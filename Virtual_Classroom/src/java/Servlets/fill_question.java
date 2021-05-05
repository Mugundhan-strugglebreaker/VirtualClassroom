package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.protocol.Resultset;

import java.sql.*;
import Database_Objects.*;


import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Servlet implementation class fill_question
 */
@WebServlet("/fill_question")
public class fill_question extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		HttpSession session=request.getSession(true);
		
		String arr1[]=request.getParameterValues("question");
		String arr2[]=request.getParameterValues("option1");
		String arr3[]=request.getParameterValues("option2");
		String arr4[]=request.getParameterValues("option3");
		String arr5[]=request.getParameterValues("option4");
		String arr6[]=request.getParameterValues("answer");

		String qpcode=(String)session.getAttribute("exam_name");
		
		try
		{
		Connection con=Database_Connection.getConnection();
		String query="insert into "+qpcode+"(question,option_A,option_B,option_C,option_D,answer) values(?,?,?,?,?,?)";
		PreparedStatement pst=con.prepareStatement(query);	
			for(int i=0;i<arr1.length;i++)
			{
				pst.setString(1, arr1[i]);
				pst.setString(2,arr2[i] );
				pst.setString(3,arr3[i] );
				pst.setString(4,arr4[i] );
				pst.setString(5, arr5[i]);
				pst.setString(6, arr6[i]);
				pst.executeUpdate();
			}
			
			
                      out.println("<script>alert(inserted successfully);</script>");     

			

			        final String username = "virtualclassroom2022@gmail.com";
			        final String password = "mrma2022";

			        Properties props = new Properties();
			        props.put("mail.smtp.starttls.enable", "true");
			        props.put("mail.smtp.auth", "true");
			        props.put("mail.smtp.host", "smtp.gmail.com");
			        props.put("mail.smtp.port", "587");

			        Session session1 = Session.getInstance(props,
			          new javax.mail.Authenticator() {
			            protected PasswordAuthentication getPasswordAuthentication() {
			                return new PasswordAuthentication(username, password);
			            }
			          });

			        try {

			            Message message = new MimeMessage(session1);
			            message.setFrom(new InternetAddress("virtualclassroom2022@gmail.com"));
			            String[] mailAddressTo = new String[100];    
//			            mailAddressTo[0] = "18euit084@skcet.ac.in";   
//			            mailAddressTo[1] = "18euit080@skcet.ac.in";
//			            mailAddressTo[2] = "18euit118@skcet.ac.in";
//			            mailAddressTo[3] = "18euec018@skcet.ac.in";
			            
			            String exam_name=(String)session.getAttribute("exam_name");
			            String ar[]=exam_name.split("_");
                                    System.out.println("ar[0]: "+ar[0]);
			            String query1="select * from students where code=?";
			            PreparedStatement pst1=con.prepareStatement(query1);
			            pst1.setString(1,ar[0]);
			            
			            ResultSet rs1=pst1.executeQuery();
                                    int ind=0;
                                    while(rs1.next())
                                    {
                                        System.out.println("------"+rs1.getString("email"));
                                        mailAddressTo[ind++]=rs1.getString("email");
                                    }
			              

			           InternetAddress[] mailAddress_TO = new InternetAddress[ind];

			            for (int i = 0; i < ind; i++)
			            {
			                mailAddress_TO[i] = new InternetAddress(mailAddressTo[i]);
			            }

			            message.addRecipients(Message.RecipientType.TO, mailAddress_TO);
			          //  message.setRecipients(Message.RecipientType.TO,InternetAddress.parse("18euit080@skcet.ac.in"));
			            message.setSubject("Test Invite");
//			            message.setText("Hai mei,"
//			                + "\n\n No spam to my email, please!");
			           message.setContent(
              "<h1>Mail from Virtual Classroom</h1>\n" +
                      "Test Hosted For Subject :"+session.getAttribute("subject_name")+"<br>"+
                      "Exam Paper Code :"+qpcode+"<br>"+
                      "Start Time:"+session.getAttribute("start_time")+"<br>"+
                      "End Time:"+session.getAttribute("end_time")+"<br>"
                      +
                      "<a href='http://localhost:8080/Virtual_Classroom/Login.jsp'>Take test</a>"
                      +
"    <h3>GuideLines for Online Test</h3>\n" +
"        <p> i)There will be <span style=\"color: red;\">only 2 tab switching allowed</span>.If you cross it test will be ended and it will not be <b>graded.</b></p>\n" +
"        <p> ii)The total time to complete each question will be <span style=\"color: blue;font-weight: bold;\">15 secs</span></p>\n" +
"        <p> iii)If you get low marks no <i> <b>re-test</b></i> will be allowed.</p>\n" +
"         \n" +
"        <h2 style=\"color: rgb(0, 4, 255);\">So prepare well</h2>",
             "text/html");

			            Transport.send(message);

			            System.out.println("Done");

			        } catch (MessagingException e) {
                                    System.out.println("inside");
                                    out.println("<script>alert(No Students in the classroom);</script>");
			             out.println("<script>location.replace('DashBoard.jsp');</script>");
			            throw new RuntimeException(e);
			        }
			        
			  con.close();
			    
			out.println("<script>alert('Question paper created successfully');</script>");
			out.println("<script>location.replace('DashBoard.jsp')</script>");
		}
		catch(Exception e)
		{
                    System.out.println("inside 1");
                        out.println("<script>alert('No Students in the classroom');</script>");
			out.println("<script>location.replace('DashBoard.jsp')</script>");
			System.out.println("Error: "+e);
		}
		
	}

}
