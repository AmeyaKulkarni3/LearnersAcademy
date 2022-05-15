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
	<%!List<Teacher> teachers = new ArrayList<>();%>
	<%!List<Subject> subjects = new ArrayList<>();%>
	<%!ClassOffered co = new ClassOffered();%>
	<%
	if(session.getAttribute("classId") == null){
		session.setAttribute("classId", request.getParameter("classId"));
	}	
	int id = Integer.parseInt(String.valueOf((session.getAttribute("classId"))));
	TeacherDAO teacherDAO = new TeacherDAO();
	SubjectDAO subjectDAO = new SubjectDAO();
	ClassDAO classDAO = new ClassDAO();
	teachers = teacherDAO.getTeachers();
	subjects = subjectDAO.getSubjects();
	co = classDAO.getClassById(id);
	%>
	<%@include file="header.jsp"%>
	<div style="text-align: center">
		<h2>
			Add Teachers and Subjects to
			<%=co.getClassName()%></h2>
		<form action="updateSubjectTeachers.jsp" method="post">
			Select Subject <br> <br> <select name="subject">
				<%
				for (int i = 0; i < subjects.size(); i++) {
				%>
				<option value="<%=subjects.get(i).getId()%>"><%=subjects.get(i).getName()%></option>
				<%
				}
				%>
			</select><br> <br> Select Teacher <br> <br> <select
				name="teacher">
				<%
				for (int i = 0; i < teachers.size(); i++) {
				%>
				<option value="<%=teachers.get(i).getId()%>"><%=teachers.get(i).getFirstName() + " " + teachers.get(i).getLastName()%></option>
				<%
				}
				%>
			</select><br> <br> <input type="submit" value="Save"><br>
			<br>
		</form>
		<%
		List<Teacher> classTeachers = co.getTeachers();
		List<Subject> classSubjects = co.getSubjects();
		if (classTeachers.size() != 0 || classSubjects.size() != 0) {
		%>
		<table border=1 class="center">
			<tr>
				<th>Sr.No</th>
				<th>Subject</th>
				<th>Teacher</th>
				<th></th>
			</tr>
			<%
			for (int i = 0; i < classSubjects.size(); i++) {
			%>
			<tr>
				<td><%=i + 1%></td>
				<td><%=classSubjects.get(i).getName()%></td>
				<td><%=classTeachers.get(i).getFirstName() + " " + classTeachers.get(i).getLastName()%></td>
				<td><a
					href="deleteSubjectTeacher.jsp?cid=<%=co.getId()%>&sid=<%=classSubjects.get(i).getId()%>&tid=<%=classTeachers.get(i).getId()%>">Delete</a></td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		}
		%>
		<br>
		<br> <a href="classList.jsp">Back</a>
	</div>
</body>
</html>