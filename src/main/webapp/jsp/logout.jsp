<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
Michael McNulty
CSD - 460 Capstone
Poviso
11/28/2021
References: Some of the code below was taken and adjusted from the site https://www.onlyxcodes.com/2018/01/login-and-register-using-jsp-mysql.html to fit our needs for this project.
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout Page</title>
</head>
<body>
	<%
		session.invalidate();
		response.sendRedirect("index.jsp");
	%>
</body>
</html>

