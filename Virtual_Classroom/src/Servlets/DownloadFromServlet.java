package Servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
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


/**
 * Servlet implementation class DownloadFromServlet
 */
@WebServlet("/DownloadFromServlet")
public class DownloadFromServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		response.setContentType("text/html");
		HttpSession session=request.getSession(true);
		String code=(String)session.getAttribute("code");
		  Connection conn = null;
	       try {
	        
	           conn =Database_Connection.getConnection();
	           int id = 0;
	           try {
	               id =Integer.parseInt( request.getParameter("id"));
	           } catch (Exception e) {
	 
	           }
	           Attachment attachment = getAttachmentFromDB(conn, id,code);
	 
	           if (attachment == null) {
	            
	               response.getWriter().write("No data found");
	               return;
	           }
	 
	           String fileName = attachment.getFilename();
	           System.out.println("File Name: " + fileName);
	 
	           String contentType = this.getServletContext().getMimeType(fileName);
	           System.out.println("Content Type: " + contentType);
	 
	           response.setHeader("Content-Type", contentType);
	 
	           response.setHeader("Content-Length", String.valueOf(attachment.getFiledata().length()));
	 
	           response.setHeader("Content-Disposition", "inline; filename=\"" + attachment.getFilename() + "\"");
	 
	         
	           Blob fileData = attachment.getFiledata();
	           InputStream is = fileData.getBinaryStream();
	 
	           byte[] bytes = new byte[1024];
	           int bytesRead;
	 
	           while ((bytesRead = is.read(bytes)) != -1) {
	               response.getOutputStream().write(bytes, 0, bytesRead);
	           }
	           is.close();
	  
	 
	       } catch (Exception e) {
	           throw new ServletException(e);
	       } finally {
	          
	       }
	}
	private Attachment getAttachmentFromDB(Connection conn, int id,String code) throws SQLException {
	       String sql = "Select id,filename,filedata,description "//
	               + " from "+code+" where id = ?";
	       PreparedStatement pstm = conn.prepareStatement(sql);
	       pstm.setLong(1, id);
	       ResultSet rs = pstm.executeQuery();
	       if (rs.next()) {
	           String fileName = rs.getString("filename");
	           Blob fileData = rs.getBlob("filedata");
	           String description = rs.getString("description");
	           return new Attachment(id, fileName, fileData, description);
	       }
	       return null;
	   }
	 
	 


}
