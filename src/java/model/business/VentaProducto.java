/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.business;

/**
 *
 * @author Ricardo
 */
public class VentaProducto
{
    private Producto producto;
    private Carrito carrito;
    private Venta venta;
    
    public VentaProducto() 
    {
        producto = new Producto();
        carrito = new Carrito();
        venta = new Venta();
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Carrito getCarrito() {
        return carrito;
    }

    public void setCarrito(Carrito carrito) {
        this.carrito = carrito;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }
    
}
