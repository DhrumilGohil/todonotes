package com.dhrumil.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dhrumil.FactoryProvider.Addfactory;
import com.dhrumil.todo.TodoRegister;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   @Override
   protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	   // TODO Auto-generated method stub
	   PrintWriter out = res.getWriter();
	   String name = req.getParameter("name");
	   String email = req.getParameter("email");
	   String phonenum = req.getParameter("phonenumber");
	   String des = req.getParameter("designation");
	   String password = req.getParameter("pass");
	//   out.print(name +  email + phonenum + des + password);
	   
	   TodoRegister register1 = new TodoRegister();
	   register1.setName(name);
	   register1.setDesignation(des);
	   register1.setEmail(email);
	   register1.setPassword(password);
	   register1.setPhonenumber(phonenum);
	   
	   Session session = Addfactory.getFactory().openSession();
	   Transaction tx = session.beginTransaction();
	   session.save(register1);
	   tx.commit();
	   session.close();
	   res.sendRedirect("login.jsp");
	   
   }

}
