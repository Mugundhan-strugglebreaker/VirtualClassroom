<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> VIRTUAL CLASSROOM</title>
<link rel = "stylesheet" type="text/css" href="Login_Style.css">
</head>
<body>
	<h1>LOGIN</h1>
      <form method="post" action="Login">
       <table>
        <tr>
         <td>Email :</td> <td><input type="text" name="email" id="email" required="required"></td>
        </tr>
        <tr>
         <td>Password :</td> <td><input type="password" name="pass" id="pass" required="required"></td>
        </tr>
        <tr>
         <td><input type="submit" value="Login"><br></td>
        </tr>
       </table>
      </form>
      <a href="http://localhost:8080/Virtual_Classroom/Register.jsp">New To Classroom? SignUp</a>
</body>
</html>