
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
    
    public static boolean validarRut(String rut) {

    boolean validacion = false;
    try 
    {
        rut =  rut.toUpperCase();
        rut = rut.replace(".", "");
        rut = rut.replace("-", "");
        int rutAux = Integer.parseInt(rut.substring(0, rut.length() - 1));

        char dv = rut.charAt(rut.length() - 1);

        int m = 0, s = 1;
        for (; rutAux != 0; rutAux /= 10) {
        s = (s + rutAux % 10 * (9 - m++ % 6)) % 11;
        }
        if (dv == (char) (s != 0 ? s + 47 : 75)) {
            validacion = true;
        }

     } 
    catch (java.lang.NumberFormatException e) 
    {
            
    }
    catch (Exception e)
    {
        
    }
    return validacion;
    }
    
}
