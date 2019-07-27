<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Academic board|Home</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<h2>LIST SHARE</h2>
	<ol>
		<c:forEach var="value" items="${shares}">				
			<li>${value.getTitle() }</li>					
		</c:forEach>
	</ol>
	
	<h2>EVENT</h2>
	<ol>
		<c:forEach var="value" items="${events}">				
			<li>${value.getTitle() }</li>					
		</c:forEach>
	</ol>
	
	<h2>LIST TUTORIAL</h2>
	<ol>
		<c:forEach var="value" items="${tutorials}">				
			<li>${value.getTitle() }</li>					
		</c:forEach>
	</ol>
	
</body>
</html>