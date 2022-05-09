package com.learnersacademy.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtils {
	
	public static final String DB_URL="jdbc:mysql://localhost:3306/learners_academy";
	public static final String USERNAME="root";
	public static final String PASSWORD="root";
	public static Connection getConn() throws ClassNotFoundException, SQLException {
		//register my driver
		Class.forName("com.mysql.jdbc.Driver");
		//establish connection with DB
		Connection con=DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
		return con;
	}


}
