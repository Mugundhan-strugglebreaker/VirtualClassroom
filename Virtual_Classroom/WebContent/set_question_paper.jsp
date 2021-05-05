

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
<link rel="stylesheet" type="text/css" href="question.css">
</head>
<body>
<%
String email=(String)session.getAttribute("email");
try
{
Connection con=Database_Connection.getConnection();
String query="select subject from teachers where email=?";
PreparedStatement pst=con.prepareStatement(query);
pst.setString(1, email);
ResultSet rs=pst.executeQuery();



%>
<div class="container">
            <div class="row">
                <div class="col-md-5">
                    <h1 >CREATE QUESTION PAPER</h1>
                    <form method="post" action="set_question_paper" >
                        <div class="row">
                            <div class="move">
                                <label for="" class="label control-label">SUBJECT</label>
                                <div class="spc"></div>
                                <select class="form-select" name="opt" aria-label="Default select example" required>
                                    <option selected>Open this select menu</option>
                                    <%while(rs.next()) { %>
   <option  value='<%=rs.getString("subject") %>'><%=rs.getString("subject") %></option>
<% }%>
                                </select>
                            </div>
                        </div>
   
                        <div class="row">
                            <label for="" class="label control-label">EXAM NAME</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" type="text" name="exam_name" id="exam_name" required>
                            </div>
                        </div>
   
                        <div class="row">
                            <label for="" class="label control-label">NO OF QUESTIONS</label>
                            <div class="col-md-10">
                                <input class="form-control" type="number" name="no_of_questions" id="no_of_questions" required>
                            </div>
                        </div>

                        <div class="row">
                            <label for="" class="label control-label">START TIME</label>
                            <div class="col-md-10">
                                <input class="form-control" type="datetime-local" name="start_time" id="start_time" required>
                            </div>
                        </div>

                        <div class="row">
                            <label for="" class="label control-label">END TIME</label>
                            <div class="col-md-10">
                                <input class="form-control" type="datetime-local" name="end_time" id="end_time" required>
                            </div>
                        </div>

                        <button class="btn btn-outline-light" type="submit">SUBMIT</button>
                    </form>

                    <div class="row">
                        <div class="col-md-10">
                            <a href="DashBoard.jsp" class="btn btn-primary btn-outline-lg active" role="button" aria-pressed="true">Home</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
  <%
 
}
catch(Exception e)
{
System.out.println("Error: "+e);
}
%>
        <script src="bootstrap.min.js"></script>
   <script src="./assets/js/jquery.min.js"></script>
</body>
</html>