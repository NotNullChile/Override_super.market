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

/**
 *
 * @author Ricardo
 */
@WebServlet(name = "CreateDespacho", urlPatterns = {"/create_despacho.do"})
public class CreateDespacho extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
            //Class            
            model.business.Despacho despacho = new model.business.Despacho();
            model.dal.DespachoDal despachoDal = new model.dal.DespachoDal();
            
            //Set
            despacho.setIdDespacho(despachoDal.countDespacho());
            despacho.setDireccion(request.getParameter("txt_despacho") + " " + request.getParameter("txt_numeroCasa"));
            despacho.setNombrePersonaAEntregar(request.getParameter("txt_persona_a_entregar"));
            despacho.getComuna().setIdComuna((Integer.parseInt(request.getParameter("txt_comuna"))));
            despacho.getComuna().setNombreComuna((request.getParameter("dll_comunas")));
            //Create Session
            request.getSession().setAttribute("despacho", despacho);
            
            //Pagina Siguiente
            request.getRequestDispatcher("metodo_pago.jsp").forward(request, response);
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
