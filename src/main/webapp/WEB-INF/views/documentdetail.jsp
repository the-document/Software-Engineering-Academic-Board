<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap-grid.css" rel="stylesheet"
        type="text/css" />
        
    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.carousel.min.css"/>' />

    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.theme.default.min.css"/>' />

	 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css" />

    <link rel="stylesheet" href='<c:url value="/resource/css/bth-theme.css"/>' type="text/css" />
	<title>${subject.getName()} </title>
</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		
		
		<!-- new data here------------------------------------------- -->
		 <style type="text/css">
    	.menu-document{
    		width: 103px;
			text-align: center;
			height: 42px;
    	}

    	.bottom-bar .bottom-menu li:hover{
    		color: #5B9BD5;
    	}

    	
    	.hidespacedoc{
    		display: none;
    	}

    	.selected-row{
    		background-color: #9234eb !important;
    	}

    	#count_select_doc{
    		margin-top: -31px;
			margin-left: 13px;border-radius: 50%;
			background-color: #fc0000;
			width: 17px;
			height: 17px;
			color: #fff;
			text-align: center;
			font-size: 0.8rem;
    	}

    	.upload-model-input-text{
    		margin-top: 40px; border-radius: 18px; line-height: 36px;padding-left: 10px;background-color: #e5e5e5;
    	}
    	
    	.infor-donot-have-data{
                		color: #C4C4C4;
                		font-size: 1.5rem;
                		text-align: left;
                	}
    </style>

    <main class="container">
        <section class="course-detail">
            <div class="row">
                <div class="col-lg-3" style="margin: 0px;">
                    <div class="course-info">
                        <div class="course-image">
                            <img src='<c:url value="/${subject.getAvatar() }"/>' />
                        </div>
                        <div class="course-name" style="height: 300px;">
                            <h4>${subject.getName()}</h4>
                            <p>
                                Đại số tuyến tính là một ngành toán học nghiên cứu về không gian vectơ, hệ phương trình
                                tuyến tính và các phép biến ...
                            </p>
                            <div class="btn-area">
                                <button style="border-radius: 12px;background-color: #fff;width: 107px;line-height: 31px;">
									Bài viết
								</button>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-lg-9" style="padding: 0px;">
                    <div class="document-area">
                        <table id="table-document-space">
                            <thead>
                                <tr>
                                    <th>Tên tài liệu</th>
                                    <th>Tên tác giả</th>
                                    <th>Lượt tải</th>
                                </tr>
                            </thead>
                            <tbody id="dethi" >
                            	
                            	<c:forEach var="data" items="${listTest}">
                            		<tr id="${data.getId()}" class="doc-row" onclick="SetFocusRow(`${data.getId()}`)">
	                                <td>${data.getName()}</td>
	                                <td>${data.getAuthor().getName()}</td>
	                                <td>${data.getDowloads()}</td>
	                            </tr>
                            	</c:forEach>
                            	
	                           
                            </tbody>
                            <tbody id="baigiang" class="hidespacedoc">
                            	
                            </tbody>
                             <tbody id="training" class="hidespacedoc">
                            	
                            </tbody>
                             <tbody id="video" class="hidespacedoc">
                            	
                            </tbody>
                             <tbody id="sach" class="hidespacedoc">
                            	
                            </tbody>

                        </table>

                    </div>
                    <div class="bottom-bar">
                        <div>
                            <ul class="bottom-menu">
                            	<div id="subjectID" value="${subject.getId()}"></div>
                                <li onclick="focusMenuDocument(`dethibtn`,`dethi`)" id="dethibtn" class="active menu-document">Đề thi</li>
                                <li onclick="focusMenuDocument(`baigiangbtn`,`baigiang`)" id="baigiangbtn" class="menu-document">Bài giảng</li>
                                <li onclick="focusMenuDocument(`trainingbtn`,`training`)" id="trainingbtn" class="menu-document">Training</li>
                                <li onclick="focusMenuDocument(`videobtn`,`video`)" id="videobtn" class="menu-document">Video</li>
                                <li onclick="focusMenuDocument(`sachbtn`,`sach`)" id="sachbtn" class="menu-document">Sách</li>
                            </ul>
                        </div>
                        <div>
                            <ul class="bottom-menu func-button">
                                <li onclick="DowloadDocument(${subject.getId() })">
                                    <i alt="Tải" class="fas fa-download"></i>
                                    <div id="count_select_doc" value="0">0</div>
                                </li> 
                                <li id="btn-upload">
                                    <i class="fas fa-upload"></i>
                                </li>
                                <li>
                                    <i class="fas fa-heart"></i>
                                </li>
                                <li>
                                    <i class="fas fa-info"></i>
                                </li>
                                <li>
                                    <i class="fas fa-save"></i>
                                </li>

                                <style type="text/css">
                                    		.round{
												background-image: linear-gradient(45deg, transparent 50%, gray 50%), linear-gradient(135deg, gray 50%, transparent 50%), radial-gradient(#ddd 70%, transparent 72%);
												background-position: calc(100% - 20px) calc(1em + 2px), calc(100% - 15px) calc(1em + 2px), calc(100% - .5em) .5em;
												background-size: 5px 5px, 5px 5px, 1.5em 1.5em;
												background-repeat: no-repeat;
												-webkit-appearance: none;
												-moz-appearance: none;
												border: 1px solid #555C6F;
												width: 239px !important;
												}
											#upload-modal2 {
											    display: none;
											}

											#upload-modal2.active {
											    display: block;
											}

                                </style>

                                <div id="upload-modal" class="upload-ui">
                                    <h3>upload tài liệu 1/2</h3>
                                    <span id="modal-close"
                                    
                                    onclick='closeModal("upload-modal")'
                                    class="close"><i class="fas fa-times" style="padding: 8px;"></i></span>
                                    <form style="text-align: center;" >

                                    	

                                        <select id="typedoc" class="round" style="margin-top: 40px; border-radius: 18px;">
                                            <option value="noselected" selected>chọn loại tài liệu</option>
                                            <option value="dethi">Đề thi</option>
                                            <option value="baigiang">Bài giảng</option>
                                            <option value="training">Training</option>
                                            <option value="video">Video</option>
                                            <option value="sach">Sách</option>
                                        </select>

                                        <select id="typesubject" class="round" style="margin-top: 40px; border-radius: 18px;">
                                        	 <option value="noselected" selected>Chọn môn học</option>
                                            <option value="dethi">Đề thi</option>
                                            <option value="baigiang">Bài giảng</option>
                                            <option value="training">Training</option>
                                            <option value="video">Video</option>
                                            <option value="sach">Sách</option>
                                        </select>


                                        <input onclick="ShowSelectSubject()" style="margin-top: 19px;border-radius: 17px;
                                        line-height: 32px;width: 103px; background-color: #5B9BD5;
                                        border:none;box-shadow: 1px 3px 0px #E5E5E5;
                                        font-family: Rosario;font-size: 1.2rem;color: #fff;"
                                        	type="button" value="Tiếp tục" />
                                    </form>

                                </div>


                                <div id="upload-modal2" class="upload-ui">
                                    <h3>upload tài liệu 2/2</h3>
                                    <span id="modal-close2"
                                    
                                    onclick='closeModal("upload-modal2")'
                                    class="close"><i class="fas fa-times" style="padding: 8px;"></i></span>
                                    <form style="text-align: center;" >


                                        <input id="namedoc" value="hehe" type="text" name="" class="round upload-model-input-text"  />
                                        <input id="linkdoc" value="linkne" type="text" name="" class="round upload-model-input-text" /> 


                                        <input onclick="UploadDocument()" style="margin-top: 19px;border-radius: 17px;
                                        line-height: 32px;width: 103px; background-color: #5B9BD5;
                                        border:none;box-shadow: 1px 3px 0px #E5E5E5;
                                        font-family: Rosario;font-size: 1.2rem;color: #fff;"
                                        	type="button" value="upload" />
                                    </form>

                                </div>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
		
		<jsp:include page="footer.jsp"/>
		<script type="text/javascript">
			$(document).ready(function() {
				  $("#documents").addClass("active");
				});
		</script>
		
		<script src='<c:url value="/resource/JS/tai-lieu.js"/>'></script>
</body>
</html>