<%-- 
    Document   : busqueda_alimentos_congelados.jsp
    Created on : Jul 4, 2015, 3:54:49 PM
    Author     : urtubia @ notNull
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dal.ProductoDal"%>
<%@page pageEncoding="UTF-8" %>
<%@page contentType="text/html"%>
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
            String tipoProducto = "Alimentos Congelados";
            String thisURL = "busqueda_alimentos_congelados.jsp";
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
                           type="text" 
                           class="form-control" 
                           placeholder="Búsqueda de productos..."
                           autofocus
                           >
                    <span class="input-group-btn">
                        <button type="submit" 
                                class="btn btn-primary"
                                name="btn_busqueda_general"
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
        <!--horizontal menu end-->
        <!--Body-->
        <div class="w3-row">
        <br>
            <div class="w3-col m1"> &nbsp; </div>    
                        <!--Sidebar-->
            <div class="list-group w3-col m2">
            <a class="list-group-item" href=index.jsp> <img src="icons/Override.png" width="30" height="30" alt="Override"/>
                &nbsp;Home</a>
            <a class="list-group-item" href="busqueda_abarrotes.jsp"><img src="icons/abarrotes.png" width="30" height="30" alt="abarrotes"/>
                        &nbsp;Abarrotes</a>
            <a class="list-group-item  active" href="busqueda_alimentos_congelados.jsp"><img src="icons/alimentos_congelados_w.png" width="30" height="30" alt="alimentos_congelados"/>
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
                <div class="w3-container red">
                    <h2>Productos categoría: <%=tipoProducto%>&nbsp;&nbsp; <img src="icons/alimentos_congelados_w.png" width="50" height="50" alt="alimentos_congelados_w"/>
                    </h2>
                </div>
                
                <!--Result Sort-->
                
                <div class="row">
                    
                </div>
                <div class="w3-row">
                    <div class="w3-col m1">&nbsp;</div>
                    <div class="w3-col m3"><br><h4>Ordenar resultados</h4></div>
                    <div class="w3-col m1">
                        <form action=<%=thisURL%> method="Post">
                            <br>
                            <button name="btn_ordenar_alpha_asc"
                                    type="submit" 
                                    class="btn btn-primary"
                                    >
                                <i class="fa fa-sort-alpha-asc"></i>
                            </button>
                        </form>
                    </div>
                    <div class="w3-col m1">
                        <form action=<%=thisURL%> method="Post">
                            <br>
                            <button name="btn_ordenar_alpha_desc"
                                    type="submit" 
                                    class="btn btn-primary"
                                    >
                                <i class="fa fa-sort-alpha-desc"></i>
                            </button>
                        </form>
                    </div>
                    <div class="w3-col m1">
                        <form action=<%=thisURL%> method="Post">
                            <br>
                            <button name="btn_ordenar_precio_asc"
                                    type="submit" 
                                    class="btn btn-primary"
                                    >
                                <i class="fa fa-sort-numeric-asc"></i>
                            </button>
                        </form>
                    </div>
                    <div class="w3-col m1">
                        <form action=<%=thisURL%> method="Post">
                            <br>
                            <button name="btn_ordenar_precio_desc"
                                    type="submit" 
                                    class="btn btn-primary"
                                    >
                                <i class="fa fa-sort-numeric-desc"></i>
                            </button>
                        </form>
                    </div>
                    <div class="w3-col m1">&nbsp;</div>
                </div>
                <!--End of result sort-->
                
                <!--Price filter-->
                <div class="w3-row">
                    <div class="w3-col m1">&nbsp;</div>
                    <div class="w3-col m3"><br><h4>Filtrar por precio</h4></div>
                    <div class="w3-col m8">
                        <br>
                        <form action=<%=thisURL%> method="Post">
                        <h4>
                            Min&nbsp;<i class="fa fa-minus"></i>
                            <input name="valor_min"
                                   type="number"
                                   size="2"
                                   width="2"
                                   style="width: 80px;"
                                   value="0"
                                   min="0"
                                   max="999999"
                                   >
                            Max&nbsp;<i class="fa fa-plus"></i>
                            <input name="valor_max"
                                   type="number"
                                   size="2"
                                   width="2"
                                   style="width: 80px;"
                                   value="999999"
                                   min="0"
                                   max="999999"
                                   >
                            <button name="btn_filtrar_valores"
                                    type="submit" 
                                    class="btn btn-primary"
                                    >
                                <i class="fa fa-sign-out"></i>
                            </button>
                        </h4>
                        </form>
                    </div>
                </div>
                <!--End of price filter-->
                
                <form action=detalle_producto.jsp method="POST">
                    <div class="w3-row-margin">
                        <%
                         model.dal.ProductoDal productoDal = new ProductoDal();
                         //Formato Dinero CL
                         DecimalFormat formato = new DecimalFormat("$#,###");
                         ArrayList<model.business.Producto> listProduct = productoDal.listaProductoBusquedaGeneral();
                         
                         listProduct = productoDal.listaProductoXTipoProducto(tipoProducto);
                         
                         if(request.getParameter("btn_filtrar_valores") != null)
                         {
                             int valor1 = Integer.parseInt(request.getParameter("valor_min"));
                             int valor2 = Integer.parseInt(request.getParameter("valor_max"));
                             listProduct = productoDal.listaProductoXValores(tipoProducto, valor1, valor2);
                         }
                         else if (request.getParameter("btn_ordenar_precio_asc") != null)
                         {
                             listProduct = productoDal.listaProductoMenorAMayor(tipoProducto);
                         }
                         else if(request.getParameter("btn_ordenar_precio_desc") != null)
                         {
                             listProduct = productoDal.listaProductoMayorAMenor(tipoProducto);
                         }
                         else if(request.getParameter("btn_ordenar_alpha_asc") != null)
                         {
                             listProduct = productoDal.listaProductoXOrdenAlfabeticoASC(tipoProducto);
                         }
                         else if(request.getParameter("btn_ordenar_alpha_desc") != null)
                         {
                             listProduct = productoDal.listaProductoXOrdenAlfabeticoDESC(tipoProducto);
                             
                         }else 
                         {
                             //listProduct = productoDal.listaProductoBusquedaGeneral(request.getParameter(thisPage));
                         }
                         if (listProduct.isEmpty()) {
                                 out.println("<br>No existen productos que contengan el nombre o descripción <strong>''" + request.getParameter("txt_busqueda")+"''</strong>");
                         }
                             
                         
                         for(model.business.Producto p : listProduct)
                         {                                    
                        %>
                        <div class="w3-third">
                            <div class="w3-card-2">
                                <button value="<%=p.getUrlFoto()%>" name="imagen"> 
                                <img name="imagen" value="<%=p.getUrlFoto()%>" src="imagesProducts/<%=p.getUrlFoto()%>" style="width:100%">
                                </button>
                                <div class="w3-container">   
                                    <h5><%=p.getNombreProducto()%></h5>
                                    <hr>
                                    <h5 align="right"><%=formato.format(p.getPrecioUnitario())%></h5>
                                </div>                                
                            </div>
                        </div>
                          <%
                            }
                          %> 
                   </div> 
                 </form> 
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
