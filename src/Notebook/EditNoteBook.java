package Notebook;

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

@WebServlet("/editNoteBookServlet")
public class EditNoteBook extends HttpServlet
{
	private static final long serialVersionUID = 1L;    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String oldname = request.getParameter("oldnotebookname").toUpperCase();
		String updatedname = request.getParameter("updatedname").toUpperCase();
		String status = request.getParameter("status").toUpperCase();
        String date = request.getParameter("date").toUpperCase();
		try
		{
		    Connection conn = null;
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    conn = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
		    Statement st=null;
		    st=conn.createStatement();
		    st.executeUpdate("update notebook set name='"+updatedname+"',status='"+status+"',date='"+date+"' where name='"+oldname+"'");
		    System.out.println("NoteBook Name Updated Successfully !!!");
		    System.out.println("Updated Notebook :\n"+updatedname+"\n"+status+"\n"+date);
		    response.sendRedirect("notebookedit-success.jsp");
		}
		catch(Exception e)
		{
		    e.printStackTrace();
		}
	}
}