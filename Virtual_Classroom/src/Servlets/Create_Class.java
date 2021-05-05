package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database_Objects.Database_Connection;

@WebServlet("/Create_Class")
public class Create_Class extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession(true);
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		try
		{
			Connection con=Database_Connection.getConnection();
			String subject=request.getParameter("subject");
			String code=request.getParameter("code");
			String section=request.getParameter("section");
			String email=(String)session.getAttribute("email");
			
			String query="insert into teachers(email,code,subject,section) values (?, ?, ?, ?) ";
			PreparedStatement pst=con.prepareStatement(query);
			
			pst.setString(1, email);
			pst.setString(2, code);
			pst.setString(3,subject);
			pst.setString(4, section);
			
			//pst.executeUpdate();
			
			int res=Create_Code_Table(session,con, out,code);
			if(res==1)
			{
				pst.executeUpdate();
				String string=code+"_QBinfo";
				String query_info="create table "+string+"(id int not null AUTO_INCREMENT,testcode varchar(255),start_time datetime,end_time datetime,PRIMARY key(id))";
				PreparedStatement preparedStatement=con.prepareStatement(query_info);
				preparedStatement.executeUpdate();
				out.println("<script>alert('Successfully created the class');</script>");
 				out.println("<script>location.replace('DashBoard.jsp')</script>");
				
			}
			session.setAttribute("subject", subject);
			session.setAttribute("code",code);
			session.setAttribute("section", section);
			session.setAttribute("email", email);
			
		}
		catch(Exception exp)
		{
			out.println("Exception is "+exp);
		}
	}
	public static int Create_Code_Table(HttpSession session,Connection con,PrintWriter out,String code) 
	{
		try
		{
			String query="create table "+code+"(id int not null AUTO_INCREMENT,filename varchar(200) not null,filedata blob,description varchar(255),PRIMARY key(id))";
			PreparedStatement pst=con.prepareStatement(query);
			if(Check_Table(con, out, code))
			{
				out.println("<script>alert('Subject Code Already Exsists');</script>");
				out.println("<script>location.replace('Create_Class.jsp')</script>");
				return 0;
			}
			else
			{
				pst.executeUpdate();
				return 1;
//				out.println("<script>alert('Successfully created the class');</script>");
//				out.println("<script>location.replace('DashBoard.jsp')</script>");
			}
			
		}
		catch(Exception exp)
		{
			out.println("Exception is "+exp);
		}
		return 0;
	}
	public static void Create_QBInfo_Table(Connection con,PrintWriter out)
	{
		
	}
	public static boolean Check_Table(Connection con,PrintWriter out,String code)
	{
		try
		{
			DatabaseMetaData db=con.getMetaData();
			ResultSet rs=db.getTables(null, null, code, null);
			if(rs.next())
				return true;
			else
				return false;
		}
		catch(Exception exp)
		{
			out.println("Exception is "+exp+"hi");
		}
		return true;
	}
}
