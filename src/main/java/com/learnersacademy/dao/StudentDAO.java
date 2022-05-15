package com.learnersacademy.dao;

import java.sql.SQLException;
import java.util.List;

import com.learnersacademy.entity.ClassOffered;
import com.learnersacademy.entity.Student;
import com.learnersacademy.utils.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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
		s.setClassJoined(student.getClassJoined());

		int id = (int) session.save(s);

		transaction.commit();
		session.close();
//		sessionFactory.close();

		return id;

	}

	public List<Student> getStudents() {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();

		Query<Student> query = session.createQuery("from Student");

		List<Student> students = query.list();

		transaction.commit();
		session.close();

		return students;
	}

	public String updateClass(Student student) {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();

		student.setClassJoined(null);

		session.saveOrUpdate(student);

		transaction.commit();
		session.close();

		return "success";

	}

	public Student getStudentById(int id) {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();

		Query query = session.createQuery("from Student where id=:no");

		query.setParameter("no", id);

		Student s = (Student) query.uniqueResult();

		transaction.commit();
		session.close();

		return s;

	}
	
	public String updateStudent(Student student) throws ClassNotFoundException, SQLException {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();

		Student s = getStudentById(student.getId());

		s.setFistName(student.getFistName());
		s.setLastName(student.getLastName());
		s.setDateOfBirth(student.getDateOfBirth());
		s.setAddress(student.getAddress());
		s.setPhone(student.getPhone());
		
		if(!s.getClassJoined().getClassName().equals(student.getClassJoined().getClassName())) {
			s.setClassJoined(student.getClassJoined());
		}

		session.saveOrUpdate(s);

		transaction.commit();
		session.close();
//		sessionFactory.close();

		return "success";

	}
	
	public String deleteStudent(int id) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();

		Student s = getStudentById(id);
		
		session.delete(s);
		
		transaction.commit();
		session.close();
		
		return "success";
		
	}

}
