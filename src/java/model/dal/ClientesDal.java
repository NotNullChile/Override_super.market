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
public class ClientesDal 
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
    
    public int insertClient(model.business.Clientes c)
    {
        try 
        {
            //Se conecta al BD
            conexion();
            // Insert Cliente
            String sql = "INSERT INTO clientes VALUES(" + c.getRut() + ",'" + c.getNombre() + "','" + c.getApellido() + "','" + c.getEmail() + "'," + c.getTelefono() + ",'" + c.getLogin().getUsername() + "');";
            return state.executeUpdate(sql);
        } 
        catch (SQLException e) 
        {
            return e.getErrorCode();
        }
        finally
        {
            try 
            {
                //Al terminar el proceso se desconecta de la BD
               conn.close(); 
            }
            catch (Exception ex) 
            {
                
            }
        }
        
    }
}
