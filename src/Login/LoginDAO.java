package Login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import Registration.JDBCutils;
import databaseConnection.DatabaseConnector;

public class LoginDAO 
{
	public boolean validate(Login login) throws ClassNotFoundException
	{
        boolean status = false;
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = JDBCutils.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select * from users where email = ? and password = ? "))
        {
            preparedStatement.setString(1, login.getEmail());
            preparedStatement.setString(2, login.getPassword());
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();
        } 
        catch(Exception e)
        {
        	System.out.println(e.getMessage());
        }
        return status;
    }
	public String getUserName(String email) throws Exception
	{
		String name = "";
		try
		{
		    Connection con = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
		    Statement st = con.createStatement();
		    ResultSet rs = st.executeQuery("select username from users where email='"+email+"'");
		    while(rs.next())
		    {
		    	name=rs.getString("username");
		    }
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		System.out.println("current user is : "+name);
		return name;
	}
}
