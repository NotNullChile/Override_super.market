
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
    private TipoProductos tipoProducto;
    private Marcas marca;
    private String urlFoto;
    public Producto() 
    {
        idProducto = 0;
        nombreProducto = new String();
        precioUnitario = 0;
        stock = 0;
        descripcion = new String();
        tipoProducto = new TipoProductos();
        marca = new Marcas();
        urlFoto = new String();
    }

    public Producto(int idProducto, String nombreProducto, int precioUnitario, 
            int stock, String descripcion,String urlFoto) 
    {
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.precioUnitario = precioUnitario;
        this.stock = stock;
        this.descripcion = descripcion;
        this.tipoProducto = new TipoProductos();
        this.marca = new Marcas();
        this.urlFoto = urlFoto;
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

    public TipoProductos getTipoProducto() {
        return tipoProducto;
    }

    public void setTipoProducto(TipoProductos tipoProducto) {
        this.tipoProducto = tipoProducto;
    }

    public Marcas getMarca() {
        return marca;
    }

    public void setMarca(Marcas marca) {
        this.marca = marca;
    }

    public String getUrlFoto() {
        return urlFoto;
    }

    public void setUrlFoto(String urlFoto) {
        this.urlFoto = urlFoto;
    }
    
    
    
}
