
package model.business;

import java.util.Date;

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
    private String fecha;
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
        this.fecha = new String();
        this.cliente = new Clientes();
        this.carrito = new Carrito();
        this.despacho = new Despacho();
    }

    
    public Venta(int idVenta, int subTotal, int iva, int Total) {
        this.idVenta = idVenta;
        this.subTotal = subTotal;
        this.iva = iva;
        this.Total = Total;
        this.fecha = new String();
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

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
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
