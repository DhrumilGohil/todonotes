<%@page import="org.hibernate.query.Query"%>
<%@page import="com.dhrumil.todo.TodoRegister"%>
<%@page import="com.dhrumil.servlets.register"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.dhrumil.FactoryProvider.Addfactory"%>
<%@page import="org.hibernate.Session"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
		<%@include file="file_css_js.jsp" %>
		<style type="text/css">
			body{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
}
.emp-profile{
    padding: 3%;
    margin-top: 3%;
    margin-bottom: 3%;
    border-radius: 0.5rem;
    background: #fff;
}
.profile-img{
    text-align: center;
}
.profile-img img{
    width: 70%;
    height: 100%;
}
.profile-img .file {
    position: relative;
    overflow: hidden;
    margin-top: -20%;
    width: 70%;
    border: none;
    border-radius: 0;
    font-size: 15px;
    background: #212529b8;
}
.profile-img .file input {
    position: absolute;
    opacity: 0;
    right: 0;
    top: 0;
}
.profile-head h5{
    color: #333;
}
.profile-head h6{
    color: #0062cc;
}
.profile-edit-btn{
    border: none;
    border-radius: 1.5rem;
    width: 70%;
    padding: 2%;
    font-weight: 600;
    color: #6c757d;
    cursor: pointer;
}
.proile-rating{
    font-size: 12px;
    color: #818182;
    margin-top: 5%;
}
.proile-rating span{
    color: #495057;
    font-size: 15px;
    font-weight: 600;
}
.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
    font-weight:600;
    border: none;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #0062cc;
}
.profile-work{
    padding: 14%;
    margin-top: -15%;
}
.profile-work p{
    font-size: 12px;
    color: #818182;
    font-weight: 600;
    margin-top: 10%;
}
.profile-work a{
    text-decoration: none;
    color: #495057;
    font-weight: 600;
    font-size: 14px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 600;
}
.profile-tab p{
    font-weight: 600;
    color: #0062cc;
}s
		</style>
</head>
<body>
<!------ Include the above in your HEAD tag ---------->

<div class="container emp-profile">
		<%
		response.setHeader("Cache-Control", "no-cache,no-store");
			ServletContext context1 = getServletContext();
			int id =(Integer) context1.getAttribute("ID");
			Session session2 = Addfactory.getFactory().openSession();
			Transaction tx = session2.beginTransaction();
			
			Query query = session2.createQuery("from TodoRegister where Id = :c");
			query.setParameter("c", id);
			
			TodoRegister register1 = (TodoRegister)query.uniqueResult();
			
			tx.commit();
			session2.close();
		%>
            <form method="post">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="images/user.png" alt=""/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h5>
                                        <%=register1.getName() %>
                                    </h5>
                                    <h6>
                                        <%=register1.getDesignation() %>
                                    </h6>
                                    <p class="proile-rating">RANKINGS : <span>8/10</span></p>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                 
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2 text-center pb-5">
                        <div class="logout-img">
                           <a href="logoutServlet"> <img src="images/logout.png" alt=""class="img-fluid" width="30"/></a>
                        </div>
                    </div>
                  </div>
                <div class="row">
                    <div class="col-md-4">
                        
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>User Id</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=register1.getId() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Name</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=register1.getName() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=register1.getEmail() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=register1.getPhonenumber() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Profession</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=register1.getDesignation() %></p>
                                            </div>
                                        </div>
                            </div>

                        </div>
                    </div>
                </div>
            </form>           
        </div>
 </body>
</html>