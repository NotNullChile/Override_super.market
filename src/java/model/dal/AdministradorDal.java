
package model.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import model.business.Administrador;
import model.business.Clientes;

/**
 *
 * @author RicardoCarrasco
 */
public class AdministradorDal 
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
    
    public model.business.Administrador searchAdmin(model.business.Administrador ad)
    {
        try 
        {
            conexion();
            String sql = "SELECT a.nombre, a.apellido FROM administrador a "
                    + "INNER JOIN login l ON a.username = l.username "
                    + "WHERE l.username = '" + ad.getLogin().getUsername() + "' AND l.contraseña = '" + ad.getLogin().getPassword()+ "';";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.first()) 
            {
                model.business.Administrador a = new model.business.Administrador();
                a.setNombre(rs.getString(1));
                a.setApellido(rs.getString(2));
                return a;
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
}
