
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Comunas 
{
    private int idComuna;
    private String nombreComuna;

    public Comunas() 
    {
        idComuna = 0;
        nombreComuna = new String();
    }

    public Comunas(int idComuna, String nombreComuna) 
    {
        this.idComuna = idComuna;
        this.nombreComuna = nombreComuna;
    }

    public int getIdComuna() {
        return idComuna;
    }

    public void setIdComuna(int idComuna) {
        this.idComuna = idComuna;
    }

    public String getNombreComuna() {
        return nombreComuna;
    }

    public void setNombreComuna(String nombreComuna) {
        this.nombreComuna = nombreComuna;
    }
    
    //Methods Custom
    
}
