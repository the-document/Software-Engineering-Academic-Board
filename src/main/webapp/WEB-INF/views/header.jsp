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
                        <li><a href=#>Cuộc thi</a></li>
                        <li><a href=#>Tài liệu</a></li>
                        <li><a href=#>Bài viết</a></li>
                    </ul>
                </div>
            </div>
            <div class="nav-right">
                <div class="user-menu">
                
                	<c:choose>
						<c:when test="${user==null }">
							 <button onclick="openLoginModal()">Login</button>
                    		 <button onclick="openSignupModal()">Signup</button>
						</c:when>
						
						<c:otherwise>
							
							<h4>Xin chào: ${user.getName()}</h4>
							<img alt="ảnh đại diện" src="${user.getAvatar()}"/>
						</c:otherwise>
					</c:choose>
                   
                </div>
            </div>
        </div>
</header>
