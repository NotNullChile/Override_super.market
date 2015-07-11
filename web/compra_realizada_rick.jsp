<%-- 
    Document   : compra_realizada_rick
    Created on : 10-07-2015, 22:32:02
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
        Clientes c = (Clientes) sesion.getAttribute("cliente");
        %>
    <body>
        <h1>Gracias por hacerme RICO :3</h1>
        <a href="index.jsp">Index</a>
        <a href="mis_compras_rick.jsp">Ver mis compras</a>
    </body>
</html>
