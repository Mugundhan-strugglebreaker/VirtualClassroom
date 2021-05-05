<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIRTUAL CLASSROOM</title>
<link rel = "stylesheet" type="text/css" href="UploadFile.css">
</head>
<body>
<div style="padding:5px; color:red;font-style:italic;">
       ${errorMessage}
    </div>
    
   <%
   	
    String email=(String)session.getAttribute("email");
    String subject=request.getParameter("subject");
    String code=request.getParameter("code");
    session.setAttribute("subject", subject);
    session.setAttribute("code", code);
    
   	out.println("<h1>Welcome to Upload File</h1>");
   	
   	out.println("<center><h1>"+subject+"</h1></center>");
   	out.println("<center><h1>"+code+"</h1></center>");
   
   %>
    <h2>Upload Files</h2>
 
    <form method="post" action="${pageContext.request.contextPath}/UploadtoDB"
        enctype="multipart/form-data">
        
        <h1>Select file to upload:</h1>
        
        
   		<br>
        <input type="file" name="file"  />
        <br />
        
        <h1>Description:</h1>
        <br />
        <input type="text" name="description" size="100" />
        <br />
        <br />
        <input type="submit" value="Upload" />
    </form>

</body>
</html>