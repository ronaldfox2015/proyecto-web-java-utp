<%-- 
    Document   : register-cliente
    Created on : 22/07/2019, 09:26:02 PM
    Author     : Lucia&Angel :D
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Registro de cliente</title>
        <!-- Bootstrap core CSS -->
        <%@include file="layouts/css.jsp" %>
    </head>
    <body>
          <!-- navigation-->
        <%@include file="layouts/navigation.jsp" %>
        <!-- Navigation -->
        <div class="container" style="margin-top: 92px;">
            <h3 class="mt-4 mb-3 text-center">Registro de nuevo cliente
                <small></small>
            </h3>
            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <img src="../static/img/SorteoPApaLanding-Desktop.jpg" class="img-fluid" alt="Responsive image"/>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card"  style="padding-right: 10px;padding-left: 10px;">
                        <div class="card-body">

                        </div>
                        <form action="/cliente/registrar"  method="post" class="needs-validation"  novalidate>
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
                                    <label for="dni">DNI</label>
                                    <input type="text" class="form-control" id="dni"  name="dni" placeholder="DNI" required>
                                    <div class="invalid-feedback">
                                        Por favor proporcione un DNI válido.
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
                                    <label for="RazonSocial">Celular</label>
                                    <input type="text" class="form-control" id="celular" name="celular" placeholder="Celular" required>
                                    <div class="invalid-feedback">
                                        Por favor proporcione una Razon Social válida.

                                    </div>
                                </div>                                    
                            </div>
                             <div class="form-row">
                                <div class="col-md-12 mb-2">
                                    <label for="Correo">Correo Electronico</label>
                                    <input type="text" class="form-control" id="email" name="email" placeholder="email" required>
                                    <div class="invalid-feedback">
                                        Por favor proporcione una Razon Social válida.

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
        </div>
    </body>
</html>
