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
	int id = Integer.parseInt(request.getParameter("id"));
	if(session.getAttribute("teacherId") == null){
		session.setAttribute("teacherId", id);
	}
	ClassDAO dao = new ClassDAO();
	classes = dao.getClasses();
	PrintWriter pw = response.getWriter();
	if (classes == null) {
		pw.print("<h4> No Classes Exist </h4>");
	}
	TeacherDAO tdao = new TeacherDAO();
	int teacherId = Integer.parseInt(String.valueOf(session.getAttribute("teacherId")));
	Teacher teacher = tdao.getTeacherById(teacherId);
	%>
	<%@include file="header.jsp"%>
	<div style="text-align: center">
		<form action="editTeacherCode.jsp" method="post">
			<h2>Update Student</h2>
			<br> First Name <br> <input type="text" name="firstName" value="<%=teacher.getFirstName()%>"><br>
			<br> Last Name <br> <input type="text" name="lastName" value="<%=teacher.getLastName()%>"><br>
			<br> DOB <br> <input type="date" name="dateOfBirth" value="<%=teacher.getDateOfBirth()%>"><br>
			<br> Address <br> <input type="text" name="address" value="<%=teacher.getAddress()%>"><br>
			<br> Phone <br> <input type="text" name="phone" value="<%=teacher.getPhone()%>"><br><br>
			Designation <br>
			<select name="designation" id="designation" value="<%=teacher.getDesignation().name()%>">
				<option value="full"> Full Professor</option>
				<option value="associate"> Associate Professor</option>
				<option value="assistant"> Assistant Professor</option>
				<option value="visiting"> Visiting Professor</option>
				<option value="adjunct"> Adjunct Professor</option>
			</select> <br><br>
			<br><br> <input type="submit">
		</form>
	</div>
	<a href="AdminHome.jsp">Back to Admin Menu...</a>
</body>
</html>