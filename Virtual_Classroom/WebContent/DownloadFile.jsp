<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Database_Objects.Database_Connection" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIRTUAL CLASSROOM</title>
<link rel = "stylesheet" type="text/css" href="UploadFile.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">

</head>

<body>
<div style="padding:5px; color:red;font-style:italic;">
       ${errorMessage}
    </div>
    
   <%
   	
    String email=(String)session.getAttribute("email");
    String subject=request.getParameter("subject");
    String code=request.getParameter("code");
    session.setAttribute("subject", subject);
    session.setAttribute("code", code);
    
   	out.println("<h1>Welcome to Download File</h1>");
   	
   	out.println("<center><h1>"+subject+"</h1></center>");
   	out.println("<center><h1>"+code+"</h1></center>");
   	Connection con=null;
   	try
   	{
	   	con=Database_Connection.getConnection();
	   	
	   	String  query="select * from "+code;
	   	PreparedStatement preparedStatement=con.prepareStatement(query);
	   	ResultSet rs=preparedStatement.executeQuery();
	   
	   	out.println("<center><table id='table' border style='padding:10px'>");
	   	out.println("<tr><th>Id</th><th>File name</th><th>Description</th><th>Download</th></tr>");%>
	<%    while(rs.next())
	    {%>
	    	
	    	<tr>
	    	   <td><%=rs.getString("id") %></td>
	    	    <td><%=rs.getString("filename") %></td>
	    	     <td><%=rs.getString("description") %></td>
	    	     <td align="center" id=<%=rs.getString("id")  %> onclick="func(this.id)"><i class="fa fa-download" aria-hidden="true"/></td>
	    
	    	   
	    	
	    	</tr>
	    	
	   <% }
	    out.println("</table></center>");
   	}
   	catch(Exception e)
   	{
   		
   	}
   	
   	
   
   %>
 
     <script>
    
        var table = document.getElementById('table');

        function func(ele)
        {
        	window.location="http://localhost:8080/Virtual_Classroom/DownloadFromServlet?id="+ele;
        	
  
        }

         </script>

</body>
</html>