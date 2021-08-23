package Registration;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDAO
{

    public int registerEmployee(User employee) throws ClassNotFoundException
    {
        String query = "INSERT INTO users"+"(username, email, mobile, password, confirmPassword) VALUES "+"(?, ?, ?, ?, ?);";
        int result = 0;
        try (Connection connection = JDBCutils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query)) 
        {
            preparedStatement.setString(1, employee.getUserName());
            preparedStatement.setString(2, employee.getEmail());
            preparedStatement.setString(3, employee.getMobileNumber());
            preparedStatement.setString(4, employee.getPassword());
            preparedStatement.setString(5, employee.getConfirmPassword());
            System.out.println(preparedStatement);
            result = preparedStatement.executeUpdate();
        } 
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return result;
    }
}