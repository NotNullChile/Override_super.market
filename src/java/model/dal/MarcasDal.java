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
import model.business.Marcas;


/**
 *
 * @author RicardoCarrasco
 */
public class MarcasDal 
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
    public ArrayList<Marcas> listMarcas()
    {
        try 
        {
            ArrayList <Marcas> listaMarcas = new ArrayList<>();
            conexion();
            String sql = "SELECT * FROM marcas";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                Marcas m = new Marcas();
                m.setIdMarca(rs.getInt(1));
                m.setDescripcion(rs.getString(2));
                listaMarcas.add(m);
            }
            return listaMarcas;
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
