

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Database_Objects.Database_Connection" %>
 <%@ page import="java.sql.*" %>
    	    
 <%
 	String email=(String)session.getAttribute("email");
 	String name=null,mobile=null,password=null;
 	try
 	{
 		Connection con=Database_Connection.getConnection();
		String query="select * from users where email=?";
		
		PreparedStatement pstmt=con.prepareStatement(query);
        pstmt.setString(1,email);
        ResultSet rs=pstmt.executeQuery();
        
        while(rs.next())
        {
        	name=rs.getString("name");
        	mobile=rs.getString("mobile");
        	password=rs.getString("password");
        }
        
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
        <title>VIRTUAL CLASSROOM</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="show.css">
    </head>
    <body>
        
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <h1 class="text-center">SHOW PROFILE</h1>
                    <form>
                        <div class="row">
                            <label for="" class="label control-label">NAME</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control text-dark" type="text" name="name" id="name" value='<%=name %>' readonly>
                            </div>
                        </div>
    
                        <div class="row">
                            <label for="" class="label control-label">EMAIL</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control text-dark" type="email" name="email" id="email" value='<%=email %>' readonly>
                            </div>
                        </div>
    
                        <div class="row">
                            <label for="" class="label control-label">PASSWORD</label>
                            <div class="col-md-10">
                                <input class="form-control text-dark" type="text" name="pass" id="pass" value='<%=password %>' readonly>
                            </div>
                        </div>
    
                        <div class="row">
                            <label for="" class="label control-label">MOBILE</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control text-dark" type="text" name="mobile" id="mobile" value='<%=mobile %>' readonly>
                            </div>
                        </div>
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