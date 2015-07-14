/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.business.Producto;
import model.dal.ProductoDal;

/**
 *
 * @author Ricardo
 */
@WebServlet(name = "ModificarEliminarProducto", urlPatterns = {"/modificar_eliminar_producto.do"})
public class ModificarEliminarProducto extends HttpServlet {

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
            //CLASS
            model.business.Producto p = new Producto();
            model.dal.ProductoDal pro = new ProductoDal();
            //SET
            int id = Integer.parseInt(request.getParameter("txt_id_producto"));
            p.setIdProducto(Integer.parseInt(request.getParameter("txt_id_producto")));
            p.setNombreProducto(request.getParameter("txt_nombre_producto"));
            p.getTipoProducto().setIdTipoProducto(Integer.parseInt(request.getParameter("ddl_lista_tipo_producto")));
            p.getMarca().setIdMarca(Integer.parseInt(request.getParameter("ddl_marca_producto")));
            p.setPrecioUnitario(Integer.parseInt(request.getParameter("txt_precio")));
            p.setStock(Integer.parseInt(request.getParameter("txt_stock")));
            p.setEstado(Integer.parseInt(request.getParameter("rbtn_estado")));
            p.setDescripcion(request.getParameter("txt_descripcion"));
            
            if(request.getParameter("btn_guardar") != null)
            {
                if(pro.updateProducto(p) == 1)
                {
                    out.print("Wena update");
                    //request.getRequestDispatcher("")
                }
                else
                {
                     out.print(pro.updateProducto(p));
                }
            }
            if(request.getParameter("btn_eliminar") != null)
            {
                if(pro.deleteProducto(p) == 1)
                {
                    out.print("Wena delete");
                }
                else
                {
                     out.print(pro.deleteProducto(p));
                }
            }
        }
        catch(Exception e)
        {
            out.print(e.getMessage());
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
