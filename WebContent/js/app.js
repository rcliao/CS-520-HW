'use strict';


// Declare app level module which depends on filters, and services
angular.module('envApp', ['ui.bootstrap', 'ngCookies', 'envApp.filters', 'envApp.services', 'envApp.directives']).
  config(['$routeProvider', function($routeProvider) {
    $routeProvider.when(
    		'/home',
    		{
    			templateUrl: 'partials/home.html',
    			controller: 'HomeCtrl'
    		}
    );
    $routeProvider.when(
    		'/createEvent',
    		{
    			templateUrl: 'partials/createEvent.html',
    			controller: 'CreateCtrl'
    		}
    );
    $routeProvider.when(
    		'/listEvent',
    		{
    			templateUrl: 'partials/listEvent.html',
    			controller: 'EventsListCtrl'
    		}
    );
    $routeProvider.when(
    		'/event/:eventId',
    		{
    			templateUrl: 'partials/event.html',
    			controller: 'EventDetailCtrl'
    		}
    );
    $routeProvider.otherwise(
    		{ redirectTo: '/home' }
    );
  }]);
