<%-- 
    Document   : index2.jsp
    Created on : Jul 4, 2015, 3:54:49 PM
    Author     : urtubia @ notNull
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="w3.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="icon" type="image/ico" href="images/override.ico">
    </head>
    <body>
        <!--header-->
        <header class="w3-container red w3-row">
            <div class="w3-col m1">&nbsp;</div>
            <div class="w3-col m2">
                <img src="images/Override_logo.png" width="70%" alt="Override_logo"/>
            </div>
            <div class="w3-col m1">&nbsp;</div>
            <div class="w3-col m3">
                <br><br>
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" placeholder="Búsqueda de productos...">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
                    </span>
                </div><!-- /input-group -->
            </div>
            <div class="w3-col m1">&nbsp;</div>
            <div class="w3-col m2">
                <br><br>
                <div class="input-group input-group-sm">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-success"><i class="fa fa-user"></i>&nbsp;Iniciar Sesión</button>
                    </span>
                </div><!-- /input-group -->  
            </div>
            <div class="w3-col m1">
                <br><br>
                <div class="input-group input-group-sm">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-info"><i class="fa fa-shopping-cart"></i>&nbsp;mi carro</button>
                    </span>
                </div><!-- /input-group -->  
            </div>
            <div class="w3-col m1">&nbsp;</div>
        </header>
        <!--header end-->
        <!--horizontal menu-->
        <nav class="w3-topnav w3-padding green-d1">
            <a href="#">Home</a>
            <a href="#">Abarrotes</a>
            <a href="#">Alimentos Congelados</a>
            <a href="#">Bebidas y Tragos</a>
            <a href="#">Carnes</a>
            <a href="#">Desayuno y Once</a>
            <a href="#">Hogar y Limpieza</a>
            <a href="#">Lácteos</a>
        </nav>
        <!--horizontal menu end-->
        <!--Body-->
        <div class="w3-row">
        <br>
            <div class="w3-col m1"> &nbsp; </div>    
            <div>
                <nav class="w3-col m2 w3-ul w3-card w3-padding w3-bordered yellow-l5" style="width:25%">
                    <br>
                    <li><a href="#">Home</a></li><br>
                    <li><a href="#">Abarrotes</a></li> <br>
                    <li><a href="#">Alimentos Congelados</a></li> <br>
                    <li><a href="#">Bebidas y Tragos</a></li><br>
                    <li><a href="#">Carnes</a></li><br>
                    <li><a href="#">Desayuno y Once</a></li><br>
                    <li><a href="#">Hogar y Limpieza</a></li><br>
                    <li><a href="#">Lácteos</a></li><br>
                </nav>
            </div>
            <div class="w3-col m7 w3-card w3-padding">
            <!--Carrusel con banners.-->
                <div class="w3-container">
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
                <br>
                <div class="w3-container red">
                    <h2>Ofertas impactantes&nbsp;&nbsp;<i class="fa fa-heartbeat"></i> </h2>
                </div>
                    <div class="w3-row-margin">
                        <div class="w3-third">
                            <div class="w3-card-2">
                                <img src="http://www.lider.cl/dys/productImages/g/5466382ga.jpg" style="width:100%">
                                <div class="w3-container">
                                    <h5>Producto 1</h5>
                                </div>
                            </div>
                        </div>
                        <div class="w3-third">
                            <div class="w3-card-2">
                                <img src="http://www.lider.cl/dys/productImages/g/172325ga.jpg" style="width:100%">
                                <div class="w3-container">
                                    <h5>Producto 2</h5>
                                </div>
                            </div>
                        </div>
                        <div class="w3-third">
                            <div class="w3-card-2">
                            <img src="http://www.lider.cl/dys/productImages/g/5934782ga.jpg" style="width:100%">
                                <div class="w3-container">
                                    <h5>Producto 3</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="w3-row-margin">
                        <div class="w3-third">
                            <div class="w3-card-2">
                                <img src="http://www.lider.cl/dys/productImages/g/134880ga.jpg" style="width:100%">
                                <div class="w3-container">
                                    <h5>Producto 4</h5>
                                </div>
                            </div>
                        </div>
                    <div class="w3-third">
                        <div class="w3-card-2">
                            <img src="http://www.lider.cl/dys/productImages/g/5434633ga.jpg" style="width:100%">
                            <div class="w3-container">
                                <h5>Producto 5</h5>
                            </div>
                        </div>
                    </div>
                    <div class="w3-third">
                        <div class="w3-card-2">
                            <img src="http://www.lider.cl/dys/productImages/g/5586646ga.jpg" style="width:100%">
                            <div class="w3-container">
                                <h5>Producto 6</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="w3-col m1">&nbsp;</div>
        </div>
        <footer class="footer w3-row">
            <div class="w3-container">
                <!--Creative Commons License-->
                <div class=" ">
                    <div class="w3-col m1"> &nbsp;</div>
                    <div class="w3-col m1">
                        <br>
                        <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">
                            <img alt="Licencia Creative Commons" style="border-width:0" src="https://licensebuttons.net/l/by-nc-nd/4.0/88x31.png" width="60%"/>
                        </a>
                    </div>
                    <div class="w3-col m1"> &nbsp; </div>
                    <div class="w3-col m6 w3-padding-left">
                        <h6>
                            <span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">@Override super.market(<i class="fa fa-shopping-cart"></i>)</span> por 
                                <a xmlns:cc="http://creativecommons.org/ns#" href="http://www.notnull.cl" property="cc:attributionName" rel="cc:attributionURL">
                                    notNull Chile</a> <br>Se distribuye bajo una <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"> Licencia Creative
                                        Commons Atribución-NoComercial-SinDerivar 4.0 Internacional</a>.<br />Basada en una obra en 
                                <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/NotNullChile/Override_super.market" rel="dct:source">
                                https://github.com/NotNullChile/Override_super.market</a>.
                        </h6>
                    </div>
                    <div class="w3-col m1"> &nbsp; </div>
                    <div class="w3-col m1">
                        <br>
                        <img src="images/notnull.png" width="60%" alt="notnull"/>
                    </div>
                    <div class="w3-col m1"> &nbsp; </div>
                </div>
                <!--End of creative Commons License-->
            </div>
        </footer>    
    </body>
</html>
