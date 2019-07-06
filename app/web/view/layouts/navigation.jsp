<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/home">
            <img src="${request.getContextPath()}/../static/img/logo.jpeg" width="50px" height="50px" alt="">
        </a>
        <hi class="title text-warning">Happy Parking</hi>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link text-warning" href="#">Quienes somos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-warning" href="#">Trabaja con nosotros</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-warning" href="#">Ayuda</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-warning" href="/empresa">soy Empresa</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <img src="${request.getContextPath()}/../static/img/login.png" width="30px" height="30px" alt="">
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                        <a data-toggle="modal" data-target="#modalLogin" class="dropdown-item text-warning" href="#modalLogin">Ingresar</a>
                        <a class="dropdown-item text-warning" href="<%=request.getAttribute("href-empresa")%>">Registrate</a>
                    </div>
                </li>

            </ul>
        </div>
    </div>
</nav>