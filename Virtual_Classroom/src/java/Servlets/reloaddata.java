/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpSession;

@WebServlet("/reloaddata")
public class reloaddata extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		try
		{
			 response.setContentType("text/html");
			 Connection con=Database_Objects.Database_Connection.getConnection();
			 String str2 ="select * from chatting_data";
			 PreparedStatement stmt2 = con.prepareStatement(str2);
			 ResultSet rs2 = stmt2.executeQuery();
			 HttpSession session=request.getSession(true);
			 while(rs2.next())
			 {
				 String uname = rs2.getString(1);
				 String msg = rs2.getString(2);
				 String mdate = rs2.getString(3);
				 String mtime = rs2.getString(4);
                                 String name=(String)session.getAttribute("name");
                                if(!name.equals(uname))
                                 {
                                    out.print("<div dir= 'ltr'>");
                                    out.print("<p class='nameCnt'>"+"<b>"+uname+"</b>" + "-<g>"+msg+"</g><br><small>"+ mdate +" "+mtime+"</small></p>");
                                    out.print("</div>");
                                 }
                                 else
                                 {
                                     out.print("<div dir= 'rtl'>");
                                     out.print("<p dir= 'ltr' class='nameCnt2'>"+"<b>"+uname+"</b>" + "-<g>"+msg+"</g><br><small>"+ mdate +" "+mtime+"</small></p>");
                                     out.print("</div>");
                                 }
			 }
			 con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Wrong ");
		}
	}


}