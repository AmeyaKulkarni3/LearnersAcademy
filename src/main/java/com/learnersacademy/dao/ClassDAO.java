package com.learnersacademy.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.learnersacademy.entity.ClassOffered;
import com.learnersacademy.entity.Student;
import com.learnersacademy.entity.Subject;
import com.learnersacademy.entity.Teacher;
import com.learnersacademy.utils.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ClassDAO {

	public int createClass(ClassOffered classOffered) throws ClassNotFoundException, SQLException{
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();

		ClassOffered co = new ClassOffered();
		
		co.setClassName(classOffered.getClassName());
		
		int id = (int) session.save(co);
		
		transaction.commit();
		session.close();
//		sessionFactory.close();
		
		return id;
	}
	
	public List<ClassOffered> getClasses(){
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		Query<ClassOffered> query = session.createQuery("from ClassOffered");
		
		List<ClassOffered> classes = query.list();
		
		transaction.commit();
		session.close();
		
		return classes;
		
	}
	
	public ClassOffered getClassById(int id) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		Query query = session.createQuery("from ClassOffered where id=:no");
		
		query.setParameter("no", id);
		
		ClassOffered co = (ClassOffered) query.uniqueResult();
		
		transaction.commit();
		session.close();
				
		return co;
		
	}
	
	public String updateSubjectTeacher(int id, int subjectId, int teacherId) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		ClassOffered co = getClassById(id);
		
		List<Subject> subjects = co.getSubjects();
		List<Teacher> teachers = co.getTeachers();
		
		SubjectDAO subDAO = new SubjectDAO();
		TeacherDAO tDAO = new TeacherDAO();
		
		Subject s = subDAO.getSubjectById(subjectId);
		
		Teacher t = tDAO.getTeacherById(teacherId);
		
		subjects.add(s);
		teachers.add(t);
		
		co.setSubjects(subjects);
		co.setTeachers(teachers);
		
		session.saveOrUpdate(co);
		
		transaction.commit();
		session.close();
		
		return "success";
		
	}
	
	public String deleteSubjectsTeachers(int id, int subjectId, int teacherId) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		ClassOffered co = getClassById(id);
		
		List<Subject> subjects = co.getSubjects();
		List<Teacher> teachers = co.getTeachers();
		
		for(Subject s : subjects) {
			if(s.getId() == subjectId) {
				subjects.remove(s);
				break;
			}
		}
		
		for(Teacher t : teachers) {
			if(t.getId() == teacherId) {
				teachers.remove(t);
				break;
			}
		}
		
		co.setSubjects(subjects);
		co.setTeachers(teachers);
		
		session.saveOrUpdate(co);
		
		transaction.commit();
		session.close();
		
		return "success";
		
	}
	
	public String updateClassName(int id, String className) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		ClassOffered co = getClassById(id);
		
		co.setClassName(className);
		
		session.saveOrUpdate(co);
		
		transaction.commit();
		session.close();
		
		return "success";
	}
	
	public String deleteClass(int id) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		ClassOffered co = getClassById(id);
		
		List<Student> students = co.getStudents();
		
		for(Student s : students) {
			s.setClassJoined(null);
			session.saveOrUpdate(s);
			transaction.commit();
			transaction = session.beginTransaction();
			
		}
		
		co.setTeachers(null);
		co.setSubjects(null);
		
		session.saveOrUpdate(co);
		
		session.delete(co);
		
		transaction.commit();
		session.close();
		
		return "success";
		
	}
	
	public void deleteClassTeacher(int classId, int teacherId) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		ClassOffered co = getClassById(classId);
		
		List<Teacher> teachers = co.getTeachers();
		
		for(Teacher t : teachers) {
			if(t.getId() == teacherId) {
				teachers.remove(t);
				break;
			}
		}
		
		co.setTeachers(teachers);
		
		session.saveOrUpdate(co);
		
		transaction.commit();
		session.close();
	}

}
