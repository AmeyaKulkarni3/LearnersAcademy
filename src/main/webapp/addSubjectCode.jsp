<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.learnersacademy.entity.Subject"%>
<%@ page import="com.learnersacademy.dao.SubjectDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	SubjectDAO dao = new SubjectDAO();
	String name = request.getParameter("subjectName");
	Subject subject = new Subject();
	subject.setName(name);
	int id = dao.createSubject(subject);
	PrintWriter pw = response.getWriter();
	if (id > 0) {
		pw.print("<h4>Subject Added Successfully!</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
		rd.include(request, response);
	} else {
		pw.print("<h4>Could not add Subect! Please try again.</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
		rd.include(request, response);
	}
	%>

</body>
</html>