<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>

<!-- toast popup -->
	<style type="text/css">
        #hay-dang-ky{
            padding-left: 5px;padding-right: 5px; color: #5B9BD5; font-weight: bold;
        }

        #hay-dang-ky:hover{
            color: #b835f0;
        }

		#toast {
		    visibility: hidden;
		    max-width: 50px;
		    height: 50px;
		    /*margin-left: -125px;*/
		    margin: auto;
		    background-color: #333;
		    color: #fff;
		    text-align: center;
		    border-radius: 2px;

		    position: fixed;
		    z-index: 5;
		    left: 0;right:0;
		    bottom: 30px;
		    font-size: 17px;
		    white-space: nowrap;
		}
		#toast #img{
			width: 50px;
			height: 50px;
		    
		    float: left;
		    
		    padding-top: 16px;
		    padding-bottom: 16px;
		    
		    box-sizing: border-box;

		    
		    background-color: #111;
		    color: #fff;
		}
		#toast #desc{

		    
		    color: #fff;
		   
		    padding: 16px;
		    
		    overflow: hidden;
			white-space: nowrap;
		}

		#toast.show {
		    visibility: visible;
		    -webkit-animation: fadein 0.5s, expand 0.5s 0.5s,stay 3s 1s, shrink 0.5s 2s, fadeout 0.5s 2.5s;
		    animation: fadein 0.5s, expand 0.5s 0.5s,stay 3s 1s, shrink 0.5s 4s, fadeout 0.5s 4.5s;
		}

		@-webkit-keyframes fadein {
		    from {bottom: 0; opacity: 0;} 
		    to {bottom: 30px; opacity: 1;}
		}

		@keyframes fadein {
		    from {bottom: 0; opacity: 0;}
		    to {bottom: 30px; opacity: 1;}
		}

		@-webkit-keyframes expand {
		    from {min-width: 50px} 
		    to {min-width: 450px}
		}

		@keyframes expand {
		    from {min-width: 50px}
		    to {min-width: 450px}
		}
		@-webkit-keyframes stay {
		    from {min-width: 450px} 
		    to {min-width: 450px}
		}

		@keyframes stay {
		    from {min-width: 450px}
		    to {min-width: 450px}
		}
		@-webkit-keyframes shrink {
		    from {min-width: 450px;} 
		    to {min-width: 50px;}
		}

		@keyframes shrink {
		    from {min-width: 450px;} 
		    to {min-width: 50px;}
		}

		@-webkit-keyframes fadeout {
		    from {bottom: 30px; opacity: 1;} 
		    to {bottom: 60px; opacity: 0;}
		}

		@keyframes fadeout {
		    from {bottom: 30px; opacity: 1;}
		    to {bottom: 60px; opacity: 0;}
		}
	</style>
	<div id="toast">
		<div id="img">
			<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
			width="100%" height="100%"
			viewBox="0 0 172 172"
			style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#ffffff"><g id="surface1"><path d="M84.28,6.88c-10.4275,0 -18.92,8.4925 -18.92,18.92c0,10.4275 8.4925,18.92 18.92,18.92c10.4275,0 18.92,-8.4925 18.92,-18.92c0,-10.4275 -8.4925,-18.92 -18.92,-18.92zM51.6,55.04c-1.89469,0 -3.44,1.53188 -3.44,3.44v20.64c0,1.90813 1.54531,3.44 3.44,3.44h17.2v55.04h-17.2c-1.89469,0 -3.44,1.53188 -3.44,3.44v20.64c0,1.90813 1.54531,3.44 3.44,3.44h68.8c1.89469,0 3.44,-1.53187 3.44,-3.44v-20.64c0,-1.90812 -1.54531,-3.44 -3.44,-3.44h-17.2v-79.12c0,-1.90812 -1.54531,-3.44 -3.44,-3.44z"></path></g></g></g></svg>
		</div>

		<div id="desc">notify</div>
	</div>

	<script type="text/javascript">

		function launch_toast() {
		    var x = document.getElementById("toast")
		    x.className = "show";
		   	console.log("toast");
		    setTimeout(function(){ 
			    x.className = x.className.replace("show", "");
		     }, 5000);
		}

		function refresh() {
	        window.location.reload(true);
	             
	     }
		
	</script>

