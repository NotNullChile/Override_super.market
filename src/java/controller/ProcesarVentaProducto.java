/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.business.Venta;

/**
 *
 * @author Ricardo
 */
@WebServlet(name = "ProcesarVentaProducto", urlPatterns = {"/procesar_venta_producto"})
public class ProcesarVentaProducto extends HttpServlet {

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
            //Servlet creado con la finalidad de saber que compró nuestro cliente.
            
            //Session
            HttpSession sesion = request.getSession();
            Venta v = (Venta) sesion.getAttribute("venta");
            ArrayList<model.business.Carrito> listCarrito = (ArrayList<model.business.Carrito> ) sesion.getAttribute("carrito");
            //Class
            model.dal.VentaProductoDal  vp = new model.dal.VentaProductoDal(); 
            model.dal.VentaDal  ve = new model.dal.VentaDal();
            //Insert
            for (int i = 0; i < listCarrito.size(); i++) 
            {
                int idVenta = ve.maxVenta();
                int idProducto = listCarrito.get(i).getProducto().getIdProducto();
                vp.insertVentaProducto(idVenta, idProducto);
                //Borrrará todo de la lista
                //listCarrito.remove(i);
            } 
            for (int i = 0; i < listCarrito.size(); i++) 
            {
                //Borrrará todo de la lista
                listCarrito.removeAll(listCarrito);
            } 
            request.getRequestDispatcher("redirect_index_coompra_realizada.jsp").forward(request, response);
        }
        catch(Exception e)
        {
            //Error Genérico:
            request.getRequestDispatcher("redirect_index_error.jsp").forward(request, response);
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
