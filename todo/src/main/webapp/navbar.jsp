<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">TodoMaker</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="addNotes.jsp">Add Notes</a>
      </li>
     <!--  <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li> -->
      <li class="nav-item">
        <a class="nav-link disabled" href="ShowAllNotes.jsp ">Show Notes</a>
      </li>
    </ul>
    <%ServletContext context1 = request.getServletContext();
    	if(context1.getAttribute("ID")==null)
    	{
    %>
      <a href="register.jsp" class="btn btn-success my-2 my-sm-0" type="submit">Register</a>
       <a href="login.jsp" class="btn btn-primary my-2 px-3 my-sm-0 ml-3" type="submit">Login</a>
    <%} 
    	else
    	{
    %>
   
    <ul class="navbar-nav ml-auto nav-flex-icons">
    <li class="nav-item">
    	 <a href="logoutServlet" class="btn btn-success my-2 my-sm-0" type="submit">Logout</a>
    <li>
      <li class="nav-item avatar ml-4">
        <a class="nav-link p-0" href="profile.jsp">
          <img src="images/user.png" class="rounded-circle z-depth-0"
            alt="avatar image" height="35">
        </a>
      </li>
    </ul>
     
    <%} %>
  </div>
</nav>