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
	<%
	if (session.getAttribute("teacherId") == null) {
		session.setAttribute("teacherId", request.getParameter("id"));
	}
	int id = Integer.parseInt(String.valueOf((session.getAttribute("teacherId"))));
	TeacherDAO dao = new TeacherDAO();
	String status = dao.deleteTeacher(id);
	PrintWriter pw = response.getWriter();
	if (status.equals("success")) {
		pw.print("<h4>Details Updated Successfully!</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("teacherList.jsp");
		rd.include(request, response);
	} else {
		pw.print("<h4>Issue Updating Details! Please try again.</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("teacherList.jsp");
		rd.include(request, response);
	}
	%>

</body>
</html>