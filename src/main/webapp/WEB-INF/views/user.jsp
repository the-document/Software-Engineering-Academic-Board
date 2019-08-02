<%@page import="com.nguyenhongphuc.entity.User"%>
<%@page import="java.util.List"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <title>BHT | User profile</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
	<style type="text/css">
		body{
			font-family: Rosario;
		}

		p{
			font-family: Rosario;
			margin: 4px;
		}

		#cover{
			display: flex;
			width: auto;
			height: 234px;
			background-image: url(http://mrwallpapers.com/wp-content/uploads/2018/11/Sky-Nature-Background.jpg);
			background-position:center;
			background-repeat:no-repeat;
			background-size:cover;
			justify-content: center;
			ju
		}

		#avatar{
			width: 130px;
			height: 130px;
			border-radius: 50%;	
			margin-top: 86px;
			border: 4px solid #5B9BD5;
		}

		#follow-btn{
			width: 130px;
			height: 37px;
			border-radius: 13px;
			background-color: #fff;	
			position: absolute;
			bottom: 23px;
			background-image: url(https://img.icons8.com/ios-filled/50/000000/checked.png);
			background-position:left;
			background-repeat:no-repeat;
			background-size:25px;
			justify-content: center;
			font-family: Rosario;
			padding-left: 20px;
		}

		#user-infor{
			width: auto;
			height: auto;
			display: flex;
			flex-direction: row;
			justify-content: space-between;
			font-family: Rosario;
			font-size: 1.3rem;
			border-bottom: solid 3px #E5E5E5;
		}

		.name{
			display: flex;
		}

		.follow-infor{
			display: flex;
			color:  #C4C4C4;
		}
	</style>

	<div class="container">
		
		<div id="cover" class="row">
			<div class="col-12 col-md-4" style="text-align: left;">
				<img  id="avatar" src="${user.getAvatar()}">
			</div>
			<div class="col-0 col-md-4 col-sm-1 "></div>

			<div class="col-md-4" style="text-align: center;">
				<button id="follow-btn">Đã theo dõi</button>
			</div>
		</div>

		<div class="row " id="user-infor">
			<div id="infor" class="col-md-6" style="padding-top: 13px;">
				<div class="name">
					<p>${user.getName()}</p>
					<%
						String username=((User) request.getAttribute("user")).getUsername();
						String pre=username.split("@")[0];
					%>
					<p style="color: #5B9BD5">@<%= pre%></p>
				</div>

				<div class="point">
					<p style="font-weight: bold;">
						${posts.size()}<img style="margin-bottom: -6px;width: 24px; margin-left:5px;margin-right: 30px;" src='<c:url value="/resource/images/icons/paper.png"/>'>
					 	0 <img style="margin-bottom: -6px;width: 24px;margin-left:5px;margin-right: 30px;" src='<c:url value="/resource/images/icons/chat-buble.png"/>'>
					</p>
				</div>

				<div class="follow-infor">
					<p>999 người đang theo dõi</p>
					<p>, 888 người theo dõi</p>
				</div>
			</div>

			<div class="armorial col-md-4" style="display: flex;justify-content: center;justify-items: center;align-items: center; flex-direction: column;">
				<img style="width: 83px;height: 83px; "
					 src='<c:url value="/resource/images/icons/icon-rank.png"/>'>
				<p>${user.getPoint()} Points</p>
			</div>
		</div>

		<div style="border-left: 2px solid #5B9BD5; color: #5B9BD5; font-size: 2rem; margin-top: 20px; padding-left: 5px;">BÀI VIẾT</div>

		<c:choose>
			<c:when test="${posts.size()==0 }">
				<div style="align-content: center;">
					<h2 style="color: #C4C4C4; text-align: center; margin: 30px;">Bạn chưa có bài viết nào gần đây</h2>
				</div> 
			</c:when>
			
			<c:otherwise>
				<c:forEach var="post" items="${ posts}">
					<div style="display: flex; flex-direction: column; padding: 20px;box-shadow: 2px 2px 2px grey;">
						<div class="post-infor" style="display: flex; width: 100%">
			
							<div style="display: flex; justify-content: space-between;flex-direction: row;width: 100%;">
								<div style="display: flex;flex-direction: row;">
									<div>
										<img style="width: 40px;height: 40px; border-radius:  50%;" src='<c:url value="${user.getAvatar()}"/>'>
									</div>
									<div style="color: #C4C4C4;font-size: 1.4rem;padding-left: 8px;">Đã đăng trong</div>
									<div style="color: #4F1111;font-size: 1.4rem; padding-left: 5px;">${post.getType()}</div>
									<div>
										<img style="width: 25px;height: 25px;margin-left: 19px;"
									 	src='<c:url value="/resource/images/icons/pin.png"/>'>
									 </div>
								</div>
								<div style="color: #C4C4C4;font-size: 1.4rem;">#${post.getCategory().getName()}</div>
							</div>
							
						</div>
						<div class="post-image col-sm-12">
							<img style="max-width: 100%;max-height: 318px;padding: 18px;" src='<c:url value="${post.getImage()}"/>'>
						</div>
						<div class="post-title" style="font-family: Rosario; font-size: 1.5rem;">
							${post.getTitle()}
						</div>
					</div>
				</c:forEach>
				
			</c:otherwise>
			
		</c:choose>
		

		<div class="footer" style="height: 50px;"></div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>