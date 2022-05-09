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
		<form action="addStudentCode.jsp" method="post">
			<h2>Add New Student</h2><br>
			First Name <br>
			<input type="text" name="firstName"><br><br>
			Last Name <br>
			<input type="text" name="lastName"><br><br>
			DOB <br>
			<input type="date" name="dateOfBirth"><br><br>
			Address <br>
			<input type="text" name="address"><br><br>
			Phone <br>
			<input type="text" name="phone"><br><br>
			Assign Class <br>
			<input type="text" name="class"><br><br>
			<input type="submit">
		</form>
	</div>
	<a href="AdminHome.jsp">Back to Admin Menu...</a>
</body>
</html>