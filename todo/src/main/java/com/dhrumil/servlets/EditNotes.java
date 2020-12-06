package com.dhrumil.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.query.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dhrumil.FactoryProvider.Addfactory;
import com.dhrumil.todo.Todomaker;

/**
 * Servlet implementation class EditNotes
 */
@WebServlet("/editnotes")
public class EditNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  @Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
	  PrintWriter out = res.getWriter();
		try {
			ApplicationContext context = new ClassPathXmlApplicationContext("Todomaker.xml");
			
			String title = req.getParameter("title");
			String description = req.getParameter("description");
			int id = Integer.parseInt(req.getParameter("noteID").trim());
			
		//	out.print(id);
			Session session = Addfactory.getFactory().openSession();
			Transaction tx = session.beginTransaction();
			
			Todomaker note1 = session.get(Todomaker.class, id);
			note1.setTitle(title);
			note1.setDescrption(description);
			note1.setAddDate(new Date());
		
			//Hibernet update()
		
			tx.commit();
			session.close();
			
			out.print("<h1 style='text-align:center;'>Update Successfully</h1>");
			res.sendRedirect("ShowAllNotes.jsp");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
