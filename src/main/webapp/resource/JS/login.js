
function loginNormal() {
	var username =$("#username").val();
	var password =$("#password").val();
	console.log(username);
	console.log(password);
	$.ajax({
		type: "POST",
		url: "user/login",
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
	var username =$("#register-username").val();
	var name =$("#register-name").val();
	var password =$("#register-password").val();
	var password2 =$("#register-password2").val();

	$.ajax({
		type: "POST",
		url: "user/register",
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
				$("#refister-notify").text("Thất bại: " +data.name);
			else
				$("#refister-notify").text("Đăng ký thành công, vui lòng đăng nhập để tiếp tục");
		},
		error: function(e){
			console.log("ERROR",e);
		}
	});
}