<%-- 
    Document   : comprobar_session
    Created on : 05-07-2015, 1:02:17
    Author     : Ricardo
--%>

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
        model.business.Clientes cliente = (model.business.Clientes) sesion.getAttribute("cliente");       
        %>
        <h1>Hola : <%=cliente.getNombre() + " " + cliente.getApellido()%> </h1>
        <a href="close_session.do">cerrar Session</a>
        
    </body>
</html>
