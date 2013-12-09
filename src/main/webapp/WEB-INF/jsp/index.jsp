<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE HTML>
<html>
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
</head>


<body class="homepage">
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel">User Login</h4>
	      </div>
	      <form name="login" method="post" action="<c:url value='/j_spring_security_check' />">
	      <div class="modal-body">
			<div class="row half">
				<div class="6u">
					<input name="j_username" placeholder="Username" type="text" class="text" required="true" />
				</div>
				<div class="6u">
					<input name="j_password" placeholder="Password" type="password" class="text" required="true" />
				</div>
				<div class="12u">
					<input type="checkbox" name="_spring_security_remember_me"> Remember me on this computer
				</div>
				<div class="12u text-center">
					${ error }
				</div>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <input type="submit" class="btn btn-primary" name="login" value="Sign In">
	      </div>
	      </form>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<!-- Header Wrapper -->
		<div id="header-wrapper">
					
			<!-- Header -->
			<jsp:include page="header.jsp"></jsp:include>

			<!-- Hero -->
				<section id="hero" class="container">
					<header>
						<h2><b>E</b>nvite Your Friend Easily<br />
					</header>
					<p>
						Easy simple way to send invitation letters to your friends on holiday season.
					</p>

				</section>

		</div>

		<!-- Features 1 -->
			<div class="wrapper">

				<div class="container">
					<div class="row">
						<section class="6u feature">
							<div class="image-wrapper first">
								<a href="#" class="image first"><img src="images/step1.png" alt="" /></a>
							</div>
							<header>
								<h2><b>Step 1</b><br />
								Create Event</h2>
							</header>
							<p>
								Create the event and set up the invitation to your friends from simple web form.
							</p>
							<ul class="actions">
								<li><a href="#signup" class="button">Create event now!</a></li>
							</ul>
						</section>
						<section class="6u feature">
							<div class="image-wrapper">
								<a href="#" class="image"><img src="images/step2.png" alt="" /></a>
							</div>
							<header>
								<h2>Step 2<br />
								Track Your Event</h2>
							</header>
							<p>
								After creating the event, you can always come back to site and see how is your event goes and even email your friend to remind them that this event is coming!
							</p>
							<ul class="actions">
								<li><a href="#signup" class="button">Track my Events</a></li>
							</ul>
						</section>
					</div>
				</div>

			</div>

		<!-- Footer Wrapper -->
			<div id="footer-wrapper">

				<!-- Footer -->
				<security:authorize access="!authenticated">
					<div id="footer" class="container">
						<header class="major">
							<h2><a id="signup" name="signup">What are you waiting for!?</a></br>
							Sign up Now!
							</h2>
							<span>Sign up processing ...</span>
						</header>
						<div class="row">
							<section class="12u">
								<form:form modelAttribute="user">
									<div class="row half">
										<div class="6u">
											<form:input path="username" placeholder="Name" type="text" class="text" required="true" />
											<form:errors path="username" />
										</div>
										<div class="6u">
											<form:input path="email" placeholder="Email" type="text" class="text" required="true" />
											<form:errors path="email" />
										</div>
									</div>
									<div class="row half">
										<div class="6u">
											<form:input path="password" placeholder="Password" type="password" class="text" required="true" />
											<form:errors path="password" />
										</div>
										<div class="6u">
											<input name="password2" placeholder="Repeat Password" type="password" class="text" required="true"/>
											<form:errors path="password2" />
										</div>
									</div>
									<div class="row half">
										<div class="6u">
											<form:input path="firstName" placeholder="First Name" type="text" class="text" required="true" />
											<form:errors path="firstName" />
										</div>
										<div class="6u">
											<form:input path="lastName" placeholder="Last Name" type="text" class="text" required="true" />
											<form:errors path="lastName" />
										</div>
									</div>
									<div class="row half">
										<div class="12u">
											<ul class="actions">
												<li><input type="submit" name="register" value="Register" class="button" /> <br /></li>
											</ul>
										</div>
									</div>
								</form:form>
							</section>
						</div>
					</div>
				</security:authorize>

				<!-- Copyright -->
					<div id="copyright" class="container">
						<ul class="menu">
							<li>&copy; Eric Liao All rights reserved.</li>
							<li>Concact by rcliao01@gmail.com</a></li>
							<li>CS 520 Homework 4</li>
						</ul>
					</div>

			</div>

			<c:if test="${ not empty error }">
				<script>
					$('#myModal').modal();
				</script>
			</c:if>

			<c:if test="${ not empty signupError }">
				<script>
					$(document.body).animate({
					    'scrollTop':   $('#signup').offset().top
					}, 2000);
				</script>
			</c:if>
</body>
</html>
