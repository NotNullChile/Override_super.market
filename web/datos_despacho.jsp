<%-- 
    Document   : datos_despacho
    Created on : Jul 12, 2015, 4:28:57 PM
    Author     : urtubia @ notNull
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Override super.market() - Carro de compras</title>
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
            response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
            response.setHeader("Pragma","no-cache");            
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
                                    
                                    out.println("<a class='btn btn-block btn-info' href='login.jsp'>");
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
            <div class="w3-col m1">&nbsp;</div>    
            <!--End of blank column-->
            
            <!--Sidebar-->
                        <!--Sidebar-->
            <div class="list-group w3-col m2">
            <a class="list-group-item" href=index.jsp> <img src="icons/Override.png" width="30" height="30" alt="Override"/>
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
            <!--End of sidebar-->
            
            <!--Content-->
            <div class="w3-col m7 w3-card w3-padding">
                <!--Main card-->
                <!--Breadcrumbs-->
                <div>
                    <ol class="breadcrumb">
                        <li><span class="badge">1</span> <span class="label label-default">Carro de Compras</span></li>
                        <li><span class="badge">2 </span>&nbsp;<span class="label label-primary">Datos de Despacho</span></li>
                        <li><span class="badge">3 </span>&nbsp;<span class="label label-default">Método de Pago</span></li>
                        <li><span class="badge">4 </span>&nbsp;<span class="label label-default">Confirmación de Compra</span></li>
                    </ol>
                </div>
                <!--End of breadcrumbs-->
                <!--Title bar-->
                <div class="w3-container red">
                    <h2>Datos de Despacho:&nbsp;&nbsp;<i class="fa fa-flip-horizontal fa-truck"></i> </h2>
                </div>
                <br><br>
                <!--End of title bar-->
              
                <form action="create_despacho.do" method="POST">        
                    
                    <div class="w3-table">
                        <div class="w3-row-padding amber">
                            <div class="w3-col m1">&nbsp;</div>
                            <div class="w3-col m10">
                                <strong>Indique los detalles de entrega de su(s) producto(s)</strong>
                                <br>&nbsp;
                            </div>
                            <div class="w3-col m1">&nbsp;</div>
                        </div>
                        <div class="w3-row w3-padding">
                            <div class="w3-col m1">
                                &nbsp;
                            </div>
                            <div class="w3-col m5">
                                Dirección
                            </div>
                            <div class="w3-col m4">
                                <input type="text"
                                       placeholder="Calle"
                                       class="form-control"
                                       name="txt_despacho" 
                                       value="" 
                                       required="true" 
                                       autofocus/>
                            </div>
                            <div class="w3-col m1">
                                <input type="number"
                                       placeholder="nº"
                                       class="form-control"
                                       name="txt_numeroCasa" 
                                       value="" 
                                       required="true" />
                            </div>
                            <div class="w3-col m1"></div>
                        </div>
                        <div class="w3-row w3-padding">
                            <div class="w3-col m1">
                                &nbsp;
                            </div>
                            <div class="w3-col m5">
                                Comuna
                            </div>
                            <div class="w3-col m5">
                                <select name="dll_comunas"
                                        class="form-control">
                                <%
                                    model.dal.ComunasDal comunaDal = new model.dal.ComunasDal();
                                    ArrayList<model.business.Comunas> listComuna = comunaDal.listaComuna();
                                    int idComuna = 0;
                                    for(model.business.Comunas comunas : listComuna)
                                    {         
                                %>                     
                                    <option value="<%=comunas.getNombreComuna()%>"><%=comunas.getNombreComuna()%></option>                        
                                <%
                                    idComuna = comunas.getIdComuna();
                                    }
                                %>  
                                    <input type="hidden" name="txt_comuna" value="<%=idComuna%>" size="1" />
                                </select>
                            </div>    
                            <div class="w3-col m1"></div>
                        </div>
                        
                        <div class="w3-row w3-padding">
                            <div class="w3-col m1">
                                &nbsp;
                            </div>
                            <div class="w3-col m5">
                                Persona a Entregar
                            </div>
                            <div class="w3-col m5">
                                <input type="text"
                                       placeholder="Nombre"
                                       class="form-control"
                                       name="txt_persona_a_entregar" 
                                       value="" 
                                       required="true" />
                            </div>
                            <div class="w3-col m1"></div>
                        </div>
                        <div>&nbsp;</div>
                        <div class="w3-row-padding">
                            <div class="w3-col m5">
                                <a class="btn btn-success btn-block" href="carro.jsp">
                                    &laquo;&nbsp;Volver a Carro de Compras</a>
                            </div>
                            <div class="w3-col m2">&nbsp;</div>
                            <div class="w3-col m5">
                                <input class="btn btn-success btn-block" 
                                       type="submit" 
                                       value="Continuar a Método de Pago &raquo;" 
                                       name="btn_continuar">
                            </div>    
                        </div>
                    </div>
                </form>
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