<footer class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="footer-logo-name">
                    <div class="logo">

                    </div>
                    <div class="name">

                    </div>
                </div>
                <div class="info-footer">
                    <ul>
                        <li style="padding-bottom: 15px;"> Kênh thông tin Sinh viên của BHT khoa CNPM - Trường ĐH CNTT - ĐHQG-HCM. Website do Ban học
                            tập CNPM
                            thực hiện và quản lý.</li>
                        <li>
                            Phát triển: Nguyễn Hồng Phúc
                        </li>
                        <li>
                            <p style="padding-left: 77px;padding-bottom: 15px;">Nguyễn Niê Đức Thịnh</p>
                        </li>
                        <li>
                            Chịu trách nhiệm nội dung: Lưu Biêu Nghị
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="info-footer">
                    <h4 style="color:#fff;padding-bottom: 20px;">Chính sách</h4>
                    <ul>
                        <li style="padding-bottom: 12px;">Chính sách điểm thưởng</li>
                        <li style="padding-bottom: 12px;">Điều khoản dịch vụ</li>
                        <li style="padding-bottom: 12px;">Phúc đẹp trai</li>
                    </ul>
                </div>
                
            </div>
            <div class="col-lg-3">
                 <div class="info-footer">
                    <h4 style="color:#fff;padding-bottom: 20px;">Thông tin liên hệ</h4>
                    <p style="padding-bottom: 12px;">Địa chỉ: Đường Hàn Thuyên, Khu phố 6, P. Linh Trung, Q. Thủ Đức, TP Hồ Chí Minh</p>
                    <p style="padding-bottom: 12px;">Email: bht.cnpm.uit@gmail.com</p>
                    <p style="padding-bottom: 12px;">Hotline: 0366272703</p>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-12">
                <h4 style="color:#fff";>@2019 Website Ban học tập Đoàn khoa Công nghệ Phần mềm. All rights reserved.
                </h4>
            </div>
        </div>
</footer>



