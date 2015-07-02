
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
    
}
