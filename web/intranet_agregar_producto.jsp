<%-- 
    Document   : intranet_agregar_producto
    Created on : Jul 9, 2015, 8:15:38 PM
    Author     : urtubia @ notNull
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.business.Login"%>
<%@page import="model.business.Clientes"%>
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
            model.business.Administrador administrador = (model.business.Administrador) sesion.getAttribute("admin");
        %>
        
        <!--header-->
        <header class="w3-container green-d1 w3-row">
            <!--Blank column(1)-->
            <div class="w3-col m1">&nbsp;</div>
            <!--End of blank column-->
            <!--Logo(2)-->
            <div class="w3-col m2">
                <a href="index_intranet.jsp">
                    <img src="images/Override_logo_intranet.png" 
                         width="70%" 
                         alt="Override('<i class='fa fa-shopping-cart'></i>')"/>
                </a>
            </div>
            <!--End of logo-->
            <!--Blank column(1)-->
            <div class="w3-col m1">&nbsp;</div>
            <!--End of blank column-->
            <!--Search form-->
            <div class="w3-col m3">
                <br>
                <div class="input-group">
                    <br>
                    <h2>Bienvenido <%=administrador.getNombre()%></h2>
                    <h4>Intranet @Override super.market(<i class="fa fa-shopping-cart"></i>)</h4>
                        
                    
                </div><!-- /input-group -->
            </div>
            <!--End of search form-->
            <!--Blank column(1)-->
            <div class="w3-col m1">
                <br><br>
            </div>
            <!--End of blank column(1)-->
            <!--Shopping cart link(1)-->
            <div class="w3-col m1">
                &nbsp;  
            </div>
            <!--End of shopping cart link-->
            <!--Login link (2)-->
            
            <div class="w3-col m2">
                <br><br><br>
                <div class="input-group">
                    <span class="input-group-btn">        
                            <%
                                try
                                {
                                    out.println("<a class='btn btn-danger' href='close_session.do'>");
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
        <nav class="w3-topnav w3-padding red-d1">
            <a href="index_intranet.jsp"> <img src="icons/Override_w.png" width="30" height="30" alt="Override_w"/>
                Home Intranet</a>
            <a href="intranet_agregar_producto.jsp"> <img src="icons/new_product_w.png" width="20" height="20" alt="abarrotes_w"/>
                Agregar Producto Nuevo</a>
            <a href="intranet_buscar_producto.jsp"> <img src="icons/search_w.png" width="20" height="20" alt="alimentos_congelados_w"/>
                Buscar Productos</a>
            <a href="intranet_agregar_marca.jsp"> <img src="icons/new_brand_w.png" width="20" height="20" alt="bebidas_y_licores_w"/>
                Agregar Nueva Marca</a>
            <a href="intranet_agregar_administrador.jsp"> <img src="icons/new_admin_w.png" width="20" height="20" alt="carnes"/>
                Agregar Nuevo Administrador</a>
        </nav>
        <!--horizontal menu end-->
        
        <!--Main row-->
        <div class="w3-row">
        <br>
            <!--Blank column(1)-->
            <div class="w3-col m1">&nbsp;</div>    
            <!--End of blank column-->
            
            <!--Sidebar-->
            <div class="list-group w3-col m2">
            <a class="list-group-item" href=index_intranet.jsp> <img src="icons/Override.png" width="30" height="30" alt="Intranet Override"/>
                &nbsp;Home Intranet</a>
                <a class="list-group-item active" href="intranet_agregar_producto.jsp"><img src="icons/new_product_w.png" width="30" height="30" alt=""/>
                        &nbsp;Agregar nuevo producto</a>
                <a class="list-group-item" href="intranet_buscar_producto.jsp"><img src="icons/search.png" width="30" height="30" alt=""/>
                        &nbsp;Buscar Producto</a>
                <a class="list-group-item" href="intranet_agregar_marca.jsp"><img src="icons/new_brand.png" width="30" height="30" alt=""/>
                        &nbsp;Agregar nueva marca</a>
                <a class="list-group-item" href="intranet_agregar_administrador.jsp"><img src="icons/new_admin.png" width="30" height="30" alt=""/>
                        &nbsp;Agregar nuevo administrador</a>
                <!--/nav-->
            </div>
            <!--End of sidebar-->
            
            <!--Content-->
            <div class="w3-col m7 w3-card w3-padding">
                <!--Title bar-->
                <div class="w3-container red">
                    <h2>Agregar nuevo producto&nbsp;&nbsp; <img src="icons/new_product_w.png" width="50" height="50" alt="new_product_w"/>
                    </h2>
                </div>
                <br>
                <!--End of title bar-->
                <div>
                    <form action="create_product.do" method="POST">
                        <table border="1" class="w3-table w3-card red-l5">
                <%                      
                    model.dal.ProductoDal productoDal = new model.dal.ProductoDal();                        
                %>
                <tbody>
                    <tr>
                        <td>
                          Número  
                        </td>
                        <td>
                            <input type="text" 
                                   name="txt_id_producto" 
                                   value="<%=productoDal.maxProduct()%>" 
                                   class="form-control"
                                   size="5" 
                                   readonly="readonly" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Nombre 
                        </td>
                        <td>
                            <input class="form-control"
                                   type="text" 
                                   name="txt_nombre_producto" 
                                   value="" 
                                   required="true" 
                                   autofocus="true"/> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Tipo Producto
                        </td>
                        <td>
                            <select name="ddl_lista_tipo_producto"
                                    class="form-control">
                            <%
                            model.dal.TipoProductosDal tipoProdDal = new model.dal.TipoProductosDal();
                            ArrayList<model.business.TipoProductos> listTipoProd = tipoProdDal.listTipoProducto();
                            for(model.business.TipoProductos t : listTipoProd)
                            {                               
                            %>                           
                                <option value="<%=t.getIdTipoProducto()%>"><%=t.getDescripcion()%></option>                               
                            <%
                            }
                            %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Marca
                        </td>
                        <td>
                            <select name="ddl_marca_producto"
                                    class="form-control">
                            <%
                            model.dal.MarcasDal marcaDal = new model.dal.MarcasDal();
                            ArrayList<model.business.Marcas> listMarca = marcaDal.listMarcas(); 
                            for(model.business.Marcas m : listMarca)
                            {                               
                            %>                    
                                <option value="<%=m.getIdMarca()%>"><%=m.getDescripcion()%></option>                          
                            <%
                            }
                            %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Precio 
                        </td>
                        <td>
                            <input type="number" 
                                   class="form-control"
                                   name="txt_precio" 
                                   value="" 
                                   size="5"
                                   min="0"
                                   required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Stock
                        </td>
                        <td>
                            <input type="number" 
                                   name="txt_stock"
                                   class="form-control"
                                   value="" 
                                   size="5" 
                                   min="0"
                                   required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Foto
                        </td>
                        <td>
                            <input type="url"
                                   class="form-control"
                                   name="txt_foto" 
                                   value="" 
                                   required="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Descripcion
                        </td>
                        <td>
                            <textarea name="txt_descripcion" 
                                      class="form-control"
                                      rows="4" 
                                      cols="20" required="true" >
                            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <input type="submit" value="Crear" name="btn_crear" class="btn btn-primary"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
                    
                </div>
                
            </div>
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
