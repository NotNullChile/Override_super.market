
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Persona 
{
    private int rut;
    private String nombre;
    private String apellido;
    private String email;
    private int telefono;

    public Persona() 
    {
        rut = 0;
        nombre = new String();
        apellido = new String();
        email = new String();
        telefono = 0;
    }

    public Persona(int rut, String nombre, String apellido, String email, int telefono) {
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.telefono = telefono;
    }

    public int getRut() {
        return rut;
    }

    public void setRut(int rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }
    
    
}
