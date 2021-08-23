package Registration;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerServlet")
public class UserController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private UserDAO userDao = new UserDAO();
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        register(request, response);
    }
    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
    {
        String username = request.getParameter("username");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        User employee = new User();
        ValidateExistingUsers users=new ValidateExistingUsers();
        employee.setUserName(username);
        employee.setEmail(email);
        employee.setMobileNumber(mobile);
        employee.setPassword(password);
        employee.setConfirmPassword(confirmPassword);
        try
        {
        	int result = 0;
            if(employee.getPassword().equals(employee.getConfirmPassword()) && employee.getMobileNumber().length()==10)
            {
            	if(users.Validate(email))
                {
                 	System.out.println("User Already Exists !!!");
                    RequestDispatcher rd=request.getRequestDispatcher("user-error.jsp");  
                    rd.forward(request,response);  
                    return;
                }
            	result = userDao.registerEmployee(employee);
            }
            if(result == 1) 
            {
            	System.out.println("User registered successfully !!!");
                RequestDispatcher rd=request.getRequestDispatcher("register-success.jsp");  
                rd.forward(request,response);  
            }
            else
            {
            	System.out.println("User registration Failed !!!");
                RequestDispatcher rd=request.getRequestDispatcher("register-error.jsp");  
                rd.forward(request,response);
            }
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    }
}