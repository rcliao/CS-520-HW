<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html ng-app>
<head>
	<title>Envite</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,600" rel="stylesheet" type="text/css" />


	<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.dropotron.min.js"></script>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css">

	<!-- Optional theme -->
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap-theme.min.css">

	<!-- Latest compiled and minified JavaScript -->
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>

	<script src="js/skel.min.js"></script>
	<script src="js/skel-panels.min.js"></script>
	<script src="js/init.js"></script>
	<noscript>
		<link rel="stylesheet" href="css/skel-noscript.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/style-n1.css" />
	</noscript>

	<script src="http://code.angularjs.org/1.2.0-rc.3/angular.min.js"></script>
</head>


<body class="homepage">

	<!-- Header Wrapper -->
		<div id="header-wrapper">
					
			<!-- Header -->
			<jsp:include page="header.jsp"></jsp:include>


		</div>

		<!-- Create Event -->
			<div class="wrapper">

				<div class="container" ng-controller="EventCtrl as ctrl">
					<div class="row">
						<form name="createEventForm">
							<section class="8u feature">
								<div class="image-wrapper">
									<a href="#" class="image"><img src="images/turkey_icon.png" alt="A turkey image" /></a>
								</div>
								<header>
									<h2><b>Create Event from ${ loginUser.firstName } ${ loginUser.lastName }</b></h2>
								</header>
								<div class="row half">
									<div class="11u">
										<input name="title" ng-model="ctrl.event.title" placeholder="Event Title" type="text" class="text" required/>
										<span class="error" ng-show="createEventForm.title.$error.required">Required!</span><br>
									</div>
								</div>
								<div class="row half">
									<div class="11u">
										<textarea name="message" ng-model="ctrl.event.message" placeholder="Message" class="textarea" required></textarea>
										<span class="error" ng-show="createEventForm.message.$error.required">Required!</span><br>
									</div>
								</div>
							</section>
							<section class="4u feature">
								<header>
									<h2>Step 2<br />
									Add Guests</h2>
								</header>
								<div class="row half">
									<div class="12u">
										<input ng-model="ctrl.guest.name" placeholder="Guest Name" type="text" class="text">
									</div>
									<div class="12u">
										<input ng-model="ctrl.guest.email" placeholder="Guest Email" type="text" class="text">
									</div>
								</div>
								<div class="row">
									<span class="error" ng-show="ctrl.event.guests.length < 1">Need at least 1 Guest</span><br>
									<ul class="actions">
										<li><a href="" class="button" ng-click="ctrl.addGuest()">Add Guest</a></li>
									</ul>
								</div>
								<div class="row half">
									<div class="12u">
										<table class="table">
											<tr>
												<th>Name</th>
												<th>Email</th>
												<th>Delete</th>
											</tr>
											<tr ng-repeat="guest in ctrl.event.guests">
												<td><input ng-model="guest.name" type="text" class="text" required/></td>
												<td><input ng-model="guest.email" type="text" class="text" required/></td>
												<td><a href="" class="btn" ng-click="ctrl.deleteGuest($index)">Del</a></td>
											</tr>
										</table>
									</div>
								</div>
								<ul class="actions">
									<li><button type="submit" class="button" ng-disabled="!createEventForm.$valid" ng-click="ctrl.createEvent()">Create Event!</button></li>
								</ul>
							</section>
						</form>
					</div>
				</div>

			</div>

		<!-- Footer Wrapper -->
			<div id="footer-wrapper">

				<!-- Copyright -->
					<div id="copyright" class="container">
						<ul class="menu">
							<li>&copy; Eric Liao All rights reserved.</li>
							<li>Concact by rcliao01@gmail.com</a></li>
							<li>CS 520 Homework 4</li>
						</ul>
					</div>

			</div>

	<script>
		function EventCtrl($http) {
			this.event = {
				id: ${ event.id },
				title: "${ event.title }",
				message: "${ event.message }",
				guests: [
					<c:forEach items="${event.guests}" var="guest">
						{ name: "${ guest.name }", email: "${ guest.email }" },
					</c:forEach>
				]
			};

			this.$http = $http;
		};

		EventCtrl.prototype.createEvent = function() {

			this.$http.post('editEvent.html', this.event)
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
	</script>
</body>
</html>
