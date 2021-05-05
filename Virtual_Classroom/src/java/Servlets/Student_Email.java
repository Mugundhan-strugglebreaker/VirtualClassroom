
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/Student_Email"})
public class Student_Email extends HttpServlet 
{
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
    {
        //String name="Meiyappan";
        String subject=request.getParameter("subject");
        String description=request.getParameter("description");
        HttpSession session = request.getSession(true);
        String student_email=(String) session.getAttribute("student_email");
        String student_name=(String) session.getAttribute("student_name");
        String name=(String)session.getAttribute("name");
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        //out.println("<script>alert('"+subject+" "+description+"');</script>");
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
            message.setFrom(new InternetAddress("aravind102001@gmail.com"));
            String[] mailAddressTo = new String[1];    
            mailAddressTo[0] = student_email;
            
              

           InternetAddress[] mailAddress_TO = new InternetAddress[mailAddressTo.length];

            for (int i = 0; i < mailAddressTo.length; i++)
            {
                mailAddress_TO[i] = new InternetAddress(mailAddressTo[i]);
            }

            message.addRecipients(Message.RecipientType.TO, mailAddress_TO);
          //  message.setRecipients(Message.RecipientType.TO,InternetAddress.parse("18euit080@skcet.ac.in"));
            message.setSubject(subject);
//            message.setText("Hai mei,"
//                + "\n\n No spam to my email, please!");
           message.setContent(
              "<h1>Mail from Virtual Classroom</h1>\n" +"<b>From: </b>"+name+"<br>"+description,
             "text/html");

            Transport.send(message);
            out.println("<script>alert('Mail sent successfully');</script>");
            out.println("<script>location.replace('DashBoard.jsp')</script>");
            System.out.println("Done");} 
        catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        
        
        
        
    }
    
}