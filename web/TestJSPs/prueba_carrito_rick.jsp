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


        <h1></h1>
        <h1></h1>
        <h1></h1>
        <h1></h1>
        <form action="prueba_carrito_rick.jsp" method="POST">
        
        <table border="1">
            <tbody>
                <tr>
                    <td>Id</td>
                    <td>Nombre Producto</td>
                    <td>Pedido</td>
                    <td>Precio</td>
                    <td>SubTotal</td>
                    <td>Borrar</td>
                    <td>Total</td>
                </tr>
                <%
                //Session
                  
                HttpSession sesion = request.getSession();
                //ArrayList
                model.business.Carrito carrito = new model.business.Carrito();
                int total = 0;
                ArrayList<model.business.Carrito> listCarrito = (ArrayList<model.business.Carrito> ) sesion.getAttribute("carrito");
                if(request.getParameter("btn_borrar") != null)
                {
                    for(int i=0;i<listCarrito.size();i++)
                    {
                        listCarrito.remove(listCarrito.get(i));
                        break;
                    }
                }
                for(model.business.Carrito c : listCarrito )
                {
                    total = total + c.getProducto().subTotal();
                %>

                <tr>
                    <td><%=c.getProducto().getIdProducto()%></td>
                    <td><%=c.getProducto().getNombreProducto()%></td>
                    <td><%=c.getProducto().getStock()%></td>
                    <td><%=c.getProducto().getPrecioUnitario()%></td>
                    <td><%=c.getProducto().subTotal()%></td>
                    <td><input type="submit" value="Borrar" name="btn_borrar" /></td>
                </tr>
               <%
                }
               %>
               <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td><%=total%></td>
               </tr>

            </tbody>
        </table>
</form>
    </body>
</html>
