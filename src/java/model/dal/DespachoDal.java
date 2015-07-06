
package model.dal;

import java.sql.Connection;
import java.sql.DriverManager;
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
            String sql = "INSERT INTO ";
            return 0;
        }
        catch (Exception e)
        {
        }
        return 0;
    }
}
