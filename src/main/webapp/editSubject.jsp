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
<body>
	<%@include file="header.jsp"%>
	<div style="text-align: center">
		<%
		if(session.getAttribute("subjectId") == null){
			session.setAttribute("subjectId", request.getParameter("id"));
		}	
		int id = Integer.parseInt(String.valueOf((session.getAttribute("subjectId"))));
		SubjectDAO dao = new SubjectDAO();
		Subject s = dao.getSubjectById(id);
		%>
		<h2>Edit Class</h2><br>
		<form action="editSubjectCode.jsp">
			Enter New Class Name<br><br>
			<input type="text" name="newSubjectName" value="<%=s.getName()%>"><br><br>
			<input type="submit">
		</form>
	</div>
</body>
</html>