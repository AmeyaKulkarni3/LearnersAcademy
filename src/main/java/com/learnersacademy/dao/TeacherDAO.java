package com.learnersacademy.dao;

import java.util.List;

import com.learnersacademy.entity.ClassOffered;
import com.learnersacademy.entity.Subject;
import com.learnersacademy.entity.Teacher;
import com.learnersacademy.utils.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class TeacherDAO {
	
	public int createTeacher(Teacher teacher) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		int id = (int) session.save(teacher);
		
		transaction.commit();
		session.close();
		
		return id;
	}
	
	public List<Teacher> getTeachers(){
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		Query<Teacher> query = session.createQuery("from Teacher");
		
		List<Teacher> teachers = query.list();
		
		transaction.commit();
		session.close();
		
		return teachers;
		
	}
	
	public Teacher getTeacherById(int id) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		Query query = session.createQuery("from Teacher where id=:no");
		
		query.setParameter("no", id);
		
		Teacher t = (Teacher) query.uniqueResult();
		
		transaction.commit();
		session.close();
		
		return t;
				
	}
	
	public String updateTeacher(Teacher teacher) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		TeacherDAO dao = new TeacherDAO();
		
		Teacher t = dao.getTeacherById(teacher.getId());
		
		t.setFirstName(teacher.getFirstName());
		t.setLastName(teacher.getLastName());
		t.setDateOfBirth(teacher.getDateOfBirth());
		t.setAddress(teacher.getAddress());
		t.setPhone(teacher.getPhone());
		t.setDesignation(teacher.getDesignation());
		
		session.saveOrUpdate(t);
		
		transaction.commit();
		session.close();
		
		return "success";
	}
	
	public String deleteTeacher(int id) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		TeacherDAO dao = new TeacherDAO();
		
		ClassDAO cdao = new ClassDAO();
		
		List<ClassOffered> classes = cdao.getClasses();
		
		for(ClassOffered co : classes) {
			List<Teacher> teachers = co.getTeachers();
			if(teachers != null) {
				for(Teacher teacher : teachers) {
					if(teacher.getId() == id) {
						teachers.remove(teacher);
						co.setTeachers(teachers);
						session.saveOrUpdate(co);
						transaction.commit();
						transaction = session.beginTransaction();	
					}
				}
			}
			
		}
		
		Teacher t = dao.getTeacherById(id);
		
		session.delete(t);
		
		transaction.commit();
		session.close();
		
		return "success";
		
	}

}
