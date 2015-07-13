
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Clientes extends Persona
{
    private Login login;

    public Clientes() 
    {
         this.login = new Login();
    }

    public Clientes(int rut, String nombre, String apellido, String email, int telefono) {
        
        super(rut, nombre, apellido, email, telefono);
        this.login = new Login();
    }

    public Login getLogin() {
        return login;
    }

    public void setLogin(Login login) {
        this.login = login;
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
