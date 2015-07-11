<%-- 
    Document   : mostrar_compras_rick
    Created on : 11-07-2015, 0:30:05
    Author     : Ricardo
--%>

<%@page import="model.business.Clientes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession sesion = request.getSession();    
        Clientes c = (Clientes) sesion.getAttribute("cliente");
        request.setCharacterEncoding("UTF-8");
        String orden1 = request.getParameter("dll_ordenes");
        %>
        <h1>Mi compra</h1>
        <table border="1">
            <thead>
                <tr>
                        <td>
                           <%=orden1%>
                        </td>
                </tr>        
                 <%
                       model.dal.VentaProductoDal vp = new model.dal.VentaProductoDal();
                       String orden = request.getParameter("dll_ordenes");
                       ArrayList<model.business.VentaProducto> listProductos = vp.listaProductosXOrdenes(c,orden);
                       for(model.business.VentaProducto v : listProductos)
                       {
                    %>
                    <tr>
                        <td>
                            Foto
                        </td>
                        <td>
                            Nombre
                        </td>
                        <td>
                            SubTotal
                        </td>
                        <td>
                            IVA
                        </td>
                        <td>
                            Total
                        </td>
                    </tr>
                    <tr>
                        <td>
                          <img name="imagen" src="imagesProducts/<%=v.getProducto().getUrlFoto()%>" style="width:100%">  
                        </td>
                        <td>
                            <%=v.getProducto().getNombreProducto()%>
                        </td>
                        <td>
                            <%=v.getVenta().getSubTotal()%>
                        </td>
                        <td>
                            <%=v.getVenta().getIva()%>
                        </td>
                        <td>
                            <%=v.getVenta().getTotal()%>
                        </td>
                    </tr>
                    <%       
                     }
                    %>
                </tbody>
        </table>

    </body>
</html>
