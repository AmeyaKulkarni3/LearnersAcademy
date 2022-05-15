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
		<form action="addTeacherCode.jsp" method="post">
			<h2>Add New Teacher</h2><br>
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
			Designation <br>
			<select name="designation" id="designation">
				<option value="full"> Full Professor</option>
				<option value="associate"> Associate Professor</option>
				<option value="assistant"> Assistant Professor</option>
				<option value="visiting"> Visiting Professor</option>
				<option value="adjunct"> Adjunct Professor</option>
			</select> <br><br>
			<input type="submit">
		</form>
	</div>
	<a href="AdminHome.jsp">Back to Admin Menu...</a>
</body>
</html>