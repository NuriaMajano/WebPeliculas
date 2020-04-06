<%-- 
    Document   : peliculas
    Created on : 18-mar-2020, 12:08:17
    Author     : Nuria
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.Person"%>
<%@page import="entities.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="entities.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="css/mycss.css">
    <title>MoviesNuria</title>
  </head>
  <body>
      <%
      Usuario user = (Usuario) session.getAttribute("usuario");
      %>
    <div class="container shadow">
         <nav class="navbar navbar-dark navbar-expand-md bg-dark px-0">
      <img src="img/tmdb.png" alt="tmdb">
      
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
            <a class="nav-link bg-dark text-white" href="Controller?op=inicio">Person</a>
        </li>
        <li class="nav-item">
            <a class="nav-link bg-dark text-white" href="Controller?op=damemovies">Movie</a>
        </li>
      </ul>
        <%if (user!=null) {%>
        <form class="row" action="Controller?op=logout" method="POST">
            
                <h4 class="text-success m-2">Welcome, <%= user.getNombre()%>!</h4> 

                <button type="submit" class="btn btn-outline-success px-4 mr-5">Log Out</button>
            
        </form>
        <%}else {%>
        <form class="row" action="Controller?op=login" method="POST">
            <div class="col">
                <input type="text" class="form-control" name="dni" placeholder="DNI">
            </div>
            <div class="col">
                <input type="text" class="form-control" name="nombre" placeholder="Nombre">
            </div>
            <div class="col">
                <button type="submit" class="btn btn-outline-success pr-4 pl-4">Login</button>
            </div>
        <form>
        <%}%>
    </nav>
     <!-- MOVIES -->
       <div class="row m-2">
      <%
        List<Movie> peliculas = (List<Movie>)session.getAttribute("peliculas");
            for (int i=0;i<peliculas.size();i++){
            Movie pelicula = peliculas.get(i);
            
        %>
            <div class="col-lg-6 my-2">
                <div class="card mb-3" style="max-width: 540px;">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <% if (pelicula.getPoster() !=null ){ %>
                     <img
                        src="https://image.tmdb.org/t/p/w500<%=pelicula.getPoster() %>" class="card-img-top img-fluid" alt="<%=pelicula.getTitulo() %>">
                    <%} else{%>
                     <img src="img/noimage.png" class="card-img-top img-fluid" alt="noimage">
                    <%}%>
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        
                      <% SimpleDateFormat simple = new SimpleDateFormat("EEE, dd MMM yyyy");
                         String fecha = simple.format(pelicula.getFecha());
                      %>
                       <h5 class="card-title"><%=pelicula.getTitulo() %></h5>
                       <p class="card-text"><%=fecha %> </p>
                       <p class="card-text"><%=pelicula.getTrama()%> </p>
                    </div>   
                </div>
            </div>
        </div>    
    </div>
                       <%}%>
       </div>
        <footer class="bg-dark text-success text-center"> The MovieBD - Azarquiel 2020</footer>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>