<!-- login/register -->    
   <div id="id01" class="modal login-form">
        <div class="modal-content animate">
            <div id="form-div">
                <div class="logo form-item">
                    <img src='<c:url value="/resource/images/icons/logo.png"/>'>
                </div>
                 <p id="login-notify" class="message-error"></p>
                <div class="log-input main-input form-item ">
                    <img style="padding-top: 12px;" class="  logo-input " src="<c:url value="/resource/images/icons/username.png"/>" />
                    <input id="username" class="text-input" " type="text" placeholder="Tên đăng nhập" name="username" required />
                </div>
                <div class="log-input main-input form-item">
                    <img style="padding-top: 12px;" class=" logo-input" src="<c:url value="/resource/images/icons/password.png"/>" />
                    <input id="password" class="text-input" type="password" placeholder="Mật khẩu" name="password" required />
                </div>
                <div class="form-item">
                    <button id="login-btn-onclick" class="btn-login" onclick="loginNormal()">
                    	Login
                    </button>
                   
                </div>
                <div class="form-itema">
                    <label>
                        <!-- <input type="checkbox" checked="checked" name="remember"> Remember me -->
                        <!-- ADD -->

                        <div style="font-family: Rosario; font-size: 15px; text-align: center;">
                        	<p class="login-text">Quên mật khẩu?</p>
	                        <div class="row "  >
	                        	 <p class="login-text" style="padding-left: 5px;padding-right: 5px">Chưa có tài khoản?</p>
	                        	 <p onclick="openSignupModal()" class="login-text" id="hay-dang-ky">Hãy đăng ký</p>
	                        </div>

	                        <div class="logo form-item">
	                        	
			                    <img src='<c:url value="/resource/images/icons/google2.png"/>'
			                    style="max-width: 40px;max-height: 40px; margin-bottom: 30px" />
			                    
			                    <a href="https://www.facebook.com/dialog/oauth?client_id=889293998090512&redirect_uri=https://localhost:8443/Software-Engineering-Academic-Board/login/facebook">
				                    <img src='<c:url value="/resource/images/icons/facebook.png"/>'
				                    style="max-width: 43px;max-height: 43px; margin-bottom: 30px"/>
			                    </a>
			                </div>
                        </div>
                        
                       
                        <!-- END ADD -->
                    </label>
                </div>
            </div>
            <div class="modal-close">
                <button class="btn-close" onclick="closeLoginModal()"><img
                        src="<c:url value="/resource/images/icons/close.png"/>"  /></button>
            </div>
        </div>
    </div>

    <div id="id02" class="modal login-form">
        <div class="modal-content animate row" style="padding: 0px">

            <div id="form-div" style="width: 100%;align-items: stretch;">
            	<div class="logo form-item" style="position: absolute;margin-top: 30px; left: 46%;">
	                    <img src='<c:url value="/resource/images/icons/logo.png"/>'" />
	           </div>
                <div class="signup-form">
                	
                    <div class="left" style="background-color: #5B9BD5"	>
                        <div style="text-align: center; color: #fff;font-weight:
                        		 bold; margin-top: 40px;margin-bottom: 30px; ">
                    		ĐĂNG KÝ
                		</div>
                		<p id="refister-notify2"></p>
                        <div class="register-input log-input main-input form-item">
                            <img class="register-icon-input" src="<c:url value="/resource/images/icons/username.png"/>" />
                            <input id="register-username" type="email" placeholder="bht@example.com" name="username" required />
                        </div>
                        <div class="register-input log-input main-input form-item">
                            <img class="register-icon-input" src="<c:url value="/resource/images/icons/username.png"/>" />
                            <input id="register-name" type="text" placeholder="Tên hiển thị" name="password" required />
                        </div>
                        <div class="register-input log-input main-input form-item">
                            <img class="register-icon-input" src="<c:url value="/resource/images/icons/password.png"/>" />
                            <input id="register-password" type="password" placeholder="Mật khẩu" name="password" required />
                        </div>
                        <div class="register-input log-input main-input form-item">
                            <img class="register-icon-input" src="<c:url value="/resource/images/icons/password.png"/>" />
                            <input id="register-password2" type="password" placeholder="Nhập lại mật khẩu" name="password" required />
                        </div>
                        <div class="register-input form-item">
                            <button id="regiser-btn" class="btn-register" onclick="register()">Register</button>
                        </div>
                       
                        <!-- <div class="form-itema">
                            <label>
                                <input type="checkbox" checked="checked" name="remember"> Remember me
                            </label>
                        </div> -->
                    </div>

                    <div class="right">
                    	<div style="text-align: center; color: #5B9BD5;
                    				font-weight: bold; margin-top: 40px;margin-bottom: 30px;">
                    		ĐĂNG NHẬP
                    	</div>
                       
                        <div class="register-input log-input main-input form-item">
                    		<img class="register-icon-input-login" src="<c:url value="/resource/images/icons/username.png"/>" />
                    		<input id="username-popup2" class="text-input" " type="text" placeholder="Tên đăng nhập" name="username" required />
                		</div>

                		<div class="register-input log-input main-input form-item">
		                    <img class="register-icon-input-login" src="<c:url value="/resource/images/icons/password.png"/>" />
		                    <input id="password-popup2" class="text-input" type="password" placeholder="Mật khẩu" name="password" required />
                		</div>
                		<div class="form-item" style="display: flex; justify-content: center;">
		                    <button id="login-btn-f2" class="btn-login register-input" onclick="loginNormalPopupRegister()"> Login</button>
                		</div>

                		<div class="form-itema">
                    		<label>
                        		<!-- <input type="checkbox" checked="checked" name="remember"> Remember me -->
                        		<!-- ADD -->


	                        	<div style="font-family: Rosario; font-size: 15px; text-align: center;">
	                        		<p class="login-text ">Quên mật khẩu?</p>
		                        

		                        	<div class="logo form-item">
					                    <img src='<c:url value="/resource/images/icons/google2.png"/>' 
					                    style="max-width: 40px;max-height: 40px; margin-bottom: 60px" />
					                    
					                    <a href="https://www.facebook.com/dialog/oauth?client_id=889293998090512&redirect_uri=https://academicboard.herokuapp.com/Software-Engineering-Academic-Board/login/facebook">
					                    	<img src='<c:url value="/resource/images/icons/facebook.png"/>'
					                    	style="max-width: 43px;max-height: 43px; margin-bottom: 60px"/>
					                    </a>
					                    
				                	</div>
	                        	</div>
                        
                       
                        <!-- END ADD -->
                    		</label>
                		</div>
                    </div>
                </div>

            </div>


            <div class="modal-close">
                <button class="btn-close" onclick="closeSignupModal()">
                <img src='<c:url value="/resource/images/icons/close.png"/>' /></button>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src='<c:url value="/resource/JS/owl.carousel.js"/>'></script>
    <script src='<c:url value="/resource/JS/login.js"/>'></script>
    <script>
        // Get the modal
        var modalLogin = document.getElementById('id01');
        var modalSignup = document.getElementById('id02');


        function openLoginModal() {
            $("#login-notify").text("");
            modalLogin.style.display = "block";
        }

        function closeLoginModal() {
            modalLogin.style.display = "none"
        }

        function openSignupModal() {
            modalSignup.style.display = "block"
        }

        function closeSignupModal() {
            modalSignup.style.display = "none";
            modalLogin.style.display = "none";
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
