<%-- 
    Document   : startchat
    Created on : 8 Feb, 2021, 3:33:45 PM
    Author     : N.MEIYAPPAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<%
    
    if(session.getAttribute("name")==null)
  response.sendRedirect("Login.jsp");
%>

<html>
    <%String uname=(String)session.getAttribute("name"); %>
    <center> <h1 class="bg-dark text-white vfont">VIRTUAL CLASSROOM DISCUSSION FORUM</h1></center>
    <head>
        <link rel="stylesheet" type="text/css" href="startchatting.css">
        <script type="text/javascript" src="check.js"></script>
        <title>The Chat Room</title>
    <link rel="shortcut icon" href="icon.jpeg" />
    <script>
      <% System.out.println("hai"); %>
      setInterval(reloaddata, 3);
    </script>
    </head>

    <body>
        <p id="result"></p>
        <h3 class="vfont text-white">  Welcome, <%=uname%></h3>
        <div class="logout-div" align="right"><a href="DashBoard.jsp" class="logout-chat">Logout</a></div>
        <div id="list">
            <div id="content">
            </div>
            <input style="display: none" type="text" id="u" value="<%=uname%>">
            
            <textarea id='h' style="width: 94%;border-radius: 10px;height: 10%;margin-left: 24px;"></textarea>
            <div class="sendCnt" onclick="addText()">
            <!--<i class="fa fa-paper-plane fa-3x text-white"  aria-hidden="true"></i>
            <svg  enable-background="new 0 0 24 24" height="30px" viewBox="0 0 24 24" width="50px" xmlns="http://www.w3.org/2000/svg"><path d="m8.75 17.612v4.638c0 .324.208.611.516.713.077.025.156.037.234.037.234 0 .46-.11.604-.306l2.713-3.692z"/><path d="m23.685.139c-.23-.163-.532-.185-.782-.054l-22.5 11.75c-.266.139-.423.423-.401.722.023.3.222.556.505.653l6.255 2.138 13.321-11.39-10.308 12.419 10.483 3.583c.078.026.16.04.242.04.136 0 .271-.037.39-.109.19-.116.319-.311.352-.53l2.75-18.5c.041-.28-.077-.558-.307-.722z"/></svg>-->
            <svg height="50px" viewBox="0 0 64 64" width="50px" style="margin-bottom: 50px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><linearGradient id="linear-gradient" gradientUnits="userSpaceOnUse" x1="31.993" x2="31.993" y1="1.712" y2="56.251"><stop offset="0" stop-color="#22e0ff"/><stop offset="1" stop-color="#009cba"/></linearGradient><linearGradient id="linear-gradient-2" x1="31.993" x2="31.993" xlink:href="#linear-gradient" y1="-3.181" y2="52.702"/><g id="Send"><path d="m.42 57.551 11.3-24.742a1.952 1.952 0 0 0 0-1.618l-11.3-24.742a4.546 4.546 0 0 1 6.169-5.949l54.893 27.435a4.545 4.545 0 0 1 0 8.129l-54.893 27.436a4.546 4.546 0 0 1 -6.169-5.949z" fill="url(#linear-gradient)"/><path d="m11.72 32.809-11.3 24.742a4.546 4.546 0 0 0 6.169 5.949l54.893-27.436a4.545 4.545 0 0 0 0-8.129s-45.645 21.748-49.762 4.874z" fill="url(#linear-gradient-2)"/><g fill="#fff"><path d="m53.937 29.754-7.445-3.721a1 1 0 0 1 .9-1.789l7.445 3.721a1 1 0 1 1 -.9 1.789z"/><path d="m16.293 10.938-2.074-1.038a1 1 0 1 1 .894-1.789l2.074 1.036a1 1 0 0 1 -.894 1.79z"/><path d="m10.7 8.142-5.2-2.6.266.583a1 1 0 0 1 -1.819.831l-.798-1.756a1.544 1.544 0 0 1 2.1-2.022l6.351 3.175a1 1 0 0 1 -.9 1.789z"/></g></g></svg>
            </div>
<!--            <input type="button" value="send" onclick="addText()" />-->
        </div>
    </body>


</html>
