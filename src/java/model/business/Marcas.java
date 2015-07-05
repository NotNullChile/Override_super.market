
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Marcas 
{
    private int idMarca;
    private String descripcion;   

    public Marcas() 
    {
        idMarca = 0;
        descripcion = new String();
        
    }

    public Marcas(int idMarca, String descripcion) {
        this.idMarca = idMarca;
        this.descripcion = descripcion;
        
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    
    //Methods Custom
}
