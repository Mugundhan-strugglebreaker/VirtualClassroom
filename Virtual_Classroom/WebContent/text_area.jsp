<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VIRTUAL CLASSROOM</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="sendmail.css">
    </head>
    <%
        String student_email=request.getParameter("student_email");
        String student_name=request.getParameter("student_name");
        session.setAttribute("student_email", student_email);
        session.setAttribute("student_name", student_name);
        
    %>
    <body>
    <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <h1 class="text-center">TO <%=student_name %></h1>
                    <form action="Student_Email" id="usrform">
                        <div class="row">
                            <label for="" class="label control-label">SUBJECT</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" type="text" name="subject" id="subject" required>
                            </div>
                        </div>
    
                        <div class="row">
                            <label for="" class="label control-label">COMMENT</label>
                            <div class="spc"></div>
                            <div class="col-md-10">
                                <textarea name="description" id="description" cols="45" rows="6" required></textarea>
                            </div>
                        </div>

                        <button class="btn btn-outline-light" type="submit">SEND MAIL</button>
                    </form>

                    <div class="row">
                        <div class="col-md-10">
                            <a href="#" class="btn btn-primary btn-outline-lg active" role="button" aria-pressed="true">Home</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script src="./assets/js/bootstrap.min.js"></script>
	    <script src="./assets/js/jquery.min.js"></script>
    </body>
</html>