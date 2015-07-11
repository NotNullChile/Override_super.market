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

/**
 *
 * @author RicardoCarrasco
 */
public class VentaDal
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
    
    public int insertVenta(model.business.Venta v)
    {
        try 
        {
            conexion();
            String sql = "INSERT INTO venta VALUES(null," + v.getSubTotal() + "," + v.getIva() + "," + v.getTotal() + "," + v.getMetodosDePago().getIdMetodosDePago() + "," + v.getCliente().getRut() + ",'" + v.getFecha() + "'," + v.getCarrito().getIdCarrito() + "," + v.getDespacho().getIdDespacho() + ");";
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
                conn.close();
            } 
            catch (Exception e)
            {
            }
        }
    }
    public int maxVenta()
    {
        try
        {
            conexion();
            String sql = "SELECT max(idVenta) FROM venta;";      
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
