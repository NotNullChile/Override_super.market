<%-- 
    Document   : index
    Created on : Jul 1, 2015, 11:43:00 PM
    Author     : urtubia @ notNull
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link href='http://fonts.googleapis.com/css?family=Nova+Mono' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Fredericka+the+Great' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Quicksand:700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Syncopate:700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    </head>
    <body class="body">
        <!--header-->
        <div class=" header logo">
            <div class="row">
                <br>
                <div class="col-sm-1"></div>
                <div class="col-sm-3">
                    <h1>@Override</h1>
                    <h2 class="sublogo">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;super.market(<i class="fa fa-shopping-cart"></i>)
                    </h2>
                </div>
                <!--Formulario de búsqueda general en el sitio.-->
                <form>
                    <div class="col-sm-3">
                        <br>
                        <input name="busqueda"
                               type="text" 
                               class="form-control" 
                               id="busqueda">
                    </div>
                    <div class="col-sm-1 busqueda btn btn-warning">
                        <h3>buscar</h3>
                        <h1><i class="fa fa-search"></i></h1>
                    </div>
                </form>
                <!--Inicio de sesión.-->
                <div class="col-sm-2 user btn btn-success">
                    <h3>iniciar Sesión:</h3>
                    <h1><i class="fa fa-user"></i></h1>
                </div>
                <!--Ver carro de compras.-->
                <div class="col-sm-1 carro btn btn-primary">
                    <h3>mi carro:</h3>
                    <h1><i class="fa fa-shopping-cart"></i></h1>
                </div>
            </div>
            <br>
        </div>
        <!--Barra de navegación horizontal.-->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand active" href="#">@Override(<i class="fa fa-shopping-cart"></i>)</a>
                </div>
                <div>
                  <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">Abarrotes</a></li>
                    <li><a href="#">Alimentos congelados</a></li>
                    <li><a href="#">Bebidas y Licores</a></li>
                    <li><a href="#">Carnes</a></li>
                    <li><a href="#">Cereales y Snacks</a></li>
                    <li><a href="#">Desayuno y Once</a></li>
                    <li><a href="#">Hogar y Limpieza</a></li>
                    <li><a href="#">Lacteos</a></li>
                  </ul>
                </div>
            </div>
        </nav>
        
        <div>
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-2">
                    <h2>Productos:</h2>
                    <hr>
                    <h3>
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-success">(<i class="fa fa-shopping-cart"></i>)&nbsp;&nbsp;Home</a>
                        <a href="#" class="list-group-item"><i class="fa fa-asterisk"></i>&nbsp;&nbsp;Abarrotes</a>
                        <a href="#" class="list-group-item"><i class="fa fa-asterisk"></i>&nbsp;&nbsp;Alimentos &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;congelados</a>
                        <a href="#" class="list-group-item"><i class="fa fa-asterisk"></i>&nbsp;&nbsp;Bebidas y Licores</a>
                        <a href="#" class="list-group-item"><i class="fa fa-asterisk"></i>&nbsp;&nbsp;Carnes</a>
                        <a href="#" class="list-group-item"><i class="fa fa-asterisk"></i>&nbsp;&nbsp;Cereales y Snacks</a>
                        <a href="#" class="list-group-item"><i class="fa fa-asterisk"></i>&nbsp;&nbsp;Desayuno y Once</a>
                        <a href="#" class="list-group-item"><i class="fa fa-asterisk"></i>&nbsp;&nbsp;Hogar y Limpieza</a>
                        <a href="#" class="list-group-item"><i class="fa fa-asterisk"></i>&nbsp;&nbsp;Lacteos</a>
                    </div>
                    </h3>
                    </div>
                <div class="col-sm-8">
                    <!--Carrusel con banners.-->
                    <div class="container">
                    <br>
                        <div id="myCarousel" class="carousel slide " data-ride="carousel">
                            <!-- Indicadores-->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>
                            <!-- Wrapper for slides -->
                                <div class="carousel-inner" 
                                     role="listbox">
                                <div class="item active">
                                    <img src="images/cafe.png" alt="Nescafe Tradición Granulado $ 999" width="230" height="172">
                                </div>
                                <div class="item">
                                    <img src="images/pizzas.png" alt="Chania" width="460" height="345">
                                </div>
                                <div class="item">
                                    <img src="images/tragos.png" alt="Flower" width="460" height="345">
                                </div>
                            </div>
                            <!-- Controles izquierda y derecha carrusel -->
                            <a class="left carousel-control" 
                                href="#myCarousel" 
                                role="button" 
                                data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" 
                                      aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" 
                                href="#myCarousel" 
                                role="button" 
                                data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                            </a>
                        </div>      
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
