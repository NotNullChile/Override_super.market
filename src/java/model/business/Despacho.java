
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
    private Comunas comuna;

    public Despacho() 
    {
        this.idDespacho = 0;
        this.direccion = new String();
        this.nombrePersonaAEntregar = new String();
        this.comuna = new Comunas();
    }

    public Despacho(int idDespacho, String direccion, String nombrePersonaAEntregar) {
        this.idDespacho = idDespacho;
        this.direccion = direccion;
        this.nombrePersonaAEntregar = nombrePersonaAEntregar;
        this.comuna = new Comunas();
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

    public Comunas getComuna() {
        return comuna;
    }

    public void setComuna(Comunas comuna) {
        this.comuna = comuna;
    }

    
}
