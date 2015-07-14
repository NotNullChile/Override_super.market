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

/**
 *
 * @author Ricardo
 */
public class CreateAdmin extends HttpServlet {

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
           //Iniciacion de clases
            
            model.business.Administrador admin    = new model.business.Administrador();
            model.dal.AdministradorDal adminDal   = new model.dal.AdministradorDal();
            model.dal.LoginDal loginDal         = new model.dal.LoginDal();
            
            if(admin.validarRut(request.getParameter("txt_nuevo_rut")))
            {

                //Set Class
                admin.setRut(Integer.parseInt(request.getParameter("txt_nuevo_rut")));
                admin.setNombre(request.getParameter("txt_nuevo_nombre"));
                admin.setApellido(request.getParameter("txt_nuevo_apellido"));
                admin.setEmail(request.getParameter("txt_nuevo_email"));
                admin.setTelefono(Integer.parseInt(request.getParameter("txt_nuevo_telefono")));
                admin.getLogin().setUsername(Integer.parseInt(request.getParameter("txt_nuevo_rut")));
                String password1 = request.getParameter("txt_nuevo_password_1");
                String password2 = request.getParameter("txt_nuevo_password_2");
                String passwordDefinitiva = null;
                if (password1.equals(password2)) 
                {
                    passwordDefinitiva = password1;
                }
                admin.getLogin().setPassword(passwordDefinitiva);          
                admin.getLogin().setRol(0);

                //Nos retornará un numero la consulta
                int resultado = loginDal.insertLogin(admin);

                if (passwordDefinitiva != null) 
                {
                    switch(resultado)
                    {
                        //Si retorna 1 todo Ok
                        case 1 : 
                            adminDal.insertAdmin(admin);
                            out.print("Registro Ok :)");
                            //request.getRequestDispatcher("paginaARedirigir.jsp").forward(request, response);
                            break;
                        //Si retorna 1062 Admin ya registrado
                        case 1062:
                            //Pagina a redirigir Admin ya registrado
                            //request.getRequestDispatcher("pagina.jsp").forward(request, response);
                            break;
                        //Error desconocido
                        default: 
                            out.print("Contáctese con el administrador de la pagina");
                            //Pagina a redirigir errorDesconocido
                            //request.getRequestDispatcher("pagina.jsp").forward(request, response);
                            break;
                    }

                }
                else
                {
                    //request.getRequestDispatcher("error_signup_differentpasswords.jsp").forward(request, response);
                }
        }
        else
        {
               out.print("Rut no valido"); 
        }
        }
        catch(NumberFormatException e)
        {
            out.print("Revise sus Valores numericos");
        }
        catch(NullPointerException ex)
        {
            out.print("No deje nada vacio");
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