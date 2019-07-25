<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<c:choose>
	<c:when test="${user==null }">
		<h1>Bạn chưa đăng nhập</h1>
	</c:when>
	
	<c:otherwise>
		
		<h1>Xin chào: ${user.getName()}</h1>
		<img alt="ảnh đại diện" src="${user.getAvatar()}"/>
	</c:otherwise>
</c:choose>
