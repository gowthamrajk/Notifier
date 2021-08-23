package Registration;

import java.sql.Connection;
import java.sql.DriverManager;
import databaseConnection.DatabaseConnector;

public class JDBCutils
{
    public static Connection getConnection() 
    {
        Connection connection = null;
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
        return connection;
    }
}