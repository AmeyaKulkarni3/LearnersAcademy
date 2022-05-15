<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.learnersacademy.dao.*"%>
<%@ page import="com.learnersacademy.entity.*"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.io.PrintWriter" %>
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
	System.out.println(dob);
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	int classId = Integer.parseInt(request.getParameter("course"));
	ClassDAO classDao = new ClassDAO();
	ClassOffered co = classDao.getClassById(classId);
	Student student = new Student();
	student.setFistName(firstName);
	student.setLastName(lastName);
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	LocalDate date = LocalDate.parse(dob, formatter);
	student.setDateOfBirth(date);
	student.setAddress(address);
	student.setPhone(phone);
	student.setClassJoined(co);
	System.out.println(student);
	StudentDAO dao = new StudentDAO();
	int row = dao.createStudent(student);
	PrintWriter pw = response.getWriter();
	if(row>0){
		pw.print("<h4>Student Added Successfully!</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
		rd.include(request, response);
	}
	else{
		pw.print("<h4>Could not add Student! Please try again.</h4>");
		RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
		rd.include(request, response);
	}

	%>

</body>
</html>