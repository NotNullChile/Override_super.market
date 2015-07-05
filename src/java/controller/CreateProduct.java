/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dal.ProductoDal;

/**
 *
 * @author Ricardo
 */
public class CreateProduct extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try  
        {
           //Clases
            model.business.Producto p = new model.business.Producto();
            model.dal.ProductoDal productoDal = new ProductoDal();
            
            //Set
             p.setIdProducto(Integer.parseInt(request.getParameter("txt_id_producto")));
             p.setNombreProducto(request.getParameter("txt_nombre_producto"));
             p.setPrecioUnitario(Integer.parseInt(request.getParameter("txt_precio")));
             p.setStock(Integer.parseInt(request.getParameter("txt_stock")));
             p.setDescripcion(request.getParameter("txt_descripcion"));
             p.getTipoProducto().setIdTipoProducto(Integer.parseInt(request.getParameter("ddl_lista_tipo_producto")));
             p.getMarca().setIdMarca(Integer.parseInt(request.getParameter("ddl_marca_producto")));
             p.setUrlFoto(request.getParameter("txt_foto"));
             
             //Registro BD
             int resultado = productoDal.insertProduct(p);
             switch(resultado)
             {
                 case 1 :
                     out.print("Registro OK");
                     //Pagina Redirrecion
                     //request.getRequestDispatcher("pagina.jsp").forward(request, response);
                     break;
                 case 1062:
                     out.print("Producto Existente");
                     //Pagina Redirrecion
                     //request.getRequestDispatcher("pagina.jsp").forward(request, response);
                     break;
                 default: 
                     out.print("Error : "+ productoDal.insertProduct(p));
                     //Pagina Redirrecion
                     //request.getRequestDispatcher("pagina.jsp").forward(request, response);
                     break;
             }
         
        }
        catch(Exception e)
        {
            out.print("error : " + e.getMessage());
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
