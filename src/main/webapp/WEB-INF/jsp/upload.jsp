<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

	<script src="http://codeorigin.jquery.com/jquery-2.0.3.min.js"></script>

	<script src="js/skel.min.js"></script>
	<script src="js/skel-panels.min.js"></script>
	<script src="js/init.js"></script>
	<noscript>
		<link rel="stylesheet" href="css/skel-noscript.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/style-n1.css" />
	</noscript>

	<script src="js/angular.js"></script>
</head>


<body class="homepage">

	<!-- Header Wrapper -->
		<div id="header-wrapper">
					
			<!-- Header -->
			<jsp:include page="header.jsp"></jsp:include>


		</div>

		<!-- Create Event -->
			<div class="wrapper">

				<div class="container" ng-controller="EventCtrl">
					<div class="row">
						<form action="${id}/upload.html" method="post" enctype="multipart/form-data">
							<div id="placeholder"></div>
							Banner Image: <input type="file" name="banner" id="imageUpload" />
							<input type="submit" name="upload" value="Upload"/>
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
	$("#imageUpload").change(function(){
       
	   readURL(this);
	});
	function readURL(input) {

	   if (input.files && input.files[0]) {
	       var reader = new FileReader();

	       reader.onload = function (e) {
	           $('#placeholder').attr('src', e.target.result);
	       };

	       reader.readAsDataURL(input.files[0]);
	       
	   }
	}
</script>
</body>
</html>
