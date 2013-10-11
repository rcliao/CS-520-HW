'use strict';

/* Services */


// Demonstrate how to register services
// In this case it is a simple value service.
angular.module('envApp.services', ['ngResource']).
factory('envResources', function($resource){
	return $resource(':tableName/:operation',
		{
			// here we can define some path param that can extract value directly from
			// "data object" for post request
		},
		{
			login:
			{
				method:'POST',
				params:{ tableName : 'user', operation: 'login' }
			},
			register:
			{
				method:'POST',
				params:{ tableName : 'user', operation: 'register' }
			},
			createEvent:
			{
				method:'POST',
				params:{ tableName : 'event', operation: 'create' }
			},
			getEvents:
			{
				method: 'GET',
				params:{ tableName : 'event', operation: 'list' },
				isArray:true
			},
			getEvent:
			{
				method: 'GET',
				params:{ tableName : 'event' }
			},
			sendEmails:
			{
				method: 'Post',
				params: {tableName : 'email', operation: 'send'}
			}
	});
  }).
  value('version', '0.1');
