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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.business.Carrito;
import model.business.Marcas;
import model.business.Producto;

/**
 *
 * @author Ricardo
 */
public class ProcesarCarro extends HttpServlet {

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
        //Permite capturar acentos
        request.setCharacterEncoding("UTF-8");
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
            //Class
            model.business.Carrito c = new model.business.Carrito();
            model.business.Marcas m = new model.business.Marcas();
            //Session
            HttpSession sesion = request.getSession();
            //ArrayList
            ArrayList<model.business.Carrito> listCarrito = (ArrayList<model.business.Carrito> ) sesion.getAttribute("carrito");
            m.setDescripcion(request.getParameter("txt_marca"));
            c.getProducto().setIdProducto(Integer.parseInt(request.getParameter("id_producto")));
            c.getProducto().setMarca(m);
            c.getProducto().setNombreProducto(request.getParameter("txt_nombre"));
            c.getProducto().setPrecioUnitario(Integer.parseInt(request.getParameter("txt_precio")));
            c.getProducto().setStock(Integer.parseInt(request.getParameter("spi_stock")));
            c.getProducto().setUrlFoto(request.getParameter("txt_image"));
            listCarrito.add(c);
            request.getRequestDispatcher("carro.jsp").forward(request, response);
            
        }
        catch(Exception e)
        {
            //Mandar Mensaje de "DEBES REGISTRARTE PARA COMPRAR"
            request.getRequestDispatcher("redirect_iniciar_sesion.jsp").forward(request, response);
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
