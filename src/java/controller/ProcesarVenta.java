/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.business.Clientes;
import model.business.Despacho;
import model.business.MetodosDePagos;
import model.business.Producto;
import model.business.Venta;

/**
 *
 * @author Ricardo
 */
public class ProcesarVenta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            //Servlet creado con la finalidad de procesar la venta y sus derivados.
            
            //SESSION
            HttpSession sesion = request.getSession();
            Clientes c = (Clientes) sesion.getAttribute("cliente");
            Despacho d = (Despacho) sesion.getAttribute("despacho");
            MetodosDePagos mp = (MetodosDePagos) sesion.getAttribute("metodo_pago");
            ArrayList<model.business.Carrito> listCarrito = (ArrayList<model.business.Carrito> ) sesion.getAttribute("carrito");
            
            //CLASS
            //DAL
            model.dal.DespachoDal despachoDal   = new model.dal.DespachoDal();
            model.dal.CarritoDal carritoDal     = new model.dal.CarritoDal();
            model.dal.VentaDal ventaDAl         = new model.dal.VentaDal();
            model.dal.ProductoDal productoDal   = new model.dal.ProductoDal();
            //BUSINESS
            model.business.Despacho despacho    = new model.business.Despacho();
            model.business.Carrito  carrito     = new model.business.Carrito();
            model.business.Venta venta          = new model.business.Venta();
            //SET DESPACHO
            despacho.setDireccion(d.getDireccion());
            despacho.setNombrePersonaAEntregar(d.getNombrePersonaAEntregar());
            despacho.getComuna().setIdComuna(d.getComuna().getIdComuna());
            //INSERT DESPACHO
            int insertDespacho = despachoDal.insertDespacho(d);
            switch(insertDespacho)
            {
                case 1: 
                    break;
                default:  out.print("Despacho: " + despachoDal.insertDespacho(d));
                    break;
            }
            //SET CARRITO
            carrito.setOrden("#Orden de Compra N°" + carritoDal.countCarrito());
            //INSERT CARRITO
            int insertCarrito = carritoDal.insertCarrito(carrito);
            switch(insertCarrito)
            {
                case 1: 
                    break;
                default:  out.print("Carrito: " + carritoDal.insertCarrito(carrito));
                    break;
            }
            //INSERT VENTA
            venta.setSubTotal(Integer.parseInt(request.getParameter("txt_subtotal")));
            venta.setIva(Integer.parseInt(request.getParameter("txt_iva")));
            venta.setTotal(Integer.parseInt(request.getParameter("txt_total")));
            venta.getMetodosDePago().setIdMetodosDePago(mp.getIdMetodosDePago());
            venta.getCliente().setRut(c.getRut());
            //Formato Fecha
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
            Date fecha = new Date();
            fecha.getTime();
            //Obtiene Fecha de ahora
            venta.setFecha(dateFormat.format(fecha));
            venta.getCarrito().setIdCarrito(carritoDal.countCarrito()-1);
            venta.getDespacho().setIdDespacho(despachoDal.countDespacho()-1);
            
            //SET VENTA
            int insertVenta = ventaDAl.insertVenta(venta);
            switch(insertVenta)
            {
                case 1: 
                    //Descuenta todos los stock que estan en la lista
                    for(int i = 0; i < listCarrito.size(); i++)
                    {
                       int idProducto = listCarrito.get(i).getProducto().getIdProducto();
                       int stock = productoDal.stockProducto(idProducto) - listCarrito.get(i).getProducto().getStock();
                       productoDal.updateProductoStock(stock,idProducto);
                    }
                    request.getSession().setAttribute("venta", venta);
                    break;
                default:  out.print("Venta: " + ventaDAl.insertVenta(venta));
                    break;
            }          
            
            request.getRequestDispatcher("procesar_venta_producto").forward(request, response);
        }
        catch(Exception e)
        {
            //Error Genérico:
            request.getRequestDispatcher("redirect_index_error.jsp").forward(request, response);
            //out.print(e.getMessage());
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
