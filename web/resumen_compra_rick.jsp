<%-- 
    Document   : resumen_compra_rick
    Created on : 08-07-2015, 22:31:35
    Author     : Ricardo
--%>

<%@page import="java.util.ArrayList"%>
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
    <body>
        <h1>Datos Despacho</h1>     
        <%
        HttpSession sesion = request.getSession();    
        Clientes c = (Clientes) sesion.getAttribute("cliente");
        %>
       <form action="create_despacho.do" method="POST">              
        <table border="1" aling="right">                      
            <tbody>
                <tr>
                    <td>Despacho</td> 
                </tr>
                <tr>
                    <td>
                        Direccion
                    </td>
                    <td>
                        <input type="text" name="txt_despacho" 
                               value="" required="true" />
                    </td>
                </tr>
                <tr>
                    <td>Comuna</td>
                    <td>
                        <select name="dll_comunas">
                        <%
                        model.dal.ComunasDal comunaDal = new model.dal.ComunasDal();
                        ArrayList<model.business.Comunas> listComuna = comunaDal.listaComuna();
                        int idComuna = 0;
                        for(model.business.Comunas comunas : listComuna)
                        {         
                        %>                     
                            <option value="<%=comunas.getNombreComuna()%>"><%=comunas.getNombreComuna()%></option>                        
                        <%
                        idComuna = comunas.getIdComuna();
                        }
                        %>  
                        <input type="hidden" name="txt_comuna" value="<%=idComuna%>" size="1" />
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Persona a entregar
                    </td>
                    <td>
                        <input type="text" name="txt_persona_a_entregar" 
                               value="" required="true"/>
                    </td>
                </tr>
                <tr>
                    <td>
                         <input type="submit" value="Continuar" name="btn_continuar" />
                    </td>
                </tr>
            </tbody>
        </table>
       </form>
    </body>
</html>
