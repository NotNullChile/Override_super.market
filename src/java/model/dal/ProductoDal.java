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
public class ProductoDal
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
    public int insertProduct(model.business.Producto p)
    {
        try 
        {
            conexion();
            String sql = "INSERT INTO productos VALUES(" + p.getIdProducto() + ",'" + p.getNombreProducto() + "'," + p.getPrecioUnitario() + "," + p.getStock() + ",'" + p.getDescripcion() + "'," + p.getTipoProducto().getIdTipoProducto()+ "," + p.getMarca().getIdMarca()+ ",'" + p.getUrlFoto() + "');";
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
    
    public int maxProduct()
    {
        try
        {
              conexion();
              String sql = "SELECT max(idProducto)+1 FROM productos;";
              PreparedStatement ps = conn.prepareStatement(sql);
              ResultSet rs = ps.executeQuery();
              while(rs.next())
              { 
                 return rs.getInt(1);
              }           
         }
        catch(SQLException e)
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
      return 0;
    }
    
    public ArrayList<model.business.Producto> listaProductoXTipoProducto(String tipoProducto)
    {
        try 
        {
            conexion();
            ArrayList<model.business.Producto> listProduct = new ArrayList<>();
            String sql = 
                    "SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock,"
                  + "p.descripcion, t.descripcion, m.descripcion , p.urlFoto"
                  + "FROM productos p INNER JOIN tipoproductos t"
                  + "ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m"
                  + "ON p.idMarca = m.idMarca"
                  + "WHERE t.descripcion = '" + tipoProducto + "';";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) 
            {
                model.business.Producto p = new model.business.Producto();
                p.setIdProducto(rs.getInt(1));
                p.setNombreProducto(rs.getString(2));
                p.setPrecioUnitario(rs.getInt(3));
                p.setStock(rs.getInt(4));
                p.setDescripcion(rs.getString(5));
                p.getTipoProducto().setDescripcion(rs.getString(6));
                p.getMarca().setDescripcion(rs.getString(7));
                p.setUrlFoto(rs.getString(8));
                listProduct.add(p);
            }
            return listProduct;
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
    
    public ArrayList<model.business.Producto> listaProductoXValores(String tipoProducto,int valor1, int valor2)
    {
        try 
        {
            conexion();
            ArrayList<model.business.Producto> listProduct = new ArrayList<>();
            String sql = 
                    "SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock,"
                  + "p.descripcion, t.descripcion, m.descripcion , p.urlFoto"
                  + "FROM productos p INNER JOIN tipoproductos t"
                  + "ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m"
                  + "ON p.idMarca = m.idMarca"
                  + "WHERE t.descripcion = '" + tipoProducto + "'"
                  + "AND p.precioUnitario between " + valor1 + " AND " + valor2 + ";";            
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) 
            {
                model.business.Producto p = new model.business.Producto();
                p.setIdProducto(rs.getInt(1));
                p.setNombreProducto(rs.getString(2));
                p.setPrecioUnitario(rs.getInt(3));
                p.setStock(rs.getInt(4));
                p.setDescripcion(rs.getString(5));
                p.getTipoProducto().setDescripcion(rs.getString(6));
                p.getMarca().setDescripcion(rs.getString(7));
                p.setUrlFoto(rs.getString(8));
                listProduct.add(p);
            }
            return listProduct;
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
    
    public ArrayList<model.business.Producto> listaProductoMenorAMayor(String tipoProducto)
    {
        try 
        {
            conexion();
            ArrayList<model.business.Producto> listProduct = new ArrayList<>();
            String sql = 
                    "SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock,"
                  + "p.descripcion, t.descripcion, m.descripcion , p.urlFoto"
                  + "FROM productos p INNER JOIN tipoproductos t"
                  + "ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m"
                  + "ON p.idMarca = m.idMarca"
                  + "WHERE t.descripcion = '" + tipoProducto + "'"
                  + "ORDER by 3;";            
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) 
            {
                model.business.Producto p = new model.business.Producto();
                p.setIdProducto(rs.getInt(1));
                p.setNombreProducto(rs.getString(2));
                p.setPrecioUnitario(rs.getInt(3));
                p.setStock(rs.getInt(4));
                p.setDescripcion(rs.getString(5));
                p.getTipoProducto().setDescripcion(rs.getString(6));
                p.getMarca().setDescripcion(rs.getString(7));
                p.setUrlFoto(rs.getString(8));
                listProduct.add(p);
            }
            return listProduct;
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
    
    public ArrayList<model.business.Producto> listaProductoMayorAMenor(String tipoProducto)
    {
        try 
        {
            conexion();
            ArrayList<model.business.Producto> listProduct = new ArrayList<>();
            String sql = 
                    "SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock,"
                  + "p.descripcion, t.descripcion, m.descripcion , p.urlFoto"
                  + "FROM productos p INNER JOIN tipoproductos t"
                  + "ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m"
                  + "ON p.idMarca = m.idMarca"
                  + "WHERE t.descripcion = '" + tipoProducto + "'"
                  + "ORDER by 3 DESC;";            
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) 
            {
                model.business.Producto p = new model.business.Producto();
                p.setIdProducto(rs.getInt(1));
                p.setNombreProducto(rs.getString(2));
                p.setPrecioUnitario(rs.getInt(3));
                p.setStock(rs.getInt(4));
                p.setDescripcion(rs.getString(5));
                p.getTipoProducto().setDescripcion(rs.getString(6));
                p.getMarca().setDescripcion(rs.getString(7));
                p.setUrlFoto(rs.getString(8));
                listProduct.add(p);
            }
            return listProduct;
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
    
    public ArrayList<model.business.Producto> listaProductoXOrdenAlfabetico(String tipoProducto)
    {
        try 
        {
            conexion();
            ArrayList<model.business.Producto> listProduct = new ArrayList<>();
            String sql = 
                    "SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock,"
                  + "p.descripcion, t.descripcion, m.descripcion , p.urlFoto"
                  + "FROM productos p INNER JOIN tipoproductos t"
                  + "ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m"
                  + "ON p.idMarca = m.idMarca"
                  + "WHERE t.descripcion = '" + tipoProducto + "'"
                  + "ORDER by 2;";            
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) 
            {
                model.business.Producto p = new model.business.Producto();
                p.setIdProducto(rs.getInt(1));
                p.setNombreProducto(rs.getString(2));
                p.setPrecioUnitario(rs.getInt(3));
                p.setStock(rs.getInt(4));
                p.setDescripcion(rs.getString(5));
                p.getTipoProducto().setDescripcion(rs.getString(6));
                p.getMarca().setDescripcion(rs.getString(7));
                p.setUrlFoto(rs.getString(8));
                listProduct.add(p);
            }
            return listProduct;
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
