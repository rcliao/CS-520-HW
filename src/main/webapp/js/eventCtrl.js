var app = angular.module('envite', []);

app.factory('formDataObject', function() {
    return function(data) {
        var fd = new FormData();
        angular.forEach(data, function(value, key) {
            fd.append(key, value);
        });
        return fd;
    };
});

app.controller('EventCtrl', function($scope, $http, formDataObject) {
	$scope.event = {
		title: '',
		message: '',
		guests: []
	};

	$scope.createEvent = function() {
		$http({
			method: 'POST',
			url: 'create.html', 
			data: $scope.event
		})
		.success( function(data) {
			console.log(data);
			window.location = "upload.html?id=" + data.id;
		});
	};

	$scope.addGuest = function() {
		$scope.event.guests.push($scope.guest);
		$scope.guest = {};
	};

	$scope.deleteGuest = function(index) {
		$scope.event.guests.splice(index, 1);
	};
});