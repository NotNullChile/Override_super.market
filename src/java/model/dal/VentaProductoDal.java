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
import model.business.Producto;

/**
 *
 * @author Ricardo
 */
public class VentaProductoDal 
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
    
    public int insertVentaProducto(int idVenta, int idProducto)
    {
        try 
        {
            conexion();
            String sql = "INSERT INTO venta_producto VALUES (" + idVenta + "," + idProducto + ");";
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
               conn.createStatement();
            } 
            catch (Exception e)
            {
            }
        }
    }
    public ArrayList<model.business.VentaProducto> listaOrdenes(model.business.Clientes c)
    {
        try 
        {
            ArrayList<model.business.VentaProducto> listVentaP = new ArrayList<>();
            conexion();
            String sql = "SELECT v.fecha, c.orden "
                    + "FROM venta_producto vp INNER JOIN productos p "
                    + "ON vp.idProducto = p.idProducto INNER JOIN venta v "
                    + "ON vp.idVenta = v.idVenta INNER JOIN carrito c "
                    + "ON v.idCarrito = c.idCarrito INNER JOIN clientes cli "
                    + "ON cli.rut = v.rut "
                    + "WHERE cli.rut = " + c.getRut() + " GROUP BY 2 ORDER BY 2;";        
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                model.business.VentaProducto vp = new model.business.VentaProducto();
                vp.getVenta().setFecha(rs.getString(1));
                vp.getCarrito().setOrden(rs.getString(2));
                listVentaP.add(vp);
            }
            return listVentaP;
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
    
    public ArrayList<model.business.VentaProducto> listaProductosXOrdenes(model.business.Clientes c,String orden)
    {
        try 
        {
            ArrayList<model.business.VentaProducto> listVentaP = new ArrayList<>();
            conexion();
            String sql = "SELECT p.UrlFoto, p.nombreProducto, v.subTotal, v.iva, v.total "
                    + "FROM venta_producto vp INNER JOIN productos p "
                    + "ON vp.idProducto = p.idProducto INNER JOIN venta v "
                    + "ON vp.idVenta = v.idVenta INNER JOIN carrito c "
                    + "ON v.idCarrito = c.idCarrito INNER JOIN clientes cli "
                    + "ON cli.rut = v.rut "
                    + "WHERE cli.rut = " + c.getRut() + " AND c.orden = '" + orden + "';";        
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                model.business.VentaProducto vp = new model.business.VentaProducto();
                vp.getProducto().setUrlFoto(rs.getString(1));
                vp.getProducto().setNombreProducto(rs.getString(2));
                vp.getVenta().setSubTotal(rs.getInt(3));
                vp.getVenta().setIva(rs.getInt(4));
                vp.getVenta().setTotal(rs.getInt(5));
                listVentaP.add(vp);
            }
            return listVentaP;
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
