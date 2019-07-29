
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
	
}