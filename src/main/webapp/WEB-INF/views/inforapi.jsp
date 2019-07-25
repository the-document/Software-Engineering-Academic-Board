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
		<p>POST - đăng ký và trả về user, nếu không thành công thì user.id=0 và message lỗi nằm trong user.name</p>
		<br/>

		<h1>catagory controller</h1>
		<h4 style="color:red">/documents</h4>
		<p>GET -Load page tài liệu, trả về danh sách các môn học đại cương</p>
		<h5>value: listSubjectDefault, type: com.nguyenhongphuc.entity.Catagory </h5>
		<br/>
		
		<h4 style="color:red">/documents/ajax/{namescope}</h4>
		<p>GET - trả về danh sách các môn học thuộc namescope</p>
		<h5>value: listSubject, type: com.nguyenhongphuc.entity.Catagory </h5>
		<br/>
		
		<h1>document controller</h1>
		<h4 style="color:red">/documents/{idSubject}</h4>
		<p>GET - trả về view document detail, môn học có idSubject, danh sách đề thi của subject này</p>
		<h5>value: subject, type: com.nguyenhongphuc.entity.Catagory </h5>
		<h5>value: listTest, type: com.nguyenhongphuc.entity.Documents </h5>
		<br/>
		
		<h4 style="color:red">/{idSubject}/ajax/{name-type-documents}</h4>
		<p> GET - danh sách ame-type-documents của subject này</p>
		<h5>value: listdocuments, type: com.nguyenhongphuc.entity.Documents </h5>
		<br/>
</body>
</html>