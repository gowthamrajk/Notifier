package Note;

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

@WebServlet("/deleteNote")
public class DeleteNote extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
		    Connection conn = null;
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        conn = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
	        Statement st=null;
		    st=conn.createStatement();
			String noteName = request.getParameter("delete");
		    st.executeUpdate("DELETE FROM notes WHERE notename='"+noteName+"'");
		    System.out.println("Deleted Note Name : "+noteName);
		    System.out.println("Notes Deleted Successfully !!!");
		    response.sendRedirect("notes.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
}