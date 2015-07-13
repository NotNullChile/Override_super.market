<%-- 
    Document   : confirmar_venta_rick
    Created on : 09-07-2015, 21:10:44
    Author     : Ricardo
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dal.ProductoDal"%>
<%@page import="model.business.MetodosDePagos"%>
<%@page import="model.dal.CarritoDal"%>
<%@page import="model.business.Despacho"%>
<%@page import="model.business.Clientes"%>
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
        //Call Session
        Clientes c = (Clientes) sesion.getAttribute("cliente");
        Despacho d = (Despacho) sesion.getAttribute("despacho");
        MetodosDePagos mp = (MetodosDePagos) sesion.getAttribute("metodo_pago");        
        //Venta
        int subTotal = 0;
        int iva = 0;
        int totalAPagar = 0;
        DecimalFormat formato = new DecimalFormat("$#,###");
        ArrayList<model.business.Carrito> listCarrito = (ArrayList<model.business.Carrito> ) sesion.getAttribute("carrito");
        //Class       
        CarritoDal carritoDal = new CarritoDal();
        String carritoOrden = "#Orden de Compra N° " + carritoDal.countCarrito();
        %>
        <h1>Confirme Compra <%=carritoOrden%></h1>
        <form action="procesar_venta.do" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td>
                            Mis Datos
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Rut
                        </td>
                        <td>
                            <%=c.getRut()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nombre Cliente
                        </td>
                        <td>
                            <%=c.getNombre() + " " + c.getApellido()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mail Contacto
                        </td>
                        <td>
                            <%=c.getEmail()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Datos Despacho
                        </td>
                    </tr>
                    <tr>
                        <td>Persona a entregar</td>
                        <td>
                            <%=d.getNombrePersonaAEntregar()%>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            Direccion
                        </td>
                        <td>
                            <%=d.getDireccion()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Comuna
                        </td>
                        <td>
                            <%=d.getComuna().getNombreComuna()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Valor
                        </td>
                        <td>
                            $4.990
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Método Pago
                        </td>
                        <td>
                            <%=mp.getDescripcion()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            SubTotal
                        </td>
                        <td>
                            <%
                            //ESTO AGREGALO AL OTRO FORMULARIO
                            int subTotalDespacho = (int) Math.round(4990/1.19);
                            int ivaDespacho = (int) Math.round(subTotalDespacho*0.19);
                            int totalDespacho = subTotalDespacho + ivaDespacho;
                            //
                            for(model.business.Carrito ca : listCarrito)
                            {
                               subTotal += ca.getProducto().subTotal();
                               iva += ca.getProducto().calculoIva();
                               totalAPagar += ca.getProducto().calculoTotalAPagar();
                            }
                            %>
                            <%=formato.format(subTotal + subTotalDespacho )%>
                            <input type="hidden" name="txt_subtotal" value="<%=subTotal+subTotalDespacho%>" size="1" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            IVA
                        </td>
                        <td>
                            <%=formato.format(iva + ivaDespacho)%>
                            <input type="hidden" name="txt_iva" value="<%=iva+ivaDespacho%>" size="1" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Total a pagar
                        </td>
                        <td>
                            <%=formato.format(totalAPagar + totalDespacho)%>
                            <input type="hidden" name="txt_total" value="<%=totalAPagar+ivaDespacho%>" size="1" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="Comprar" name="btn_comprar" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
