

package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Database_Objects.Database_Connection;

@WebServlet(name = "Update_questions", urlPatterns = {"/Update_questions"})
public class Update_questions extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        HttpSession session=request.getSession();
        
        String question[]=request.getParameterValues("ques");
        String option1[]=request.getParameterValues("opt1");
        String option2[]=request.getParameterValues("opt2");
        String option3[]=request.getParameterValues("opt3");
        String option4[]=request.getParameterValues("opt4");
        String answer[]=request.getParameterValues("ans");
        
        try
        {
           String qcode=(String)session.getAttribute("qcode_update");
          Connection con=Database_Connection.getConnection();
          String query="TRUNCATE TABLE "+qcode;
          PreparedStatement pst=con.prepareStatement(query);
          pst.executeUpdate();
          for(int i=0;i<question.length;i++)
          {
          String query1="insert into "+qcode+" values (?,?,?,?,?,?,?)";
          PreparedStatement pst1=con.prepareStatement(query1);
          pst1.setInt(1, i+1);
          pst1.setString(2, question[i]);
          pst1.setString(3, option1[i]);
          pst1.setString(4, option2[i]);
          pst1.setString(5, option3[i]);
          pst1.setString(6, option4[i]);
          pst1.setString(7, answer[i]);
          
           pst1.executeUpdate();
          }
          out.println("<script>alert('Question paper updated successfully');</script>");
          out.println("<script>location.replace('DashBoard.jsp')</script>");
        }
        catch(Exception e)
        {
            System.out.println("Error: "+e);
        }
        
    }

    

}
