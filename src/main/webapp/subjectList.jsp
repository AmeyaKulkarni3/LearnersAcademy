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
		<h1>Subjects</h1>
		<table border=1 class="center">
			<%
			session.setAttribute("subjectId", null);
			SubjectDAO dao = new SubjectDAO();
			List<Subject> subjects = dao.getSubjects();
			%>
			<tr>
				<th>Subject Id</th>
				<th>Subject Name</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<% for(Subject s : subjects){ %>
				<tr>
					<td><%=s.getId() %></td>
					<td><%=s.getName() %></td>
					<td><a href="editSubject.jsp?id=<%=s.getId()%>">Edit</a></td>
					<td><a href="deleteSubject.jsp?id=<%=s.getId()%>">Delete</a></td>
				</tr>
			<%} %>
		</table>
	</div>
	<a href="AdminHome.jsp">Back to Admin Menu...</a>
</body>
</html>