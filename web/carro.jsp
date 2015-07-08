<%-- 
    Document   : carro
    Created on : 06-07-2015, 0:23:12
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
                <!--Main card-->
                
                <!--Title bar-->
                <div class="w3-container red">
                    <h2>Su carro de compras:&nbsp;&nbsp;<i class="fa fa-shopping-cart"></i> </h2>
                </div>
                <br><br>
                <!--End of title bar-->
                <form action="carro.jsp" method="POST">
                        
                    <table border="1" class="table">
                        <thead>    
                            <tr class="amber">
                                <td><strong>Código<br>Producto</strong></td>
                                <td><strong>Foto</strong></td>
                                <td><strong>Nombre Producto</strong></td>
                                <td><strong>Unidades</strong></td>
                                <td align="right"><strong>Precio Unitario</strong></td>
                                <td align="right"><strong>SubTotal</strong></td>
                                <td><strong>&nbsp;</strong></td>
                                
                            </tr>
                        </thead>
                        <tbody>
                                <%
                                //ArrayList
                                DecimalFormat formato = new DecimalFormat("$#,###");
                                model.business.Carrito carrito = new model.business.Carrito();
                                int total = 0;
                                ArrayList<model.business.Carrito> listCarrito = (ArrayList<model.business.Carrito> ) sesion.getAttribute("carrito");
                                if(request.getParameter("btn_borrar") != null)
                                {
                                    for(int i=0;i<listCarrito.size();i++)
                                    {
                                        listCarrito.remove(listCarrito.get(i));
                                        break;
                                    }
                                }
                                for(model.business.Carrito c : listCarrito )
                                {
                                    total = total + c.getProducto().subTotal();
                                %>

                <tr>
                    <td><%=c.getProducto().getIdProducto()%></td>
                    <td><img src="imagesProducts/<%=c.getProducto().getUrlFoto()%>" width="80"/></td>
                    <td><strong><%=c.getProducto().getNombreProducto()%>
                            <br><%=c.getProducto().getMarca().getDescripcion()%>
                        </strong></td>
                        <td><span class="badge"><%=c.getProducto().getStock()%></span></td>
                    <td align="right"><%=formato.format(c.getProducto().getPrecioUnitario())%></td>
                    <td align="right"><%=formato.format(c.getProducto().subTotal())%></td>
                    <td><input class="btn btn-danger" type="submit" value="Eliminar item" name="btn_borrar" /></td>
                </tr>
               <%
                }
               %>
               <tr class="blue-d1">
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td align="right"><strong>Total</strong></td>
                  <td align="right"><strong><%=formato.format(total)%></strong></td>
                  <td><input class="btn btn-success" type="submit" value="Comprar" name="btn_comprar" />
                  </td>
               </tr>

            </tbody>
        </table>
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
