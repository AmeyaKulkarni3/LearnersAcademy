<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.learnersacademy.dao.*"%>
<%@ page import="com.learnersacademy.entity.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
table.center{
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
	<%@include file="header.jsp"%>
	<div style="text-align: center">
		<h1>Teachers</h1>
		<table border=1 class="center">
			<%
			TeacherDAO dao = new TeacherDAO();
			List<Teacher> teachers = dao.getTeachers();
			%>
			<tr>
				<th>Teacher Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>DOB</th>
				<th>Address</th>
				<th>Phone</th>
				<th>Designation</th>
				<th>Edit</th>
				<th>Delete
				
			</tr>
			<% for(Teacher t : teachers){ %>
				<tr>
					<td><%=t.getId() %></td>
					<td><%=t.getFirstName() %></td>
					<td><%=t.getLastName() %></td>
					<td><%=t.getDateOfBirth() %></td>
					<td><%=t.getAddress() %></td>
					<td><%=t.getPhone() %></td>
					<td><%=t.getDesignation().name() %></td>
					<td><a href="editTeacher.jsp?id=<%=t.getId()%>">Edit</a></td>
					<td><a href="deleteTeacher.jsp?id=<%=t.getId()%>">Delete</a></td>
				</tr>
			<%} %>
		</table>
	</div>
	<a href="AdminHome.jsp">Back to Admin Menu...</a>
</body>
</html>