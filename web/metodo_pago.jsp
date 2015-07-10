<%-- 
    Document   : despacho_rick
    Created on : 08-07-2015, 23:46:51
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
        <h1>Método de pago</h1>
        <form action="create_metodo_pago.do" method="POST">   
        <table border="1">

            <tbody>
                <tr>
                    <td>
                        Método de pago
                    </td>      
                    <td>
                        <select name="dll_metodo_pago">
                            <%
                            model.dal.MetodosDePagosDal mp = new model.dal.MetodosDePagosDal();
                            ArrayList<model.business.MetodosDePagos> listMetodos = mp.listMetodosDePagos();
                            for(model.business.MetodosDePagos m : listMetodos)
                            {
                            %>
                            <option value="<%=m.getDescripcion()%>"><%=m.getDescripcion()%></option>
                            <%
                             }
                            %>
                        </select>  
                    </td>
                     
                </tr>

                <tr>
                    <td>
                        Numero Tarjeta
                    </td>
                    <td>
                        <input type="text" name="txt_numero_tarjeta" 
                               value="" required="true" maxlength="15"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Pin-Pass
                    </td>
                    <td>
                        <input type="password" name="txt_pin_pass" value="" 
                               size="5" required="true" maxlength="4" />
                    </td>
                </tr>

                <tr>
                    <td><input type="submit" value="Continuar" name="btn_continuar" /></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
   </form>
    </body>
</html>
