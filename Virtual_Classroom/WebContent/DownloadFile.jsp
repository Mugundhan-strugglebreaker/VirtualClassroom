<%-- 
    Document   : Download_file_new
    Created on : 7 Feb, 2021, 6:34:02 PM
    Author     : N.MEIYAPPAN
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Database_Objects.Database_Connection" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIRTUAL CLASSROOM</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="Download_file.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">

</head>

<body>
<div style="padding:5px; color:red;font-style:italic;">
       ${errorMessage}
    </div>
   
    <div class="spc"></div>
   
   <%
       
       String email=(String)session.getAttribute("email");
    String subject=request.getParameter("subject");
    String code=request.getParameter("code");
    session.setAttribute("subject", subject);
    session.setAttribute("code", code);
   
  
%>
<div class="container">
            <header>
                <div class="container-fluid bg-dark">
                    <h3 class="text-center text-white">DOWNLOAD FILE</h3>
                </div>
            </header>
            <hr>
        <h2 class="text-center text-white"><%=subject %></h2><hr>
<%
    Connection con=null;
    try
    {
  con=Database_Connection.getConnection();
 
  String  query="select * from "+code;
  PreparedStatement preparedStatement=con.prepareStatement(query);
  ResultSet rs=preparedStatement.executeQuery();
 
%>

<table class="table table-striped table-dark">
                <thead>
                  <tr>
                    <th scope="col">ID</th>
                    <th scope="col">FILENAME</th>
                    <th scope="col">DESCRIPTION</th>
                    <th scope="col">DOWNLOAD</th>
                  </tr>
                </thead>
                <tbody>

<%
   while(rs.next())
   {%>
   
    <tr>
                    <th scope="row"><%=rs.getString("id") %></th>
                    <td><%=rs.getString("filename") %></td>
                    <td><%=rs.getString("description") %></td>
                    <td  style="padding-left:50px" id=<%=rs.getString("id")  %> onclick="func(this.id)"><i class="fa fa-download" style="cursor: pointer" aria-hidden="true"/></td>
             </tr>
   
 
  <% }
    }
    catch(Exception e)
    {
   
    }
   
   
   
   %>
   </tbody>
   </table>
   
   </div>
 
     <script>
   
        var table = document.getElementById('table');

        function func(ele)
        {
        window.location="http://localhost:8080/Virtual_Classroom/DownloadFromServlet?id="+ele;
       
 
        }

         </script>
         
         <script src="bootstrap.min.js"></script>
   <script src="jquery.min.js"></script>

</body>
</html>