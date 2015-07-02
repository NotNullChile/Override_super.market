
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Administrador extends Persona
{
    private Login login;

    public Administrador() 
    {
        this.login = new Login();
    }

    public Administrador(int rut, String nombre, String apellido, String email, int telefono) {
        super(rut, nombre, apellido, email, telefono);
    }

    public Login getLogin() {
        return login;
    }

    public void setLogin(Login login) {
        this.login = login;
    }
    
    
}
