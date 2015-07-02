
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Carrito 
{
    private int idCarrito;
    private int idProducto;
    private int rut;

    public Carrito() 
    {
        idCarrito = 0;
        idProducto = 0;
        rut = 0;
    }

    public Carrito(int idCarrito, int idProducto, int rut) {
        this.idCarrito = idCarrito;
        this.idProducto = idProducto;
        this.rut = rut;
    }

    public int getIdCarrito() {
        return idCarrito;
    }

    public void setIdCarrito(int idCarrito) {
        this.idCarrito = idCarrito;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getRut() {
        return rut;
    }

    public void setRut(int rut) {
        this.rut = rut;
    }
    
    
}
