package com.dhrumil.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dhrumil.FactoryProvider.Addfactory;
import com.dhrumil.todo.Todomaker;

/**
 * Servlet implementation class deletenotes
 */
@WebServlet("/deletnotes")
public class deletenotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
		protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			// TODO Auto-generated method stub
		try {
			int NoteID = Integer.parseInt(req.getParameter("noteID").trim());
			Session session = Addfactory.getFactory().openSession();
			Transaction tx = session.beginTransaction();
				Todomaker noteTodomaker = session.get(Todomaker.class, NoteID);
				session.delete(noteTodomaker);
			tx.commit();
			session.close();
			res.sendRedirect("ShowAllNotes.jsp");

		} catch (Exception e) {
			// TODO: handle exception
		}
					}

}
