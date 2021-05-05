<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="rank.css">
    </head>
<body>
  <%
  String no_of_ques=request.getParameter("no_of_questions");
  int no=Integer.parseInt(no_of_ques);
  %>
   <div class="spc"></div>
  <div class="container">
                <header>
<!--                    <div class="container-fluid bg-dark">
                        <h3 class="text-white">WELCOME #NAME</h3>
                    </div>-->
                </header>
            <h2 class="text-center text-white">QUESTION PAPER</h2>
             <form method="post" action="fill_question">
                <table class="table table-striped table-dark">
                    <thead>
                      <tr>
  <tr>
  <th scope="col">S.NO</th>
  <th scope="col">QUESTIONS</th>
  <th scope="col">OPTION A</th>
  <th scope="col">OPTION B</th>
  <th scope="col">OPTION C</th>
  <th scope="col">OPTION D</th>
  <th scope="col">ANSWER</th>
  </tr>
  </thead>
  <tbody>
  <%
  for(int i=0;i<no;i++)
  {%>
  <tr>
  <td scope="row"><%=i+1 %></td>
  <td> <input type="text" id="question" name="question" required> </td>
  <td> <input type="text" id="option1" name="option1" required> </td>
  <td> <input type="text" id="option2" name="option2" required> </td>
  <td> <input type="text" id="option3" name="option3" required> </td>
  <td> <input type="text" id="option4" name="option4" required> </td>
  <td> <input type="text" id="answer" name="answer" required> </td>
  </tr>
  <%}
  %>
  </tbody>
  </table>
  <button class="btn btn-outline-light" type="submit">SET QUESTIONS</button>
  </form>
  <div class="spc" ></div>
  <div class="row">
                        <div class="col-md-10">
                            <a href="DashBoard.jsp" class="btn btn-primary btn-outline-lg active" role="button" aria-pressed="true">Home</a>
                        </div>
                    </div>
              </div>
 
 
</body>
</html>
