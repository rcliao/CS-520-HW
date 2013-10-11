'use strict';

/* Controllers */

function HomeCtrl($scope, $rootScope, $location, $route, envResources,
		$cookieStore) {

	$scope.remember = true;

	$scope.getClass = function(path) {
		if ($location.path().substr(0, path.length) === path) {
			return "active";
		} else {
			return "";
		}
	};

	$scope.logout = function() {
		$cookieStore.remove('user');
		$rootScope.loginUser = null;

		$route.reload();
	};

	$scope.login = function(user, remember) {
		envResources.login(user, function(res) {
			// success recall
			$rootScope.loginUser = res;
			if (remember) {
				$cookieStore.put('user', $rootScope.loginUser);
			}

		}, function(err) {
			if (err.status == 401) {

			}
		});
	};

	$scope.register = function(user) {
		envResources.register(user, function(res) {
			// success recall
			$rootScope.loginUser = user;
		}, function(err) {
			if (err.status == 401) {
				$rootScope.$broadcast('signup-failed', {});
			} else if (err.status == 500) {
				$rootScope.$broadcast('server-error', {});
			}
		});
	};
}

function MainCtrl($scope, $http, $rootScope, $cookieStore) {
	$rootScope.$on('event-created', function() {
		$scope.setAlert({
			type : 'success',
			msg : 'Event was created successfully'
		});
	});
	
	$rootScope.$on('signup-failed', function() {
		$scope.setAlert({
			type : 'error',
			msg : 'Sign up process failed'
		});
	});
	
	$rootScope.$on('server-error', function() {
		$scope.setAlert({
			type : 'error',
			msg : 'Ooops, server error'
		});
	});

	$rootScope.$on('email-sent', function() {
		$scope.setAlert({
			type : 'success',
			msg : 'Email sent'
		});
	});
	
	$rootScope.$on('signin-req', function() {
		$scope.setAlert({
			type : 'warning',
			msg : 'Sign in required'
		});
	});

	$scope.alerts = [];

	$scope.setAlert = function(msg) {
		// { type: 'error', msg: 'Oh snap! Change a few things up and try
		// submitting again.' },
		$scope.alerts = [];
		$scope.alerts.push(msg);
	};

	$scope.closeAlert = function(index) {
		$scope.alerts.splice(index, 1);
	};
	
	$rootScope.loginUser = $cookieStore.get('user') || null;

	// this is what makes basic authorization
	$scope.$watch('loginUser.username + loginUser.password', function() {
		$http.defaults.headers.common['Authorization'] = 'Basic '
				+ $rootScope.loginUser.username;
	});
}

function CreateCtrl($scope, $location, $rootScope, envResources) {
	if (!$rootScope.loginUser) {
		$rootScope.$broadcast('signin-req', {});
		$location.path('#/home');
	}

	$scope.event = {
		creator : $rootScope.loginUser,
		guests : []
	};

	$scope.guest = {};

	$scope.addGuest = function(guest) {
		guest.respond = false;
		$scope.event.guests.push(guest);
		$scope.guest = {};
	};

	$scope.deleteGuest = function(index) {
		$scope.event.guests.splice(index, 1);
	};

	$scope.createEvent = function() {
		envResources.createEvent($scope.event, function() {
			$rootScope.$broadcast('event-created', {});
			$location.path('/listEvent').replace();
		});
	};
}

function EventsListCtrl($scope, $rootScope, $location, $modal, envResources) {
	if (!$rootScope.loginUser) {
		$rootScope.$broadcast('signin-req', {});
		$location.path('#/home');
	}

	envResources.getEvents(function(res) {
		$scope.events = res;
	});

	$scope.openEmailPanel = function(guests, id) {

		var modalInstance = $modal.open({
			templateUrl : 'partials/emailModal.html',
			controller : EmailCtrl,
			resolve : {
				guests : function() {
					return guests;
				},
				id : function() {
					return id;
				}
			}
		});

		modalInstance.result.then(function(selectedItem) {

		}, function() {

		});
	};
}

function EventDetailCtrl($scope, $routeParams, $modal, envResources) {
	$scope.eventId = $routeParams.eventId;
	
	envResources.getEvent({
		'eventId' : $routeParams.eventId
	}, function(res) {
		$scope.event = res;
		$scope.goingGuests = [];
		$scope.notGoingGuests = [];
		
		for ( var i = 0; i < $scope.event.guests.length; i++) {
			if ($scope.event.guests[i].respond) {
				$scope.goingGuests.push($scope.event.guests[i]);
			} else {
				$scope.notGoingGuests.push($scope.event.guests[i]);
			}
		}
	});
	
	$scope.openEmailPanel = function(guests, id) {

		var modalInstance = $modal.open({
			templateUrl : 'partials/emailModal.html',
			controller : EmailCtrl,
			resolve : {
				guests : function() {
					return guests;
				},
				id : function() {
					return id;
				}
			}
		});

		modalInstance.result.then(function(selectedItem) {

		}, function() {
			
		});
	};
}

function EmailCtrl($scope, $rootScope, $modalInstance, envResources, guests, id) {

	$scope.id = id;

	$scope.guests = guests;

	$scope.ok = function() {
		$modalInstance.close($scope.selected.item);
	};

	$scope.cancel = function() {
		$modalInstance.dismiss('cancel');
	};
	
	$scope.selectAll = function() {
		for ( var i = 0; i < guests.length; i++) {
			guests[i].emailNoti = true;
		}
	};

	$scope.sendEmails = function(message) {
		var emails = [];
		for ( var i = 0; i < guests.length; i++) {
			if (guests[i].emailNoti) {
				emails.push(guests[i].email);
			}
		}

		envResources.sendEmails({
			'emails' : emails,
			'eventId' : $scope.id,
			'message' : message
		}, {}, function() {
			$rootScope.$broadcast('email-sent', {});
			$modalInstance.close();
		});
	};
};