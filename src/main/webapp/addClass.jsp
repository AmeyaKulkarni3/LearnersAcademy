<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Learner's Academy</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<div style="text-align: center">
		<form action="addClassCode.jsp" method="post">
			<h2>Add New Class</h2><br>
			Class Name <br>
			<input type="text" name="className"><br><br>
			<input type="submit">
		</form>
	</div>
	<a href="AdminHome.jsp">Back to Admin Menu...</a>
</body>
</html>