<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="Database_Objects.Database_Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIRTUAL CLASSROOM</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="edit.css">
</head>
<body>
    <% String email=(String)session.getAttribute("email"); 
       Connection con=Database_Connection.getConnection();
       String query="select code from teachers where email=?";
       PreparedStatement pst=con.prepareStatement(query);
       pst.setString(1, email);
       ResultSet rs=pst.executeQuery();
       String name=(String)session.getAttribute("name");
    %>
    <h1 class="text-center" >VIRTUAL CLASSROOM</h1>
        <div class="spc"></div>
    
    <div class="container">
            
            <div class="row">
                <div class="col-md-5">
                    <h1 style="margin-left: 50px">WELCOME <%=name%></h1>
                    
                    
                    
                    <form method="post" action="print_as_excel">
                        <div class="row">
                            <div class="move">
                                
                            
                                <select class="form-select" aria-label="Default select example" name="code"  required>
        <option value="">select subject Code</option>
                      <%
                            while(rs.next())
                            {
                                System.out.println("----------------"+rs.getString("code"));
                                String str=rs.getString("code");
                                str=str+"_qbinfo";
                                String query_in="select * from "+str;
                                PreparedStatement pst1=con.prepareStatement(query_in);
                                ResultSet rs1=pst1.executeQuery();
                                while(rs1.next())
                                {
                      %>
                        <option  value='<%=rs1.getString("testcode") %>'><%=rs1.getString("testcode") %></option>


                    <%
                    
                        
}}%>
    </select>
                                
                                
                            </div>
                        </div>
                        
                        <button class="btn btn-outline-light" type="submit">DOWNLOAD</button>
                    </form>

                    <div class="row">
                        <div class="col-md-10">
                            <a href="DashBoard.jsp" class="btn btn-primary btn-outline-lg active" role="button" aria-pressed="true">Home</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    
    
    
</body>
</html>