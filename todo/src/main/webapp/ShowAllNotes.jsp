<%@page import="org.hibernate.query.*"%>
<%@page import="java.util.List"%>
<%@page import="com.dhrumil.todo.Todomaker"%>
<%@page import="com.dhrumil.FactoryProvider.Addfactory"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
		<%@include file="file_css_js.jsp" %>
</head>
<body>
	  <%@include file="navbar.jsp" %>
	  <%
	  response.setHeader("Cache-Control", "no-cache,no-store");
		ServletContext context = request.getServletContext();
		if(context.getAttribute("ID") == null)
		{
			response.sendRedirect("register.jsp");
		}
		else
		{
	%>
	<div class="container">
		<h1 style="text-align: center;">All Notes</h1>
		<%
			int id =(Integer) getServletContext().getAttribute("ID");
			Session session2 = Addfactory.getFactory().openSession();
			Query allnotes = session2.createQuery("from Todomaker where register_Id=:c");
			allnotes.setParameter("c", id);
			List<Todomaker> allnote = allnotes.list();
			for(Todomaker tmk:allnote)
			{
			%>
				
			<div class="card mt-3">
			  <img class="card-img-top p-1" style="max-width: 100px;" src="images/notes.png" alt="Card image cap">
			  <div class="card-body">
			    <h5 class="card-title"><%= tmk.getTitle() %></h5>
			    <p class="card-text"><%= tmk.getDescrption() %></p>
			    <div class="container text-center">
			    	<a href="deletnotes?noteID=<%=tmk.getId() %>" class="btn btn-danger">Delete</a>
			    	<a href="editnotes.jsp?noteID=<%=tmk.getId() %>" class="btn btn-primary">Update</a>
			    </div>
			  </div>
			</div>
		<%
			}
			session2.close();
		%>
		<%
		}
		%>
	</div>
	
</body>
</html>