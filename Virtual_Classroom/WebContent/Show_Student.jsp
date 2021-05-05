<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="Database_Objects.Database_Connection" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

  	<%
  	try
  	{
  	  String code="18maths123";
  	  Connection con=Database_Connection.getConnection();
  	  String query_stud="select * from students where code=?";
  	  PreparedStatement prepared_Statement=con.prepareStatement(query_stud);
  	  prepared_Statement.setString(1,code);
  	  ResultSet rs=prepared_Statement.executeQuery();
  	  %>
  	  <center>
  	  <h1>VIRTUAL CLASSROOM</h1>
  	  <h2><%=code %></h2>
  	  </center>
  	  <center>
  	  
  	  <table border="1">
  	  <tr><th>SNO</th><th>Name</th><th>Email</th></tr>
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
  		// out.println("<h1>"+rs1.getString("name")+"</h1>");
  		 // out.println("==========================<br>");
  		  %>
  		       <tr><td><%=i %></td><td><%=rs1.getString("name") %></td><td><%=rs.getString("email") %></td></tr>
  		  <% 
  		  i++;
  		  
  	  }
  	  %>
  	  </table>
  	  </center>
  	  <%
  	}
  	catch(Exception e)
  	{
  		out.println(e);
  	}
  	
  	
  	%>

</body>
</html>