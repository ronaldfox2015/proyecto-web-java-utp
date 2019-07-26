<%-- 
    Document   : home
    Created on : 20/06/2019, 10:36:30 PM
    Author     : ronald
--%>
<%@page import="entity.Garage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language='java' contentType='text/html;charset=iso-8859-1'%>
<% ArrayList<Garage> listGarage = (ArrayList<Garage>) request.getAttribute("listGarage");%>
<% ArrayList<Garage> listDistrito = (ArrayList<Garage>) request.getAttribute("listDistrito");%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
                <link rel="shortcut icon" href="http://lineadecodigo.com/wp-content/uploads/2007/03/favicon.ico">

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
        <div class="jumbotron" style="margin-top: 32px;">

            <div class="container-fluid gedf-wrapper">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-10 col-lg-12">
                        <form class="card card-sm">
                            <div class="card-body row no-gutters align-items-center">
                                <div class="col-auto">
                                    <i class="fas fa-search h4 text-body"></i>
                                </div>
                                <!--end of col-->
                                <div class="col">
                                    <input class="form-control form-control-lg form-control-borderless" type="search" placeholder="Buscar anuncio">
                                </div>
                                <!--end of col-->
                                <div class="col-auto">
                                    <button class="btn btn-lg btn-success" type="submit">buscar</button>
                                </div>
                                <!--end of col-->
                            </div>
                        </form>
                    </div>
                    <!--end of col-->
                </div>
                <div class="row">

                    <div class="col-md-3">
                        <div class="card">
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between align-items-center active">
                                    Distritos
                                    <span class="badge badge-primary badge-pill">14</span>
                                </li>
                                <%  for (int i = 0; i < listDistrito.size(); i++) {%>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                <td><%= listDistrito.get(i).getLocation().getName()%></td>
                                </li>
                                <% }%>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <!--- \\\\\\\Post-->
                        <div class="card gedf-card">
                            <div class="card-body">
                                <div class="tab-content" id="myTabContent">
                                    <div class="list-group">
                                        <%  for (int i = 0; i < listGarage.size(); i++) {%>
                                        <a href="#" class="list-group-item list-group-item-action">
                                            <div class="d-flex w-100 justify-content-between">
                                                <h5 class="mb-1"><%= listGarage.get(i).getName()%></h5>
                                                <small>hace <%= listGarage.get(i).getUpdateDate()%> dias</small>
                                            </div>
                                            <p class="mb-1"><%= listGarage.get(i).getLocation().getName()%> - av. general garzon </p>
                                            <small>precio <%= listGarage.get(i).getParkingGarage().getPrice()%> soles por hora</small>
                                        </a>
                                        <% }%>

                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- Post /////-->
                    </div>

                </div>
            </div>
        </div>

        <!-- /.container -->
        <!-- Bootstrap core JavaScript -->
        <%@include file="layouts/js.jsp" %>
        <%@include file="layouts/footer.jsp" %>
        <%@include file="layouts/login.jsp" %>
    </body>
</html>
