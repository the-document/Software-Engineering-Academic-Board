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
        
    <link rel="stylesheet" type="text/css" href='<c:url value="/css/resource/owl.carousel.min.css"/>' />

    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.theme.default.min.css"/>' />


    <link rel="stylesheet" href='<c:url value="/resource/css/bth-theme.css"/>' type="text/css" />
    <title>Ban học tập Công nghệ phần mềm | Trang chủ</title>
</head>
<body >
		<jsp:include page="header.jsp"/>
	
<main class="container">

<!-- TITLE OF DAI CUONG  -->
        <section class="row">
            <div class="col-lg-12 ">
                <div class="title-bar">
                    <div class="left-border">
                        <h4>ĐẠI CƯƠNG</h4>
                        <p>Những môn học năm 1, năm 2</p>
                    </div>
                    <div class="post-logo right">
                     <img src='<c:url value="/resource/images/icons/icons8-pen-64.png"/>'>
                    </div>

                </div>
            </div>
        </section>
        
<!-- LIST SUBJECT IN DAI CUONG  -->
        <section class="row">
         	<div class="col-lg-12">
         		<div class="courses">
         		
		        	<c:forEach var="value" items="${listSubjectDefault}">
							<div class="items">
								<a href="documents/${value.getId() }">
									<div class="course-image">
										<img src='<c:url value="${value.getAvatar() }"/>'>
									</div>
									<div class="course-name">${value.getName() }</div>
								</a>
							</div>
					</c:forEach>

                </div>
            </div>
        </section>



	
