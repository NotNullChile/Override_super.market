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
import java.util.ArrayList;
import model.business.MetodosDePagos;

/**
 *
 * @author RicardoCarrasco
 */
public class MetodosDePagosDal
{
    private Connection conn;
    private Statement state;
    
    private void conexion()
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
    public ArrayList<MetodosDePagos> listMetodosDePagos()
    {
        try 
        {
            conexion();
            ArrayList <MetodosDePagos> listaMetodosPago = new ArrayList<>();
            conexion();
            String sql = "SELECT * FROM metodosDePago ORDER by 1";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                MetodosDePagos m = new MetodosDePagos();
                m.setIdMetodosDePago(rs.getInt(1));
                m.setDescripcion(rs.getString(2));
                listaMetodosPago.add(m);
            }
            return listaMetodosPago;
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
}
