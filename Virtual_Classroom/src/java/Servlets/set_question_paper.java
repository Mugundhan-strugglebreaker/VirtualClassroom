package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import Database_Objects.*;

/**
 * Servlet implementation class set_question_paper
 */
@WebServlet("/set_question_paper")
public class set_question_paper extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		HttpSession session=request.getSession(true);
		
		String subname=request.getParameter("opt");
                session.setAttribute("subject_name", subname);
                System.out.println("Subject name=  "+subname);
		
		String exam_name=request.getParameter("exam_name");
		
		String no_of_que=request.getParameter("no_of_questions");
		session.setAttribute("no_of_question", no_of_que);
		
		String st_time=request.getParameter("start_time");
                session.setAttribute("start_time", st_time);
                
                
//                st_time=st_time.replace("T", " ");
//                st_time=st_time+":00";
//                System.out.println("start time: "+st_time);
//                Timestamp ts1=Timestamp.valueOf(st_time);
		
		String ed_time=request.getParameter("end_time");
                session.setAttribute("end_time", ed_time);
//                ed_time=ed_time.replace("T", " ");
//                ed_time=ed_time+":00";
//                System.out.println("end time: "+ed_time);
//                Timestamp ts2=Timestamp.valueOf(ed_time);
		
		try
		{
			Connection con=Database_Connection.getConnection();
			String query="select code from teachers where subject=?";
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, subname);
			ResultSet rs=pst.executeQuery();
			String qcode="";
			if(rs.next())
			{
				qcode=rs.getString("code");
			}
			con.close();
			System.out.println("QCODE:   "+qcode);
			String table_name=qcode+"_"+exam_name;  
			
			session.setAttribute("exam_name", table_name);
			
			con=Database_Connection.getConnection();
			String query1="create table "+table_name+"(id int not null AUTO_INCREMENT,question varchar(255),option_A varchar(255),option_B varchar(255),option_C varchar(255),option_D varchar(255),answer varchar(255),PRIMARY key(id))";
			
			PreparedStatement pst1=con.prepareStatement(query1);
			//out.println("<script>alert('welcome');</script>");
			
			if(Check_Table(con, out, table_name))
			{
				out.println("<script>alert('Test Code Already Exsists');</script>");
				out.println("<script>location.replace('set_question_paper.jsp')</script>");
			}
			else
			{
				//System.out.println("Hello guys");
				pst1.executeUpdate();
				
				String table_name1=qcode+"_qbinfo";  
				
				String query2="insert into "+table_name1+"(testcode,start_time,end_time)values(?,?,?)";
				PreparedStatement pst2=con.prepareStatement(query2);
				pst2.setString(1, table_name );
				pst2.setString(2,st_time);
				pst2.setString(3,ed_time );
				
				pst2.executeUpdate();
			
				out.println("<script>alert('Successfully created the test');</script>");
//				out.println("<script>location.replace('DashBoard.jsp')</script>");
			}
			
			con.close();
			
			RequestDispatcher rd = request.getRequestDispatcher("/fill_question_new.jsp");
	        rd.forward(request, response);
			
		}
		catch(Exception e)
		{
			System.out.println("Error: "+e);
		}
		
		
		
		
	}
	
	public static boolean Check_Table(Connection con,PrintWriter out,String code)
	{
		
		try
		{
			DatabaseMetaData db=con.getMetaData();
			ResultSet rs=db.getTables(null, null, code, null);
			if(rs.next())
			{
				//out.println("<script>alert('true');</script>");
				return true;
			}
			else
			{
				//out.println("<script>alert('false');</script>");
				return false;
			}
		}
		catch(Exception exp)
		{
			out.println("Exception is "+exp+"hi");
		}
		return true;
	}

}
