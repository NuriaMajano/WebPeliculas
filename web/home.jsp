<%-- 
    Document   : home
    Created on : 18-mar-2020, 12:07:15
    Author     : Nuria
--%>

<%@page import="entities.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="entities.Person"%>
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
     <!-- PERSON -->
      <div class="row m-2">
      <%
        List<Person> personas = (List<Person>)session.getAttribute("personas");
            for (int i=0;i<personas.size();i++){
            Person persona = personas.get(i);
            
        %>
            <div class="card text-center px-0 col-md-6 col-lg-4">
                    <img
                        src="https://image.tmdb.org/t/p/w500<%=persona.getFoto()%>" class="card-img-top img-fluid" alt="<%=persona.getNombre()%>">
                    <div class="card-body">
                        <% for (int a=0; a<persona.getRatingList().size(); a++) {%>
                         <span class="card-text" class="display-4">&#9733;</span>
                         <%}%>
                        <p class="card-text"><%=persona.getNombre()%></p>
                    </div>
                        <% if (user!= null){ %>
                        <span class="rating">
                            <a href="Controller?op=rating&rating=1">&#9733;</a>
                            <a href="Controller?op=rating&rating=2">&#9733;</a>
                            <a href="Controller?op=rating&rating=3">&#9733;</a>
                            <a href="Controller?op=rating&rating=4">&#9733;</a>
                            <a href="Controller?op=rating&rating=5">&#9733;</a>
                        </span>
                        <div class="card-footer">
                            <button class="btn btn-success" data-toggle="modal" data-nombre="<%= persona.getNombre() %>" data-id="<%= persona.getId() %>" data-target="#modalfilmografia">Filmografia</button>
                        </div>    
                        <%}%>
            </div>
                        <%
                            }
                            
                        %>
        </div>       
        <footer class="bg-dark text-success text-center"> The MovieBD - Azarquiel 2020</footer>
    </div>

        <!-- Modal -->
    
<div class="modal fade" id="modalfilmografia" tabindex="-1" role="dialog" aria-labelledby="modalfilmografia" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">MOVIES</h5>
      </div>
      <div class="modal-body">
        <div class="row">
            <h5 id="name"></h5>
          <div id="filmografia" class="col-sm-12">
               <!--se rellena con ajax-->
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>
        
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="js/myjs.js"></script>
  </body>
</html>
