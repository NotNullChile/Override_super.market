<%-- 
    Document   : comprobar_session_admin
    Created on : 05-07-2015, 1:19:54
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
        model.business.Administrador admin = (model.business.Administrador) sesion.getAttribute("admin");       
        %>
        <h1>Hola : <%=admin.getNombre() + " " + admin.getApellido()%> </h1>
    </body>
</html>
