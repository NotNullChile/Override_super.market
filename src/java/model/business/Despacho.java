
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Despacho 
{
    private int idDespacho;
    private String direccion;
    private String nombrePersonaAEntregar;
    private int idComuna;
    private int idVenta;

    public Despacho() 
    {
        this.idDespacho = 0;
        this.direccion = new String();
        this.nombrePersonaAEntregar = new String();
        this.idComuna = 0;
        this.idVenta = 0;
    }

    public Despacho(int idDespacho, String direccion, String nombrePersonaAEntregar, int idComuna, int idVenta) {
        this.idDespacho = idDespacho;
        this.direccion = direccion;
        this.nombrePersonaAEntregar = nombrePersonaAEntregar;
        this.idComuna = idComuna;
        this.idVenta = idVenta;
    }

    public int getIdDespacho() {
        return idDespacho;
    }

    public void setIdDespacho(int idDespacho) {
        this.idDespacho = idDespacho;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNombrePersonaAEntregar() {
        return nombrePersonaAEntregar;
    }

    public void setNombrePersonaAEntregar(String nombrePersonaAEntregar) {
        this.nombrePersonaAEntregar = nombrePersonaAEntregar;
    }

    public int getIdComuna() {
        return idComuna;
    }

    public void setIdComuna(int idComuna) {
        this.idComuna = idComuna;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }
    
}
