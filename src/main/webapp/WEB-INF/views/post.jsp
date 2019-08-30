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
	
	<title>BHT| Bài viết</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	
	<style type="text/css">
        .post-card{
            border-radius: 15px;background-color: #5B9BD5;padding: 0px; margin: 5px;
        }

        .author{
            display: flex;
            flex-direction: row;
        }

        .author-image{
            width: 30px; max-height: 30px; margin-left: 5px;margin-bottom: 10px;margin-top: 5px;
            border-radius: 50%;
        }

        .author-name{
            margin-left: 5px; padding-top: 10px;
        }

        a:hover{
           color: #eb349e;
        }
        a{
            color: #fff;
        }

        .post-image img{
            width: 100%;
        }

        .title{
            color: #646464;
            border-bottom: 2px solid #5B9BD5;
            max-width: 50%;
            margin-top: 41px;
			margin-bottom: 13px;
			padding-bottom: 10px;
        }

        .card-general{
            margin: 0px;
            padding: 0px;
        }
        
        .hint-text{
        	-o-text-overflow: ellipsis;   /* Opera */
    		text-overflow: ellipsis;   /* IE, Safari (WebKit) */
    		overflow:hidden;              /* don't show excess chars */
    		white-space:nowrap;           /* force single line */
    		width: 180px;
    		color: #fff; text-align: center;
        }
    </style>
    
 <div class="container">
 
 <!--SHARE=====================================================================  -->
	 <div class="title">
        <h2 style=" font-size: 22px;line-height: 24px;">Bài chia sẻ gần nhất</h2>
    </div>

    <div class="row">
        
        <c:forEach var="share" items="${postShareList}">
        	<div class="col-lg-3 col-md-3  col-8  col-sm-4 ">
	            <div style="align-items: center; max-width: 200px;" class="post-card">
	                    <div class="post-image">
	                        <img style="border-radius: 12px;" src='<c:url value="${share.getImageUrl()}"/>' />
	                    </div>
	                    <div class="hint-text" >
	                        <a style="font-size: 1.2rem;" href='<c:url value="/posts/detail/${share.getId()}"/>'>${share.getTitle()}</a>
	                    </div>
	                    <div class="author">
	                        <img src="https://cdn1.iconfinder.com/data/icons/avatars-1-5/136/87-512.png" class="author-image">
	                        <p class="author-name">  
	                            <a href='<c:url value="/user/${share.getAuthor().getId()}"/>'>${share.getAuthor().getFullname()}</a>
	                        </p>
	                    </div>
	            </div>
	        </div>
        </c:forEach>
  
    </div>
	
	 <!--TUTORIAL=====================================================================  -->
	 <div class="title">
        <h2 style=" font-size: 22px;line-height: 24px;">Bài hưỡng dẫn gần nhất</h2>
    </div>
    
    <div class="row">
        
        <c:forEach var="tutorial" items="${postTutorialList}">
        	<div class="col-lg-3 col-md-3  col-8  col-sm-4 ">
	            <div style="align-items: center; max-width: 200px;" class="post-card">
	                    <div class="post-image">
	                        <img style="border-radius: 12px;" src='<c:url value="${tutorial.getImageUrl()}"/>' />
	                    </div>
	                    <div class="hint-text" >
	                        <a style="font-size: 1.2rem;" href='<c:url value="/posts/detail/${tutorial.getId()}"/>'>${tutorial.getTitle()}</a>
	                    </div>
	                    <div class="author">
	                        <img src="https://cdn1.iconfinder.com/data/icons/avatars-1-5/136/87-512.png" class="author-image">
	                        <p class="author-name">  
	                            <a href='<c:url value="/user/${tutorial.getAuthor().getId()}"/>'>${tutorial.getAuthor().getFullname()}</a>
	                        </p>
	                    </div>
	            </div>
	        </div>
        </c:forEach>
  
    </div>
    
     <!--EVENT=====================================================================  -->
     <div class="title">
        <h2 style=" font-size: 22px;line-height: 24px;">Sự kiện gần đây</h2>
    </div>
    
     <div class="row">
        
        <c:forEach var="event" items="${postEventList}">
        	<div class="col-lg-3 col-md-3  col-8  col-sm-4 ">
	            <div style="align-items: center; max-width: 200px;" class="post-card">
	                    <div class="post-image">
	                        <img style="border-radius: 12px;" src='<c:url value="${event.getImageUrl()}"/>' />
	                    </div>
	                    <div class="hint-text" >
	                        <a style="font-size: 1.2rem;" href='<c:url value="/posts/detail/${event.getId()}"/>'>${event.getTitle()}</a>
	                    </div>
	                    <div class="author">
	                        <img src="https://cdn1.iconfinder.com/data/icons/avatars-1-5/136/87-512.png" class="author-image">
	                        <p class="author-name">  
	                            <a href='<c:url value="/user/${event.getAuthor().getId()}"/>'>${event.getAuthor().getFullname()}</a>
	                        </p>
	                    </div>
	            </div>
	        </div>
        </c:forEach>
  
    </div>
    
    
</div>

	<style type="text/css">
		.btn-create-post{
			position: absolute;right: 139px; 
			bottom:83px; width: 50px;height: 50px;
			 border-radius: 50%;border: 2px solid #ff0000;
			 text-align: center;
			 background-color: #fff;
		}
		.btn-create-post:hover{
			background-color: #59ff00;
		}
	</style>
	<div class="btn-create-post">
		<a href="posts/upload">
			<img style="width: 70%;padding-top: 5px; " src='<c:url value="resource/images/icons/create.png"/>'>
		</a>
	</div>
	
 	
	<jsp:include page="footer.jsp"/>
	<script type="text/javascript">
			$(document).ready(function() {
				  $("#posts").addClass("active");
				});
	</script>
</body>
</html>