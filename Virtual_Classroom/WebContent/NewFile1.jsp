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
  	
  	 String res=request.getParameter("selectvalue");
  	 out.println(res);
  	 if(res!=null)
  	 {
  		 try
  		 {
  		  Connection con=Database_Connection.getConnection();
  		   String query="select * from results where qcode=?";
  		   PreparedStatement preparedStatement=con.prepareStatement(query);
  		   preparedStatement.setString(1, res);
  		   ResultSet rs=preparedStatement.executeQuery();
  		   int i=0;
  		   int total=0;
  		   %>
  		   <h1>Results</h1>
  		     <table border="1">
  		     <tr><th>Id</th><th>Name</th><th>Marks</th><th>Total Marks</th></tr>
  		     
  		   <%
  		    while(rs.next())
  		    {
  		    i++;
  		    total=Integer.parseInt(rs.getString("total"));
  		    %>
  		    	<tr>
  		    	<td><%=rs.getString("id") %></td>
  		    	<td><%=rs.getString("name") %></td>
  		    	<td><%=rs.getString("mark") %></td>
  		    	<td><%=rs.getString("total") %></td>
  		    	</tr>
  		   <%  	
  		    }
  		   %>
  		   </table>
  		   <h1>Ranking Order</h1>
  		   
  		   <table border="1">
  		    <tr><th>Rank</th><th>Name</th><th>Marks</th><th>Total Marks</th></tr>
  		   
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
  		   
  		    <tr>
  		    	<td><%=x+1 %></td>
  		    	<td><%=name[x] %></td>
  		    	<td><%=mark[x] %></td>
  		    	<td><%=total %></td>
  		    	</tr>
  		   
  			  <%
  		   }
  		   %>
  		   </table>
  		   <%
  		   
  		   
  		 }
  		 catch(Exception e)
  		 {
  			 
  		 }
  		 
  		 
  	 }
  	 
  	 
  	 
  	 
  	%>
    <a href="http://localhost:8080/Virtual_Classroom/Rank.jsp">Rank</a>

</body>
</html>