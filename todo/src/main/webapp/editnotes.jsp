<%@page import="com.dhrumil.todo.Todomaker"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.dhrumil.FactoryProvider.Addfactory"%>
<%@page import="java.io.PrintWriter"%>
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
	<div class="container">
	<h1>Edit your note..</h1>
		<%
			response.setHeader("Cache-Control", "no-cache,no-store");
			PrintWriter printout = response.getWriter();
			int id =Integer.parseInt(request.getParameter("noteID").trim());
			Session session2 = Addfactory.getFactory().openSession();
			Todomaker noteTodomaker = session2.get(Todomaker.class, id);
			session2.close();
			//printout.print(id);
		%>
		<form action="editnotes" method="post">
		<input type="hidden" value="<%= noteTodomaker.getId()%>" name="noteID">
		  <div class="form-group">
		    <label for="title">Title</label>
		    <input type="text" class="form-control" value="<%=noteTodomaker.getTitle() %>" id="title" name="title" placeholder="Enter Your title">
		  </div>
		 
		  <div class="form-group">
		    <label for="exampleFormControlTextarea1">Description</label>
		    <textarea class="form-control" id="description" name="description"  rows="5"><%=noteTodomaker.getDescrption() %></textarea>
		  </div>
		  
		  <div class="container text-center">
		  	 <button type="submit" class="btn btn-success">Save Mynotes</button>
		  </div>
		</form>
	</div>
</body>
</html>