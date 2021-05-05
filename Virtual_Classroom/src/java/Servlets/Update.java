package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database_Objects.Database_Connection;

@WebServlet("/Update")
public class Update extends HttpServlet {
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
			String query="update users set name=? , password=? ,mobile=? where email=?";
			//out.println(name+" "+email+" "+password+" "+mobile);
			PreparedStatement pst=con.prepareStatement(query);
			
			pst.setString(1, name);
			pst.setString(2,password);
			pst.setString(3,mobile);
			pst.setString(4, email);
			
			session.setAttribute("name", name);
			session.setAttribute("email", email);
			session.setAttribute("password", password);
			session.setAttribute("mobile", mobile);
			
			pst.executeUpdate();
			
			out.println("<script>window.alert('Updation Successful');</script>");
			out.println("<script>location.replace('DashBoard.jsp')</script>");
			con.close();
		}
		catch(Exception exp)
		{
			System.out.println("Exception is "+exp);
		}
	}
}
