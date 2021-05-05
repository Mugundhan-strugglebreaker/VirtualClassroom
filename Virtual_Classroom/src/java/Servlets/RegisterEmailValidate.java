/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Database_Objects.*;
import java.sql.*;
/**
 *
 * @author N.MEIYAPPAN
 */
@WebServlet(name = "RegisterEmailValidate", urlPatterns = {"/RegisterEmailValidate"})
public class RegisterEmailValidate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		String st_email=request.getParameter("email");
		int flag=0;
                try
                {
                   Connection con=Database_Connection.getConnection();
                   String query="select * from users";
                   PreparedStatement preparedStatement=con.prepareStatement(query);
                   ResultSet rs=preparedStatement.executeQuery();
                   flag=0;
                   while(rs.next())
                   {
                       if(st_email.equals(rs.getString("email")))
                       {
                           flag=1;
                           break;
                       }
                   }
                    
                }
                catch(Exception e)
                {
                    
                }
                
		if(flag==1)
			out.println(0);
		else
			out.println(1);
    }

    
}
