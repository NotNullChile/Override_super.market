
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Carrito 
{
    private int idCarrito;
    private int recibo;
    private Producto producto;
    
    public Carrito() 
    {
        idCarrito = 0;
        recibo = 0;
        producto = new Producto();
    }

    public Carrito(int idCarrito, int recibo) {
        this.idCarrito = idCarrito;
        this.recibo = recibo;
        producto = new Producto();
    }

    public int getIdCarrito() {
        return idCarrito;
    }

    public void setIdCarrito(int idCarrito) {
        this.idCarrito = idCarrito;
    }

    public int getRecibo() {
        return recibo;
    }

    public void setRecibo(int recibo) {
        this.recibo = recibo;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

   
    
    
}
