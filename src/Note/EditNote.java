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

@WebServlet("/editNoteServlet")
public class EditNote extends HttpServlet
{
	private static final long serialVersionUID = 1L;    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String oldname = request.getParameter("oldnotename").toUpperCase();
		String updatedname = request.getParameter("updatedname").toUpperCase();
		String status = request.getParameter("status").toUpperCase();
        String startdate = request.getParameter("startdate").toUpperCase();
        String enddate = request.getParameter("enddate").toUpperCase();
        String remainderdate = request.getParameter("remainderdate").toUpperCase();
		try
		{
		    Connection conn = null;
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    conn = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
		    Statement st=null;
		    st=conn.createStatement();
		    st.executeUpdate("update notes set notename='"+updatedname+"',status='"+status+"',startdate='"+startdate+"',enddate='"+enddate+"',remainderdate='"+remainderdate+"' where notename='"+oldname+"'");
		    System.out.println("Notes Name Updated Successfully !!!");
		    System.out.println("Updated Note : "+updatedname+" "+status+" "+startdate+" "+enddate+" "+remainderdate);
		    response.sendRedirect("notesedit-success.jsp");
		}
		catch(Exception e)
		{
		    e.printStackTrace();
		}
	}
}