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
	int classId = Integer.parseInt(request.getParameter("cid"));
	int subjectId = Integer.parseInt(request.getParameter("sid"));
	int teacherId = Integer.parseInt(request.getParameter("tid"));
	ClassDAO dao = new ClassDAO();
	String status = dao.deleteSubjectsTeachers(classId, subjectId, teacherId);
	PrintWriter pw = response.getWriter();
	if (status.equals("success")) {
		pw.print("<h4>Details Deleted Successfully!</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("SubjectsAndTeachers.jsp");
		rd.include(request, response);
	} else {
		pw.print("<h4>Issue Deleting Details! Please try again.</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("SubjectsAndTeachers.jsp");
		rd.include(request, response);
	}
	%>

</body>
</html>