package Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class LoginController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{		
		authenticate(request, response);
	}
    private void authenticate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
    {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Login login = new Login();
        login.setEmail(email);
        login.setPassword(password);
        LoginDAO dao=new LoginDAO();
        try 
        {
            if (dao.validate(login)) 
            {
            	System.out.println("User Logged in successfully");
                RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");  
                rd.forward(request,response);  
                HttpSession session = request.getSession(false);
                HttpSession session1 = request.getSession(false);
                session1.setAttribute("currmail", email);
                try
                {
                    if(session!=null)
                    session.setAttribute("name",dao.getUserName(email));
                }
                catch(Exception e)
                {
                    System.out.println(e);
                }
            } 
            else 
            {
            	System.out.println("User Login failed");
            	RequestDispatcher rd=request.getRequestDispatcher("login-error.jsp");  
                rd.forward(request,response);  
            }
        } 
        catch (ClassNotFoundException e)
        {
            System.out.println(e.getMessage());
        }
    }
}