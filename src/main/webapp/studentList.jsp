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
table.center {
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
	<%@include file="header.jsp"%>
	<div style="text-align: center">
		<h1>Students Enrolled</h1>
		<table border=1 class="center">
			<%
			session.setAttribute("studentId",null);
			StudentDAO dao = new StudentDAO();
			List<Student> students = dao.getStudents();
			%>
			<tr>
				<th>Student Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>DOB</th>
				<th>Address</th>
				<th>Phone</th>
				<th>Class</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<%
			for (Student s : students) {
			%>
			<tr>
				<td><%=s.getId()%></td>
				<td><%=s.getFistName()%></td>
				<td><%=s.getLastName()%></td>
				<td><%=s.getDateOfBirth()%></td>
				<td><%=s.getAddress()%></td>
				<td><%=s.getPhone()%></td>
				<%
				if (s.getClassJoined() == null) {
				%>
				<td>No Class Assigned</td>
				<%
				} else {
				%>
				<td><%=s.getClassJoined().getClassName()%></td>
				<%
				}
				%>
				<td><a href="editStudent.jsp?id=<%=s.getId()%>">Edit</a></td>
				<td><a href="deleteStudent.jsp?id=<%=s.getId()%>">Delete</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<a href="AdminHome.jsp">Back to Admin Menu...</a>
</body>
</html>