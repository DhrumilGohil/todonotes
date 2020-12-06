package com.dhrumil.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dhrumil.FactoryProvider.Addfactory;
import com.dhrumil.todo.TodoRegister;
import com.dhrumil.todo.Todomaker;

/**
 * Servlet implementation class Addnotes
 */
@WebServlet("/addnotes")
public class Addnotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
		protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();
		try {
			ApplicationContext context = new ClassPathXmlApplicationContext("Todomaker.xml");
			
			String title = req.getParameter("title");
			String description = req.getParameter("description");
			int id =(Integer.parseInt(req.getParameter("id")));
			
		//	System.out.println(id);
			TodoRegister register = (TodoRegister) context.getBean("todoRegister"); //only first letter in annotation
			register.setId(id);
			
			
		//	Todomaker note1 = context.getBean(Todomaker.class);
			Todomaker note1 = (Todomaker) context.getBean("todomaker");
			note1.setTitle(title);
			note1.setDescrption(description);
			note1.setAddDate(new Date());
			note1.setTodoRegister(register);
			
			
			Session session = Addfactory.getFactory().openSession();
			Transaction tx = session.beginTransaction();
			
			session.save(note1);	//Hibernet save()
			tx.commit();
			
			session.close();
			
			out.print("<h1 style='text-align:center;'>Added Successfully</h1>");
			out.print("<a href='ShowAllNotes.jsp'>Show All Notes</a>");
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}
			// TODO Auto-generated method stub
			
			
		}
}
