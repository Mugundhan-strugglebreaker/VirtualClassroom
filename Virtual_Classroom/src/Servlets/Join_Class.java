package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database_Objects.Database_Connection;

@WebServlet("/Join_Class")
public class Join_Class extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(true);
		
		String email=(String) session.getAttribute("email");
		String code=request.getParameter("code");
		Connection con=null;
		try
		{
			con=Database_Connection.getConnection();
			DatabaseMetaData db=con.getMetaData();
			ResultSet rs=db.getTables(null, null, code, null);
			if(!rs.next())
			{
				
				out.println("<script>alert('Subject code does not exists');</script>");
			 	out.println("<script>location.replace('Join_class.jsp')</script>");
			}
			else
			{
				String query="select subject from teachers where code=?";
				PreparedStatement pb=con.prepareStatement(query);
				pb.setString(1, code);
				
				ResultSet rs1=pb.executeQuery();
				rs1.next();
				String subject=rs1.getString(1);
				String query_student="insert into students(email,code,subject)values(?,?,?)";
				PreparedStatement preparedStatement=con.prepareStatement(query_student);
				preparedStatement.setString(1, email);
				preparedStatement.setString(2, code);
				preparedStatement.setString(3, subject);
				preparedStatement.executeUpdate();
				
				
				out.println("<script>alert('You are Successfully added to classroom');</script>");
				out.println("<script>location.replace('DashBoard.jsp')</script>");
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
	}

}
