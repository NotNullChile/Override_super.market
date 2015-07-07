/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

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
          String sql = "INSERT INTO carrito VALUES(" + c.getIdCarrito() + "," + c.getRecibo() + ");";
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
}
