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
        <meta charset="UTF-8">
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
                <div class="input-group">
                    <input name= "txt_busqueda" 
                           type="search"
                           class="form-control" 
                           placeholder="Búsqueda de productos..."
                           autofocus>
                    <span class="input-group-btn">
                        <button type="submit"
                                name="btn_busqueda_general"
                                class="btn btn-primary"
                                id="submit"
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
                <%
                    try
                    {
                        out.println("Bienvenido <br>"+ cliente.getNombre());
                    }
                    catch(Exception e)
                    {
                        out.println("<br>");
                    }
                %> 
            </div>
            <!--End of shopping cart link-->
            <!--Login link (2)-->
            
            <div class="w3-col m2">
                <br>
                <div class="input-group">
                    <span class="input-group-btn">    
                            <%
                                try
                                {
                                    cliente.getNombre();
                                    out.println("<a class='btn btn-block btn-info' href='carro.jsp'>");
                                    out.println("<i class='fa fa-shopping-cart'></i>&nbsp;Carro de Compras");
                                    out.println("</a><br>");
                                    
                                    out.println("<a class='btn btn-block btn-success' href='user_profile.jsp'>");
                                    out.println("<i class='fa fa-user'></i>&nbsp;Mi Perfil");
                                    out.println("</a><br>");

                                    out.println("<a class='btn btn-block btn-warning' href='close_session.do'>");
                                    out.println("<i class='fa fa-lock'></i>&nbsp;Cerrar Sesión");
                                    out.println("</a>");
                                    
                                }
                                catch(Exception e)
                                {
                                    out.println("<br>&nbsp;<br>");
                                    
                                    out.println("<a class='btn btn-block btn-info' href='redirect_iniciar_sesion.jsp'>");
                                    out.println("<i class='fa fa-shopping-cart'></i>&nbsp;Carro de Compras");
                                    out.println("</a><br>");
                                    
                                    out.println("<a class='btn btn-block btn-success' href='login.jsp'>");
                                    out.println("<i class='fa fa-user'></i>&nbsp;Iniciar Sesión");
                                    out.println("</a><br>");
                                    
                                    out.println("<a class='btn btn-block btn-warning' href='login.jsp'>");
                                    out.println("<i class='fa fa-user-plus'></i>&nbsp;Nuevo Usuario");
                                    out.println("</a>");
                                }
                            %>        
                    </span>
                </div><!-- /input-group -->  
            </div>
            <!--End of login link-->
            <!--Blank column(1)-->
            <div class="w3-col m1">
                <br><br><br>
                <div class="input-group">
                    <span class="input-group-btn">               
                    </span>
                </div><!-- /input-group -->
            </div>
            <!--End of blank column(1)-->
        </header>
        <!--header end-->
                            
                            <%
                            try
                            {
                                ProductoDal productoDal = new ProductoDal();
                                Producto p = new Producto();
                                DecimalFormat formato = new DecimalFormat("$#,###");
                                p = productoDal.buscarProducto(request.getParameter("imagen"));
                                
                                //Parent definition for breadcrumb:
                                String parent = "";
                                
                                if (p.getTipoProducto().getDescripcion().equalsIgnoreCase("Abarrotes")) {
                                    parent = "busqueda_abarrotes.jsp";
                                }
                                else if (p.getTipoProducto().getDescripcion().equalsIgnoreCase("Alimentos Congelados")) {
                                    parent = "busqueda_alimentos_congelados.jsp";
                                }
                                else if (p.getTipoProducto().getDescripcion().equalsIgnoreCase("Bebidas y Licores")) {
                                    parent = "busqueda_bebidas_y_licores.jsp";
                                }
                                else if (p.getTipoProducto().getDescripcion().equalsIgnoreCase("Carnes")) {
                                    parent = "busqueda_carnes.jsp";
                                }
                                else if (p.getTipoProducto().getDescripcion().equalsIgnoreCase("Cereales y Snacks")) {
                                    parent = "busqueda_cereales_y_snacks.jsp";
                                }
                                else if (p.getTipoProducto().getDescripcion().equalsIgnoreCase("Desayuno y Once")) {
                                    parent = "busqueda_desayuno_y_once.jsp";
                                }
                                else if (p.getTipoProducto().getDescripcion().equalsIgnoreCase("Hogar y Limpieza")) {
                                    parent = "busqueda_hogar_y_limpieza.jsp";
                                }
                                else if (p.getTipoProducto().getDescripcion().equalsIgnoreCase("Mascotas")) {
                                    parent = "busqueda_mascotas.jsp";
                                }
                                
                            %>
        
        <!--horizontal menu-->
        <nav class="w3-topnav w3-padding green-d1">
            <a href="index.jsp"> <img src="icons/Override_w.png" width="30" height="30" alt="Override_w"/>
                </a>
            <a href="busqueda_abarrotes.jsp"> <img src="icons/abarrotes_w.png" width="20" height="20" alt="abarrotes_w"/>
                Abarrotes</a>
            <a href="busqueda_alimentos_congelados.jsp"> <img src="icons/alimentos_congelados_w.png" width="20" height="20" alt="alimentos_congelados_w"/>
                Alimentos Congelados</a>
            <a href="busqueda_bebidas_y_licores.jsp"> <img src="icons/bebidas_y_licores_w.png" width="20" height="20" alt="bebidas_y_licores_w"/>
                Bebidas y Licores</a>
            <a href="busqueda_carnes.jsp"> <img src="icons/carnes_w.png" width="20" height="20" alt="carnes"/>
                Carnes</a>
            <a href="busqueda_cereales_y_snacks.jsp"> <img src="icons/cereales_y_snacks_w.png" width="20" height="20" alt="cereales_y_snacks_w"/>
                Cereales y Snacks</a>
            <a href="busqueda_desayuno_y_once.jsp"> <img src="icons/desayuno_y_once_w.png" width="20" height="20" alt="desayuno_y_once_w"/>
                Desayuno y Once</a>
            <a href="busqueda_hogar_y_limpieza.jsp"> <img src="icons/hogar_y_limpieza_w.png" width="20" height="20" alt="hogar_y_limpieza_w"/>
                Hogar y Limpieza</a>
            <a href="busqueda_mascotas.jsp"> <img src="icons/mascotas_w.png" width="20" height="20" alt="mascotas_w"/>
                Mascotas</a>
        </nav>
        <!--horizontal menu end-->
        <!--Body-->
        <div class="w3-row">
        <br>
            <div class="w3-col m1"> &nbsp; </div>    
                        <!--Sidebar-->
            <div class="list-group w3-col m2">
            <a class="list-group-item active" href=index.jsp> <img src="icons/Override_w.png" width="30" height="30" alt="Override"/>
                &nbsp;Home</a>
            <a class="list-group-item" href="busqueda_abarrotes.jsp"><img src="icons/abarrotes.png" width="30" height="30" alt="abarrotes"/>
                        &nbsp;Abarrotes</a>
            <a class="list-group-item" href="busqueda_alimentos_congelados.jsp"><img src="icons/alimentos_congelados.png" width="30" height="30" alt="alimentos_congelados"/>
                        &nbsp;Alimentos Congelados</a>
            <a class="list-group-item" href="busqueda_bebidas_y_licores.jsp"><img src="icons/bebidas_y_licores.png" width="30" height="30" alt="bebidas_y_licores"/>
                        &nbsp;Bebidas y Licores</a>
            <a class="list-group-item" href="busqueda_carnes.jsp"> <img src="icons/carnes.png" width="30" height="30" alt="carnes"/>
                        &nbsp;Carnes</a>
            <a class="list-group-item" href="busqueda_cereales_y_snacks.jsp"> <img src="icons/cereales_y_snacks.png" width="30" height="30" alt="hogar_y_limpieza"/>
                        &nbsp;Cereales y Snacks</a>
            <a class="list-group-item" href="busqueda_desayuno_y_once.jsp"> <img src="icons/desayuno_y_once.png" width="30" height="30" alt="desayuno_y_once"/>
                        &nbsp;Desayuno y Once</a>
            <a class="list-group-item" href="busqueda_hogar_y_limpieza.jsp"> <img src="icons/hogar_y_limpieza.png" width="30" height="30" alt="hogar_y_limpieza"/>
                        &nbsp;Hogar y Limpieza</a>
            <a class="list-group-item" href="busqueda_mascotas.jsp"> <img src="icons/mascotas.png" width="30" height="30" alt="mascotas"/>
                        &nbsp;Mascotas</a>
                <!--/nav-->
            </div>
            <!--End of sidebar-->
            <div class="w3-col m7 w3-card w3-padding">
                <!--Breadcrumbs-->
                <div>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><img src="icons/Override.png" width="30" height="30" alt="Override"/>
                            </a></li>
                        <li><a href="resultados_busqueda.jsp">Todos los productos</a></li>
                        <li class="active"><a href="<%=parent%>"><%=p.getTipoProducto().getDescripcion()%></a></li>
                        <li><a href="#"><%=p.getNombreProducto()%>&nbsp;<%=p.getMarca().getDescripcion()%></a></li>
                    </ol>
                </div>
                <!--End of breadcrumbs-->
                <div class="w3-container red">
                    <h2>Detalles del producto:&nbsp;&nbsp;<i class="fa fa-search"></i> </h2>
                </div>
                <form action="procesar_carro.do" method="POST">
                <div class="w3-row-margin">
                    
                    <div class="w3-third">
                        <div class="w3-card-2">
                            
                            
                            
                            <img src="imagesProducts/<%=p.getUrlFoto()%>" style="width:100%">     
                            <div class="w3-container">
                                <h5><!--%=p.getNombreProducto()%--></h5>
                            </div>
                        </div>
                    </div>
                    <div width="30%">
                        <div class="w3-card-2" >
                            <h1><input type="text" name="txt_nombre" value="<%=p.getNombreProducto()%>"  style="border: none"/> 
                                <br><input type="text" name="txt_marca" value="<%=p.getMarca().getDescripcion()%>"  style="border: none"/></h1>
                            <h4><%=p.getTipoProducto().getDescripcion()%></h4>
                            <h6>SKU:<input type="text" name="id_producto" value="<%=p.getIdProducto()%>"  style="border: none"/></h6>
                            <h3><%=p.getDescripcion()%></h3><br>
                            <h3>Precio Unitario:<%=formato.format(p.getPrecioUnitario())%> <input type="hidden" name="txt_precio" value="<%=p.getPrecioUnitario()%>" /> </h3>
                            <h5>Stock: <%=p.getStock()%> unidades.</h5><br><input type="hidden" name="txt_image" value="<%=p.getUrlFoto()%>" style="border: none"  />   
                            <br><br>
                        </div>
                        <div class="w3-container green-d3 row w3-padding-8">
                            <%
                                if (p.getStock() > 0) 
                                {
                                    out.println("<label class='col-sm-2'>Cantidad</label>");
                                    out.println("<div class='col-sm-2'>");
                                    out.println("<input type='number' name='spi_stock' class='form-control' value='1' min='1' max= " + p.getStock() + " required >");
                                    out.println("</div>");
                                    out.println("<div class='col-sm-2'>");
                                    out.println("<button type='submit' class='btn btn-info'>");
                                    out.println("<i class='fa fa-shopping-cart'></i>");
                                    out.println("Agregar al carro de compras");
                                    out.println("</button>");
                                    out.println("</div>");
                                }
                                else
                                {
                                    out.println("<label class='col-sm-2'>Producto agotado.</label>");
                                }
                            %>
                            <!--label class='col-sm-2'>Cantidad</label>
                            <div class='col-sm-2'>
                                <input type='number' name='spi_stock'
                                       class='form-control'
                                       value='1'
                                       min='1'
                                       max="<%=p.getStock()%>"
                                       required >
                                
                            </div>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-info">
                                    <i class="fa fa-shopping-cart"></i>
                                    Agregar al carro de compras
                                </button>
                            </div-->
                                <%
                                }
                                catch(Exception e)
                                {  
                                    
                                }                           
                                %>
                       </div>
                    </div>
                 
                </div>
                     </form>         
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
