<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<style type="text/css">
		.btn-hover:hover{
			color: #fff;
			background-color: #e8f0fe !important;
		}
	</style>

    <header class="container">
        <div class="nav-bar ">
            <div class="nav-left">

                <div class="logo-wraper " >
                    <a href="/">
                		<img src='<c:url value="/resource/images/icons/logo.png"/>'>
                	</a>
                </div>

                <div class="main-input search-bar" >
                    <div class="input-icon input">
                        <img src='<c:url value="/resource/images/icons/icon-search.png"/>'>
                    </div>
                    <input class="" type="text"  style="width: 310px                ;" />
                </div>

                <div class="nav">
                    <ul>
                        <li><a id="competition" href="/competition">
                        	Cuộc thi</a class=".menu-bar-active"></li>
                        <li><a id="documents"  href="/documents">
                        	Tài liệu</a></li>
                        <li><a id="posts" href="/posts">
                        	Bài viết</a></li>
                    </ul>
                </div>
            </div>

            <div class="nav-right ">
                <div class="user-menu">
                   <c:choose>
						<c:when test="${useractive==null }">
							<button class="btn-hover" id="login-btn" onclick="openLoginModal()">Login</button>
						</c:when>
						
						<c:otherwise>
							<div style="display: flex;" class="dropdown">
                    			<img id="nav-user-avatar" alt="ảnh đại diện"
	                     			src="${useractive.getAvatar()}">
		                    	<p id="nav-user-name"> ${useractive.getFullname()}</p>
	
			                    <ul class="dropdown-content">
			                    	<li><a href='<c:url value="/user/${useractive.getId()}"/>'>Trang cá nhân</a></li>
			                    	<li>Điều khoản</li>
			                    	<li><a href='<c:url value="/user/logout"/>'>Đăng xuất</a></li>
			                    </ul>
                    		</div>
						</c:otherwise>
					</c:choose> 
                </div>
            </div>
        </div>
    </header>
	
<div style="with:100%;border-bottom: 1px solid #490; "></div>