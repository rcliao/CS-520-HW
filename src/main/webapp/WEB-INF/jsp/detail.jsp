<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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

				<h1>${ guestResult }</h1>

				<div class="container" ng-controller="EventCtrl as ctrl">
					<div class="row">
						<form name="createEventForm">
							<section class="8u feature">
								<div class="image-wrapper">
									<img src="bannerImg.html?id=${event.id}" alt="" />
								</div>
								<header>
									<h2><b>Create Event from ${ loginUser.firstName } ${ loginUser.lastName }</b></h2>
								</header>
								<div class="row half">
									<div class="11u">
										<h2>{{ ctrl.event.title }}</h2>
									</div>
								</div>
								<div class="row half">
									<div class="11u">
										<p>
											{{ ctrl.event.message }}
										</p>
									</div>
								</div>
							</section>
							<security:authorize access="authenticated and principal.username == #event.creator.username">
								<section class="4u feature">
									<div class="row half">
										<div class="12u">
											<table class="table">
												<tr>
													<th>Name</th>
													<th>Email</th>
													<th>Response</th>
												</tr>
												<tr ng-repeat="guest in ctrl.event.guests">
													<td>{{guest.name}}</td>
													<td>{{guest.email}}</td>
													<td>{{ guest.respond }}</td>
												</tr>
											</table>
										</div>
									</div>
								</section>
							</security:authorize>
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
</body>
</html>
