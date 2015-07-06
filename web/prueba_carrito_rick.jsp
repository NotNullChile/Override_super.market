<%-- 
    Document   : prueba_carrito_rick
    Created on : 06-07-2015, 0:23:12
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
        <%
        
            //Session
            HttpSession sesion = request.getSession();
            //ArrayList
            ArrayList<model.business.Carrito> listCarrito = (ArrayList<model.business.Carrito> ) sesion.getAttribute("carrito");
        for(model.business.Carrito c : listCarrito )
        {
            
        
        %>
        <h1><%=c.getProducto().getStock()%></h1>
        <%
        }
        %>
    </body>
</html>
