<%-- 
    Document   : resumen_compra_rick
    Created on : 08-07-2015, 22:31:35
    Author     : Ricardo
--%>

<%@page import="model.business.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
    HttpSession sesion = request.getSession();
    Clientes c = (Clientes)sesion.getAttribute("cliente");
    
    %>
    <body>
        <h1>Datos Facturación</h1>
        <table border="1">
            <tbody>
                <tr>
                    <td>Nombre</td>
                    <td><%=c.getNombre() + " " + c.getApellido()%></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
