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
                        <a href="/empresa/dashboard" class="list-group-item active">dashboard</a>
                        <a href="/empresa/mi-cuenta" class="list-group-item">Mi cuenta</a>
                        <a href="/publicar" class="list-group-item">Publicar</a>
                        <a href="/publicar/listar-activo" class="list-group-item">Procesos</a>
                    </div>
                </div>
                <!-- Content Column -->
                <div class="col-lg-9 mb-4">
                    dashboard
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
