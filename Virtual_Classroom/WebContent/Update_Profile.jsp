<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="Database_Objects.Database_Connection" %>
 <%@ page import="java.sql.*" %>
    	    
 <%
 	String email=(String)session.getAttribute("email");
 	String password=null;
 	String name=null,mobile=null;
 	int id=0;
 	try
 	{
 		Connection con=Database_Connection.getConnection();
		String query="select * from users where email=?";
		
		PreparedStatement pstmt=con.prepareStatement(query);
        pstmt.setString(1,email);
        ResultSet rs=pstmt.executeQuery();
        
        while(rs.next())
        {
        	id=rs.getInt("id");
        	name=rs.getString("name");
        	mobile=rs.getString("mobile");
        	password=rs.getString("password");
        }
        
        session.setAttribute("id", id);
        session.setAttribute("name", name);
		session.setAttribute("email", email);
		session.setAttribute("password", password);
		session.setAttribute("mobile", mobile);
        
        con.close();
 	}
 	catch(Exception exp)
 	{
 		System.out.println("Exception is "+exp);
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIRTUAL CLASSROOM</title>
<link rel = "stylesheet" type="text/css" href="Profile.css">
<script type="text/javascript" src="Update_Validation.js"></script>
</head>
<body>
	 <h1>UPDATE PROFILE</h1>
      <form method="post" action="Update" onsubmit="return Validate();">
       <table>
        <tr>
         <td>Name :</td> <td><input type="text" name="name" id="name" value='<%=name %>' required="required"></td>
        </tr>
        <tr>
         <td>Email :</td> <td><input type="email" name="email" id="email" value='<%=email %>' readonly="readonly"></td>
        </tr>
        <tr>
         <td>Password :</td> <td><input type="text" name="pass" id="pass" value='<%=password %>' required="required"></td>
        </tr>
        <tr>
         <td>Mobile No :</td> <td><input type="text" name="mobile" id="mobile" value='<%=mobile %>' required="required"></td>
        </tr>
        <tr>
         <td><input type="submit" value="Update"><br></td>
        </tr>
        <tr>
         <td><a href="http://localhost:8080/Virtual_Classroom/DashBoard.jsp">Back</a></td>
        </tr>
       </table>
      </form>
</body>
</html>