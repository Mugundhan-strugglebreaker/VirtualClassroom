<%-- 
    Document   : show_students_new
    Created on : 11 Feb, 2021, 11:06:01 PM
    Author     : N.MEIYAPPAN
--%>

<%-- 
    Document   : show_students
    Created on : 8 Feb, 2021, 3:48:48 PM
    Author     : N.MEIYAPPAN
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="Database_Objects.Database_Connection" %>
    <%@ page import="java.sql.*" %>
    
<html>
    <head>
        <title>VIRTUAL CLASSROOM</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="student_result.css">
        <style>
            td:last-child{cursor: pointer;
                          font-weight: bold;}
        </style>
    </head>
    <body>
            <div class="container">
                <header>
                </header>
                 <%
                    try
                    {
                      String code=(String)session.getAttribute("code");
                      Connection con=Database_Connection.getConnection();
                      String query_stud="select * from students where code=?";
                      PreparedStatement prepared_Statement=con.prepareStatement(query_stud);
                      prepared_Statement.setString(1,code);
                      ResultSet rs=prepared_Statement.executeQuery();
                 %>

                 <h2 class="text-center text-white bg-dark"><%=code%>  STUDENTS</h2><br><br>
                <table class="table table-striped table-dark" id="table">
                    <thead>
                    <tr>
                        <th scope="col">S.NO</th>
                        <th scope="col">NAME</th>
                        <th scope="col">EMAIL</th>
                        <th scope="col">SEND EMAIL</th>
                    </tr>
                    </thead>
                    <tbody>
                        <%
                        int i=1;
                          while(rs.next())
                          {
                              //out.println("<h1>"+rs.getString("email")+"</h1>");
                              String email_stud=rs.getString("email");
                              String query_name="select name from users where email=?";
                              PreparedStatement preparedStatement_stud=con.prepareStatement(query_name);
                              preparedStatement_stud.setString(1, email_stud);
                              ResultSet rs1=preparedStatement_stud.executeQuery();
                              rs1.next();
                            
       

                        %>

                    <tr>
                        <th scope="row"><%=i%></th>
                        <td><%=rs1.getString("name") %></td>
                        <td><%=rs.getString("email") %></td>
                        <td><i class="fa fa-envelope fa-2x " style="color:white" aria-hidden="true"></i></td>
                    </tr>
                    </tbody>



                      <%
                          i++;
         
                         }
                      %>
                </table>
             
                  <%
                        }
                        catch(Exception e)
                        {
                            out.println(e);
                        }
                       
                       
                        %>
                        
                        <div class="row">
                    <div class="col-md-10">
                        <a href="DashBoard.jsp" class="btn btn-primary btn-outline-lg active" role="button" aria-pressed="true">BACK</a>
                    </div>
                </div>

            </div>

                        <script>
    
            var index, table = document.getElementById('table');
            for(var i = 1; i < table.rows.length; i++)
            {
                table.rows[i].cells[3].onclick = function()
                {
                 
                        name = this.parentElement.cells[1].innerText;
                        email= this.parentElement.cells[2].innerHTML;
                        //alert(name+" "+email);
                        window.location="http://localhost:8080/Virtual_Classroom/text_area.jsp?student_name="+name+"&student_email="+email;
                    
                    
                    //console.log(index);
                };
                
            }
    
        </script>
        
    </body>
</html>

