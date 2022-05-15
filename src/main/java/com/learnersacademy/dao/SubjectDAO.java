package com.learnersacademy.dao;

import java.util.List;

import com.learnersacademy.entity.ClassOffered;
import com.learnersacademy.entity.Subject;
import com.learnersacademy.utils.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class SubjectDAO {
	
	public int createSubject(Subject subject) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		int id = (int) session.save(subject);
		
		transaction.commit();
		session.close();
		
		return id;
	}
	
	public List<Subject> getSubjects() {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		Query<Subject> query = session.createQuery("from Subject");
		
		List<Subject> subjects = query.list();
		
		transaction.commit();
		session.close();
		
		return subjects;
	}
	
	public Subject getSubjectById(int id) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		Query query = session.createQuery("from Subject where id=:no");
		
		query.setParameter("no", id);
		
		Subject s = (Subject) query.uniqueResult();
		
		transaction.commit();
		session.close();
		
		return s;
				
	}
	
	public String updateSubjectName(int id, String newSubjectName) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		Subject s = getSubjectById(id);
		s.setName(newSubjectName);
		
		session.saveOrUpdate(s);
		
		transaction.commit();
		session.close();
		
		return "success";
		
	}
	
public String deleteSubject(int id) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		Subject s = getSubjectById(id);
		
		session.delete(s);
		
		transaction.commit();
		session.close();
		
		return "success";
		
	}

}
