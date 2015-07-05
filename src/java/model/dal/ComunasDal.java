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
import java.sql.Statement;
import java.util.ArrayList;
import model.business.Comunas;

/**
 *
 * @author crojo
 */
public class ComunasDal 
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
    public ArrayList<Comunas> listaComuna()
    {       
        try 
        {
            conexion();
            ArrayList <Comunas> listaComunas = new ArrayList<>();
            conexion();
            String sql = "select * from comunas order by 2";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                Comunas c = new Comunas();
                c.setIdComuna(rs.getInt(1));
                c.setNombreComuna(rs.getString(2));
                listaComunas.add(c);
            }
            return listaComunas;
        } 
        catch (Exception e) 
        {
            return null;
        }      
    }
}
