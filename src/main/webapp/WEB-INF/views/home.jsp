<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap-grid.css" rel="stylesheet"
        type="text/css" />
        
    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.carousel.min.css"/>' />

    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.theme.default.min.css"/>' />


    <link rel="stylesheet" href='<c:url value="/resource/css/bth-theme.css"/>' type="text/css" />
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