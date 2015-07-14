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
public class LoginDal
{
    //Conexion conn = new Conexion();
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
    
    
    public int insertLogin(model.business.Clientes c)
    {
        try 
        {
            //Se conecta al BD
            conexion();
            // Insert Login
            String sql = "INSERT INTO login VALUES('" + c.getLogin().getUsername()+ "','" + c.getLogin().getPassword() + "'," + c.getLogin().getRol() + ");";   
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
    public int insertLogin(model.business.Administrador a)
    {
        try 
        {
            //Se conecta al BD
            conexion();
            // Insert Login
            String sql = "INSERT INTO login VALUES('" + a.getLogin().getUsername()+ "','" + a.getLogin().getPassword() + "'," + a.getLogin().getRol() + ");";   
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
