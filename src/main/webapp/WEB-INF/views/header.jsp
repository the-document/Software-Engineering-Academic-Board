<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<header class="container">
        <div class="nav-bar">
            <div class="nav-left">
                <div class="logo-wraper">
                   <img src='<c:url value="/resource/images/icons/logo.png"/>'>
                </div>
                <div class="main-input search-bar">
                    <div class="input-icon input">
                       	<img src='<c:url value="/resource/images/icons/icon-search.png"/>'>
                    </div>
                    <input class="" type="text" />
                </div>
                <div class="nav">
                    <ul>
                        <li><a id="competition" href="http://localhost:8080/Software-Engineering-Academic-Board/competition">
                        	Cuộc thi</a class=".menu-bar-active"></li>
                        <li><a id="documents"  href="http://localhost:8080/Software-Engineering-Academic-Board/documents">
                        	Tài liệu</a></li>
                        <li><a id="posts" href="http://localhost:8080/Software-Engineering-Academic-Board/posts/detail/6">
                        	Bài viết</a></li>
                    </ul>
                </div>
            </div>
            <div class="nav-right">
                <div class="user-menu">
                	<c:choose>
						<c:when test="${user==null }">
							<button id="login-btn" onclick="openLoginModal()">Login</button>
						</c:when>
						
						<c:otherwise>
							<div style="display: flex;" class="dropdown">
                    			<img id="nav-user-avatar" alt="ảnh đại diện"
	                     			src="${user.getAvatar()}">
		                    	<p id="nav-user-name"> ${user.getName()}</p>
	
			                    <ul class="dropdown-content">
			                    	<li>Trang cá nhân</li>
			                    	<li>Điều khoản</li>
			                    	<li><a href="user/logout">Đăng xuất</a></li>
			                    </ul>
                    		</div>
						</c:otherwise>
					</c:choose>                  
                    <!-- <button onclick="openSignupModal()">Signup</button> -->
                </div>
            </div>
        </div>
    </header>
    
