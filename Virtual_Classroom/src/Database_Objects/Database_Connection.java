package Database_Objects;

import java.sql.Connection;

import java.sql.DriverManager;

public class Database_Connection 
{

private static Connection con;
	
	public static Connection getConnection()
	{
		try
		{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Virtual_Classroom","root","");
		}
		catch(Exception exp)
		{
			System.out.println("Exception is "+exp);
		}
		return con;
	}
}
