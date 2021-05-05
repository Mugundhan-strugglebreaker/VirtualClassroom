
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
 	String email=(String)session.getAttribute("email");
 	//out.println(email);
 %>
 <%@ page import="Database_Objects.Database_Connection" %>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIRTUAL CLASSROOM</title>
<link rel = "stylesheet" type="text/css" href="DashBoard.css">
</head>
<body>
	<ul>
		<li><a href="http://localhost:8080/Virtual_Classroom/Join_class.jsp">Join Class</a></li>
		<li><a href="http://localhost:8080/Virtual_Classroom/Create_Class.jsp">Create Class</a></li>
	</ul><br><br>
	<ul>
	  <li><a href="http://localhost:8080/Virtual_Classroom/Show_Profile.jsp">Show Profile</a></li>
	  <li><a href="http://localhost:8080/Virtual_Classroom/Update_Profile.jsp">Update Profile</a></li>
	  <li><a href="http://localhost:8080/Virtual_Classroom/Logout.jsp">Logout</a></li>
	</ul>
	<%! 
		
	
	%>
	<%
			out.println("<h1>Welcome "+email+"</h1>");
			Connection con=Database_Connection.getConnection();
			boolean teacher=false;
			boolean student=false;
			
					try
					{
						
					String query="select 1 from teachers where email=?";
					PreparedStatement preparedStatement=con.prepareStatement(query);
					preparedStatement.setString(1, email);
					ResultSet rs=preparedStatement.executeQuery();
				//	out.println(rs.next());
				
					teacher=rs.next();
					
					String query1="select 1 from students where email=?";
					PreparedStatement preparedStatement1=con.prepareStatement(query1);
					preparedStatement1.setString(1, email);
					ResultSet rs1=preparedStatement1.executeQuery();
				//	out.println(rs1.next());
					student=rs1.next();
					
					
						
						
					}
					catch(Exception e)
					{
						out.println(e);
					}
					
			if(teacher)
			{
				out.println("<h1>Your role as a Teacher</h1>");
				try
				{
						out.println("<a href=''>Create Test</a>");	
						String class_query="select * from teachers where email=?";
						PreparedStatement prepare_class=con.prepareStatement(class_query);
						prepare_class.setString(1, email);
						ResultSet rs=prepare_class.executeQuery();
						
							
						while(rs.next())
						{
							out.println("<div class='forwardUpload' onclick='teacher_detail(this)'>");	
							out.println("<br>====================================");
							out.println("<h3>"+rs.getString("subject")+"</h3>");
							out.println("<h3>"+rs.getString("code")+"</h3><br>");
							out.println("====================================");
							out.println("</div><br><br>");
						}
						
						
						
						
				}
				catch(Exception e)
				{
					
				}
				
			}
			if(student)
			{
				out.println("<h1>Your role as a Student</h1>");
				try
				{
						String class_query="select * from students where email=?";
						PreparedStatement prepare_class=con.prepareStatement(class_query);
						prepare_class.setString(1, email);
						ResultSet rs=prepare_class.executeQuery();
						
						
						while(rs.next())
						{
							out.println("<div class='forwardDownload' onclick='student_details(this)'>");	
							out.println("<br>====================================");
							out.println("<h3>"+rs.getString("subject")+"</h3>");
							out.println("<h3>"+rs.getString("code")+"</h3><br>");
							out.println("====================================");
							out.println("</div><br><br>");
						}
							
						
						
						
				}
				catch(Exception e)
				{
					
				}
			}
			
			
	
	%>
	<script>
	function teacher_detail(ele)
	{

		var x=ele.children;
		window.location="http://localhost:8080/Virtual_Classroom/UploadFile.jsp?subject="+x[1].innerText+"&code="+x[2].innerText;
	}
	function student_details(ele)
	{
		var x=ele.children;
		// alert(x[1].innerText);
		//  alert(x[2].innerText);
		  window.location="http://localhost:8080/Virtual_Classroom/DownloadFile.jsp?subject="+x[1].innerText+"&code="+x[2].innerText;
		  //location.replace("NewFile.jsp");
	}
	
	</script>
</body>
</html>