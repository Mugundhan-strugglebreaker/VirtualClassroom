<%-- 
    Document   : demoexam
    Created on : 30 Jan, 2021, 7:03:50 PM
    Author     : N.MEIYAPPAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Test</title>
    <link rel="stylesheet" href="style1.css">
    <!-- FontAweome CDN Link for Icons-->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
           var obj;
          // document.getElementById("a").innerHTML
        function test(str)
        {
              
               // alert("hi"+str);
                var ob=new XMLHttpRequest();
                
                ob.onreadystatechange=function ss()
                {
                    if(ob.readyState===4)
                    {
                        console.log("kk");
                        var str=(ob.responseText);
                         console.log("kk332");
                        obj=JSON.parse(str);
                      
                        for(i=0;i<obj.length;i++)
                        {
                            console.log(obj[i].ID);
                            console.log(obj[i].QUESTION);
                            console.log(obj[i].ANSWERS);
                   //         console.log(online[i].Date_Of_Birth);
                   //         console.log(online[i].Place_Of_Birth);
                   //         console.log(online[i].Country);
                            var ary_options=obj[i].OPTIONS;
                            console.log(obj[i].OPTIONS);
                            for(j=0;j<ary_options.length;j++)
                            console.log(ary_options[j]);

                        }  
                    }
                }
              //  alert(obj);

            ob.open("GET","JSONServlet?table_name="+str,true);
            ob.send();
            
        }
    </script>
   
</head>
<% String 
       s=request.getParameter("select_code"); 
       
session.setAttribute("qcode_result", s);
%>
<body onload="test('<%=s%>')">
    <!-- start Quiz button -->
    <div class="start_btn" onclick="asd()" ><button>Start Exam</button></div>

    <!-- Info Box -->
    <div class="info_box">
        <div class="info-title"><span>Some Rules for Online Examination</span></div>
        <div class="info-list">
            <div class="info">1. You will have only <span>15 seconds</span> per each question.</div>
            <div class="info">2. You can't select any option once time goes off.</div>
            <div class="info">3. If you exceed tab switching <span>of 2 times</span> your test will be ended</div>
            <div class="info">4. You'll get mark on the basis of your correct answers.</div>
        </div>
        <div class="buttons">
            <button class="quit">Exit Exam</button>
            <button class="restart">Continue</button>
        </div>
    </div>

    <!-- Quiz Box -->
    <div class="quiz_box">
        <header>
            <div class="title"><%=s%></div>
            <div class="timer">
                <div class="time_left_txt">Time Left</div>
                <div class="timer_sec">15</div>
            </div>
            <div class="time_line"></div>
        </header>
        <section>
            <div class="que_text">
                <!-- Here I've inserted question from JavaScript -->
            </div>
            <div class="option_list">
                <!-- Here I've inserted options from JavaScript -->
            </div>
        </section>

        <!-- footer of Quiz Box -->
        <footer>
            <div class="total_que">
                <!-- Here I've inserted Question Count Number from JavaScript -->
            </div>
            <button class="next_btn">Next Que</button>
        </footer>
    </div>

    <!-- Result Box -->
    <div class="result_box">
        <div class="icon">
            <i class="fas fa-crown"></i>
        </div>
        <div class="complete_text">You've completed the Examination!</div>
        <div class="score_text">
            <!-- Here I've inserted Score Result from JavaScript -->
        </div>
        <div class="buttons">
          
            
        </div>
    </div>

    <!-- Inside this JavaScript file I've inserted Questions and Options only -->

    <!-- Inside this JavaScript file I've coded all Quiz Codes -->
    <script src="Script.js"></script>

</body>
</html>