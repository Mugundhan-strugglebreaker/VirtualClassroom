<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<head>
    <title>VIRTUAL CLASSROOM</title>
    <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
    <link rel = "stylesheet" type="text/css" href="Register.css">
    <script type="text/javascript" src="Validation_registration.js"></script>
    <script>
        
        function test_email(str)
        {
            var xmlhttp;
	    if (window.XMLHttpRequest) 
	    {
	        xmlhttp = new XMLHttpRequest();
	    } 
	   
	    xmlhttp.onreadystatechange = function() 
	    {
	    	
	        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
	        {
	            var obj=xmlhttp.responseText;
	          //  console.log(obj);
	            
	            if(parseInt(obj)==1)
	            {
	            	//document.getElementById("as").innerHTML=str
	            	console.log(obj);
	            	var x=document.getElementById("email");
	            	x.classList.add("correct");
	            	x.classList.remove("incorrect");
	            }
	            else
            	{
	            	console.log(obj);
	            	var x=document.getElementById("email");
	            	x.classList.add("incorrect");
	            	x.classList.remove("correct");
            	
            	}


	        }


	    }
	    xmlhttp.open("POST", "RegisterEmailValidate?email=" +str, true);
	    xmlhttp.send(null);
        }
    </script>
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
					<div class="col-md-10 hed">
						<h3 class="text-left text-white">REGISTRATION FORM</h3>
					</div>
				</div>
				<hr>

                                <form  method="post" action="Registration" onsubmit="return Validate()">
					<div class="row">
						<label for="" class="label control-label">NAME</label>
						<div class="col-md-10">
							<input type="text" class="form-control" type="text" name="name" id="name" required>
						</div>
					</div>

					<div class="row">
						<label for="" class="label control-label">EMAIL</label>
						<div class="col-md-10">
                                                    <input type="text" class="form-control" type="text" name="email" id="email" onkeyup="test_email(this.value)" required>
						</div>
					</div>

					<div class="row">
						<label for="" class="label control-label">PASSWORD</label>
						<div class="col-md-10">
							<input class="form-control" type="password" name="pass" id="pass" required>
						</div>
					</div>

					<div class="row">
						<label for="" class="label control-label">REPEAT PASSWORD</label>
						<div class="col-md-10">
							<input class="form-control" type="password" name="cpass" id="cpass" required>
						</div>
					</div>

					<div class="row">
						<label for="" class="label control-label">MOBILE</label>
						<div class="col-md-10">
							<input type="text" class="form-control" type="text" name="mobile" id="mobile" required>
						</div>
					</div>

					<button class="btn btn-outline-light" type="submit">REGISTER</button>
				</form>

				<div class="row">
					<div class="col-md-10">
						<a href="http://localhost:8080/Virtual_Classroom/Login.jsp" class="btn btn-primary btn-outline-lg active" role="button" aria-pressed="true">Already Have a Account ? SignIn</a>
					</div>
				</div>

			</div>

		</div>
	</div>

	<script src="F:\smaple bootstrap\js\bootstrap.min.js"></script>
	<script src="F:\smaple bootstrap\js\jquery.min.js"></script>
</body>