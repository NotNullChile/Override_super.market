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
    public ArrayList<model.business.MetodosDePagos> listMetodosDePagos()
    {
        try 
        {
            ArrayList<model.business.MetodosDePagos> listMetodos = new ArrayList<>();
            String sql = "SELECT * FROM metodosDePago;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next())
            {
                model.business.MetodosDePagos mp = new model.business.MetodosDePagos();
                mp.setIdMetodosDePago(rs.getInt(1));
                mp.setDescripcion(rs.getString(2));
                listMetodos.add(mp);
            }
            return listMetodos;
        }
        catch (SQLException e)
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
