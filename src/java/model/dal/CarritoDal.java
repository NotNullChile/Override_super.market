/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.business.Carrito;

/**
 *
 * @author RicardoCarrasco
 */
public class CarritoDal
{
    private Connection conn;
    private Statement state;
    
    public void conexion()
    {
        try 
        {
          Class.forName("com.mysql.jdbc.Driver").newInstance();
          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarketNotNull","root","root");
          state = conn.createStatement();
        } 
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    public int insertCarrito(model.business.Carrito c)            
    {
        try 
        {
          conexion();
          String sql = "INSERT INTO carrito VALUES(null,'" + c.getOrden()+ "');";
          return state.executeUpdate(sql);          
        } 
        catch (SQLException e) 
        {
            e.getErrorCode();
        }
        finally
        {
            try 
            {
             conn.close();
            } catch (Exception e)
            {
                return -1;
            }     
        }
        return 0;    
    }
    
    public model.business.Carrito buscarProductoXIdProducto (int idCarrito)
    {
        try
        {
            conexion();
            String sql = "SELECT orden FROM carrito WHERE idCarrito = " + idCarrito + ";";      
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.first())
            {
                model.business.Carrito c = new model.business.Carrito();
                c.setOrden(rs.getString(1));
                return c;
            }
            return null;
        } 
        catch (Exception e) 
        {
            return null;
        }
         finally
        {
            try 
            {
               conn.close();
            }
            catch (Exception e) 
            {
            }
        }     
    }
    
    public int countCarrito()
    {
        try
        {
            conexion();
            String sql = "SELECT count(idCarrito)+1 FROM carrito;";      
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {              
                return rs.getInt(1);
            }
            
            return 0;
        } 
        catch (Exception e) 
        {
            return 0;
        }
         finally
        {
            try 
            {
               conn.close();
            }
            catch (Exception e) 
            {
            }
        } 
    }
}
