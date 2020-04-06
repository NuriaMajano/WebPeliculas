<%-- 
    Document   : filmografia
    Created on : 18-mar-2020, 13:06:42
    Author     : Nuria
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Movie"%>
<%@page import="java.util.List"%>

<% List<Movie> peliculas = (List<Movie>) session.getAttribute("peliculas");
    if (peliculas.size()==0){%>
        <h5 class="text-center">Este señor no tiene ninguna pelicula</h5>
    <%}
    else {%>
        <%
        for (Movie pelicula : peliculas) {
             %>
         <div class="col-lg-6 my-2">
            <div class="card mb-3">
                      <div class="row no-gutters">
                <div class="col-md-4">
                 <%if (pelicula.getPoster()!=null) {%>
                  <img src="https://image.tmdb.org/t/p/w500<%= pelicula.getPoster() %>" style="width: 100px;" class="card-img-top img-fluid" alt="<%= pelicula.getTitulo()%>">
                 <%}else {%>
                  <img src="img/noimage.png" class="card-img-top img-fluid"alt="noimage" style="width: 100px;"> 
                        <%}%>
                    </div>
                <div class="col-md-8">
                  <div class="card-body">
                      
                      <% SimpleDateFormat simple = new SimpleDateFormat("EEE, dd MMM yyyy");
                         String fecha = simple.format(pelicula.getFecha());
                      %>
                      
                    <h class="card-title"><%= pelicula.getTitulo()%></h4>
                    <p class="card-text"><h5><%= fecha%></h5></p>
        
                  </div>
                  
                </div>
                  
              </div>
                  
            </div>
                  
        </div>
    <%
        }

    }

%>