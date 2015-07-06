
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Carrito 
{
    private int idCarrito;
    private Producto producto;
    private int rut;

    public Carrito() 
    {
        idCarrito = 0;
        this.producto = new Producto();
        rut = 0;
    }

    public Carrito(int idCarrito, int rut) {
        this.idCarrito = idCarrito;
        this.producto = new Producto();
        this.rut = rut;
    }

    public int getIdCarrito() {
        return idCarrito;
    }

    public void setIdCarrito(int idCarrito) {
        this.idCarrito = idCarrito;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getRut() {
        return rut;
    }

    public void setRut(int rut) {
        this.rut = rut;
    }
    
    
}
