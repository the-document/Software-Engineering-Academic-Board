<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Academic board|Login</title>
</head>
<body>
	  <a href="https://www.facebook.com/dialog/oauth?client_id=889293998090512&redirect_uri=https://localhost:8443/Software-Engineering-Academic-Board/login/process">Login Facebook</a>
	  
	  <form name='loginForm' action="<c:url value='j_spring_security_login' />" method='POST'>
	    <table>
	      <tr>
	        <td>User:</td>
	        <td><input type='text' name='username'></td>
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