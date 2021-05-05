package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database_Objects.Database_Connection;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession(true);
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		try
		{
			Connection con=Database_Connection.getConnection();
			
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String password=request.getParameter("pass");
			String mobile=request.getParameter("mobile");
			
			session.setAttribute("name", name);
			session.setAttribute("email", email);
			session.setAttribute("password", password);
			session.setAttribute("mobile", mobile);
			
			String query="insert into users(name,email,password,mobile) values (?, ?, ?, ?) ";
			PreparedStatement pst=con.prepareStatement(query);
			
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3,password);
			pst.setString(4,mobile);
			if(Check_Email_Exsists(con,email))
			{
				pst.executeUpdate();
				out.println("<script>window.alert('Registartion Successful');</script>");
				out.println("<script>location.replace('Login.jsp')</script>");
			}
			else
			{
				out.println("<script>window.alert('Email Id Already Exsists');</script>");
				out.println("<script>location.replace('Register.jsp')</script>");
			}
			con.close();
		}
		catch(Exception exp)
		{
			System.out.println("Exception is "+exp);
		}
	}
	public static boolean Check_Email_Exsists(Connection con, String email) throws SQLException
	{
		String query="select * from users where email=?";
		
		PreparedStatement pstmt=con.prepareStatement(query);
        pstmt.setString(1,email);
        ResultSet rs=pstmt.executeQuery();
        
        if(rs.next())
        	return false;
        return true;
	}
}
