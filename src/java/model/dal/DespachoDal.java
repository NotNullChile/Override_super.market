
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
public class DespachoDal 
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
    
    public int insertDespacho(model.business.Despacho d)
    {
        try 
        {
            conexion();
            String sql = "INSERT INTO clientes VALUES(" + d.getIdDespacho() + ",'" + d.getDireccion() + "','" + d.getNombrePersonaAEntregar() + "'," + d.getComuna().getIdComuna() + ");";
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
    
    public int countDespacho()
    {
        try
        {
            conexion();
            String sql = "SELECT count(idDespacho)+1 FROM despacho;";      
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
