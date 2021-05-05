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
 	
 out.println("<h1>Welcome</h1>");
 String email="18euit084@skcet.ac.in";
 try
 {
 
   Connection con=Database_Connection.getConnection();
   String query="select code from teachers where email=?";
   PreparedStatement preparedStatement=con.prepareStatement(query);
   preparedStatement.setString(1, email);
   ResultSet rs=preparedStatement.executeQuery();
   %>
   <form action="NewFile1.jsp">
    <select name="selectvalue">
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
    <input type="submit" value="Submit">
    </form>
    <%
   
 }
 catch(Exception e)
 {
	 
 }
   
 
 
 %>

</body>
</html>