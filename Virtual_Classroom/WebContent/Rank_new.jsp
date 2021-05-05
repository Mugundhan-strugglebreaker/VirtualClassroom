<%-- 
    Document   : Rank_new
    Created on : 7 Feb, 2021, 8:05:00 PM
    Author     : N.MEIYAPPAN
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Database_Objects.Database_Connection" %>
    <%@ page import="java.sql.*" %>

<html>
<head>
<meta charset="ISO-8859-1">
        <title>VIRTUAL CLASSROOM</title>
        <link rel="stylesheet" type="text/css" href="bootstrap1.min.css">
        <link rel="stylesheet" type="text/css" href="rank_new.css">
    </head>
<body>

<div class="spc"></div>
 
 <%
 
 String u_name=(String)session.getAttribute("name");

 String email=(String)session.getAttribute("email");

 try
 {
 
   Connection con=Database_Connection.getConnection();
   String query="select code from teachers where email=?";
   PreparedStatement preparedStatement=con.prepareStatement(query);
   preparedStatement.setString(1, email);
   ResultSet rs=preparedStatement.executeQuery();
   %>
<div class="container">
            <div class="row">
                <div class="col-md-5">
                    <h1 class="text-center" >WELCOME <%=u_name%></h1>
                   
                    <form action="show_results_and_rank.jsp">
                        <div class="row">
                            <div class="move">
                                <select class="form-select" name="selectvalue">
                                <option selected>Open this select menu</option>
    <%
   while(rs.next())
   {
  String str=rs.getString("code");
  str=str+"_"+"qbinfo";
  String query_in="select * from "+str;
PreparedStatement preparedStatement2=con.prepareStatement(query_in);
ResultSet rs1=preparedStatement2.executeQuery();
while(rs1.next())
{%>

<option value='<%=rs1.getString("testcode") %>'><%=rs1.getString("testcode") %></option>

<% }


%>
 
 
   
   <%
   }
    %>
</select>
                            </div>
                        </div>
                       
                        <button class="btn btn-outline-light" type="submit">SUBMIT</button>
                    </form>

                    <div class="row">
                        <div class="col-md-10">
                            <a href="DashBoard.jsp" class="btn btn-primary btn-outline-lg active" role="button" aria-pressed="true">Home</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    <%
   
 }
 catch(Exception e)
 {

 }
   
 
 %>
 
  <script src="./assets/js/bootstrap.min.js"></script>
 <script src="./assets/js/jquery.min.js"></script>

</body>
</html>
