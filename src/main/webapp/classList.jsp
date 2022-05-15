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
td {
    text-align: center;
    vertical-align: middle;
}
</style>
<body>
	<%@include file="header.jsp"%>
	<div style="text-align: center">
		<h1>Classes</h1>
		<table border=1 class="center">
			<%
			session.setAttribute("classId", null);
			ClassDAO dao = new ClassDAO();
			List<ClassOffered> classes = dao.getClasses();
			%>
			<tr>
				<th>Class Id</th>
				<th>Class Name</th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<% for(ClassOffered c : classes){ %>
				<tr>
					<td><%=c.getId() %></td>
					<td><%=c.getClassName() %></td>
					<td><a href="editClass.jsp?id=<%=c.getId()%>">Edit</a></td>
					<td><a href="deleteClass.jsp?id=<%=c.getId()%>">Delete</a></td>
					<td><a href="SubjectsAndTeachers.jsp?classId=<%=c.getId()%>">Subjects and Teachers</a></td>
					<td><a href="classReport.jsp?id=<%=c.getId()%>">Class Report</a></td>
				</tr>
			<%} %>
		</table>
	</div>
	<a href="AdminHome.jsp">Back to Admin Menu...</a>
</body>
</html>