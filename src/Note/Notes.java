package Note;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databaseConnection.DatabaseConnector;

@WebServlet("/noteServlet")
public class Notes extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String notename = request.getParameter("notename").toUpperCase();
		String notebookname = request.getParameter("notebookname").toUpperCase();
        String status = request.getParameter("status").toUpperCase();
        String startdate = request.getParameter("startdate").toUpperCase();
        String enddate = request.getParameter("enddate").toUpperCase();
        String remainderdate = request.getParameter("remainderdate").toUpperCase();
        try
        {
        	Connection conn = null;
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    conn = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
		    String query = "INSERT INTO notes"+"(notename, notebookname, status, startdate, enddate, remainderdate) VALUES "+"(?, ?, ?, ?, ?, ?);";
		    PreparedStatement preparedStatement = conn.prepareStatement(query);
		    preparedStatement.setString(1, notename);
		    preparedStatement.setString(2, notebookname);
            preparedStatement.setString(3, status);
            preparedStatement.setString(4, startdate);
            preparedStatement.setString(5, enddate);
            preparedStatement.setString(6, remainderdate);
            preparedStatement.executeUpdate();
		    System.out.println(preparedStatement);
		    System.out.println("Notes created Successfully");
		    response.sendRedirect("notes.jsp");
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
	}
}