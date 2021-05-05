<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="Database_Objects.Database_Connection" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.sql.Timestamp" %>
    <%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table border="1">
<tr><th>S.No</th><th>TestCode</th><th>Start time</th><th>End time</th></tr>
<%
	String email="18euit084@skcet.ac.in";
	out.println("<h1>Welcome "+email+"</h1>");
	int sno=1;
	ArrayList<String> al=new ArrayList<String>();
    try
    {
    	Connection con=Database_Connection.getConnection();
    	String query="select code from students where email=?";
    	PreparedStatement preparedStatement=con.prepareStatement(query);
    	preparedStatement.setString(1, email);
    	ResultSet rs=preparedStatement.executeQuery();
    	while(rs.next())
    	{
    		//out.println("<h1>QBCODE:"+rs.getString("code")+"</h1><br>");
    		String str=rs.getString("code");
    		str=str+"_qbinfo";
    		String query_in="select * from "+str;
    		PreparedStatement preparedStatement2=con.prepareStatement(query_in);
    		ResultSet rs1=preparedStatement2.executeQuery();
    		while(rs1.next())
    		{
    			// out.println("<h1>"+rs1.getString("testcode")+"--->"+rs1.getTimestamp("start_time")+"--->"+rs1.getTimestamp("end_time")+"</h1><br>");
    			 
    			 Timestamp end_time=rs1.getTimestamp("end_time");
    			 
    			 Timestamp original_st_time=rs1.getTimestamp("start_time");
    			 //getting start time from database and 5 min to the start time
    			 Timestamp starttime=rs1.getTimestamp("start_time");
    			 long now=starttime.getTime();
    			 long nowPlus5Minutes = now + TimeUnit.MINUTES.toMillis(5);
    			 
    			 // convertion start+5min to Timestamp
    	         Timestamp start_time=new Timestamp(nowPlus5Minutes);
    			 
    			 //getting current time
    			 long millis=System.currentTimeMillis();
    			 Timestamp time=new Timestamp(millis);
    		     
    			 SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-DD HH.mm");
    		     
    			 //string of current time
    			 String sdformat=sdf.format(time);
    		     
    			 //string of start_time+5min
    		     String st_time=sdf.format(start_time);
    			 
    			 String or_st_time=sdf.format(original_st_time); 
    		     
    			 String en_time=sdf.format(end_time);
    			 
    		 //    out.println(st_time+"--->");
    		   //  out.println(en_time);
    		     
    		     if(sdformat.compareTo(en_time)>=1)
    		     {
    		       //out.println("<h1>Test yet not started</h1>");
    		    	 //out.println("<h1>Time exceeded</h1>");
	    		       
    		     }
    		     else
    		     {
    		    	  %>
    		    	  
    		    	  <tr><td><%=sno %></td><td><%=rs1.getString("testcode") %></td><td><%=rs1.getTimestamp("start_time") %></td><td><%=rs1.getTimestamp("end_time") %></td></tr>
    		    	  <%
    		    	  
    		    	   if(sdformat.compareTo(or_st_time)>=1 && sdformat.compareTo(st_time)<1 )
	 		           {
    		    		   al.add(rs1.getString("testcode"));
	 		        		//out.println("<h1>Ur are allowed to take test</h1>");
	 		           }
	     		       else if(sdformat.compareTo(st_time)>=1)
	     		       {
	     		    		//out.println("<h1>Ur are late to test not allowed to take test</h1>");
	     		       }
	     		       else
	     		       {
	     		    	   //out.println("<h1>Test yet not started </h1>");
	     		       }
    		    	  sno++;
    		    
    		     }
    		        	
    		        	
    		        
    		       
    			
    		}
    		
    		
    		
    	}
    	
    }
    catch(Exception e)
    {
    	
    }

   // out.println(al);
%>


</table>

<form action="NewFile.jsp">
<select name="select_code" required>
<option value="">Select testcode</option>
<%
  for(int i=0;i<al.size();i++)
  {%>
    <option value='<%=al.get(i) %>'><%=al.get(i) %></option>
  <% 
	  
  }

%>
</select>
<input type="submit" value="Take test">
</form>

</body>
</html>