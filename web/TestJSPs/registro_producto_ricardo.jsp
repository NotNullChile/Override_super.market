<%-- 
    Document   : registro_producto
    Created on : 04-07-2015, 22:52:25
    Author     : Ricardo
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registro Producto</h1>
        <form action="create_product.do" method="POST">
            <table border="1">
                <%                      
                    model.dal.ProductoDal productoDal = new model.dal.ProductoDal();                        
                %>
                <tbody>
                    <tr>
                        <td>
                          Numero  
                        </td>
                        <td>
                            <input type="text" name="txt_id_producto" value="<%=productoDal.maxProduct()%>" 
                                   size="5" readonly="readonly" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Nombre 
                        </td>
                        <td>
                            <input type="text" name="txt_nombre_producto" 
                                   value="" required="true" /> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Tipo Producto
                        </td>
                        <td>
                            <select name="ddl_lista_tipo_producto">
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
                            <select name="ddl_marca_producto">
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
                            <input type="text" name="txt_precio" 
                                   value="" size="5" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Stock
                        </td>
                        <td>
                            <input type="text" name="txt_stock" 
                                   value="" size="5" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Foto
                        </td>
                        <td>
                            <input type="text" name="txt_foto" 
                                   value="" required="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Descripcion
                        </td>
                        <td>
                            <textarea name="txt_descripcion" rows="4" 
                                      cols="20" required="true" >
                            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <input type="submit" value="Crear" name="btn_crear" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
