$("#email-quick").keyup(function(event) {
    openRegisterForm();
});

function openRegisterForm() {
	if (event.keyCode === 13) {
    	$("#register-username").val($("#email-quick").val());
        $("#go-to-register").click();
    }
}


//login popup
$("#username").keyup(function(event) {
    requireLogin();
});

$("#password").keyup(function(event) {
    requireLogin();
});

function requireLogin() {
	if (event.keyCode === 13) {
    
        $("#login-btn-onclick").click();
    }
}

//login and register popup
$("#register-username").keyup(function(event) {
    requireRegister();
});
$("#register-name").keyup(function(event) {
    requireRegister();
});
$("#register-password").keyup(function(event) {
    requireRegister();
});
$("#register-password2").keyup(function(event) {
    requireRegister();
});

function requireRegister() {
	if (event.keyCode === 13) {
        $("#regiser-btn").click();
    }
}

$("#username-popup2").keyup(function(event) {
     requireLogin2(); 
});
$("#password-popup2").keyup(function(event) {
    requireLogin2(); 
});

function requireLogin2() {
	if (event.keyCode === 13) {
        $("#login-btn-f2").click();
    }
}


function loginNormal() {
	var username =$("#username").val();
	var password =$("#password").val();
	console.log(username);
	console.log(password);
	$.ajax({
		type: "POST",
		url: "https://academicboard.herokuapp.com/user/login",
		data:{
			username:username,
			password:password
		},
		dataType: 'json',
		timeout:100000,
		success: function (data) {
			if(data.id==0)
				$("#login-notify").text(data.name);
			else
			{
				location.reload();
			}
		},
		error: function (e){
			console.log("ERROR:",e);
		}
	});
}

function register() {
	//console.log("in register");
	//$("#refister-notify").text("Thất bại: ");
	var username =$("#register-username").val();
	var name =$("#register-name").val();
	var password =$("#register-password").val();
	var password2 =$("#register-password2").val();

	$.ajax({
		type: "POST",
		url: "https://academicboard.herokuapp.com/user/register",
		data:{
			username:username,
			name:name,
			password:password,
			password2:password2
		},
		dataType: 'json',
		timeout: 100000,
		success: function(data){
			if (data.id==0)
			{
				$("#refister-notify").removeClass("message-success");
				$("#refister-notify").addClass("message-error");
				$("#refister-notify").text("Thất bại: " +data.name);
			}
			else
			{
				$("#refister-notify").removeClass("message-error");
				$("#refister-notify").addClass("message-success");
				$("#refister-notify").text("Đăng ký thành công, đăng nhập để tiếp tục");
				$("#username-popup2").val(username);
			}
		},
		error: function(e){
			console.log("ERROR",e);
		}
	});
}

function loginNormalPopupRegister() {
	var username =$("#username-popup2").val();
	var password =$("#password-popup2").val();
	console.log(username);
	console.log(password);
	$.ajax({
		type: "POST",
		url: "https://academicboard.herokuapp.com/user/login",
		data:{
			username:username,
			password:password
		},
		dataType: 'json',
		timeout:100000,
		success: function (data) {
			if(data.id==0)
				$("#login-notify2").text(data.name);
			else
			{
				location.reload();
			}
		},
		error: function (e){
			console.log("ERROR:",e);
		}
	});
}