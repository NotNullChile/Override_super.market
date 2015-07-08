<%-- 
    Document   : login_ricardo
    Created on : 04-07-2015, 15:20:48
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
        <h1>Login</h1>
        <form action="procesar_login.do" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td>
                            RUT
                        </td>
                        <td>
                            <input type="text" name="txt_rut" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password
                        </td>
                        <td>
                            <input type="text" name="txt_password" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <input type="submit" value="Entrar" name="btn_entrar" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
        
       
    </body>
</html>
