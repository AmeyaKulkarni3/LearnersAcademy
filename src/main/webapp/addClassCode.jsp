<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.learnersacademy.entity.ClassOffered"%>
<%@ page import="com.learnersacademy.dao.ClassDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String name = request.getParameter("className");
	ClassOffered co = new ClassOffered();
	co.setClassName(name);
	ClassDAO dao = new ClassDAO();
	int id = dao.createClass(co);
	PrintWriter pw = response.getWriter();
	if (id > 0) {
		pw.print("<h4>Class Added Successfully!</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
		rd.include(request, response);
	} else {
		pw.print("<h4>Could not add Class! Please try again.</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
		rd.include(request, response);
	}
	%>

</body>
</html>