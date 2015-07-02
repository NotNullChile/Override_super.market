
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Producto 
{
    private int idProducto;
    private String nombreProducto;
    private int precioUnitario;
    private int stock;
    private String descripcion;
    private int idTipoProducto;
    private int idMarca;

    public Producto() 
    {
        idProducto = 0;
        nombreProducto = new String();
        precioUnitario = 0;
        stock = 0;
        descripcion = new String();
        idTipoProducto = 0;
        idMarca = 0;
    }

    public Producto(int idProducto, String nombreProducto, int precioUnitario, int stock, String descripcion, int idTipoProducto, int idMarca) {
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.precioUnitario = precioUnitario;
        this.stock = stock;
        this.descripcion = descripcion;
        this.idTipoProducto = idTipoProducto;
        this.idMarca = idMarca;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(int precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdTipoProducto() {
        return idTipoProducto;
    }

    public void setIdTipoProducto(int idTipoProducto) {
        this.idTipoProducto = idTipoProducto;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }
    
    
    
}
