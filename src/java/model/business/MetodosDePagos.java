
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class MetodosDePagos
{
    private int idMetodosDePago;
    private String descripcion;

    public MetodosDePagos()
    {
        idMetodosDePago = 0;
        descripcion = new String();
    }

    public MetodosDePagos(int idMetodosDePago, String descripcion) {
        this.idMetodosDePago = idMetodosDePago;
        this.descripcion = descripcion;
    }

    public int getIdMetodosDePago() {
        return idMetodosDePago;
    }

    public void setIdMetodosDePago(int idMetodosDePago) {
        this.idMetodosDePago = idMetodosDePago;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    //Methods Custom
}
