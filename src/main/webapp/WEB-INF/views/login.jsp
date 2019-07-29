<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Academic board|Login</title>
</head>
<body>

	<jsp:include page="header.jsp"/>


	  <a href="https://www.facebook.com/dialog/oauth?client_id=889293998090512&redirect_uri=https://localhost:8443/Software-Engineering-Academic-Board/login/facebook">Login Facebook</a>
	  
	  <form name='loginForm' action="login" method='POST'>
	    <table>
	      <tr>
	        <td>User:</td>
	        <td><input type='email' name='username'></td>
	      </tr>
	      <tr>
	        <td>Password:</td>
	        <td><input type='password' name='password' /></td>
	      </tr>
	      <tr>
	        <td colspan='2'><input name="submit" type="submit" value="login" /></td>
	      </tr>
	    </table>
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	  </form>
</body>
</html>