<%-- 
    Document   : index2.jsp
    Created on : Jul 4, 2015, 3:54:49 PM
    Author     : urtubia @ notNull
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.dal.ProductoDal"%>
<%@page import="model.business.Producto"%>
<%@page import="model.business.Marcas"%>
<%@page import="model.business.TipoProductos"%>
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
            <form action="resultados_busqueda.jsp" method="post">
            <div class="w3-col m3">
                <br><br>
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" placeholder="Búsqueda de productos...">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
                    </span>
                </div
                <!-- /input-group -->
            </div>
            </form>
            <div class="w3-col m1">&nbsp;</div>
            <div class="w3-col m1">
                <br><br>
                <div class="input-group input-group-sm">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-info"><i class="fa fa-shopping-cart"></i>&nbsp;mi carro</button>
                    </span>
                </div><!-- /input-group -->  
            </div>
            <div class="w3-col m2">
                <br><br>
                <div class="input-group input-group-sm">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-success"><i class="fa fa-user"></i>&nbsp;Iniciar Sesión / Nuevo Usuario</button>
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
            <a href="#">Mascotas</a>
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
                    <li><a href="#">Mascotas</a></li><br>
                </nav>
            </div>
            <div class="w3-col m7 w3-card w3-padding">
            
                <br>
                <div class="w3-container red">
                    <h2>Detalles del producto:&nbsp;&nbsp;<i class="fa fa-search"></i> </h2>
                </div>
               
                <div class="w3-row-margin">
                     <form action="procesa_carrito_compras.do" method="POST">
                    <div class="w3-third">
                        <div class="w3-card-2">
                            <!-- 
                            <img src="" alt="" />
                            -->
                            <!--Cambiar por la URL comentada arriba.-->
                            <%
                            try
                            {
                               ProductoDal productoDal = new ProductoDal();
                                Producto p = new Producto();
                                DecimalFormat formato = new DecimalFormat("$#,###");
                                p = productoDal.buscarProducto(request.getParameter("imagen"));                            
                            %>
                            <img src="imagesProducts/<%=p.getUrlFoto()%>" style="width:100%">
                            <div class="w3-container">
                                <h5><%=p.getNombreProducto()%></h5>
                            </div>
                        </div>
                    </div>
                    <div width="30%">
                        <div class="w3-card-2" >
                            <h1><%=p.getNombreProducto()%></h1><br>
                            <h3><%=p.getTipoProducto().getDescripcion()%></h3><br>
                            <h2><%=p.getMarca().getDescripcion()%></h2><br>
                            <h3><%=p.getDescripcion()%></h3><br>
                            <h4>SKU: <%=p.getIdProducto()%></h4><br>
                            <h3>Precio Unitario: <%=formato.format(p.getPrecioUnitario())%> </h3><br>
                            <h4>Stock: <%=p.getStock()%> unidades.</h4><br>                           
                            </h3>
                        </div>
                        <div class="w3-container green-d3 row w3-padding-8">
                            <label class="col-sm-2">Cantidad</label>
                            <div class="col-sm-2">
                                <input type="number" name="spi_stock"
                                       class="form-control"
                                       value="1"
                                       min="1"
                                       max="<%=p.getStock()%>"
                                       required >
                                <%
                                }
                                catch(Exception e)
                                {  
                                    
                                }                           
                                %>
                            </div>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-info">
                                    <i class="fa fa-shopping-cart"></i>
                                    Agregar al carro de compras
                                </button>
                            </div>
                       </div>
                    </div>
                  </form>
                </div>
                             
            </div>
            <div class="w3-col m1">&nbsp;</div>
        </div>

        <br>
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
