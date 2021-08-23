package User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databaseConnection.DatabaseConnector;

@WebServlet("/resetpassword")
public class ResetPassword extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		try
		{
		    Connection conn = null;
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    conn = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
		    Statement st=null;
		    st=conn.createStatement();
		    st.executeUpdate("update users set password='"+password+"',confirmPassword='"+confirmPassword+"' where email='"+email+"'");
		    System.out.println("Password Reset Successfully !!!");
		    System.out.println("Updated Profile :\n"+email+"\n"+password+"\n"+confirmPassword);
		    response.sendRedirect("reset-success.jsp");
		}
		catch(Exception e)
		{
		    System.out.println(e);
		}
	}
}