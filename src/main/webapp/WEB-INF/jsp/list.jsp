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

	<link rel="stylesheet" href="css/styles.css" />

	<script src="http://code.angularjs.org/1.2.0-rc.3/angular.min.js"></script>
	<script src="js/eventCtrl.js"></script>
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
						<section class="12u feature">
							<table class="table">
								<tr>
									<th>Title</th>
									<th>Guests</th>
									<th>Action</th>
								</tr>
								<c:forEach items="${events}" var="event">
									<tr>
										<td><a href="editEvent.html?id=${ event.id }">${ event.title }</a></td>
										<td>
											<c:forEach items="${event.guests}" var="guest">
												<div class="guest-img pull-left text-center">
                                                    <img
                                                            ng-src="https://identicons.github.com/${ guest.name }.png">
                                                    <small class="text-muted">${ guest.name }</small>
                                                </div>
											</c:forEach>
										</td>
										<td>
											<a href="#" class="button">Email Guests</a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</section>
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
