<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
   	<%@include file="file_css_js.jsp" %>

    <title>Hello, world!</title>
  </head>
  <body>
  <%@include file="navbar.jsp" %>
  <div class="container text-center">
    <img alt="index img" src="images/notes.png" class="img-fluid ml-5" width="450">
   </div>
   <div class="container text-center mt-3" style="font-size: 40px;color: green;">
   	Start Your making notes journey
   </div>
  <div class="container text-center">
  	<a href="addNotes.jsp" type="button" class="btn btn-outline-success px-5 py-2 mt-3"style="font-size: 20px;">Explore</a>
  </div>

   
  </body>
</html>