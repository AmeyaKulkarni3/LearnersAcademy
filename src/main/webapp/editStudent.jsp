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
	if(session.getAttribute("studentId") == null){
		session.setAttribute("studentId", id);
	}
	ClassDAO dao = new ClassDAO();
	classes = dao.getClasses();
	PrintWriter pw = response.getWriter();
	if (classes == null) {
		pw.print("<h4> No Classes Exist </h4>");
	}
	StudentDAO sdao = new StudentDAO();
	int studentId = Integer.parseInt(String.valueOf(session.getAttribute("studentId")));
	Student student = sdao.getStudentById(studentId);
	%>
	<%@include file="header.jsp"%>
	<div style="text-align: center">
		<form action="editStudentCode.jsp" method="post">
			<h2>Update Student</h2>
			<br> First Name <br> <input type="text" name="firstName" value="<%=student.getFistName()%>"><br>
			<br> Last Name <br> <input type="text" name="lastName" value="<%=student.getLastName()%>"><br>
			<br> DOB <br> <input type="date" name="dateOfBirth" value="<%=student.getDateOfBirth()%>"><br>
			<br> Address <br> <input type="text" name="address" value="<%=student.getAddress()%>"><br>
			<br> Phone <br> <input type="text" name="phone" value="<%=student.getPhone()%>"><br>
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