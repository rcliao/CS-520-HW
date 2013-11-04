<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="header" class="container">
					
	<!-- Logo -->
		<h1 id="logo"><a href="index.html">Envite</a></h1>
	
	<!-- Nav -->
		<nav id="nav">
			<ul>
				<c:if test="${ empty loginUser }">
					<li><a class="btn btn-link btn-lg" href="#signup">Sign Up</a></li>
					<li class="break"><button class="btn btn-link btn-lg" data-toggle="modal" data-target="#myModal">Sign In</button>
					</li>
				</c:if>
				<c:if test="${ not empty loginUser }">
					<li><a href="create.html">Create Event</a></li>
					<li><a href="events.html">Your Events</a></li>
					<li class="break"><a href="logout.html">Sign Out</a></li>
					<li><a href="">Hi <b>${ loginUser.username }</b></a></li>
				</c:if>
			</ul>
		</nav>

</div>