package com.dhrumil.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.FormatFlagsConversionMismatchException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.query.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dhrumil.FactoryProvider.Addfactory;
import com.dhrumil.todo.TodoRegister;

/**
 * Servlet implementation class Loginauthentication
 */
@WebServlet("/Loginauthentication")
public class Loginauthentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	@Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	   int flag = 1;
    	   ServletContext context=getServletContext();   
    	   PrintWriter out = res.getWriter();
    	   res.setContentType("text/html");
    	   req.setAttribute("org.apache.catalina.ASYNC_SUPPORTED", true);
    	   try {
    		String email = req.getParameter("uname").trim();
       		String password = req.getParameter("pass").trim();
       		
       		Session session = Addfactory.getFactory().openSession();
   			Transaction tx = session.beginTransaction();
   			
   			String query = "from TodoRegister";
   			Query query2 = session.createQuery(query);
   			List<TodoRegister> users = query2.list();
   			
   			tx.commit();
   			session.close();
   			for (TodoRegister todoRegister : users) {
   				if ((todoRegister.getEmail().equals(email) && (todoRegister.getPassword().equals(password)) )) {
   					context.setAttribute("ID", todoRegister.getId());
   					flag =0;
//   					System.out.println(todoRegister.getId() + todoRegister.getEmail() + todoRegister.getPassword());
//   					System.out.println(email + password);
//   					req.setAttribute("id", todoRegister.getId());
//   					req.getRequestDispatcher("addNotes.jsp").forward(req, res);
   					res.sendRedirect("addNotes.jsp");
   					break;
   				}
   			}
   			res.sendRedirect("login.jsp");
   		

		} 
    	catch (Exception e) 
    	{
			System.out.println(e);
		}
    	   
    }
	

}
