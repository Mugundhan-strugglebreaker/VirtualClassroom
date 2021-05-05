<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<H1>Welcome  </H1>
	
	<ul>
		<li><a href="http://localhost:8080/Virtual_Classroom/set_question_paper.jsp">Set Question Paper</a></li>
		<li><a href="http://localhost:8080/Virtual_Classroom/Rank_new.jsp">view Result</a></li>
		
		<li><a href="http://localhost:8080/Virtual_Classroom/edit_question_paper.jsp">Edit</a></li>
		<li><a href="http://localhost:8080/Virtual_Classroom/print_as_excel.jsp">Print as Excel</a></li>
	</ul>
	<a href="DashBoard.jsp">Back</a>
	
</body>
</html>-->



<!DOCTYPE html>
<html>
<head>
    <title>VIRTUAL CLASSROOM</title>
    <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="test_option.css">
</head>
<body>

    
    <%
	 String name=(String)session.getAttribute("name");
    %>
        
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h1 class="text-left">VIRTUAL CLASSROOM</h1>
                <p class="text-left">
                    Developing a virtual classroom system to promote a greater count of students to splurge
                    into the field of Education. It integrates the benefits of a physical classroom with the
                    convenience of a no-physical-bar virtual learning environment. The clients can register
                    using their email and password that helps them to get connected to the server.
              </p>
            </div>

            <div class="col-md-5">
                <div class="mic">
                    <div class="row">
                        <div class="col-md-10">
                            <div class="spc"></div>
                            <h2 class="text-center text-light">WELCOME <%=name %></h2>
                        </div>
                    </div>
                    <div class="mov">
                        <div class="row">
                                <a href="http://localhost:8080/Virtual_Classroom/set_question_paper.jsp" class="btn btn-primary active" role="button">SET QUESTION PAPER</a>
                        </div>
                        <div class="row">
                                <a href="http://localhost:8080/Virtual_Classroom/Rank_new.jsp" class="btn btn-primary active" role="button">VIEW RESULT</a>
                        </div>
                        <div class="row">
                                <a href="http://localhost:8080/Virtual_Classroom/edit_question_paper.jsp" class="btn btn-primary active" role="button">EDIT QUESTION PAPER</a>
                        </div>
                        <div class="row">
                                <a href="http://localhost:8080/Virtual_Classroom/print_as_excel.jsp" class="btn btn-primary active" role="button">PRINT AS EXCEL</a>
                        </div>

                        <div class="row">
                            <div class="jib">
                                <div class="col-md-10">
                                    <a href="DashBoard.jsp" class="btn btn-primary btn-outline-lg active" role="button" aria-pressed="true">Home</a>
                                    <div class="spc"></div>
                                    <div class="spc"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script src="./assets/js/bootstrap.min.js"></script>
    <script src="./assets/js/jquery.min.js"></script>
</body>
</html>



<!--edit_question_paper-->