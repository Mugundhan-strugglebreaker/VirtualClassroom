package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database_Objects.Database_Connection;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession(true);
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
	    
	    try
	    {
	    	Connection con=Database_Connection.getConnection();
			String query="select * from users where email=? and  password=?";
			
			String email=request.getParameter("email");
			String password=request.getParameter("pass");
			
			session.setAttribute("email", email);
			session.setAttribute("password", password);
			
			PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,email);
            pstmt.setString(2,password);
            ResultSet rs=pstmt.executeQuery();
            
            if(rs.next())
            {
				
				 RequestDispatcher rd = request.getRequestDispatcher("DashBoard.jsp");
				 rd.forward(request, response);
				
            	out.println("<script>window.alert('Login Successful');</script>");
            }
            else
            {
            	out.println("<script>window.alert('Login UnSuccessful');</script>");
				out.println("<script>location.replace('Login.jsp')</script>");
            }
	    }
	    catch(Exception exp)
	    {
	    	System.out.println("Exception is :"+exp);
	    }
	}
}
