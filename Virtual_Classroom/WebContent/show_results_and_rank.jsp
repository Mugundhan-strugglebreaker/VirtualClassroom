<%-- 
    Document   : show_results_and_rank
    Created on : 31 Jan, 2021, 2:16:07 AM
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
        <link rel="stylesheet" type="text/css" href="rank.css">
    </head>
<body>

<%String res=request.getParameter("selectvalue");

%>

<div class="spc"></div>
<div class="container dic">
                <header>
                    <div class="container bg-dark">
                        <h3 class="text-white"><%=res %></h3>
                    </div>
                </header>
               
                <%
                String arr[]=new String[100];
                int ind=0;
                
  if(res!=null)
  {
  try
  {
   Connection con=Database_Connection.getConnection();
    String query="select * from results where qcode=?";
    PreparedStatement preparedStatement=con.prepareStatement(query);
    preparedStatement.setString(1, res);
    ResultSet rs=preparedStatement.executeQuery();
    int i=0,k=1;
    int total=0;
    %>
   
    <div class="spc"></div>
               
            <h2 class="text-center text-white">RESULT</h2>
                <table class="table table-striped table-dark">
                    <thead>
                      <tr>
                        <th scope="col">IDNO</th>
                        <th scope="col">NAME</th>
                        <th scope="col">MARKS</th>
                        <th scope="col">TOTAL MARKS</th>
                      </tr>
                    </thead>
                    <%
     while(rs.next())
     {
     i++;
     
     total=Integer.parseInt(rs.getString("total"));
     arr[ind++]=rs.getString("email");
     %>
                    <tbody>
                      <tr>
      <th scope="row"><%=k %></th>
      <td><%=rs.getString("name") %></td>
      <td><%=rs.getString("mark") %></td>
      <td><%=rs.getString("total") %></td>
      </tr>
                    <%  
                    k++;
     }
      
     String string[]=res.split("_");
     //out.println("<h1>"+string[0]+"</h1>");
     String stud_query="select email from students where code=?";
     PreparedStatement stud_pre=con.prepareStatement(stud_query);
     stud_pre.setString(1, string[0]);
     ResultSet result=stud_pre.executeQuery();
     while(result.next())
     {
         
         String email_stud=result.getString("email");
         int flag=0;
         for(int x=0;x<ind;x++)
         {
             if(email_stud.equals(arr[x]))
             {
                 flag=1;
                 break;
             }
         }
         if(flag==0)
         {
              
              String name_query="select name from users where email=?";
              PreparedStatement name_pre=con.prepareStatement(name_query);
              name_pre.setString(1, email_stud);
              ResultSet r_names=name_pre.executeQuery();
              while(r_names.next())
              {
                  //out.println(r_names.getString("name"));
                    %>
                     <tr>
      <th scope="row"><%=k%></th>
      <td><%=r_names.getString("name") %></td>
      <td>NOT ATTEMPTED </td>
      <td><%=total%></td>
      </tr>
              
                <% 
                k++;
              }
              
         }
     }
     
     
     
     
     
    %>
    </tbody>
            </table>
<div class="spc"></div>
<h2 class="text-center text-white">RANK</h2>
                <table class="table table-striped table-dark">
                    <thead>
                      <tr>
                        <th scope="col">RANK</th>
                        <th scope="col">NAME</th>
                        <th scope="col">MARKS</th>
                        <th scope="col">TOTAL MARKS</th>
                      </tr>
                    </thead>
                      <%  
    int mark[]=new int[i];
    String name[]=new String[i];
    int j=0;
  ResultSet rs1=preparedStatement.executeQuery();
    while(rs1.next())
    {
    mark[j]=Integer.parseInt(rs1.getString("mark"));
    name[j]=rs1.getString("name");
    j++;
    }
    for(int x=0;x<i;x++)
    {
    for(int y=x+1;y<i;y++)
    {
    if(mark[x]<mark[y])
    {
    int temp=mark[x];
    mark[x]=mark[y];
    mark[y]=temp;
   
    String t=name[x];
    name[x]=name[y];
    name[y]=t;
    }
    }
    }
   for(int x=0;x<i;x++)
    {%>
    <tbody>
     <tr>
      <th scope="row"><%=x+1 %></th>
      <td><%=name[x] %></td>
      <td><%=mark[x] %></td>
      <td><%=total %></td>
      </tr>
   
   <%
    }
    %>
   
   
           </tbody>
            </table>
           
            <%
   
   
  }
  catch(Exception e)
  {
 
  }
 
 
  }
 
 
 
 
               
  %>
  <div class="spc"></div>
  <div class="row">
<div class="col-md-10">
<a href="http://localhost:8080/Virtual_Classroom/DashBoard.jsp" class="btn btn-primary btn-outline-lg active" role="button" aria-pressed="true">BACK</a>
</div>
</div>  
  </div>
 
                 
<script src="bootstrap.min.js"></script>
   <script src="jquery.min.js"></script>
</body>
</html>
