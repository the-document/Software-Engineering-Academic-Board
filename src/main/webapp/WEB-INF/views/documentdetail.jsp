<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap-grid.css" rel="stylesheet"
        type="text/css" />
        
    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.carousel.min.css"/>' />

    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.theme.default.min.css"/>' />


    <link rel="stylesheet" href='<c:url value="/resource/css/bth-theme.css"/>' type="text/css" />
	<title>${subject.getName()}</title>
</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
		<!-- left================================================================== -->
		<div style="width: 260px;height: 660px;left: -1px;top: 108px;background: #FFFFFF;">
			<div style="position: absolute;width: 259px;height: 249px;left: 0px;top: 0px;background: #FFFFFF;border-radius: 30px">
				<img alt="avatar" src="${subject.getAvatar() }" style="width:100%; height:100%">
			</div>
			
			<div style="position: absolute;width: 259px;height: 412px;left: 1px;top: 248px;background: #5B9BD5;">
				<h5 style="text-align: center">${subject.getName()}</h5>
				<p style="margin-left: 20px; margin-right: 20px;">${subject.getDescription()}</p>
			</div>
		</div>
		
		<!-- right================================ -->
		<div style="position: absolute; width: 1107px;height: 662px;left: 259px;top: 106px; background: #FFFFFF;">
				
				
					
					<c:forEach var="doc" items="${listTest}">
						<button style="width: 1037px;height: 60px;float:left; position:relative"  >
							<div style="padding-right:200px;float:left; position:relative">
								${doc.getName()}
							</div>
								
							<div style="padding-right:100px;float:left; position:relative">
								Author: ${doc.getAuthor().getName()}
							</div>
								
								${doc.getDowloads()} Downloads
						</button>
					</c:forEach> 
					
						<div style="position: absolute;width: 160px;height: 102px;left: 0px;top: 400px;font-family: Rosario;font-style: normal;
							font-weight: bold;font-size: 24px;line-height: 29px;display: flex;align-items: center;text-align: center;color: #5B9BD5;">
							Đề thi
						</div>
				
		</div>
		
		
		<jsp:include page="footer.jsp"/>
		<script type="text/javascript">
			$(document).ready(function() {
				  $("#documents").addClass("active");
				});
		</script>
</body>
</html>