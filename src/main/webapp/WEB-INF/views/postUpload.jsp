<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap-grid.css" rel="stylesheet"
        type="text/css" />
    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.carousel.min.css"/>' />
    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.theme.default.min.css"/>' />
    <link rel="stylesheet" href='<c:url value="/resource/css/bth-theme.css"/>' type="text/css" />
	
	<style type="text/css">
		.input-data,select {
			margin: 10px;
			border: none;
			border-bottom: 1px solid #123;
			width: auto;
		}
		
	</style>
	
	<title>BHT| Viết bài</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div style="height:50px;"></div>
	
	<div class="container" style="display: flex; flex-direction: column;">
		
		<input class="input-data" type="type" id="title" placeholder="Nhập tiêu đề tại đây">

		<input class="input-data" type="type" id="intro" placeholder="giới thiệu hoặc quote">

		<div style="display: flex;flex-direction: row;">

			<input class="input-data" style="flex: 2" type="type" id="image" placeholder="Ảnh minh họa (Url)">

			<select  tyle="flex: 1" id="cata">
				<option value="-1">Danh mục</option>
				<c:forEach var="category" items="${categories }">
					<option value="${category.getId() }">${category.getName() }</option>
				</c:forEach>
			</select> 

			<select  tyle="flex: 1" id="type">
				<option value="-1">Loại bài viết</option>
				<option value="share">Chia sẻ</option>
				<option value="tutorial">Hưỡng dẫn</option>
				<option value="event">Sự kiện</option>
			</select> 
		</div>
		
		<textarea  " id="editor" name="content" class="texteditor"></textarea>

		<div style="text-align: end;">
			<button id="submit" onclick="UploadPost()" style="width: 200px; margin: 10px; height:40px;border-radius: 15px;
				background-color: #0069d9; color:fff;" >
				Publish
			</button>	
		</div>
		
	</div>	
	
	<jsp:include page="footer.jsp"/>
	<script type="text/javascript">
			$(document).ready(function() {
				  $("#posts").addClass("active");
				});
	</script>
</body>
	
	<script src="https://cdn.ckeditor.com/ckeditor5/12.3.1/classic/ckeditor.js"></script>

	<script>
	let editor;
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .then( newEditor => {
        editor = newEditor;
    } )
    .catch( error => {
        console.error( error );
    } );
	</script>
	
	<script src='<c:url value="/resource/JS/post.js"/>'></script>
</html>