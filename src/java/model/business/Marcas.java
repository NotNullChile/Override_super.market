
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Marcas 
{
    private int idMarca;
    private String descripcion;
    private String urlFoto;

    public Marcas() 
    {
        idMarca = 0;
        descripcion = new String();
        urlFoto = new String();
    }

    public Marcas(int idMarca, String descripcion, String urlFoto) {
        this.idMarca = idMarca;
        this.descripcion = descripcion;
        this.urlFoto = urlFoto;
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

    public String getUrlFoto() {
        return urlFoto;
    }

    public void setUrlFoto(String urlFoto) {
        this.urlFoto = urlFoto;
    }
    
    //Methods Custom
}
