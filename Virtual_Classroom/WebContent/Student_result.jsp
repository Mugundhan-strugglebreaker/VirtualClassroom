<%-- 
    Document   : Student_result
    Created on : 31 Jan, 2021, 3:47:30 PM
    Author     : N.MEIYAPPAN
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="Database_Objects.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>VIRTUAL CLASSROOM</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="student_result.css">
    </head>
    <body>
        <%
         String email=(String)session.getAttribute("email");
         String name=(String)session.getAttribute("name");
        Connection con=Database_Connection.getConnection();
        String query="select * from results where email=?";
        PreparedStatement pst=con.prepareStatement(query);
        pst.setString(1,email);
        ResultSet rs=pst.executeQuery();
        %>
        <div class="container">
                <header>
                    <div class="container-fluid bg-dark">
                        <h3 class="text-center text-white">WELCOME <%=name%></h3>
                    </div>
                </header>
            <h2 class="text-center text-white">RESULT</h2>
                <table class="table table-striped table-dark">
                    <thead>
                      <tr>
                        <th scope="col">S.NO</th>
                        <th scope="col">QUESTION PAPER CODE</th>
                        <th scope="col">MARK OBTAINED</th>
                        <th scope="col">TOTAL</th>
                      </tr>
                    </thead>
                    <tbody>
               
           
        <%
            int i=0;
            String arr[]=new String[100];
            int ind=0;
            while(rs.next())
            {
                arr[ind++]=rs.getString("qcode");
                %>
    <tr>
        <td><%=(i+1)%></td>
        <td><%=rs.getString("qcode")%></td>
        <td><%=rs.getString("mark")%></td>
        <td><%=rs.getString("total")%></td>
       
    </tr>
   
        <%
        i++;
            }
            String query1="select code from students where email=?";
            PreparedStatement pst1=con.prepareStatement(query1);
            pst1.setString(1, email);
            ResultSet rs1=pst1.executeQuery();
            while(rs1.next())
            {
                String str=rs1.getString("code");
                str=str+"_qbinfo";
                String query2="select testcode from "+str;
                PreparedStatement pst2=con.prepareStatement(query2);
                ResultSet rs2=pst2.executeQuery();
                while(rs2.next())
                {
                    int flag=0;
                    for(int x=0;x<ind;x++)
                    {
                        if(arr[x].equals(rs2.getString("testcode")))
                        {
                            flag=1;
                            break;
                        }
                    }
                     if(flag==0)
                     {
                    %>
                        <tr>
                            <td scope="row"><%=(i+1)%></td>
                            <td><%=rs2.getString("testcode")%></td>
                            <td>Not Attempted</td>
                            <td>Not Attempted</td>

                        </tr>
                    <%
                    i++;
                     }
                   
                }
               
                               
            }
           
        %>
</tbody>
                  </table>
            </div>

        <script src="bootstrap.min.js"></script>
   <script src="jquery.min.js"></script>
   
    </body>
</html>
