package com.learnersacademy.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.learnersacademy.dao.ClassDAO;
import com.learnersacademy.entity.ClassOffered;

/**
 * Servlet implementation class AddClass
 */
public class AddClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClassOffered co = new ClassOffered();
		co.setClassName(request.getParameter("className"));
		ClassDAO dao = new ClassDAO();
		PrintWriter pw = response.getWriter();
		try {
			int id = dao.createClass(co);
			if (id > 0) {
				pw.print("<h4>Class Added Successfully!</h4>");
				RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
				rd.include(request, response);
			} else {
				pw.print("<h4>Could not add Class! Please try again.</h4>");
				RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
				rd.include(request, response);
			}
		} catch (ClassNotFoundException e) {
			pw.print("<h4>Could not add Class! Please try again.</h4>");
			RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
			rd.include(request, response);
			e.printStackTrace();
		} catch (SQLException e) {
			pw.print("<h4>Could not add Class! Please try again.</h4>");
			RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
			rd.include(request, response);
			e.printStackTrace();
		}
	}

}
