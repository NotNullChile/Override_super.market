
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
    private int idMetodosDePago;
    private int numeroTarjeta;
    private int rut;
    private int idCarrito;

    public Venta() 
    {
        this.idVenta = 0;
        this.subTotal = 0;
        this.iva = 0;
        this.Total = 0;
        this.idMetodosDePago = 0;
        this.numeroTarjeta = 0;
        this.rut = 0;
        this.idCarrito = 0;
    }

    
    public Venta(int idVenta, int subTotal, int iva, int Total, int idMetodosDePago, int numeroTarjeta, int rut, int idCarrito) {
        this.idVenta = idVenta;
        this.subTotal = subTotal;
        this.iva = iva;
        this.Total = Total;
        this.idMetodosDePago = idMetodosDePago;
        this.numeroTarjeta = numeroTarjeta;
        this.rut = rut;
        this.idCarrito = idCarrito;
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

    public int getIdMetodosDePago() {
        return idMetodosDePago;
    }

    public void setIdMetodosDePago(int idMetodosDePago) {
        this.idMetodosDePago = idMetodosDePago;
    }

    public int getNumeroTarjeta() {
        return numeroTarjeta;
    }

    public void setNumeroTarjeta(int numeroTarjeta) {
        this.numeroTarjeta = numeroTarjeta;
    }

    public int getRut() {
        return rut;
    }

    public void setRut(int rut) {
        this.rut = rut;
    }

    public int getIdCarrito() {
        return idCarrito;
    }

    public void setIdCarrito(int idCarrito) {
        this.idCarrito = idCarrito;
    }
    
}
