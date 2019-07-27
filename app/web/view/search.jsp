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
<% String idDistrito = (String) request.getAttribute("idDistrito");%>

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
                        <form action="/buscar/anuncio" class="card card-sm">
                            <div class="card-body row no-gutters align-items-center">
                                <div class="col-auto">
                                    <i class="fas fa-search h4 text-body"></i>
                                </div>
                                <!--end of col-->
                                <div class="col">
                                    <input name="titulo" class="form-control form-control-lg form-control-borderless" type="search" placeholder="Buscar anuncio">
                                </div>
                                <!--end of col-->
                                <div class="col-auto">
                                    <button class="btn btn-lg btn-warning" type="submit">buscar</button>
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
                            <div class="card-body">
                                <div class="h5">Distritos</div>
                            </div>

                            <ul class="list-group">

                                <%  for (int i = 0; i < listDistrito.size(); i++) {%>
                                <a href="/buscar/filter?distrito=<%=listDistrito.get(i).getLocation().getId()%>" >
                                    <li class="list-group-item d-flex justify-content-between align-items-center <%=listDistrito.get(i).getLocation().etiqueta(idDistrito)%>">
                                        <%= listDistrito.get(i).getLocation().getName()%>
                                    </li>
                                </a>

                                <% }%>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <!--- \\\\\\\Post-->
                        <div class="card gedf-card">
                            <div class="card-header">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="d-flex justify-content-between align-items-center">                                       
                                        <div class="ml-2">
                                            <div class="h5 m-0">Total de anuncio <%=listGarage.size()%> </div>
                                            <div class="h7 text-muted"></div>
                                        </div>

                                    </div>
                                    <div>
                                        <div class="dropdown">
                                            <a href="/buscar">
                                                <div class="h7 text-muted">limpiar busqueda</div>   
                                            </a>                                           
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="card-body">
                                <div class="tab-content" id="myTabContent">
                                    <div class="list-group">
                                        <%  for (int i = 0; i < listGarage.size(); i++) {%>
                                        <a href="#" class="list-group-item list-group-item-action seleccionar" data-idcochera="<%= listGarage.get(i).getId()%>" data-toggle="modal" data-target="#reserva"
                                           onclick="selector(<%= listGarage.get(i).getId()%>)">
                                            <div class="d-flex w-100 justify-content-between">
                                                <h5 class="mb-1"><%= listGarage.get(i).getName()%></h5>
                                                <small>hace <%= listGarage.get(i).getDay()%> dias</small>
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
        <!-- Modal -->
        <div class="modal fade" id="reserva" tabindex="-1" role="dialog" aria-labelledby="reservaLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="reservaLabel">Hacer reserva</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">
                            <div class="col-md-6 mb-2">
                                <label for="validationCustom01">Placa</label>
                                <input type="text" class="form-control" id="placa" name="placa" placeholder="placa" value="" required>
                                <div class="invalid-feedback">
                                    Por favor proporcione un placa válido.
                                </div>
                            </div>
                            <div class="col-md-6 mb-2">
                                <label for="validationCustom02">modelo</label>
                                <input type="text" class="form-control" id="modelo" name="modelo" placeholder="modelo" value="" required>
                                <div class="invalid-feedback">
                                    Por favor proporcione un modelo válido.
                                </div>
                            </div>
                        </div>
                        <div class="form-row">

                            <div class="col-md-6 mb-2">
                                <label for="validationCustom02">Descripcion</label>
                                <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="Descripcion" value="" required>
                                <div class="invalid-feedback">
                                    Por favor proporcione un Descripcion válido.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="etiqueta" class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="btn-guardar-reserva" name="btn-guardar-reserva" type="button" class="btn btn-primary" data-idCochera="3" >guardar</button>
                        <input type="hidden" id="idCochera" name="idCochera" value="0">

                    </div>
                </div>
            </div>
        </div>

        <!-- /.container -->
        <!-- Bootstrap core JavaScript -->
        <%@include file="layouts/js.jsp" %>
        <script>
            function selector(idcochera) {
                document.getElementById("idCochera").setAttribute("value", idcochera);
            }

            $(function () {
                $("#btn-guardar-reserva").on("click", function (event) {

                    event.preventDefault(); // prevent default submit behaviour
                    var idCochera = $("input#idCochera").val();
                    var placa = $("input#placa").val();
                    var modelo = $("input#modelo").val();
                    var descripcion = $("input#descripcion").val();

                    $.ajax({
                        url: '/reserva',
                        type: 'POST',
                        dataType: 'json',
                        async: true,
                        data: {
                            "idCochera": idCochera,
                            "placa": placa,
                            "modelo": modelo,
                            "descripcion": descripcion
                        },
                        success: function (data, status) {

                            if (data.response.status) {
                                window.location.href = "/buscar"
                            }
                            document.getElementById("response-error").innerHTML = data.response.messages
                        },
                        error: function (data) {
                            document.getElementById("response-error").innerHTML = data.response.messages
                        }
                    });
                });
            });
        </script>
        <%@include file="layouts/footer.jsp" %>
        <%@include file="layouts/login.jsp" %>
    </body>
</html>
