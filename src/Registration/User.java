package Registration;
import java.io.Serializable;
public class User implements Serializable 
{
	private static final long serialVersionUID = 1L;
	private String userName;
    private String email;
    private String mobileNumber;
    private String password;
    private String confirmPassword;
    public String getUserName() 
    {
        return userName;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }
    public String getEmail()
    {
    	return email;
    }
    public void setEmail(String email)
    {
    	this.email=email;
    }
    public String getMobileNumber()
    {
    	return mobileNumber;
    }
    public void setMobileNumber(String mobileNumber)
    {
    	this.mobileNumber=mobileNumber;
    }
    public String getPassword() 
    {
        return password;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }
    public String getConfirmPassword()
    {
    	return confirmPassword;
    }
    public void setConfirmPassword(String confirmPassword)
    {
    	this.confirmPassword=confirmPassword;
    }
}
