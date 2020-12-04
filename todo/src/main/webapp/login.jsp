<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.form-box
{
	width:40%;
	height:500px;
	position: relative;
	top:0;
	transform:translate(70%,0%);
}
input[type="text"],input[type="password"]
{
	width:100%;
}

</style>
	<%@include file="file_css_js.jsp" %>
</head>
<body>
 <div class="container">
<div class="form-box">
	<h1 class="header text-center">Log in</h1>
	<form action="Loginauthentication" method="post">
		<div class="form-group username">
			<input type="text" name="uname"
			
			 class="form-control" id="uname" placeholder="Email/Username" autocomplete="off" required>
		</div>
		<div class="form-group password">
			<input type="password"  name="pass" class="form-control" id="password" placeholder="password" autocomplete="off" required>
		</div>
		<div class="container">
			<input type="submit" class="btn btn-primary px-5 submit mt-4 w-100" value="submit">
		</div>
		
	</form>
</div>
</div>
</body>
</html>