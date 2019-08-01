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
	
	<main class="container">

        <section class="carousel row">
            <div class="col-lg-12">
                <div class="carousel">
                    <div id="home-carousel" class="owl-carousel owl-theme half">
                        <div class="img">
                            <img src="./src/img/home/home1.jpg" />

                        </div>
                        <div class="img">
                            <img src="./src/img/home/home2.jpg" />

                        </div>
                        <div class="img">
                            <img src="./src/img/home/home3.jpg" />

                        </div>
                        <div class="img">
                            <img src="./src/img/home/home4.jpg" />

                        </div>
                        <div class="img">
                            <img src="./src/img/home/home5.jpg" />

                        </div>

                    </div>
                    <div class="title half">
                        <h2>Hoạt động training thành công tốt đẹp</h2>
                        <p>Từ ngày 12/06/2019 - 17/06/2019 Chuỗi trainging của ban học tập Công nghệ phần mềm đã diễn
                            ra, và thành công tốt đẹp</p>

                        <div class="readmore-bar" style="margin-top: 21%;">
                            <button class="function-button white">Đọc thêm</button>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <section class="mt-20 function row">
            <div class="col-lg-4 border-right">
                <div>
                    <div class="function-title">
                        Sharing is Learning
                    </div>
                    <div class="mt-20 flex-center">
                        Chia sẻ kiến thức để học hỏi được nhiều kiến thức hơn...
                    </div>
                </div>

            </div>
            <div class="col-lg-4 border-right">
                <div>
                    <div class="function-title">
                        Tạo tài khoản miễn phí
                    </div>
                    <div class="mt-20 flex-center">
                        <div class="main-input">
                            <input class="input-signup" placeholder="Điền email của bạn" type="text" />
                            <div class="go-icon">
                                <img src='<c:url value="resource/images/icons/icon-right.png"/>' />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 text-center">
                <div>
                    <div class="function-title">
                        Đóng góp nhiều hơn
                    </div>
                    <div class="mt-20 flex-center">
                        <button class="function-button">
                            Upload
                        </button>
                        <button class="function-button">
                            Viết bài
                        </button>
                    </div>
                </div>
            </div>

        </section>

        <section class="row">
            <div class="col-lg-12 ">
                <div class="title-bar">
                    <div class="left-border">
                        <h4>GIỚI THIỆU</h4>
                        <p>Ban học tập CNPM, chúng tôi là ai?</p>
                    </div>
                    <div style="border: 1px solid #5B9BD5;border-radius: 5px;">
                    	<div class="post-logo right" style="padding-left: 7px;padding-right: 7px;">
                        	<img style="width: 38px;" src='<c:url value="resource/images/icons/icon-name-tag.png"/>' />
                    	</div>
                    </div>
                    

                </div>
            </div>
        </section>
        <section class="row">

            <div class="col-lg-12">
                <div class="news-event">

                    <div class="news-event-image half">
                       <img src='<c:url value="resource/images/posts/intro.jpg"/>' />
                    </div>
                    <div class="news-event-content half">
                        <div class="intro">Chào các bạn, <br /> Đây là group chính thức của Ban học tập Đoàn
                            khoa Công
                            nghệ Phần mềm, nơi
                            giúp các bạn trao đổi những thắc mắc liên quan tới học thuật, các hoạt động
                            training, seminar... của Ban.
                        </div>
                        <div class="readmore-bar">
                            <button class="function-button white">Đọc thêm</button>
                        </div>
                    </div>
                </div>


            </div>


        </section>
        <section class="top-post">
            <!-- <div class="row">
                <div class="col-lg-12 ">
                    <div class="home-post-bar">
                        <div class="post-logo">
                            <img src="./src/img/icons/icons8-pen-64.png" />
                        </div>
                        <div class="right">
                            <h4>TOP BÀI VIẾT</h4>
                            <p>Những bài viết hay nhất</p>
                        </div>
                    </div>
                </div>
            </div> -->
            <div class="col-lg-12 mb-20">
                    <div class="title-bar" onclick='showFacultyCourses(`se-courses`)'>
                        <div class="faculty-brief" style="padding: 0px;">
                            <!-- <span class="brief">SE</span> -->
                            <div class="post-logo right">
		                        <img src='<c:url value="resource/images/icons/icons8-pen-64.png"/>' />
		                    </div>
                        </div>
                        <div class="right right-border">
                            <h4>TOP BÀI VIẾT</h4>
                            <p>Những bài viết hay nhất</p>
                        </div>
                    </div>
                </div>
            <div class="row">
            	<style type="text/css">
            		.post-card{
            			border-radius: 15px;background-color: #5B9BD5;padding: 0px; margin: 17px;
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
            	</style>
            	
            	<c:forEach var="post" items="${topPost}">
            		<div class="col-lg-2 post-card">
	                    <div class="post-image">
	                        <img style="border-radius: 12px;" src="${post.getImage() }" />
	                    </div>
	                    <div style="color: #fff">
	                        ${post.getTitle() }
	                    </div>
	                    <div class="author">
	                    	<img src=" ${post.getAuthor().getAvatar()}" class="author-image">
	                    		<p class="author-name"> ${post.getAuthor().getName() }</p>
	                    </div>
                	</div>
            	</c:forEach>
            	
               
               	
            </div>
        </section>
    </main>
    
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>