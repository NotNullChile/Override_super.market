/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import com.oreilly.servlet.MultipartRequest;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dal.ProductoDal;
import java.util.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.*;
import java.io.*;
import java.nio.file.Paths;

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
        MultipartRequest mr = new MultipartRequest(request,"C:/Users/Randy/Documents/NetBeansProjects/Override/web/imagesProducts/"); 
        try  
        {   
            //Clases
            model.business.Producto p = new model.business.Producto();
            model.dal.ProductoDal productoDal = new ProductoDal();
            
            //Se usa este Request cuando se tiene  enctype="multipart/form-data" (Importar JAR)
              
               /*FileItemFactory es una interfaz para crear FileItem*/
        FileItemFactory file_factory = new DiskFileItemFactory();
 
        /*ServletFileUpload esta clase convierte los input file a FileItem*/
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
        /*sacando los FileItem del ServletFileUpload en una lista */
        List items = servlet_up.parseRequest(request);
       
        
        for(int i=0;i<items.size();i++){
            /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
            FileItem item = (FileItem) items.get(i);
            /*item.isFormField() false=input file; true=text field*/
            if (!item.isFormField()){
                /*cual sera la ruta al archivo en el servidor*/   
                
                File archivo_server = new File("C:/Users/Randy/Documents/NetBeansProjects/Override/web/imagesProducts/"+item.getName());
                /*y lo escribimos en el servido*/
                item.write(archivo_server); 
            }
        }
         
              
            //Set
             p.setIdProducto(Integer.parseInt(mr.getParameter("txt_id_producto")));
             p.setNombreProducto(mr.getParameter("txt_nombre_producto"));
             p.setPrecioUnitario(Integer.parseInt(mr.getParameter("txt_precio")));
             p.setStock(Integer.parseInt(mr.getParameter("txt_stock")));
             p.setDescripcion(mr.getParameter("txt_descripcion"));
             p.getTipoProducto().setIdTipoProducto(Integer.parseInt(mr.getParameter("ddl_lista_tipo_producto")));
             p.getMarca().setIdMarca(Integer.parseInt(mr.getParameter("ddl_marca_producto")));
             //Recoge el NOMBRE del file
             p.setUrlFoto(mr.getFilesystemName("file"));
             p.setEstado(Integer.parseInt(mr.getParameter("rbtn_estado")));
             
             //Registro BD
             int resultado = productoDal.insertProduct(p);
             switch(resultado)
             {
                 case 1 :
                     //out.print("Registro OK");
                     //Pagina Redirrecion
                     request.getRequestDispatcher("redirect_index_intranet_producto_creado.jsp").forward(request, response);
                     break;
                 case 1062:
                     //out.print("Producto Existente");
                     //Pagina Redirrecion
                     request.getRequestDispatcher("redirect_index_intranet_error_producto_existente.jsp").forward(request, response);
                     break;
                 default:
                     //Error genérico
                        request.getRequestDispatcher("redirect_index_intranet_error.jsp").forward(request, response);
                     //out.print("Error : "+ productoDal.insertProduct(p));
                     //Pagina Redirrecion
                     //request.getRequestDispatcher("pagina.jsp").forward(request, response);
                     break;
             }
 
        }
        catch(Exception e)
        {
            //Error genérico
            //request.getRequestDispatcher("redirect_index_intranet_error.jsp").forward(request, response);
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
