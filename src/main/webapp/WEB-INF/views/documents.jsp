<%@page import="java.util.List"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Academic Board|Documents</title>
	<jsp:include page="header.jsp"/>
</head>
<body>
		<c:forEach var="value" items="${listSubjectDefault}">
			${value.getName()} <br/>
		</c:forEach>
		
		<button class="loadsubject" data-id="Công nghệ phần mềm">SE</button>
		<button class="loadsubject" data-id="Công nghệ phần mềm">CS</button>
		
		<jsp:include page="footer.jsp"/>
</body>
</html>