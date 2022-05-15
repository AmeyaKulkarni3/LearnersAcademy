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
		<%
		int classId = Integer.parseInt(request.getParameter("id"));
		ClassDAO classDAO = new ClassDAO();
		ClassOffered co = classDAO.getClassById(classId);
		%>
		<h2>
			Class Report For
			<%=co.getClassName()%></h2>
		<br>
		<%
		List<Subject> subjects = co.getSubjects();
		List<Teacher> teachers = co.getTeachers();
		List<Student> students = co.getStudents();
		%>
		<table border=1 class="center">
			<tr>
				<th>Sr. No.</th>
				<th>Subject</th>
				<th>Teacher</th>
			</tr>
			<%
			for (int i = 0; i < subjects.size(); i++) {
			%>
			<tr>
				<td><%=i + 1%></td>
				<td><%=subjects.get(i).getName()%></td>
				<td><%=teachers.get(i).getFirstName() + " " + teachers.get(i).getLastName()%>
			</tr>
			<%
			}
			%>
		</table>
		<br>
		<br>
		<h2>Students Enrolled</h2>
		<br>
		<table border=1 class="center">
			<tr>
				<th>Id</th>
				<th>First Name</th>
				<th>LastName</th>
				<th>DOB</th>
				<th>Address</th>
				<th>Phone</th>
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
			</tr>
			<%
			}
			%>
		</table><br>
		<br> <a href="classList.jsp">Back</a>
	</div>

</body>
</html>