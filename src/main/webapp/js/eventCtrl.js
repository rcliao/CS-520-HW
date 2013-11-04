function EventCtrl($http) {
	this.event = {
		title: '',
		message: '',
		guests: []
	};

	this.$http = $http;
};

EventCtrl.prototype.createEvent = function() {

	this.$http.post('create.html', this.event)
		.success( function() {
			window.location = "events.html";
		});
};

EventCtrl.prototype.addGuest = function() {

	this.event.guests.push(this.guest);

	this.guest = {};
};

EventCtrl.prototype.deleteGuest = function(index) {

    this.event.guests.splice(index, 1);

}