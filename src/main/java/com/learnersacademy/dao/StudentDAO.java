package com.learnersacademy.dao;

import java.sql.SQLException;
import com.learnersacademy.entity.Student;
import com.learnersacademy.utils.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class StudentDAO {

	public int createStudent(Student student) throws ClassNotFoundException, SQLException {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		
		Session session = sessionFactory.openSession();
		
		Transaction transaction = session.beginTransaction();
		
		Student s = new Student();
		
		s.setFistName(student.getFistName());
		s.setLastName(student.getLastName());
		s.setDateOfBirth(student.getDateOfBirth());
		s.setAddress(student.getAddress());
		s.setPhone(student.getPhone());
		
		int id = (int) session.save(s);
		
		transaction.commit();
		session.close();
//		sessionFactory.close();
		
		return id;
		
		
	}

}
