<%-- 
    Document   : demo
    Created on : 7 Feb, 2021, 6:07:26 PM
    Author     : N.MEIYAPPAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <title>VIRTUAL CLASSROOM</title>
        <link rel="stylesheet" type="text/css" href="bootstrap1.min.css">
        <link rel="stylesheet" type="text/css" href="Upload.css">
    </head>
    <body>
        <div style="padding:5px; color:red;font-style:italic;">
       ${errorMessage}
    </div>
    <script> 
        function vali_text()
        {
             var y = document.getElementById("description").value;
           if(y.length<=0)
           {
               alert("description must not be empty");
               return false;
           }
            
            var x=document.getElementById("file");
            if ('files' in x) 
            {
                if(x.files.length==0)
                {
                    alert("please select file");
                    return false;
                }
                else
                {
                    //alert("file selected");
                    return true;
                }
            }
//            alert("description must not be empty");
//            return false;
        }
    </script>
    
   <%
   	
    String email=(String)session.getAttribute("email");
    String subject=request.getParameter("subject");
    String code=request.getParameter("code");
    session.setAttribute("subject", subject);
    session.setAttribute("code", code);
//    
//   	out.println("<h1>Welcome to Upload File</h1>");
//   	
//   	out.println("<center><h1>"+subject+"</h1></center>");
//   	out.println("<center><h1>"+code+"</h1></center>");
   
   %>

        <div class="container">
            <div class="col-md-5">

                <div class="row">
                    <hr>
                    <div class="col-md-10">
                        <h3 class=" up text-center text-white">UPLOAD FILE</h3>
                    </div>
                </div>
                    
                <hr>

                <div class="row">
                    <h1 class="text-center"><%=subject%></h1>
                </div>


                <hr>

                <form method="post" action="${pageContext.request.contextPath}/UploadtoDB"
                      enctype="multipart/form-data" onsubmit="return vali_text()">

                    <div class="row">
                        <div class="col-md-10">
                            <input type="file" class="form-control" id="file" name="file"  />
                        </div>
                    </div>

                    <hr>

                    <div class="row lm">
                        <label for="" class="label control-label">DESCRIPTION</label>
                        <div class="col-md-10">
                            <textarea name="description" id="description" cols="45" rows="6" ></textarea>
                        </div>
                    </div>

                    <button class="btn btn-outline-light" type="submit">SUBMIT</button>
                </form>
                
        <a class="btn btn-outline-light btn-outline-lg " href="show_students_new.jsp" >STUDENTS</a>
    
                <div class="row">
                    <div class="col-md-10">
                        <a href="DashBoard.jsp" class="btn btn-primary btn-outline-lg active" role="button" aria-pressed="true">BACK</a>
                    </div>
                </div>
                <hr>
    
            </div>
        </div>

        
    </body>
</html>