<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap-grid.css" rel="stylesheet"
        type="text/css" />
        
    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.carousel.min.css"/>' />

    <link rel="stylesheet" type="text/css" href='<c:url value="/resource/css/owl.theme.default.min.css"/>' />

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href='<c:url value="/resource/css/bth-theme.css"/>' type="text/css" />
	<title>Academic board|admin</title>
</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
		<style type="text/css">
  		#wrapper {
		  display: -webkit-box;
		  display: -ms-flexbox;
		  display: flex;
		}
		.sidebar {
		  width: 160px !important;
		  background-color: #212529;
		  min-height: calc(100vh - 56px);
		}

		.navbar-nav {
		  display: -webkit-box;
		  display: -ms-flexbox;
		  display: flex;
		  -webkit-box-orient: vertical;
		  -webkit-box-direction: normal;
		  -ms-flex-direction: column;
		  flex-direction: column;
		  padding-left: 0;
		  margin-bottom: 0;
		  list-style: none;
		}

		.sidebar .nav-item .nav-link {
		  text-align: center;
		  padding: 0.75rem 1rem;
		  width: 90px;
		}
  </style>
		<div class="container" id="wrapper">

		    <!-- Sidebar -->
		    <ul class="sidebar navbar-nav">
		      
		      <li class="nav-item active">
		        <a class="nav-link" href="admin/">
		          <button class="btn btn-light" style=" width: 130px">Tài liệu</button>
		      	</a>
		      </li>
		      <li class="nav-item active">
		        <a class="nav-link" href="admin/posts">  
		          <button class="btn btn-light" style=" width: 130px">Bài viết</button>
		      	</a>
		      </li>
		    </ul>
		
		    <div id="content-wrapper">
		
		      <div class="container-fluid">
		
		        
		
		        <!-- DataTables Example -->
		        <div class="card mb-3">
		          <div class="card-header">
		            <i class="fas fa-table"></i>
		             Bài viết chưa duyệt</div>
		          <div class="card-body">
		            <div class="table-responsive">
		              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		                <thead>
		                  <tr>
		                    <th>Id</th>
		                    <th>Title</th>
		                    <th>Intro content</th>
		                    <th>Author</th>
		                    <th>Post time</th>
		                    <th>Hành động</th>
		                  </tr>
		                </thead>
		                <tfoot>
		                  <tr>
		                    <th>Id</th>
		                    <th>Title</th>
		                    <th>Intro content</th>
		                    <th>Author</th>
		                    <th>Post time</th>
		                    <th>Hành động</th>
		                  </tr>
		                </tfoot>
		                <tbody>
		                
		                <style>
		                	.success{
		                		color: #218838;
		                	}
		                	
		                	.fail{
		                		color: #c82333;
		                	}
		                </style>
		                
		                <c:if test="${ postList.size()<=0}">
		                	<h2 style="color:#45f542">Tất cả đã được duyệt</h2>
		                </c:if>
		                
		                 <c:forEach var="post" items="${postList}">
		                 	<tr id="${post.getId()}">
		                 	<td>${post.getId()}</td>
		                 	<td>${post.getTitle() }</td>
		                    <td>${post.getIntrocontent() }</td>
		                    <td>${post.getAuthor().getName() }</td>
		                    <td>${post.getPostday() }</td>
		                   
		                    <td style="display: flex;">
		                    	<a href="http://localhost:8080/Software-Engineering-Academic-Board/posts/preview/detail/${post.getId() }" target="blank">
			                    	<button class="btn btn-secondary" style="width: 50px;height: 35px; align-items: center; margin-right: 10px;">
			                    		<img style="width: 100%;height: 100%" src="https://img.icons8.com/ios-glyphs/30/000000/visible.png">               		
			                    	</button>
		                    	</a>
		                    	<button onclick="BrowsePost(${post.getId()})" class="btn btn-primary" style="width: 50px;height: 35px; align-items: center;">
		                    		<img style="width: 100%;height: 100%" src="https://img.icons8.com/ios-glyphs/30/000000/double-tick.png">
		                    	</button></td>
		                  	</tr>
		                 </c:forEach>

		                </tbody>
		              </table>
		            </div>
		          </div>
		          
		        </div>
		
		
		    </div>
		    <!-- /.container-fluid -->
		
		    </div>
		    <!-- /.content-wrapper -->
		
		  </div>
		  <!-- /#wrapper -->
		
		<jsp:include page="footer.jsp"></jsp:include>
		<script src='<c:url value="/resource/JS/admin.js"/>'></script>
</body>
</html>