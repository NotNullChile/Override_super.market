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
import model.business.Clientes;

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
            String sql = "INSERT INTO clientes VALUES(" + c.getRut() + ",'" + c.getNombre() + "','" + c.getApellido() + "','" + c.getEmail() + "'," + c.getTelefono() + "," + c.getLogin().getUsername() + ");";
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
    public model.business.Clientes searchCliente(model.business.Clientes cli)
    {
        try 
        {
            conexion();
            String sql = "SELECT c.nombre, c.apellido FROM clientes c "
                    + "INNER JOIN login l ON c.username = l.username "
                    + "WHERE l.username = '" + cli.getLogin().getUsername() + "' AND l.contraseña = '" + cli.getLogin().getPassword()+ "';";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.first()) 
            {
                model.business.Clientes c = new Clientes();
                c.setNombre(rs.getString(1));
                c.setApellido(rs.getString(2));
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
    public int searchRolUser(String user,String pass)
    {
        try 
        {
            conexion();
            String sql = "SELECT l.rol FROM clientes c INNER JOIN login l ON c.username = l.username WHERE l.username = '" + user + "' AND l.contraseña = '" + pass + "';";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.first()) 
            {
                return rs.getInt(1);
            }         
        } 
        catch (SQLException e) 
        {
            return e.getErrorCode();
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
        return -1;
    }
}
