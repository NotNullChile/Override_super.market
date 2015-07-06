
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Venta 
{
    private int idVenta;
    private int subTotal;
    private int iva;
    private int Total;
    private MetodosDePagos metodosDePago;
    private int numeroTarjeta;
    private Clientes cliente;
    private Carrito carrito;
    private Despacho despacho;

    public Venta() 
    {
        this.idVenta = 0;
        this.subTotal = 0;
        this.iva = 0;
        this.Total = 0;
        this.metodosDePago = new MetodosDePagos();
        this.numeroTarjeta = 0;
        this.cliente = new Clientes();
        this.carrito = new Carrito();
        this.despacho = new Despacho();
    }

    
    public Venta(int idVenta, int subTotal, int iva, int Total,  int numeroTarjeta) {
        this.idVenta = idVenta;
        this.subTotal = subTotal;
        this.iva = iva;
        this.Total = Total;
        this.numeroTarjeta = numeroTarjeta;
        this.cliente = new Clientes();
        this.carrito = new Carrito();
        this.despacho = new Despacho();
        this.metodosDePago = new MetodosDePagos();

    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(int subTotal) {
        this.subTotal = subTotal;
    }

    public int getIva() {
        return iva;
    }

    public void setIva(int iva) {
        this.iva = iva;
    }

    public int getTotal() {
        return Total;
    }

    public void setTotal(int Total) {
        this.Total = Total;
    }

    public MetodosDePagos getMetodosDePago() {
        return metodosDePago;
    }

    public void setMetodosDePago(MetodosDePagos metodosDePago) {
        this.metodosDePago = metodosDePago;
    }

    public int getNumeroTarjeta() {
        return numeroTarjeta;
    }

    public void setNumeroTarjeta(int numeroTarjeta) {
        this.numeroTarjeta = numeroTarjeta;
    }

    public Clientes getCliente() {
        return cliente;
    }

    public void setCliente(Clientes cliente) {
        this.cliente = cliente;
    }

    public Carrito getCarrito() {
        return carrito;
    }

    public void setIdCarrito(Carrito carrito) {
        this.carrito = carrito;
    }

    public Despacho getDespacho() {
        return despacho;
    }

    public void setDespacho(Despacho despacho) {
        this.despacho = despacho;
    }
    
}
