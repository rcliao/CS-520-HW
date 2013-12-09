<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<div id="header" class="container">
					
	<!-- Logo -->
		<h1 id="logo"><a href="index.html">Envite</a></h1>
	
	<!-- Nav -->
		<nav id="nav">
			<ul>
				<security:authorize access="!authenticated">
					<li><a class="btn btn-link btn-lg" href="#signup">Sign Up</a></li>
					<li class="break"><button class="btn btn-link btn-lg" data-toggle="modal" data-target="#myModal">Sign In</button>
					</li>
				</security:authorize>
				<security:authorize access="authenticated">
					<li><a href="create.html">Create Event</a></li>
					<li><a href="events.html">Your Events</a></li>
					<li class="break"><a href="j_spring_security_logout">Sign Out</a></li>
					<li><a href="">Welcome ${ username }!</a></li>
				</security:authorize>
			</ul>
		</nav>

</div>