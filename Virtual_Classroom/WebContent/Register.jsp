<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<head>
    <title>VIRTUAL CLASSROOM</title>
    <link rel = "stylesheet" type="text/css" href="Register_Style.css">
    <script type="text/javascript" src="Registration_Validation.js"></script>
</head>
<body>
    <h1>REGISTRATION</h1>
      <form method="post" action="Registration" onsubmit="return Validate();">
       <table>
        <tr>
         <td>Name :</td> <td><input type="text" name="name" id="name" required="required"></td>
        </tr>
        <tr>
         <td>Email :</td> <td><input type="email" name="email" id="email" required="required"></td>
        </tr>
        <tr>
         <td>Password :</td> <td><input type="password" name="pass" id="pass" required="required"></td>
        </tr>
        <tr>
         <td>Confirm Password :</td> <td><input type="password" name="cpass" id="cpass" required="required"><br>
        </tr>
        <tr>
         <td>Mobile No :</td> <td><input type="text" name="mobile" id="mobile" required="required"></td>
        </tr>
        <tr>
         <td><input type="submit" value="Register"><br></td>
        </tr>
       </table>
      </form>
      <a href="http://localhost:8080/Virtual_Classroom/Login.jsp">Already Having a Classroom? SignIn</a>
</body>