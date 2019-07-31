<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap-grid.css" rel="stylesheet"
        type="text/css" />     
    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.carousel.min.css"/>' />
    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.theme.default.min.css"/>' />
    <link rel="stylesheet" href='<c:url value="/resource/css/bth-theme.css"/>' type="text/css" />
	<title>BHT| Cuộc thi</title>
</head>
<body>
		<jsp:include page="header.jsp"/>
		<style> 
		  h1 { font-size: 50px; }
		  body { font: 20px Helvetica, sans-serif; color: #333; }
		  article { display: block; text-align: left; width: 650px; margin-top:150px;margin-left:27%;margin-bottom: 277px;  }
		  #hight-light { color: #dc8100; text-decoration: none; }
		  #hight-light:hover { color: #333; text-decoration: none;margin-top: 150px; }
		</style>

	<article>
	    <h1>We&rsquo;ll be back soon!</h1>
	    <div>
	        <p >Sorry for the inconvenience but we&rsquo;re performing some maintenance at the moment. If you need to you can always <a href="mailto:#" id="hight-light">contact us</a>, otherwise we&rsquo;ll be back online shortly!</p>
	        <p>&mdash; The Team</p>
	    </div>
	</article> 
	
	<jsp:include page="footer.jsp"/>
	
	<script type="text/javascript">
		$(document).ready(function() {
			  $("#competition").addClass("active");
			});
	</script>
</body>
</html>