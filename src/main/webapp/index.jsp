<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Learner's Academy</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div style="text-align:center">
<h2>Login</h2>
<form action="AdminHome" method="post">
	Username <input type="text" name="username"><br><br>
	Password <input type="password" name="password"><br><br>
	<input type="submit">
</form>
</div>
</body>
</html>