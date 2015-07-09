<%-- 
    Document   : resumen_compra_rick
    Created on : 08-07-2015, 22:31:35
    Author     : Ricardo
--%>

<%@page import="model.dal.CarritoDal"%>
<%@page import="model.business.Carrito"%>
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
    CarritoDal carritoDal = new CarritoDal();
    String carritoOrden = "#OC" + carritoDal.countCarrito();
    %>
    <body>
        <h1>Datos Facturación Orden : <%=carritoOrden%></h1>
        <table border="1">
            <tbody>
                <tr>
                    <td>Rut</td>
                    <td><%=c.getRut()%></td>     
                </tr>
                <tr>
                    <td>Nombre</td>
                    <td><%=c.getNombre() + " " + c.getApellido()%></td>
                </tr>
                <tr>
                    <td>Mail Contacto</td>
                    <td><%=c.getEmail()%></td>
                </tr>
                <tr>
                    <td>Teléfono de Contacto</td>
                    <td><%=c.getTelefono()%></td>
                </tr>
                <tr>
                    <td>
                        <a href="index.jsp">
                            <input type="submit" value="Seguir Comprando" name="btn_comprar" />  
                        </a>
                    </td>
                    <td> 
                        <a href="despacho_rick.jsp">
                            <input type="submit" value="Continuar" name="btn_continuar" />
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
        </form>
    </body>
</html>
