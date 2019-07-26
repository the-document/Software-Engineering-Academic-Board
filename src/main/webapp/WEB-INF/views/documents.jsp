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
<body >
		
		<h2>ĐẠI CƯƠNG</h2>
		<p>Thường là môn học năm nhất, năm hai</p>
		
		
	
			<c:forEach var="value" items="${listSubjectDefault}">
				<div style="float:left; margin:20px">
					<a href="documents/${value.getId() }">
						<div style="width: 100px; height: 100px; ">
							<img alt="avatar" src="${value.getAvatar() }" width=100% >
						</div>
						
					</a>
					${value.getName()} <br/>
				</div>
			</c:forEach>
		
		
		<div style="position:absolute; right: 30px; top:400px">
			<button class="loadsubject" data-id="Công nghệ phần mềm">
				<h2>CÔNG NGHỆ PHẦN MỀM</h2>
				<p>Tài liệu chuyên ngành khoa Công nghệ Phần mềm</p>
			</button>
			
		</div>	
		
		<div style="position:absolute; right: 30px; top:500px">
			<button class="loadsubject" data-id="Mạng máy tính và truyền thông">
				<h2>TRUYỀN THÔNG VÀ MẠNG MÁY TÍNH</h2>
				<p>Tài liệu chuyên ngành khoa Mạng máy tính và truyền thông</p>
			</button>
			
		</div>	
		
		
		
		<jsp:include page="footer.jsp"/>
</body>
</html>