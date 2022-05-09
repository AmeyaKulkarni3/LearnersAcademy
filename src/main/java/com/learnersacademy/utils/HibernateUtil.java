package com.learnersacademy.utils;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {
	
	private static SessionFactory sessionFactory;
	
	public static SessionFactory getSessionFactory() {
		
		System.out.println("In Hibernate Util");
		
		if(sessionFactory == null) {
			
//			System.out.println("In Hibernate Util");
			
			StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
			
			Metadata md = new MetadataSources(ssr).getMetadataBuilder().build();
			
			sessionFactory = md.getSessionFactoryBuilder().build();
			
			return sessionFactory;
		}
		return sessionFactory;
	}

}
