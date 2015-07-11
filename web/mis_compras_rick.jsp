<%-- 
    Document   : mis_compras_rick
    Created on : 11-07-2015, 0:05:59
    Author     : Ricardo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.business.Clientes"%>
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
        %>
        <h1>Mis Compras</h1>
        <form action="mostrar_compras_rick.jsp" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td>
                            Eliga Orden
                        </td>
                        <td>
                            <select name="dll_ordenes">
                                <%
                                model.dal.VentaProductoDal vp = new model.dal.VentaProductoDal();
                                ArrayList<model.business.VentaProducto> listOrdenes = vp.listaOrdenes(c);
                                for(model.business.VentaProducto v : listOrdenes)
                                { 
                                %>
                                <option value="<%=v.getCarrito().getOrden()%>"><%=v.getVenta().getFecha() + " - " + v.getCarrito().getOrden()%></option>
                                <%
                                }
                                %>
                            </select>
                        </td>
                        <td>
                            <input type="submit" value="Buscar" name="btn_buscar" />
                        </td>    
                    </tr>
               </table>
        </form>
                   
    </body>
</html>
