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
        <div class="container">
                 <!-- Page Heading/Breadcrumbs -->
                <h3 class="mt-4 mb-3 text-center">Portal del Empresa
                    <small></small>
                </h3>
                     <div class="row">
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Special title treatment</h5>
                    <img src="static/img/banner-login.jpg" class="img-fluid" alt="Responsive image">

                </div>
            </div>
        </div>
                     </div>
        </div>
        <!-- container -->
        <!-- Bootstrap core JavaScript -->
        <%@include file="layouts/js.jsp" %>
        <%@include file="layouts/footer.jsp" %>
    </body>
</html>