<!-- AREA OF FACULTY IN UNIVERSITY -->
        <section class="faculty-courses-area">
        
        <!--INTRUSDYBASE SUBJECT  -->
       		 <div class="row">
                <div class="col-lg-12 mb-20">
                    <div class="title-bar" onclick='showFacultyCourses(`base-courses`)'>
                        <div class="faculty-brief">
                            <span class="brief">BS</span>
                        </div>
                        <div class="right right-border">
                            <h4>CƠ SỞ NHÓM NGÀNH</h4>
                            <p>Tài liệu những môn học căn bản cần biết</p>
                        </div>
                    </div>
                </div>

                <div id="base-courses" class="col-lg-12 all-faculty-courses">
                    <div class="row">
                        <div class="col-lg-8 ">
                            <div class="faculty-courses courses">
                            
                            
                           <!--  JQUERY TO INSERT HTML HERE=============================== -->
                             <!--    <div class="items">
	                                    <div class="course-image">
	                                        <img src='<c:url value="/resource/images/category/integral.png"/>'>
	                                    </div>
	                                    <div class="course-name">
	                                        Lập trình trực quan
	                                    </div>
                                </div>
                             ===========================  -->
                               
                               
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="description">
                                Đại số tuyến tính là một ngành toán học nghiên cứu về không gian vectơ, hệ phương trình
                                tuyến
                                tính
                                và các phép biến ...
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 mb-20">
                    <div class="title-bar" onclick='showFacultyCourses(`se-courses`)'>
                        <div class="faculty-brief">
                            <span class="brief">SE</span>
                        </div>
                        <div class="right right-border">
                            <h4>CÔNG NGHỆ PHẦN MỀM</h4>
                            <p>Tài liệu chuyên ngành khoa Công nghệ Phần mềm</p>
                        </div>
                    </div>
                </div>

                <div id="se-courses" class="col-lg-12 all-faculty-courses">
                    <div class="row">
                        <div class="col-lg-8 ">
                            <div class="faculty-courses courses">
                            
                            
                           <!--  JQUERY TO INSERT HTML HERE=============================== -->
                             <!--    <div class="items">
	                                    <div class="course-image">
	                                        <img src='<c:url value="/resource/images/category/integral.png"/>'>
	                                    </div>
	                                    <div class="course-name">
	                                        Lập trình trực quan
	                                    </div>
                                </div>
                             ===========================  -->
                               
                               
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="description">
                                Đại số tuyến tính là một ngành toán học nghiên cứu về không gian vectơ, hệ phương trình
                                tuyến
                                tính
                                và các phép biến ...
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12 mb-20">
                    <div class="title-bar" onclick='showFacultyCourses(`is-courses`)'>
                        <div class="faculty-brief">
                            <span class="brief">IS</span>
                        </div>
                        <div class="right right-border">
                            <h4>HỆ THỐNG THÔNG TIN</h4>
                            <p>Tài liệu chuyên ngành khoa Hệ thống thông tin</p>
                        </div>
                    </div>
                </div>
                <div id="is-courses" class="col-lg-12 all-faculty-courses">
                    <div class="row">
                        <div class="col-lg-8 ">
                            <div class="faculty-courses courses">
                                <!-- insert here  -->
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="description">
                                Đại số tuyến tính là một ngành toán học nghiên cứu về không gian vectơ, hệ phương trình
                                tuyến
                                tính
                                và các phép biến ...
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12 mb-20">
                    <div class="title-bar" onclick='showFacultyCourses(`nc-courses`)'>
                        <div class="faculty-brief">
                            <span class="brief">NC</span>
                        </div>
                        <div class="right right-border">
                            <h4>MẠNG MÁY TÍNH VÀ TRUYỀN THÔNG</h4>
                            <p>Tài liệu chuyên ngành khoa Mạng máy tính và truyền thông </p>
                        </div>
                    </div>
                </div>
                <div id="nc-courses" class="col-lg-12 all-faculty-courses">
                    <div class="row">
                        <div class="col-lg-8 ">
                            <div class="faculty-courses courses" >
                               <!--  insert here-->
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="description">
                                Đại số tuyến tính là một ngành toán học nghiên cứu về không gian vectơ, hệ phương trình
                                tuyến
                                tính
                                và các phép biến ...
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12 mb-20">
                    <div class="title-bar" onclick='showFacultyCourses(`fit-courses`)'>
                        <div class="faculty-brief">
                            <span class="brief">FIT</span>
                        </div>
                        <div class="right right-border">
                            <h4>KHOA HỌC VÀ KỸ THUẬT THÔNG TIN</h4>
                            <p>Tài liệu chuyên ngành khoa Khoa học và kỹ thuật thông tin</p>
                        </div>
                    </div>
                </div>
                <div id="fit-courses" class="col-lg-12 all-faculty-courses">
                    <div class="row">
                        <div class="col-lg-8 ">
                            <div class="faculty-courses courses">
                               <!-- insert here -->
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="description">
                                Đại số tuyến tính là một ngành toán học nghiên cứu về không gian vectơ, hệ phương trình
                                tuyến
                                tính
                                và các phép biến ...
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12 mb-20">
                    <div class="title-bar" onclick='showFacultyCourses(`ce-courses`)'>
                        <div class="faculty-brief">
                            <span class="brief">CE</span>
                        </div>
                        <div class="right right-border">
                            <h4>KỸ THUẬT MÁY TÍNH</h4>
                            <p>Tài liệu chuyên ngành khoa Kỹ thuật máy tính</p>
                        </div>
                    </div>
                </div>
                <div id="ce-courses" class="col-lg-12 all-faculty-courses">
                    <div class="row">
                        <div class="col-lg-8 ">
                            <div class="faculty-courses courses">
                               <!-- insert here -->
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="description">
                                Đại số tuyến tính là một ngành toán học nghiên cứu về không gian vectơ, hệ phương trình
                                tuyến
                                tính
                                và các phép biến ...
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            
            
            <div class="row">
                <div class="col-lg-12 mb-20">
                    <div class="title-bar" onclick='showFacultyCourses(`cs-courses`)' >
                        <div class="faculty-brief">
                            <span class="brief">CS</span>
                        </div>
                        <div class="right right-border">
                            <h4>KHOA HỌC MÁY TÍNH</h4>
                            <p>Tài liệu chuyên ngành khoa Khoa học máy tính</p>
                        </div>
                    </div>
                </div>
                <div id="cs-courses" class="col-lg-12 all-faculty-courses">
                    <div class="row">
                        <div class="col-lg-8 ">
                            <div class="faculty-courses courses">
                                
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="description">
                                Đại số tuyến tính là một ngành toán học nghiên cứu về không gian vectơ, hệ phương trình
                                tuyến
                                tính
                                và các phép biến ...
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

    </main>
		
		
		
		<jsp:include page="footer.jsp"/>
		
		<!-- <script src="./src/js/page-js/home.js"></script> -->
    	<script src='<c:url value="/resource/JS/tai-lieu.js"/>'></script>
</body>
</html>