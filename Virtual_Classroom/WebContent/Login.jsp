<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> VIRTUAL CLASSROOM</title>
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<link rel = "stylesheet" type="text/css" href="login.css">
</head>
<body>
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
				<div class="row">
					<div class="col-md-10">
						<h3 class="text-left text-white">LOGIN FORM</h3>
					</div>
				</div>
				<hr>

				<form  method="post" action="Login">

					<div class="row">
						<label for="" class="label control-label">EMAIL</label>
						<div class="col-md-10">
							<input type="text" class="form-control" type="email" name="email" id="email" required>
						</div>
					</div>

					<div class="row">
						<label for="" class="label control-label">PASSWORD</label>
						<div class="col-md-10">
							<input class="form-control" type="password" name="pass" id="pass" required>
						</div>
					</div>

					<button class="btn btn-outline-light" type="submit">LOGIN</button>
				</form>

				<div class="row">
					<div class="col-md-10">
						<a href="http://localhost:8080/Virtual_Classroom/Register.jsp" class="btn btn-primary btn-outline-lg active" role="button" aria-pressed="true">New To Classroom? SignUp</a>
					</div>
				</div>

			</div>

		</div>
	</div>

	<script src="F:\smaple bootstrap\js\bootstrap.min.js"></script>
	<script src="F:\smaple bootstrap\js\jquery.min.js"></script>
</body>
</html>