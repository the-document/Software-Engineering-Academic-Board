<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>API</title>
</head>
<body>

		<h1>user controller</h1>
		<h4 style="color:red">/login/facebook</h4>
		<p>GET, điều hướng qua xác nhận facebook, sao đó đưa về page trước đó có chứa thông tin đăng nhập đã lưu vào session</p>
		<br/>
		
		<h4 style="color:red">/user/register</h4>
		<p>GET - trả về trang test đăng ký</p>
		<br/>
		
		<h4 style="color:red">/user/register</h4>
		<p>POST -ajax đăng ký và trả về user, nếu không thành công thì user.id=0 và message lỗi nằm trong user.name</p>
		<p> type="email" name="username". type="text" name="name". type="password" name="password". type="password" name="password2"</p>
		<br/>
		
		<h4 style="color:red">/user/login</h4>
		<p>POST -ajax Đăng nhập bằng tài khoản thường, nếu không thành công thì user.id=0 và message lỗi nằm trong user.name. Khi thành công thì trong ajax set menubar user infor</p>
		<p>type='email' name='username'. type='password' name='password' </p>
		<br/>
		
		<h4 style="color:red">/user/logout</h4>
		<p>GET -ajax Đăng xuất tài khoản. Chuỗi trả về là "success" hoặc "fail"</p>
		<br/>

		<h1>catagory controller</h1>
		<h4 style="color:red">/documents</h4>
		<p>GET -Load page tài liệu, trả về danh sách các môn học đại cương</p>
		<h5>value: listSubjectDefault, type: com.nguyenhongphuc.entity.Catagory </h5>
		<br/>
		
		<h4 style="color:red">/documents/ajax/{namescope}</h4>
		<p>GET -ajax trả về danh sách các môn học thuộc namescope</p>
		<h5>value: listSubject, type: com.nguyenhongphuc.entity.Catagory </h5>
		<br/>
		
		<h1>document controller</h1>
		<h4 style="color:red">/documents/{idSubject}</h4>
		<p>GET - trả về view document detail, môn học có idSubject, danh sách đề thi của subject này</p>
		<h5>value: subject, type: com.nguyenhongphuc.entity.Catagory </h5>
		<h5>value: listTest, type: com.nguyenhongphuc.entity.Documents </h5>
		<br/>
		
		<h4 style="color:red">/documents/{idSubject}/ajax/{name-type-documents}</h4>
		<p> GET -ajax danh sách ame-type-documents của subject này</p>
		<h5>value: listdocuments, type: com.nguyenhongphuc.entity.Documents </h5>
		<br/>
		
		
		<h4 style="color:red">/documents/{idSubject}/download/{idDocument}</h4>
		<p> GET -Thực hiện dowload tài liệu, nếu người dùng đã đăng nhập tự động chuyển hướng đến tài liệu và trừ điểm. Nếu không đủ điểm thì redirect về lại trang hiện tại</p>
		
		<br/>
</body>
</html>