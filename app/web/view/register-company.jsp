<%-- 
    Document   : home
    Created on : 20/06/2019, 10:36:30 PM
    Author     : ronald
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="container" style="margin-top: 92px;">
            <!-- Page Heading/Breadcrumbs -->
            <h3 class="mt-4 mb-3 text-center">Create tu cuenta
                <small></small>
            </h3>
            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Bienvenido - Cliente Empresa</h5>
                            <img src="/static/img/oferta.jpg" class="img-fluid" alt="Responsive image"/>

                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card"  style="padding-right: 10px;padding-left: 10px;">
                        <div class="card-body">

                        </div>
                        <form action="/empresa/create-acount"  method="post" class="needs-validation"  novalidate>
                            <div class="form-row">
                                <div class="col-md-6 mb-2">
                                    <label for="validationCustom01">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="" required>
                                    <div class="invalid-feedback">
                                        Por favor proporcione un Nombre válido.
                                    </div>
                                </div>
                                <div class="col-md-6 mb-2">
                                    <label for="validationCustom02">Apellido</label>
                                    <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido" value="" required>
                                    <div class="invalid-feedback">
                                        Por favor proporcione un Apellido válido.
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-12 mb-2">
                                    <label for="Correo">Correo</label>
                                    <input type="email" class="form-control" id="email"  name="email" placeholder="Email" required>
                                    <div class="invalid-feedback">
                                        Por favor proporcione un Correo válido.
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-12 mb-2">
                                    <label for="Contraseña">Contraseña</label>
                                    <input type="password" name="password" class="form-control" id="password" placeholder="Contraseña">
                                    <div class="invalid-feedback">
                                        Por favor proporcione una Contraseña válida.
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-12 mb-2">
                                    <label for="RazonSocial">Razon Social</label>
                                    <input type="text" class="form-control" id="razon_social" name="razon_social" placeholder="Razon Social" required>
                                    <div class="invalid-feedback">
                                        Por favor proporcione una Razon Social válida.

                                    </div>
                                </div>                                    
                            </div>
                            <div class="form-row">
                                <div class="col-md-12 mb-2">
                                    <label for="NombreComercial">Nombre Comercial</label>
                                    <input type="text" class="form-control" id="nombre_comercial" name="nombre_comercial"  placeholder="Nombre Comercial" required>
                                    <div class="invalid-feedback">
                                        Por favor proporcione un Nombre Comercial válido.
                                    </div>
                                </div>                                    
                            </div>
                            <div class="form-row">
                                <div class="col-md-6 mb-2">
                                    <label for="Ruc">Ruc</label>
                                    <input type="text" class="form-control" id="ruc" name="ruc" placeholder="Ruc" required>
                                    <div class="invalid-feedback">
                                        Por favor proporcione un Ruc válido.

                                    </div>
                                </div>
                                <div class="col-md-6 mb-2">
                                    <label for="Cell">N° Celular</label>
                                    <input type="number" class="form-control" id="celular" name="celular" placeholder="N° Celular" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid zip.
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-12 mb-2">
                                    <label for="Direccion">Dirección</label>
                                    <textarea class="form-control" id="direccion" name="direccion" placeholder="Dirección" required></textarea>
                                    <div class="invalid-feedback">
                                        Please provide a valid state.
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
                </div>
            </div>
        </div>
        <%@include file="layouts/footer.jsp" %>
        <!-- container -->
        <!-- Bootstrap core JavaScript -->
        <%@include file="layouts/js.jsp" %>
        <%@include file="layouts/login.company.jsp" %>
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
