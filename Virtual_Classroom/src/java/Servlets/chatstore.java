/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chatstore")
public class chatstore extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		try
		{
			response.setContentType("text/html");
			 Connection con=Database_Objects.Database_Connection.getConnection();
			 String uname = request.getParameter("uname");
			 String msg = request.getParameter("msg"); 
			 SimpleDateFormat sdf =new SimpleDateFormat("dd-MM-yyyy");
			 SimpleDateFormat sdf1 =new SimpleDateFormat("hh:mm:ss a");
			 Date date =new Date();
			 String cmtDate =sdf.format(date);
			 String cmttime =sdf1.format(date);
			 String query= "insert into chatting_data(USERNAME,MESSAGE,POSTED_DATE,POSTED_TIME) values(?,?,?,?)";
			 PreparedStatement ps= con.prepareStatement(query);
			 ps.setString(1, uname);
			 ps.setString(2,msg);
			 ps.setString(3,cmtDate);
			 ps.setString(4,cmttime);
			 ps.executeUpdate();
			 ps.close();
			 con.close();
			
			 System.out.println(uname);
			 System.out.println(msg); 
			 
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Invalid user ");
		}
	}

}