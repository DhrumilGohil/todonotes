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
	<br>
	<div class="container">
	<H1 class="text-center">Here Add your notes</h1>
	
	<%
		response.setHeader("Cache-Control", "no-cache,no-store");
		ServletContext context = request.getServletContext();
		if(context.getAttribute("ID") == null)
		{
			response.sendRedirect("register.jsp");
		}
		else
		{
			int id =(Integer) context.getAttribute("ID"); 
	%>
		<form action="addnotes" method="post">
		<input type="hidden" name="id" value="<%= id%>">
		  <div class="form-group">
		    <label for="title" class="font-weight-bold">Title</label>
		    <input type="text" class="form-control" id="title" name="title" placeholder="Enter Your title">
		  </div>
		 
		  <div class="form-group">
		    <label for="descrition" class="font-weight-bold">Description</label>
		    <textarea class="form-control"  id="description" name="description" placeholder="Descrption.."  rows="5"></textarea>
		  </div>
		  
		  <div class="container">
		  	 <button type="submit" class="btn btn-primary">Submit</button>
		  </div>
		</form>
	</div>
	<%} %>
</body>
</html>