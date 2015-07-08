<%-- 
    Document   : registro_cliente_ricardo
    Created on : 03-07-2015, 22:27:45
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
        <h1>registro</h1>
        <form action="create_client.do" method="post">
            <table border="1">
                <tbody>
                    <tr>
                        <td>
                            RUT
                        </td>
                        <td>
                            <input type="text" name="txt_rut" 
                                   value="" size="12" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nombre
                        </td>
                        <td>
                            <input type="text" name="txt_nombre" 
                                   value="" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Apellido
                        </td>
                        <td>
                            <input type="text" name="txt_apellido" 
                                   value="" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email
                        </td>
                        <td>
                            <input type="email" name="txt_email" 
                                   value="" required="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Telefono
                        </td>
                        <td>
                            <input type="tel" name="txt_telefono" 
                                   value="" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password
                        </td>
                        <td>
                            <input type="password" name="txt_password_1" 
                                   value="" required="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Repita Password
                        </td>
                        <td>
                            <input type="password" name="txt_password_2" 
                                   value="" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <input type="submit" value="Registrarse" name="btn_crear" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
