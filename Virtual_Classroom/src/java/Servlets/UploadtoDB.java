package Servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Database_Objects.Database_Connection;


@WebServlet("/UploadtoDB")
@MultipartConfig(fileSizeThreshold = 1024*1024*20,//10mb
maxFileSize = 1024*1024*20,
maxRequestSize = 1024*1024*50)

public class UploadtoDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    PrintWriter out=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
	    out=response.getWriter();
		HttpSession session=request.getSession(true);
		
		String email=(String)session.getAttribute("email");
		String subject=(String)session.getAttribute("subject");
		String code=(String)session.getAttribute("code");
		
		
		Connection con=null;
		try
		{
			con=Database_Connection.getConnection();
			con.setAutoCommit(false);
			String description=request.getParameter("description");
			System.out.println(request.getParts());
			for(Part part:request.getParts())
			{
				String filename=extractFileName(part);
				if(filename!=null && filename.length()>0)
				{
					
					InputStream is=part.getInputStream();
					this.writeToDB(con,filename,is,description,code);
				}
			}
			con.commit();
			out.println("<script>alert('Uploaded Successfully');</script>");
			out.println("<script>location.replace('DashBoard.jsp'); </script>");
//			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DashBoard.jsp");
//            dispatcher.forward(request, response);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			request.setAttribute("errorMessage","Error :"+e.getMessage());
			  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UploadFile.jsp");
	            dispatcher.forward(request, response);
			
		}
		
		
       
		
		
		
	}


	private void writeToDB(Connection con, String filename, InputStream is, String description,String code) {
		// TODO Auto-generated method stub
		try
		{
		String query="insert into "+code+"(filename,filedata,description) values(?,?,?)";
		PreparedStatement pwt=con.prepareStatement(query);
		pwt.setString(1,filename);
		pwt.setBlob(2,is);
		pwt.setString(3, description);
		pwt.executeUpdate();
		}
		catch(Exception e)
		{
//			out.println(e);
		}
		
	}


	private String extractFileName(Part part) {
	
		String contentDisp=part.getHeader("content-disposition");
		String items[]=contentDisp.split(";");
		
		for(String s:items)
		{
			if(s.trim().startsWith("filename"))
			{
				String clientFileName=s.substring(s.indexOf("=")+2,s.length()-1);
				clientFileName=clientFileName.replace("\\", "/");
				int i=clientFileName.lastIndexOf('/');
				
				return clientFileName.substring(i+1);
				
				
			}
		}
		
		return null;
	}

}
