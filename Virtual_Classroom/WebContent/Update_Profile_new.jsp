
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
<html>
    <head>
        <title>VIRTUAL CLASSROOM</title>
         <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="show.css">
        <script type="text/javascript" src="Update_Validation.js"></script>
    </head>
    <body>
        
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <h1 class="text-center">UPDATE PROFILE</h1>
                    <form method="post" action="Update" onsubmit="return Validate();">
                        <div class="row">
                            <label for="" class="label control-label">NAME</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" type="text" name="name" value='<%=name %>' id="name" required>
                            </div>
                        </div>
    
                        <div class="row">
                            <label for="" class="label control-label">EMAIL</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" type="email" name="email" value='<%=email%>' id="email" required>
                            </div>
                        </div>
    
                        <div class="row">
                            <label for="" class="label control-label">PASSWORD</label>
                            <div class="col-md-10">
                                <input class="form-control" type="password" name="pass" value='<%=password %>' id="pass"  required>
                            </div>
                        </div>
    
                        <div class="row">
                            <label for="" class="label control-label">MOBILE</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" type="text" name="mobile" value='<%=mobile %>' id="mobile"  required>
                            </div>
                        </div>

                        <button class="btn btn-outline-light" type="submit">UPDATE</button>
                    </form>

                    <div class="row">
                        <div class="col-md-10">
                            <a href="DashBoard.jsp" class="btn btn-primary btn-outline-lg active" role="button" aria-pressed="true">Home</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/jquery.min.js"></script>
    </body>
</html>