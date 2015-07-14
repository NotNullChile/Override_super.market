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

/**
 *
 * @author Ricardo
 */
public class ProcesarLogin extends HttpServlet {

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
           //Intancia de clases
            model.dal.ClientesDal clientesDal = new model.dal.ClientesDal();
            model.dal.AdministradorDal adminDal = new model.dal.AdministradorDal();
            model.business.Administrador admin = new model.business.Administrador();
            model.business.Clientes cliente = new model.business.Clientes();
            //Get
            String user = request.getParameter("txt_rut");
            String password = request.getParameter("txt_password");
            //SET Admin
            admin.getLogin().setUsername(Integer.parseInt(user));
            admin.getLogin().setPassword(password);  
            //SET Cliente
            cliente.getLogin().setUsername(Integer.parseInt(user));
            cliente.getLogin().setPassword(password);
            
            //Consulta si existe el cliente
            if (clientesDal.searchCliente(cliente) != null) 
            {
                cliente = clientesDal.searchCliente(cliente);
                if(cliente.getNombre() != null)
                {
                 out.print("Si existe este cliente");
                //Pagina 
                    request.getSession().setAttribute("cliente", cliente);
                    request.getSession().setAttribute("carrito", new ArrayList());
                    request.getRequestDispatcher("redirect_index_sesion_iniciada.jsp").forward(request, response); 
                }
            }
            if(adminDal.searchAdmin(admin)!= null)
            {
                admin = adminDal.searchAdmin(admin);
                if (admin.getNombre() != null) 
                {
                    out.print("Si existe este Admin");
                //Pagina 
                    HttpSession sesionAdmin = request.getSession();
                    sesionAdmin.setAttribute("admin", admin);
                    request.getRequestDispatcher("redirect_index_intranet_sesion_iniciada.jsp").forward(request, response);
                }
            }
            else
            {               
                //Error login 
                request.getRequestDispatcher("error_login.jsp").forward(request, response);
            }   
        }
        catch(Exception e)
        {
            //Error login
            request.getRequestDispatcher("error_login.jsp").forward(request, response);
            //out.print("Error: " + e.getMessage());
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
