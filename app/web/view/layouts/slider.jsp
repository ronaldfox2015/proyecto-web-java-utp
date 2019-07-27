<header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active" style="background-image: url('${request.getContextPath()}/../static/img/home/1.jpg')">
                <div class="carousel-caption d-none d-md-block">
                    <form action="/buscar/anuncio" method="GET">
                        <section class="newsletter">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="content">

                                            <div class="input-group">
                                                <input name="titulo" type="text" class="form-control" placeholder="Buscar">
                                                <span class="input-group-btn">
                                                    <button  class="btn" type="submit">Buscar</button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section> 
                    </form>

                </div>
            </div>
            <!-- Slide Two - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('${request.getContextPath()}static/img/home/2.jpg')">
                <div class="carousel-caption d-none d-md-block">
                    <form action="/buscar/anuncio" method="GET">
                        <section class="newsletter">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="content">

                                            <div class="input-group">
                                                <input name="titulo" type="text" class="form-control" placeholder="Buscar">
                                                <span class="input-group-btn">
                                                    <button name="Buscar" class="btn" type="submit">Buscar</button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>                                                
                    </form>
                </div>
            </div>
            <!-- Slide Three - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('${request.getContextPath()}static/img/home/3.jpg')">
                <div class="carousel-caption d-none d-md-block">
                    <form action="/buscar/anuncio" method="GET">
                        <section class="newsletter">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="content">
                                            <div class="input-group">
                                                <input name="titulo" type="text" class="form-control" placeholder="Buscar">
                                                <span class="input-group-btn btn-warning">
                                                    <button name="Buscar" class="btn" type="submit">Buscar</button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </form>                  
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</header>
