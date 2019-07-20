<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Academic board|Home</title>
</head>
<body>
	<p><h1>this is home page</h1></p>
	<span>${ username }</span>
	<span>${ success }</span>
	
	<c:forEach var="value" items="${listSubjectDefault}">
			${value.getName()} <br/>
	</c:forEach>
</body>
</html>