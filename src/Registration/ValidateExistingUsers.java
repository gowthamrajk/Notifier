package Registration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ValidateExistingUsers 
{
	public boolean Validate(String email)
	{
		boolean status = false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier", "root", "gowthamraj@258");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from users where email='"+email+"'");
			int count=0;
			while(rs.next())
			{
			    count++;
			}
			if(count > 0)
				status = true;
			else
				status = false;
		}
		catch(Exception e) 
		{
		    System.out.println(e);
		}
		return status;
	}
}