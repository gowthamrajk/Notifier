package User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databaseConnection.DatabaseConnector;

import java.sql.DriverManager;

@WebServlet("/editServlet")
public class EditUser extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String username = request.getParameter("username");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try
		{
		    Connection conn = null;
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    conn = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
		    Statement st=null;
		    st=conn.createStatement();
		    st.executeUpdate("update users set username='"+username+"',mobile="+mobile+",password='"+password+"',confirmPassword='"+password+"' where email='"+email+"'");
		    System.out.println("User Profile Updated Successfully !!!");
		    System.out.println("Updated Profile :\n"+username+"\n"+mobile+"\n"+email+"\n"+password);
		    response.sendRedirect("useredit-success.jsp");
		}
		catch(Exception e)
		{
		    System.out.println(e);
		}
	}
}