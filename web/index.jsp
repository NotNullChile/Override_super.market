<%-- 
    Document   : index.jsp
    Created on : Jul 4, 2015, 3:54:49 PM
    Author     : urtubia @ notNull
--%>

<%@page import="model.business.Login"%>
<%@page import="model.business.Clientes"%>
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
        
        <!--Java servlet sessions and attributes-->
        <%
            HttpSession sesion = request.getSession();
            model.business.Clientes cliente = (model.business.Clientes) sesion.getAttribute("cliente");       
        %>
        
        <!--header-->
        <header class="w3-container red w3-row">
            <!--Blank column(1)-->
            <div class="w3-col m1">&nbsp;</div>
            <!--End of blank column-->
            <!--Logo(2)-->
            <div class="w3-col m2">
                <a href="index.jsp">
                    <img src="images/Override_logo.png" 
                         width="70%" 
                         alt="Override('<i class='fa fa-shopping-cart'></i>')"/>
                </a>
            </div>
            <!--End of logo-->
            <!--Blank column(1)-->
            <div class="w3-col m1">&nbsp;</div>
            <!--End of blank column(1)-->
            <!--Search form-->
            <form action="resultados_busqueda.jsp" method="post">
            <div class="w3-col m3">
                <br><br><br>
                <div class="input-group input-group">
                    <input name= "txt_busqueda" 
                           type="text" 
                           class="form-control" 
                           placeholder="Búsqueda de productos..."
                           >
                    <span class="input-group-btn">
                        <button type="submit" 
                                class="btn btn-primary"
                                >
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                </div><!-- /input-group -->
            </div>
            </form>
            <!--End of search form-->
            <!--Blank column(1)-->
            <div class="w3-col m1">&nbsp;</div>
            <!--End of blank column(1)-->
            <!--Shopping cart link(1)-->
            <div class="w3-col m1">
                <br><br><br>
                <div class="input-group">
                    <span class="input-group-btn">
                        <a type="button" 
                           href="
                           <% 
                            try
                            {
                                cliente.getNombre();
                                out.println("carro.jsp");
                            }
                            catch(Exception e)
                            {
                                out.println("login.jsp");
                            }
                           %>
                           
                           "
                                class="btn btn-info">
                            <i class="fa fa-shopping-cart"></i>
                            &nbsp;mi carro
                        </a>
                    </span>
                </div><!-- /input-group -->  
            </div>
            <!--End of shopping cart link-->
            <!--Login link (2)-->
            
            <div class="w3-col m2">
                <br><br>
                <%
                    try
                    {
                        out.println("Bienvenido "+ cliente.getNombre());
                    }
                    catch(Exception e)
                    {
                        out.println("<br>");
                    }
                %> 
                <div class="input-group">
                    <span class="input-group-btn">        
                            <%
                                try
                                {
                                    cliente.getNombre();
                                    out.println("<a class='btn btn-warning' href='close_session.do'>");
                                    out.println("<i class='fa fa-lock'></i>&nbsp;Cerrar Sesión");
                                    out.println("</a>");
                                }
                                catch(Exception e)
                                {
                                    out.println("<a class='btn btn-success' href='login.jsp'>");
                                    out.println("<i class='fa fa-user'></i>&nbsp;Iniciar Sesión / Nuevo Usuario");
                                    out.println("</a>");
                                }
                            %>        
                    </span>
                </div><!-- /input-group -->  
            </div>
            <!--End of login link-->
            <!--Blank column(1)-->
            <div class="w3-col m1">&nbsp;</div>
            <!--End of blank column(1)-->
        </header>
        <!--header end-->
        
        <!--horizontal menu-->
        <nav class="w3-topnav w3-padding green-d1">
            <a href="index.jsp">Home</a>
            <a href="#">Abarrotes</a>
            <a href="#">Alimentos Congelados</a>
            <a href="#">Bebidas y Tragos</a>
            <a href="#">Carnes</a>
            <a href="#">Desayuno y Once</a>
            <a href="#">Hogar y Limpieza</a>
            <a href="#">Mascotas</a>
        </nav>
        <!--horizontal menu end-->
        
        <!--Main row-->
        <div class="w3-row">
        <br>
            <!--Blank column(1)-->
            <div class="w3-col m1">&nbsp;</div>    
            <!--End of blank column-->
            
            <!--Sidebar-->
            <div class="w3-col m2">
                <nav class=" w3-ul w3-card w3-padding w3-bordered yellow-l5" >
                    <br>
                    <i class="fa fa-asterisk"></i>&nbsp;<a href=index.jsp>Home</a><br>&nbsp;<br>
                    <i class="fa fa-asterisk"></i>&nbsp;<a href="#">Abarrotes</a><br>&nbsp;<br>
                    <i class="fa fa-asterisk"></i>&nbsp;<a href="#">Alimentos Congelados</a><br>&nbsp;<br>
                    <i class="fa fa-asterisk"></i>&nbsp;<a href="#">Bebidas y Tragos</a><br>&nbsp;<br>
                    <i class="fa fa-asterisk"></i>&nbsp;<a href="#">Carnes</a></li><br>&nbsp;<br>
                    <i class="fa fa-asterisk"></i>&nbsp;<a href="#">Desayuno y Once</a><br>&nbsp;<br>
                    <i class="fa fa-asterisk"></i>&nbsp;<a href="#">Hogar y Limpieza</a><br>&nbsp;<br>
                    <i class="fa fa-asterisk"></i>&nbsp;<a href="#">Mascotas</a><br>&nbsp;<br>
                </nav>
            </div>
            <!--End of sidebar-->
            
            <!--Content-->
            <div class="w3-col m7 w3-card w3-padding">
                <!--Banners carousel-->
                <div class="w3-container">
                    <div id="myCarousel" 
                         class="carousel slide " 
                         data-ride="carousel">
                        <!-- Indicators-->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>
                        <!-- Slide wrappers-->
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
                        <!--End of slides wrappers-->
                        <!--Left/Right carousel controls-->
                        <!--Left-->
                        <a class="left carousel-control" 
                            href="#myCarousel" 
                            role="button" 
                            data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" 
                                  aria-hidden="true"
                                  ></span>
                            <span class="sr-only">
                                Siguiente
                            </span>
                        </a>
                        <!--Right-->
                        <a class="right carousel-control" 
                            href="#myCarousel" 
                            role="button" 
                            data-slide="next">
                            <span class="glyphicon 
                                  glyphicon-chevron-right" 
                                  aria-hidden="true"
                                  ></span>
                            <span class="sr-only">
                                Anterior
                            </span>
                        </a>
                    </div>
                </div>
                <!--End of carousel-->
                <br>
                <!--Main card-->
                
                <!--Title bar-->
                <div class="w3-container red">
                    <h2>Ofertas impactantes&nbsp;&nbsp;<i class="fa fa-heartbeat"></i> </h2>
                </div>
                <!--End of title bar-->
                <!--First Row of items-->
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
                <!--End of first row of items-->
                
                <!--Second row of items-->
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
                <!--End of second row of items-->
            </div>
            <!--End of content-->
            
            <!--Blank column-->
            <div class="w3-col m1">&nbsp;</div>
            <!--End of blank column-->
            
        </div>
        <!--End of Main Row-->
        
        <!--Footer-->
        <footer class="footer w3-row">
            <div class="w3-container">
                <!--Blank column-->
                <div class="w3-col m1"> &nbsp;</div>
                <!--End of blank column-->
                <!--Creative Commons logo-->
                <div class="w3-col m1">
                    <br>
                    <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">
                        <img alt="Licencia Creative Commons" style="border-width:0" src="https://licensebuttons.net/l/by-nc-nd/4.0/88x31.png" width="60%"/>
                    </a>
                </div>
                <!--End of Creative Commons logo-->
                <!--Blank column-->
                <div class="w3-col m1"> &nbsp; </div>
                <!--End of blank column-->
                <!--Creative Commons license-->
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
                <!--End of creative Commons license-->
                <!--Blank column-->
                <div class="w3-col m1"> &nbsp; </div>
                <!--End of blank column-->
                <!--NotNull logo-->
                <div class="w3-col m1">
                    <br>
                    <img src="images/notnull.png" width="60%" alt="notnull"/>
                </div>
                <!--End of NotNull logo-->
                <!--Blank column-->
                <div class="w3-col m1">&nbsp;</div>
                <!--End of blank column-->
            </div>
        </footer>
        <!--End of footer-->
    </body>
</html>
