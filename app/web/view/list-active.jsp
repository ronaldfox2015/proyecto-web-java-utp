<%-- 
    Document   : home
    Created on : 20/06/2019, 10:36:30 PM
    Author     : ronald
--%>
<%@page import="entity.Garage"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<Garage> listGarage = (ArrayList<Garage>) request.getAttribute("listGarage");%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Bootstrap core CSS -->
        <%@include file="layouts/css.jsp" %>
    </head>
    <body>
        <!-- navigation-->
        <%@include file="layouts/navigation.jsp" %>
        <!-- Navigation -->
        <!-- conteiner -->
        <div class="container" style="margin-top: 100px;">
            <!-- Page Heading/Breadcrumbs -->
            <h3 class="mt-4 mb-3 text-center">GESTIÓN DE EMPRESA
                <small></small>
            </h3>
            <!-- Content Row -->
            <div class="row">
                <!-- Sidebar Column -->
                <div class="col-lg-3 mb-4">
                    <div class="list-group">
                        <a href="/empresa/dashboard" class="list-group-item">dashboard</a>
                        <a href="/empresa/mi-cuenta" class="list-group-item">Mi cuenta</a>
                        <a href="/publicar" class="list-group-item">Publicar</a>
                        <a href="/publicar/listar-activo" class="list-group-item active">Procesos</a>
                    </div>
                </div>
                <!-- Content Column -->
                <div class="col-lg-9 mb-4">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Título</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  for (int i = 0; i < listGarage.size(); i++) {%>
                            <tr>
                                <th scope="row"><%= listGarage.get(i).getId()%></th>
                                <td><%= listGarage.get(i).getName()%></td>
                                <td><%= listGarage.get(i).getLocation().getName()%>-<%= listGarage.get(i).getAddress()%></td>
                                <td><%= listGarage.get(i).getStatusName()%></td>
                                <td><a href="/publicar/edit/<%= listGarage.get(i).getId()%>">Editar</a></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <%@include file="layouts/footer.jsp" %>
        <!-- container -->
        <!-- Bootstrap core JavaScript -->
        <%@include file="layouts/js.jsp" %>

    </body>
</html>
