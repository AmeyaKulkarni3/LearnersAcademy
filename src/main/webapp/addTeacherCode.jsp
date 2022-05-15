<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.learnersacademy.dao.TeacherDAO"%>
<%@ page import="com.learnersacademy.entity.Teacher"%>
<%@ page import="com.learnersacademy.utils.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String dob = request.getParameter("dateOfBirth");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String designation = request.getParameter("designation");
	Teacher teacher = new Teacher();
	teacher.setFirstName(firstName);
	teacher.setLastName(lastName);
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	LocalDate date = LocalDate.parse(dob, formatter);
	teacher.setDateOfBirth(date);
	teacher.setAddress(address);
	teacher.setPhone(phone);
	Designation des = null;
	switch (designation) {
		case "full":
			des = Designation.FULL_PROFESSOR;
			break;
		case "associate":
			des = Designation.ASSOCIATE_PROFESSOR;
			break;
		case "assistant":
			des = Designation.ASSISTANT_PROFESSOR;
			break;
		case "visiting":
			des = Designation.VISITING_PROFESSOR;
			break;
		case "adjunct":
			des = Designation.ADJUNCT_PROFESSOR;
			break;
	}
	teacher.setDesignation(des);
	System.out.println(teacher);
	TeacherDAO dao = new TeacherDAO();
	int row = dao.createTeacher(teacher);
	PrintWriter pw = response.getWriter();
	if (row > 0) {
		pw.print("<h4>Teacher Added Successfully!</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
		rd.include(request, response);
	} else {
		pw.print("<h4>Could not add Teacher! Please try again.</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
		rd.include(request, response);
	}
	%>

</body>
</html>