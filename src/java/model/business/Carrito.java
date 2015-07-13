
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Carrito 
{
    private int idCarrito;
    private String orden;
    private Producto producto;
    
    public Carrito() 
    {
        idCarrito = 0;
        orden = new String();
        producto = new Producto();
    }

    public Carrito(int idCarrito) {
        this.idCarrito = idCarrito;
        this.orden = new String();
        producto = new Producto();
    }

    public int getIdCarrito() {
        return idCarrito;
    }

    public void setIdCarrito(int idCarrito) {
        this.idCarrito = idCarrito;
    }

    public String getOrden() {
        return orden;
    }

    public void setOrden(String orden) {
        this.orden = orden;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    @Override
    public String toString() {
        return "Carrito{" + "idCarrito=" + idCarrito + ", orden=" + orden + ", producto=" + producto + '}';
    }

   
    
    
}
