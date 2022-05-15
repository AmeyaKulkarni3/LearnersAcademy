<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.learnersacademy.dao.*"%>
<%@ page import="com.learnersacademy.entity.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Learner's Academy</title>
</head>
<body>
	<%!List<ClassOffered> classes = new ArrayList<>();%>
	<%
	ClassDAO dao = new ClassDAO();
	classes = dao.getClasses();
	PrintWriter pw = response.getWriter();
	if (classes == null) {
		pw.print("<h4> No Classes Exist </h4>");
	}
	%>
	<%@include file="header.jsp"%>
	<div style="text-align: center">
		<form action="addStudentCode.jsp" method="post">
			<h2>Add New Student</h2>
			<br> First Name <br> <input type="text" name="firstName"><br>
			<br> Last Name <br> <input type="text" name="lastName"><br>
			<br> DOB <br> <input type="date" name="dateOfBirth"><br>
			<br> Address <br> <input type="text" name="address"><br>
			<br> Phone <br> <input type="text" name="phone"><br>
			<br> Assign Class <br>
			<select name="course">
				<%
				for(int i = 0; i < classes.size(); i++){ %>
					<option value="<%=classes.get(i).getId() %>"><%=classes.get(i).getClassName() %></option>					
				<%}%>
			</select>
			<br><br> <input type="submit">
		</form>
	</div>
	<a href="AdminHome.jsp">Back to Admin Menu...</a>
</body>
</html>