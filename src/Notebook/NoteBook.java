package Notebook;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Registration.User;
import Registration.ValidateExistingUsers;
import databaseConnection.DatabaseConnector;

@WebServlet("/noteBookServlet")
public class NoteBook extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String name = request.getParameter("notebookname").toUpperCase();
        String status = request.getParameter("status").toUpperCase();
        String date = request.getParameter("date").toUpperCase();
        try
        {
        	Connection conn = null;
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    conn = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
		    String query = "INSERT INTO notebook"+"(name, status, date) VALUES "+"(?, ?, ?);";
		    PreparedStatement preparedStatement = conn.prepareStatement(query);
		    preparedStatement.setString(1, name);
            preparedStatement.setString(2, status);
            preparedStatement.setString(3, date);
            preparedStatement.executeUpdate();
		    System.out.println(preparedStatement);
		    System.out.println("Notebook created Successfully");
		    response.sendRedirect("notebook.jsp");
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
	}
}