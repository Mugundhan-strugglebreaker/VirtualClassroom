package Servlets;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 

@WebServlet("/DownloadFromServlet")
public class DownloadFromServlet extends HttpServlet {
 
    // size of byte buffer to send file
    private static final int BUFFER_SIZE = 4096;   
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/virtual_classroom";
    private String dbUser = "root";
    private String dbPass = "";
     
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // get upload id from URL's parameters
        int id = Integer.parseInt(request.getParameter("id"));
         
        Connection conn = null; // connection to the database
        response.setContentType("text/html");
		HttpSession session=request.getSession(true);
		String code=(String)session.getAttribute("code");
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // queries the database
             String sql = "Select id,filename,filedata,description "//
	               + " from "+code+" where id = ?";
	       PreparedStatement pstm = conn.prepareStatement(sql);
	       pstm.setLong(1, id);
	       ResultSet rs = pstm.executeQuery();
//	       if (rs.next()) {
//	           String fileName = rs.getString("filename");
//	           Blob fileData = rs.getBlob("filedata");
//	           String description = rs.getString("description");
//	           return new Attachment(id, fileName, fileData, description);
//	       }
            if (rs.next()) {
                // gets file name and file blob data
                String fileName = rs.getString("filename");
                Blob blob = rs.getBlob("filedata");
                InputStream inputStream = blob.getBinaryStream();
                int fileLength = inputStream.available();
                 
                System.out.println("fileLength = " + fileLength);
 
                ServletContext context = getServletContext();
 
                // sets MIME type for the file download
                String mimeType = context.getMimeType(fileName);
                if (mimeType == null) {        
                    mimeType = "application/octet-stream";
                }              
                 
                // set content properties and header attributes for the response
                response.setContentType(mimeType);
                response.setContentLength(fileLength);
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", fileName);
                response.setHeader(headerKey, headerValue);
 
                // writes the file to the client
                OutputStream outStream = response.getOutputStream();
                 
                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
                 
                inputStream.close();
                outStream.close();             
            } else {
                // no file found
                response.getWriter().print("File not found for the id: " + id);  
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().print("SQL Error: " + ex.getMessage());
        } catch (IOException ex) {
            ex.printStackTrace();
            response.getWriter().print("IO Error: " + ex.getMessage());
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }          
        }
    }
}




//package Servlets;
//
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.PrintWriter;
//import java.sql.Blob;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import Database_Objects.Database_Connection;
//
//
///**
// * Servlet implementation class DownloadFromServlet
// */
//@WebServlet("/DownloadFromServlet")
//public class DownloadFromServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//  
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
//	{
//		
//		response.setContentType("text/html");
//		HttpSession session=request.getSession(true);
//		String code=(String)session.getAttribute("code");
//		  Connection conn = null;
//	       try {
//	        
//	           conn =Database_Connection.getConnection();
//	           int id = 0;
//	           try {
//	               id =Integer.parseInt( request.getParameter("id"));
//	           } catch (Exception e) {
//	 
//	           }
//	           Attachment attachment = getAttachmentFromDB(conn, id,code);
//	 
//	           if (attachment == null) {
//	            
//	               response.getWriter().write("No data found");
//	               return;
//	           }
//	 
//	           String fileName = attachment.getFilename();
//	           System.out.println("File Name: " + fileName);
//	 
//	           String contentType = this.getServletContext().getMimeType(fileName);
//	           System.out.println("Content Type: " + contentType);
//	 
//	           response.setHeader("Content-Type", contentType);
//	 
//	           response.setHeader("Content-Length", String.valueOf(attachment.getFiledata().length()));
//	 
//	           response.setHeader("Content-Disposition", "inline; filename=\"" + attachment.getFilename() + "\"");
//	 
//	         
//	           Blob fileData = attachment.getFiledata();
//	           InputStream is = fileData.getBinaryStream();
//	 
//	           byte[] bytes = new byte[1024];
//	           int bytesRead;
//	 
//	           while ((bytesRead = is.read(bytes)) != -1) {
//	               response.getOutputStream().write(bytes, 0, bytesRead);
//	           }
//	           is.close();
//	  
//	 
//	       } catch (Exception e) {
//	           throw new ServletException(e);
//	       } finally {
//	          
//	       }
//	}
//	private Attachment getAttachmentFromDB(Connection conn, int id,String code) throws SQLException {
//	       String sql = "Select id,filename,filedata,description "//
//	               + " from "+code+" where id = ?";
//	       PreparedStatement pstm = conn.prepareStatement(sql);
//	       pstm.setLong(1, id);
//	       ResultSet rs = pstm.executeQuery();
//	       if (rs.next()) {
//	           String fileName = rs.getString("filename");
//	           Blob fileData = rs.getBlob("filedata");
//	           String description = rs.getString("description");
//	           return new Attachment(id, fileName, fileData, description);
//	       }
//	       return null;
//	   }
//	 
//	 
//
//
//}