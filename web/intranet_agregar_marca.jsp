<%-- 
    Document   : intranet_agregar_marca
    Created on : Jul 9, 2015, 8:16:42 PM
    Author     : urtubia @ notNull
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
            HttpSession sesion = request.getSession();
            model.business.Administrador administrador = (model.business.Administrador) sesion.getAttribute("admin");
            model.dal.MarcasDal md = new model.dal.MarcasDal();
            
        %>
    <body>
        <h1>Agregar Marca</h1>
        <form action="agregar_marca.do" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td>
                            Id Producto
                        </td>
                        <td>
                            <input type="text" name="txt_id"
                                   value="<%=md.countMarcas()%>" 
                                   size="5" readonly="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nombre
                        </td>
                        <td>
                            <input type="text" name="txt_marca" 
                                   value="" required="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <input type="submit" value="Agregar" name="btn_agregar" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
