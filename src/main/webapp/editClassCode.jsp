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
	int classId = Integer.parseInt(String.valueOf((session.getAttribute("classId"))));
	String newClassName = request.getParameter("newClassName");
	ClassDAO dao = new ClassDAO();
	String status = dao.updateClassName(classId, newClassName);
	PrintWriter pw = response.getWriter();
	if (status.equals("success")) {
		pw.print("<h4>Details Updated Successfully!</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("classList.jsp");
		rd.include(request, response);
	} else {
		pw.print("<h4>Issue Updating Details! Please try again.</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("classList.jsp");
		rd.include(request, response);
	}
	%>

</body>
</html>