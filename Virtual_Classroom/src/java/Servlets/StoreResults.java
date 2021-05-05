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
import javax.servlet.http.HttpSession;
import Database_Objects.Database_Connection;
import java.sql.*;

/**
 *
 * @author N.MEIYAPPAN
 */
@WebServlet(name = "StoreResults", urlPatterns = {"/StoreResults"})
public class StoreResults extends HttpServlet {

         public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
           
              response.setContentType("text/html");
                  
              PrintWriter out=response.getWriter();
              
              String mark=request.getParameter("mark");
              String total=request.getParameter("total");
              HttpSession session=request.getSession();
              String qcode=(String)session.getAttribute("qcode_result");
              String email=(String)session.getAttribute("email");
              String name=(String)session.getAttribute("name");
              
              try
              {
                  Connection con=Database_Connection.getConnection();
                  String query="insert into results(email,name,qcode,mark,total) values(?,?,?,?,?)";
                  PreparedStatement pst=con.prepareStatement(query);
                  pst.setString(1, email);
                  pst.setString(2, name);
                  pst.setString(3, qcode);
                  pst.setString(4, mark);
                  pst.setString(5, total);
                  
                  pst.executeUpdate();
                  
                  
                  
                  
                  out.println("<script>alert('You have completed your test');</script>");
                  out.print("<script>location.replace('DashBoard.jsp');</script>");
                  
                  
                 
			
                  
                  con.close();
              }
              catch(Exception e)
              {
                  System.out.println("Exception: "+e);
              }
         }

}
