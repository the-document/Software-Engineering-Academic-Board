<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap-grid.css" rel="stylesheet"
        type="text/css" />
    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.carousel.min.css"/>' />
    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.theme.default.min.css"/>' />
    <link rel="stylesheet" href='<c:url value="/resource/css/bth-theme.css"/>' type="text/css" />
	
	<title>BHT| ${post.getTitle() }</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
		
	<style type="text/css">
		.post-avatar{
			border-radius: 50%;
			width: 59px;height: 59px;
			border: solid 3px #2ECC71;
		}	

		#left-bar{
			background-color: #3435;
			height: 0px;
		}
	
		#post-header{
			font-family: Roboto; 
			font-size: 3rem;
			padding-top: 20px;
		}
	
		#post-quote{
			font-size: 1.2rem; 
			margin: 14px;
			font-style: italic;
		}
	
		#post-infor{
			display: flex;
			flex-direction: row;
			font-size: 1.2rem;
			justify-content: space-between;
		}
	
		#post-time{
			margin-right: 20px;
			color: #C4C4C4;
			padding-top: 18px;
		}
	
		#post-content{
			font-family: Roboto;
			padding-top: 20px;
			font-size: 1.2rem;
		}
	
		#action-bar{
			display: flex;
			justify-content: space-between;
			border-top: 1px solid #5B9BD5;
			padding-top: 10px;
			margin-top: 20px;
			border-bottom: 1px solid #5B9BD5;
			padding-bottom: 10px;
		}
	
		#upvote-icon{
			width: 36px;
			height: 36px;
			border-radius: 50%;
			border: 2px solid #5B9BD5;
		}
	
		#bookmark-icon{
			width: 36px;
			height: 36px;
			margin-right: 15px;
		}
	
		#facebook-icon{
			width: 36px;
			height: 36px;
			margin-right: 15px;
		}
	
		#more-infor-icon{
			width: 36px;
			height: 36px;
		}
	</style>

	<div class="row">
		<div class="col-lg-2 col-md-1" id="left-bar"></div>

		<div class="col-lg-6 col-md-8">
			<div  style="height: auto;">
				<div id="post-header"> ${post.getTitle() }</div>

				<div ><p id="post-quote">${post.getIntrocontent()}</p></div >

				<div id="post-infor">

					<div style="display: flex;">
						<img class="post-avatar" src="${post.getAuthor().getAvatar() }">

						<div style="padding: 5px;font-size: 1.2rem;padding-top: 17px;display: flex;justify-content: space-between;">
							Đã đăng trong
							<div style="color: #5B9BD5;padding-left: 5px; ">${post.getType()}</div>
						</div>
					</div>
					
					
					<div id="post-time"> ${post.getReadtime()} phút đọc,      ${post.getPostday()}</div>
				</div>
				<div id="post-content">
					<p style="line-height: 26px;"> 
						${post.getContent()}
					</p>
				</div>

				<div id="action-bar">
					<div style="display: flex;">
						<img id="upvote-icon" src="https://img.icons8.com/color/48/000000/sort-up.png">
						<div style="padding-left: 9px;padding-top: 9px;">${post.getLike()} upvotes</div>
					</div>
					
					<div style="display: flex;">
						<div style="padding-top: 9px;padding-right: 50px;">${post.getViews()} views</div>
						<img id="bookmark-icon" src='<c:url value="/resource/images/icons/icon-bookmark.png"/>'>
						<img id="facebook-icon"  src='<c:url value="/resource/images/icons/facebook.png"/>'>
						<img id="more-infor-icon"  src='<c:url value="/resource/images/icons/icon-more.png"/>'>
					</div>
					
				</div>
			</div>

			
		</div>

		<div class="col-lg-4 " style="background-color: #490;height: 0px;"></div>
	</div>

	<!-- PART COMMENT -->

	<div class="row">
		<style type="text/css">
			#post-temlate{
				font-family: Roboto;
				padding-top: 50px;
				font-size: 1.2rem;
				 line-height: 26px;
			}

			#commment-box{
				width: 100%;line-height: 40px;margin-top: 10px;border-radius: 7px;background-color: #E5E5E5;
				padding-left: 20px;
				font-style: italic;
				border: rosybrown;
				background-image: url(https://img.icons8.com/ios/50/000000/right.png);
				background-repeat: no-repeat;
				background-repeat: no-repeat;
				background-position-x: right;
				background-position-y: center;
			}

			#author-comment{
				padding-top: 15px;
				color: #5B9BD5;
				 padding-left: 10px;
			}

			#time-comment{
				padding-top: 15px; 
				color: #C4C4C4;
				 padding-right: 15px;
			}

			#header-reply-comment{
				display: flex;
				margin-top: 15px;
				justify-content: space-between;
				padding-bottom: 15px;
			}

			#content-reply-comment{
				font-family: Rosario;
				line-height: 26px;
			}
		</style>

		<div class="col-lg-2 col-md-1"></div>
		<div class="col-lg-6 col-md-8" id ="post-temlate">
			<div style="display: flex;">
				Bạn có cảm nhận gì về bài viết của <div style="color: #5B9BD5; padding-left: 10px;">${post.getAuthor().getName()}</div>
			</div>

			<input type="text" name="comment" placeholder="Để lại bình luận" id="commment-box">

			<div style=" margin-top: 20px;">
				<div id="header-reply-comment">
					<div style="display: flex;">
						<img class="post-avatar" src="https://www.thesprucepets.com/thmb/LS2xCGAy-VbbHSd9UAefbVF5wTI=/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-182174009-58c5ad533df78c353c5700c8.jpg">	
						<div id="author-comment">Nguyễn Hồng Phúc</div>
					</div>
					
					<div id="time-comment">3 ngày trước</div>
				</div>
				
				<div id="content-reply-comment">
					Cảm ơn tác giả, một bài viết quá tuyệt vời.
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<style type="text/css">
				.slider-bar{
					border: 1px solid#5B9BD5; border-radius: 10px;
					text-align: left;
					max-width: 280px;
					padding-bottom: 20px;
					padding-top: 12px;
					margin-bottom: 50px;
				}

				.slider-bar-header{
					text-align: center;
					font-size: 1.5rem;
					margin-bottom: 10px;
				}

				.slider-bar-post-recomend{
					padding-left: 20px;
					line-height: 26px;
					font-family: Roboto;
					font-size: 1.2rem;
				}
				
				a:hover{
					color:#5B9BD5;
				}
			</style>

			<div class="slider-bar">
				<p class="slider-bar-header" ">Cùng tác giả</p>
				
				
				<c:forEach var="post" items="${sameAuthor }">
					<p class="slider-bar-post-recomend"><a href='<c:url value="${post.getId()}"/>'>${post.getTitle()}</a></p>
				</c:forEach>
				
			</div>

			<div class="slider-bar">
			
				<p class="slider-bar-header" ">Cùng chủ đề</p>
				
				<c:forEach var="post" items="${sameContent }">
					<p class="slider-bar-post-recomend"><a href='<c:url value="${post.getId()}"/>'>${post.getTitle()}</a></p>
				</c:forEach>
				
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"/>
	<script type="text/javascript">
			$(document).ready(function() {
				  $("#posts").addClass("active");
				});
	</script>
</body>
</html>