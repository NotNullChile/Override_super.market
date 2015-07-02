
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Login 
{
    private String username;
    private String password;
    private int rol;

    public Login() 
    {
        username = new String();
        password = new String();
        rol = -1;
    }

    public Login(String username, String password, int rol)
    {
        this.username = username;
        this.password = password;
        this.rol = rol;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }
    //Methods Custom
    
}
