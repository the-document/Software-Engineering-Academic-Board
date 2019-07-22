<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>API</title>
</head>
<body>

		<h1>catagory controller</h1>
		<h4 style="color:red">/documents</h4>
		<p>Load page tài liệu, trả về danh sách các môn học đại cương</p>
		<h5>value: listSubjectDefault, type: com.nguyenhongphuc.entity.Catagory </h5>
		<br/>
		
		<h4 style="color:red">/documents/ajax/{namescope}</h4>
		<p>trả về danh sách các môn học thuộc namescope</p>
		<h5>value: listSubject, type: com.nguyenhongphuc.entity.Catagory </h5>
		<br/>
		
		<h1>document controller</h1>
		<h4 style="color:red">/documents/details/{idSubject}</h4>
		<p>trả về view document detail, môn học có idSubject, danh sách đề thi của subject này</p>
		<h5>value: subject, type: com.nguyenhongphuc.entity.Catagory </h5>
		<h5>value: listTest, type: com.nguyenhongphuc.entity.Documents </h5>
		<br/>
		
		<h4 style="color:red">/documents/details/ajax/{idSubject}/{name-type-documents}</h4>
		<p> danh sách ame-type-documents của subject này</p>
		<h5>value: listdocuments, type: com.nguyenhongphuc.entity.Documents </h5>
		<br/>
</body>
</html>