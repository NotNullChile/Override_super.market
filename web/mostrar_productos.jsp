<%-- 
    Document   : mostrar_productos
    Created on : 05-07-2015, 2:01:08
    Author     : Ricardo
--%>

<%@page import="model.business.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dal.ProductoDal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table border="1">
            <tbody>
                <%
                model.dal.ProductoDal p = new ProductoDal();
                ArrayList<Producto> listP = p.listaProductoBusquedaGeneral("p");
                for(Producto pr: listP)
                {
                    
                
                %>
                <tr>
                    <td><%=pr.getIdProducto()%></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>

    </body>
</html>
