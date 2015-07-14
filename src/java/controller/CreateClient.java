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
public class CreateClient extends HttpServlet {

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
            
            model.business.Clientes clientes    = new model.business.Clientes();
            model.dal.ClientesDal clientesDal   = new model.dal.ClientesDal();
            model.dal.LoginDal loginDal         = new model.dal.LoginDal();
            
            if(clientes.validarRut(request.getParameter("txt_nuevo_rut")))
            {

                //Set Class
                clientes.setRut(Integer.parseInt(request.getParameter("txt_nuevo_rut")));
                clientes.setNombre(request.getParameter("txt_nuevo_nombre"));
                clientes.setApellido(request.getParameter("txt_nuevo_apellido"));
                clientes.setEmail(request.getParameter("txt_nuevo_email"));
                clientes.setTelefono(Integer.parseInt(request.getParameter("txt_nuevo_telefono")));
                clientes.getLogin().setUsername(Integer.parseInt(request.getParameter("txt_nuevo_rut")));
                String password1 = request.getParameter("txt_nuevo_password_1");
                String password2 = request.getParameter("txt_nuevo_password_2");
                String passwordDefinitiva = null;
                if (password1.equals(password2)) 
                {
                    passwordDefinitiva = password1;
                }
                clientes.getLogin().setPassword(passwordDefinitiva);          
                clientes.getLogin().setRol(1);

                //Nos retornará un numero la consulta
                int resultado = loginDal.insertLogin(clientes);

                if (passwordDefinitiva != null) 
                {
                    switch(resultado)
                    {
                        //Si retorna 1 todo Ok
                        case 1 : 
                            clientesDal.insertClient(clientes);
                            request.getRequestDispatcher("redirect_index_cliente_creado.jsp").forward(request, response);
                            break;
                        //Si retorna 1062 Cliente ya registrado
                        case 1062:
                            //Pagina a redirigir Cliente ya registrado
                            request.getRequestDispatcher("error_signup_userexists.jsp").forward(request, response);
                            break;
                        //Error desconocido
                        default: 
                            //out.print("Contáctese con el administrador de la pagina");
                            //Pagina a redirigir errorDesconocido
                            request.getRequestDispatcher("redirect_index_error.jsp").forward(request, response);
                            break;
                    }

                }
                else
                {
                    request.getRequestDispatcher("error_signup_differentpasswords.jsp").forward(request, response);
                }
        }
        else
        {
               request.getRequestDispatcher("error_signup_rut_no_valido.jsp").forward(request, response);
        }
      }
        catch(NumberFormatException e)
        {
            //Error genérico
            request.getRequestDispatcher("redirect_index_error.jsp").forward(request, response);
            //out.print("Revise sus Valores numericos");
        }
        catch(NullPointerException ex)
        {
            //Error Genérico
            //out.print("No deje nada vacio");
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
