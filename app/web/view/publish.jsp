<%-- 
    Document   : home
    Created on : 20/06/2019, 10:36:30 PM
    Author     : ronald
--%>
<%@page import="java.util.Iterator"%>
<%@page import="entity.Location"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<Location> listLocation = (ArrayList<Location>) request.getAttribute("listLocation");%>

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
            <h3 class="mt-4 mb-3 text-center">GESTIÓN DE PUBLICAR
                <small></small>
            </h3>
            <form action="/publicar/create" enctype="MULTIPART/FORM-DATA"  method="post" class="needs-validation"  novalidate>
                <div class="form-row">
                    <div class="col-md-12 mb-2">
                        <label for="Correo">Titulo de anuncio</label>
                        <input type="text" class="form-control" id="email"  name="title" placeholder="Titulo Anuncio" required>
                        <div class="invalid-feedback">
                            Por favor proporcione un titulo de anuncio valido.
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-2">
                        <label for="validationCustom01">Distrito</label>
                        <select name="district" id="district" class="custom-select" required>
                            <option value="">Seleccionar</option>
                            <%  for (int i = 0; i < listLocation.size(); i++) {%>
                            <option value="<%= listLocation.get(i).getId()%>"><%= listLocation.get(i).getName()%></option>
                            <% }%>
                        </select>                     
                        <div class="invalid-feedback">
                            Por favor seleccione el distrito.
                        </div>
                    </div>
                    <div class="col-md-6 mb-2">
                        <label for="validationCustom02">Dirección</label>
                        <input type="text" class="form-control" id="address" name="address" placeholder="Dirección" value="" required>
                        <div class="invalid-feedback">
                            Por favor proporcione una direccion validad.
                        </div>
                    </div>
                </div><!--
                <div class="form-row">
                    <label for="validationCustom02">Subir imagen</label>

                    <div class="custom-file">
                        <input type="file" name="banner" class="custom-file-input" id="customFileLangHTML">
                        <label class="custom-file-label" for="customFileLangHTML" data-browse="Elegir">Subir</label>
                    </div>
                </div> -->
                <div class="form-row">
                    <div class="col-md-12 mb-2">
                        <label for="RazonSocial">N° de vehiculos</label>
                        <input type="number" class="form-control" id="n_garage" name="n_garage" placeholder="N° de vehiculos" required>
                        <div class="invalid-feedback">
                            Por favor proporcione el numero de vehiculo válida.

                        </div>
                    </div>                                    
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-2">
                        <label for="RazonSocial">Precio</label>
                        <input type="number" class="form-control" id="price" name="price" placeholder="Precio" required>
                        <div class="invalid-feedback">
                            Por favor proporcione un precio válida.

                        </div>
                    </div>                                    
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-2">
                        <label for="RazonSocial">descuento</label>
                        <input type="number" class="form-control" id="discont" name="discont" placeholder="Descuento" required>
                        <div class="invalid-feedback">
                            Por favor proporcione descuento valido

                        </div>
                    </div>                                    
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                        <label class="form-check-label" for="invalidCheck">
                            Aceptar los términos y condiciones.
                        </label>
                        <div class="invalid-feedback">
                            Usted debe estar de acuerdo antes de enviar.
                        </div>
                    </div>

                </div>
                <div class="form-group">
                    <div class="col-md-12 mb-2">
                        <button name="register" class="btn btn-primary" type="submit">Registra</button>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="layouts/footer.jsp" %>
        <!-- container -->
        <!-- Bootstrap core JavaScript -->
        <%@include file="layouts/js.jsp" %>
        <script>

            // Example starter JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict';
                window.addEventListener('load', function () {

                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    var forms = document.getElementsByClassName('needs-validation');
                    // Loop over them and prevent submission
                    var validation = Array.prototype.filter.call(forms, function (form) {
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
        </script>
    </body>
</html>
