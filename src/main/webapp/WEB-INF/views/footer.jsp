<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>

<footer class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="footer-logo-name">
                    <div class="logo">

                    </div>
                    <div class="name">

                    </div>
                </div>
                <div class="info">
                    <ul>
                        <li> Kênh thông tin Sinh viên của BHT khoa CNPM - Trường ĐH CNTT - ĐHQG-HCM. Website do Ban học
                            tập CNPM
                            thực hiện và quản lý.</li>
                        <li>
                            Phát triển: Nguyễn Hồng Phúc
                        </li>
                        <li>
                            Chịu trách nhiệm nội dung: Lưu Biêu Nghị
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3">
                <h4>Top bài viết</h4>
                <ul>
                    <li>Lập trình hướng đối tượng - phần 1</li>
                    <li>Lập trình hướng đối tượng - phần 2</li>
                    <li>Lập trình hướng đối tượng - phần 3</li>
                </ul>
            </div>
            <div class="col-lg-3">
                <h4>Địa chỉ</h4>
                <p>Đường Hàn Thuyên, Khu phố 6, P. Linh Trung, Q. Thủ Đức, TP Hồ Chí Minh</p>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <h4>@2019 Website Ban học tập Đoàn khoa Công nghệ Phần mềm. All rights reserved.
                </h4>
            </div>
        </div>
    </footer>
    
    <div id="id01" class="modal login-form">
        <div class="modal-content animate">
            <div id="form-div">
                <div class="logo form-item">
                     <img src="<c:url value="/resource/images/icons/logo.png"/>" >
                </div>
                <div class="log-input main-input form-item">
                 	<img class="logo-input" src="<c:url value="/resource/images/icons/username.png"/>" >     
                   <input id="username" type="email" placeholder="Tên đăng nhập" name="username" required />
                </div>
                <div class="log-input main-input form-item">
                	<img class="logo-input" src="<c:url value="/resource/images/icons/password.png"/>" >
                    <input id="password" type="password" placeholder="Mật khẩu" name="password" required />
                </div>
                <div class="form-item">
                    <button onclick="loginNormal()">Login</button>
                    <p id="notify"></p>
                </div>
                <div class="form-item">
                    <label>
                        <input type="checkbox" checked="checked" name="remember"> Remember me
                    </label>
                </div>
            </div>
            <div class="modal-close">
                <button class="btn-close" onclick="closeLoginModal()">
                 <img src="<c:url value="/resource/images/icons/close.png"/>" >
                </button>
            </div>
        </div>
    </div>
    <div id="id02" class="modal login-form">
        <div class="modal-content animate">
            <div id="form-div">
                <div>
                    Signup
                </div>
                <div class="signup-form">
                    <div class="left">
                        <div class="logo form-item">
                             <img src="<c:url value="/resource/images/icons/logo.png"/>" >
                        </div>
                        <div class="log-input main-input form-item">
                            <img class="logo-input" src="<c:url value="/resource/images/icons/username.png"/>" >     
                            <input id="register-username" type="email" placeholder="Tên đăng nhập" name="register-username" required />
                        </div>
                        <div class="log-input main-input form-item">
                         	<img class="logo-input" src="<c:url value="/resource/images/icons/username.png"/>" >
                            <input id="register-name" type="text" placeholder="Tên hiển thị" name="register-name" required />
                        </div>
                        <div class="log-input main-input form-item">
                         	<img class="logo-input" src="<c:url value="/resource/images/icons/password.png"/>" >
                            <input id="register-password" type="password" placeholder="Mật khẩu" name="register-password" required />
                        </div>
                        <div class="log-input main-input form-item">
                         	<img class="logo-input" src="<c:url value="/resource/images/icons/password.png"/>" >
                            <input id="register-password2" type="password" placeholder="Nhập lại mật khẩu" name="register-password2" required />
                        </div>
                        
                        <div class="form-item">
                            <button id="register-normal" onclick="register()">Register</button>
                            <p id="refister-notify"></p>
                        </div>
                        <div class="form-itema">
                            <label>
                                <input type="checkbox" checked="checked" name="remember"> Remember me
                            </label>
                        </div>
                    </div>
                    <div class="right">
                        Hello
                    </div>
                </div>


            </div>
            <div class="modal-close">
                <button class="btn-close" onclick="closeSignupModal()">
					<img src="<c:url value="/resource/images/icons/close.png"/>" >
				</button>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src='<c:url value="resource/JS/owl.carousel.js"/>'></script>
    <script src='<c:url value="resource/JS/login.js"/>'></script>
    <script>
        // Get the modal
        var modalLogin = document.getElementById('id01');
        var modalSignup = document.getElementById('id02');


        function openLoginModal() {
            modalLogin.style.display = "block"
        }

        function closeLoginModal() {
            modalLogin.style.display = "none"
        }

        function openSignupModal() {
            modalSignup.style.display = "block"
        }

        function closeSignupModal() {
            modalSignup.style.display = "none"
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modalLogin) {
                modalLogin.style.display = "none";
            }
            if (event.target == modalSignup) {
                modalSignup.style.display = "none";
            }
        }
    </script>
