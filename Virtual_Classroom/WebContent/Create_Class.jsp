<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIRTUAL CLASSROOM</title>
<link rel = "stylesheet" type="text/css" href="Create_Class.css">
</head>
<body>
	<h1>CREATE CLASS</h1>
	<form method="post" action="Create_Class">
		<table>
        <tr>
         <td>Subject :</td><td><input type="text" name="subject" id="subject" required="required"></td>
        </tr>
        <tr>
         <td>Code :</td><td><input type="text" name="code" id="code" required="required"></td>
        </tr>
        <tr>
         <td>Section :</td><td><input type="text" name="section" id="section" required="required"></td>
        </tr>
        <tr>
         <td><input type="submit" value="Create"><br></td>
        </tr>
		</table>
	</form>
</body>
</html>