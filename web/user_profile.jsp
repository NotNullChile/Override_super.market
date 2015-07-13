<%-- 
    Document   : user_profile
    Created on : Jul 13, 2015, 1:04:12 AM
    Author     : urtubia @ notNull
--%>

<%@page import="java.util.ArrayList"%>
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
                           type="text" 
                           class="form-control" 
                           placeholder="Búsqueda de productos..."
                           name="btn_busqueda_general"
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
        
        <!--Main row-->
        <div class="w3-row">
        <br>
            <!--Blank column(1)-->
            <div class="w3-col m2">&nbsp;</div>    
            <!--End of blank column-->
            <!--Content-->
            <!--Login card-->
            <div class="w3-col m8">
                <!--Title bar-->
                <div class="w3-container red">
                    <h2>Perfil de Usuario&nbsp;&nbsp;<i class="fa fa-user"></i> </h2>
                </div>
                <!--End of title bar-->
                
                <!--Login content-->
                <form action="mostrar_compras_rick.jsp" method="POST">
                <div class="w3-card-2">
                    <br>
                    <div class="w3-row-padding">
                        <div class="w3-col m1">&nbsp;
                        </div>
                        <div class="w3-col m6">
                            <strong>Datos Personales:</strong>
                        </div>
                    </div>
                    <div><hr></div>
                    <div class="w3-row-padding">
                        <div class="w3-col m1">&nbsp;</div>
                        <div class="w3-col m5">
                            Nombre:
                        </div>
                        <div class="w3-col m5">
                            <%=cliente.getNombre()%>&nbsp;<%=cliente.getApellido()%>
                        </div>
                        <div class="w3-col m1">&nbsp;</div>
                    </div>
                    <div class="w3-row-padding">
                        <div class="w3-col m1">&nbsp;</div>
                        <div class="w3-col m5">
                            RUT:
                        </div>
                        <div class="w3-col m5">
                            <%=cliente.getRut()%>
                        </div>
                        <div class="w3-col m1">&nbsp;</div>
                    </div>
                    
                    <div>&nbsp;</div>
                    <div class="w3-row-padding">
                        <div class="w3-col m1">&nbsp;
                        </div>
                        <div class="w3-col m6">
                            <strong>Datos de Contacto:</strong>
                        </div>
                    </div>
                    <div><hr></div>
                    <div class="w3-row-padding">
                        <div class="w3-col m1">&nbsp;</div>
                        <div class="w3-col m5">
                            email:
                        </div>
                        <div class="w3-col m5">
                            <%=cliente.getEmail()%>
                        </div>
                        <div class="w3-col m1">&nbsp;</div>
                    </div>
                    <div class="w3-row-padding">
                        <div class="w3-col m1">&nbsp;</div>
                        <div class="w3-col m5">
                            Teléfono:
                        </div>
                        <div class="w3-col m5">
                            <%=cliente.getTelefono()%>
                        </div>
                        <div class="w3-col m1">&nbsp;</div>
                    </div>
                    <div>&nbsp;</div>
                    
                    <div class="w3-row-padding">
                        <div class="w3-col m1">&nbsp;
                        </div>
                        <div class="w3-col m6">
                            <strong>Datos de Pedidos:</strong>
                        </div>
                    </div>
                    <div><hr></div>
                    <div class="w3-row-padding">
                        <div class="w3-col m1">&nbsp;</div>
                        <div class="w3-col m5">
                            Detalle de mis Compras:
                        </div>
                        <div class="w3-col m4">
                            <select name="dll_ordenes"
                                    class="form-control">
                                <%
                                model.dal.VentaProductoDal vp = new model.dal.VentaProductoDal();
                                ArrayList<model.business.VentaProducto> listOrdenes = vp.listaOrdenes(cliente);
                                for(model.business.VentaProducto v : listOrdenes)
                                { 
                                %>
                                <option value="<%=v.getCarrito().getOrden()%>"><%=v.getVenta().getFecha() + " - " + v.getCarrito().getOrden()%></option>
                                <%
                                }
                                %>
                            </select>
                            <input type="submit" 
                                   class="btn btn-block btn-primary"
                                   value="Ver Detalle" 
                                   name="btn_buscar" />
                        </div>
                        <div class="w3-col m1">&nbsp;</div>
                    </div>
                    <div>&nbsp;</div>
                    
                </div>
                </form>
            </div>
                        
                        
            <!--Blank column(2)-->
            <div class="w3-col m2">&nbsp;</div>    
            <!--End of blank column-->
            

            <!--End of content-->
            
            <!--Blank column-->
            <div class="w3-col m1">&nbsp;</div>
            <!--End of blank column-->
            
        </div>
        <!--End of Main Row-->
        <br>
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

