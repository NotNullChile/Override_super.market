
package model.business;

/**
 *
 * @author RicardoCarrasco
 */
public class Login 
{
    public int username;
    private String password;
    private int rol;

    public Login() 
    {
        username = 0;
        password = new String();
        rol = 1;
    }

    public Login(int username, String password, int rol)
    {
        this.username = username;
        this.password = password;
        this.rol = rol;
    }

    public int getUsername() {
        return username;
    }

    public void setUsername(int username) {
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
