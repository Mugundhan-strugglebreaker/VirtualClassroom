
<%--
    Document   : show_Edit_Question_Paper
    Created on : 30 Jan, 2021, 11:47:12 PM
    Author     : N.MEIYAPPAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="Database_Objects.Database_Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>VIRTUAL CLASSROOM</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="show_edit_qb.css">
    </head>
    <body>
        <%
          String qcode=request.getParameter("select_qb");
          String name=(String)session.getAttribute("name");
//          out.print(qcode);
        try
        {
            Connection con=Database_Connection.getConnection();
            String Query="select * from "+qcode;
            session.setAttribute("qcode_update", qcode);
            PreparedStatement pst=con.prepareStatement(Query);
            ResultSet rs=pst.executeQuery();
        %>
        <div class="container">
                <header>
                    <div class="container-fluid bg-dark">
                        <h3 class="text-white text-center">WELCOME <%=name%></h3>
                    </div>
                </header>
            <h2 class="text-center text-white">EDIT QUESTION PAPER</h2>
           
        <form method="post" action="Update_questions">
            <table class="table table-striped table-dark">
                    <thead>
                      <tr>
                        <th scope="col">S.NO</th>
                        <th scope="col">QUESTION</th>
                        <th scope="col">OPTION A</th>
                        <th scope="col">OPTION B</th>
                        <th scope="col">OPTION C</th>
                        <th scope="col">OPTION D</th>
                        <th scope="col">ANSWER</th>
                      </tr>
                    </thead>
                    <tbody>
                   
                <%
                    while(rs.next())
                    {%>
                    <tr>
                        <td scope="row"><%=rs.getInt("id")%></td>
                        <td><input type="text" name="ques" value='<%=rs.getString("question")%>'></td>
                        <td><input type="text" name="opt1" value='<%=rs.getString("option_A")%>'></td>
                        <td><input type="text" name="opt2" value='<%=rs.getString("option_B")%>'></td>
                        <td><input type="text" name="opt3" value='<%=rs.getString("option_C")%>'></td>
                        <td><input type="text" name="opt4" value='<%=rs.getString("option_D")%>'></td>
                        <td><input type="text" name="ans" value='<%=rs.getString("answer")%>'></td>
                    </tr>
                    <%}
                %>
            </tbody>
        </table>
            <button class="btn btn-outline-light" type="submit">UPDATE</button>
       </form>    
        <%
        con.close();
        }
        catch(Exception e)
        {
            System.out.println("Error: "+e);
        }
        %>
        </div>

        <script src="bootstrap.min.js"></script>
   <script src="jquery.min.js"></script>
    </body>
</html>