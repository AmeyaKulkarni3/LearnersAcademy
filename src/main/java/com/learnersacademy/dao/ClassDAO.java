package com.learnersacademy.dao;

import java.sql.SQLException;

import com.learnersacademy.entity.ClassOffered;
import com.learnersacademy.utils.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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

}
