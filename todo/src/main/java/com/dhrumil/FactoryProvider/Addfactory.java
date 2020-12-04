package com.dhrumil.FactoryProvider;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;



public class Addfactory {
	private static SessionFactory factory;
	
	public static SessionFactory getFactory()
	{
		if(factory==null)
		{
			factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			return factory;
		}
		System.out.println("----------"+factory+"-------------");
		return factory;
	}
	
	public static void closefactory()
	{
		factory.close();
	}
}
