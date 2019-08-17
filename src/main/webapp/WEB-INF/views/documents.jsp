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
    <title>BHT| Tài liệu</title>
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
                                Các môn học cơ sở ngành là những môn học rất quan trọng, là nền tảng để học tốt các môn học khi đi vào chuyên ngành
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
                                Ngành Kỹ thuật phần mềm đào tạo những kiến thức liên quan đến quy trình phát triển phần mềm một cách chuyên nghiệp nhằm tạo ra sản phẩm phần mềm đạt chất lượng cao, đáp ứng các nhu cầu nghiệp vụ cụ thể trong nền sản xuất của xã hội.
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
                                Hoạt động trong lĩnh vực này không những đòi hỏi phải nắm vững kiến thức và kỹ năng về khoa học máy tính và công nghệ thông tin mà còn phải am hiểu tương đối chính xác về các khái niệm, về bản chất, hành vi và cơ chế hoạt động của hệ thống quản lý nhằm hỗ trợ ra quyết định một cách kịp thời, chuẩn xác, đáp ứng nhu cầu phát triển của hệ thống. 
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
                                Đến với ngành học này, bạn sẽ hiểu và làm chủ được những công nghệ mạng phổ biến như thư tín điện tử, truyền tải tập tin, truyền thông thông tin, hay những công nghệ tiên tiến như điện toán đám mây, tính toán lưới, tính toán di động, xây dựng và vận hành data center, an toàn và bảo mật thông tin.
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
                               Công nghệ thông tin là một ngành học được đào tạo để sử dụng máy tính và các phần mềm máy tính để phân phối và xử lý các dữ liệu thông tin, đồng thời dùng để trao đổi, lưu trữ và chuyển đổi các dữ liệu thông tin dưới nhiều hình thức khác nhau.
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
                                Cung cấp các kỹ năng lập trình trên máy tính, Smartphone, tablet, các hệ thống nhúng sử dụng các ngôn ngữ như: Assembly, C, C++, System C, Java, C#, Verilog/VHDL.
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
                                ngành Khoa học máy tính đóng vai trò rất quan trọng trong việc xây dựng các nền tảng nghiên cứu, phát triển các công nghệ trong tương lai, đặc biệt là những nghiên cứu ứng dụng thiết thực trong cuộc sống
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
    	
    	<script type="text/javascript">
			$(document).ready(function() {
				  $("#documents").addClass("active");
				});
		</script>
</body>
</html>