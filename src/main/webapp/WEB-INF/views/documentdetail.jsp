<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<h4>Name: ${subject.getName()}</h4>
		<h4>Desciption: ${subject.getDescription()}</h4>
		
		<img alt="avatar" src="${subject.getAvatar() }" style="width:200px;height:auto;"/>
			
		
		<!-- <h4>Avatar: ${subject.getAvatar()}</h4> -->
		<h4>Major: ${subject.getScope()}</h4>
		<br/><br/><br/>
		<c:forEach var="doc" items="${listTest}">
			<br/>
			<h5>Doc Name: ${doc.getName() }</h5>
			<p>Type: ${doc.getType() }</p>
			<p>Downloads: ${doc.getDowloads() }</p>
			<p>Status: ${doc.getStatus() }</p>
			<p>Des: ${doc.getDescription() }</p>
			<div style="widh:100px height 100px">
			<img alt="link" src="${doc.getUrl() }"/>
			</div>
			
			
			<p>Author: ${doc.getAuthor().getName() }</p>
			<p>Category: ${doc.getCategory() }</p>
		</c:forEach>
</body>
</html>