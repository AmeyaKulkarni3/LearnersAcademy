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
	<%
	int count = 0;
	ClassDAO dao = new ClassDAO();
	int classId = (int) session.getAttribute("classClicked");
	ClassOffered co = dao.getClassById(classId);
	List<Subject> subjects = co.getSubjects();
	List<Teacher> teachers = co.getTeachers();
	%>
	<table border=1 class="center">
		<tr>
			<th>Sr.No</th>
			<th>Subject</th>
			<th>Teacher</th>
			<th></th>
		</tr>
		<%
		for (int i = 0; i < subjects.size(); i++) {
		%>
		<tr>
			<td>count++</td>
			<td><%=subjects.get(i).getName()%></td>
			<td><%=teachers.get(i).getFirstName() + " " + teachers.get(i).getLastName()%></td>
			<td><a href="deleteSubjectTeacher.jsp">Delete</a></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>