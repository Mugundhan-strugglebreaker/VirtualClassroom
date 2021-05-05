package Servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import net.sf.json.*;
import Database_Objects.Database_Connection;
//com.mysql.cj.jdbc.Driver
@WebServlet("/JSONServlet")
public class JSONServlet extends  HttpServlet
{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        
                 response.setContentType("text/html");
                  
                 PrintWriter out=response.getWriter();
                 String table_name=request.getParameter("table_name");
                 System.out.println(table_name+"--------------------------------------------------");
                 HttpSession session=request.getSession(true);
                 session.setAttribute("qb_ans_code", table_name);
                 JSONArray array=new JSONArray();
                 JSONObject record = new JSONObject();
                 try
                 {
                 Connection con=Database_Connection.getConnection();
                 String query="select * from "+table_name;
                 PreparedStatement pst=con.prepareStatement(query);
                 ResultSet rs=pst.executeQuery();
                 
                 while(rs.next())
                 {
                     System.out.println("heik");
                     record.put("ID", rs.getInt("id"));
                     record.put("QUESTION",rs.getString("question"));
                     String questions[]={rs.getString("option_A"),rs.getString("option_B"),rs.getString("option_C"),rs.getString("option_D")};
                     record.put("OPTIONS",questions );
                     record.put("ANSWERS",rs.getString("answer") );
                     array.add(record);
                     record=new JSONObject();
                     
                 }
                 
                 }
                 catch(Exception e)
                 {
                     System.out.println("Error: "+e);
                 }
                 
                 
//                 JSONObject sen = new JSONObject();
//                 String arry[] = {"hai ","how","are ","you "};
//	         record.put("ID",101);
//	         record.put("First_Name", "Aravind");
//	         record.put("Last_Name", "M");
//	         record.put("OPTIONS", arry);
//	         record.put("Date_Of_Birth", "10-03-2001");
//	         record.put("Place_Of_Birth","Coimbatore");
//	         record.put("Country","India");
//                 array.add(record);
//                 record=new JSONObject();
//                 record.put("ID",102);
//	         record.put("First_Name", "Mei");
//	         record.put("Last_Name", "S");
//	         record.put("OPTIONS", arry);
//	         record.put("Date_Of_Birth", "10-04-2002");
//	         record.put("Place_Of_Birth","Coimbatore");
//	         record.put("Country","India");
//	         array.add(record);
//                 String arraqy[] = {"TOPPER ","LEGEND","ULTRA TOPPER ","ASER"};
//	         record.put("ID",103);
//	         record.put("First_Name", "Mugi");
//	         record.put("Last_Name", "S");
//	         record.put("OPTIONS", arraqy);
//	         record.put("Date_Of_Birth", "UNDEFINED");
//	         record.put("Place_Of_Birth","EARTH");
//	         record.put("Country","India");
//                 array.add(record);
              //   sen.put("Demo", array);
                 
   
//   arrayObj.add("MCA");
//   arrayObj.add("Amit Kumar");
//   arrayObj.add("19-12-1986");
//   arrayObj.add(24);
//   arrayObj.add("Scored");
//   arrayObj.add(new Double(66.67));
//    PrintWriter out = response.getWriter();
    out.println(array);
//    for(int i=0;i<arrayObj.size();i++)
//    {
//    out.println(arrayObj.getString(i));
//    }
  }
}