<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Database_Objects.Database_Connection" %>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Dashboard.css">
    <link rel="stylesheet" href="bootstrap.min.css">
<!--     <link rel="stylesheet" type="text/css" href="bootstrap.min.css">-->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
  <div class="container">
  <div class="navigation ">
       
       <div class="navLink"> <a href="http://localhost:8080/Virtual_Classroom/startchat.jsp" class="nav_cont">CHAT</a></div>
      <div class="navLink"> <a href="http://localhost:8080/Virtual_Classroom/Create_Class.jsp" class="nav_cont">CREATE CLASS</a></div>
    <div class="navLink"> <a href="http://localhost:8080/Virtual_Classroom/Join_class.jsp" class="nav_cont">JOIN CLASS</a></div>
    <div class="navLink"> <a href="http://localhost:8080/Virtual_Classroom/Show_profile_new.jsp" class="nav_cont">SHOW PROFILE</a></div>
    <div class="navLink"> <a href="http://localhost:8080/Virtual_Classroom/Update_Profile_new.jsp" class="nav_cont">UPDATE PROFILE</a></div>
    <div class="navLink"> <a href="http://localhost:8080/Virtual_Classroom/placement.html" class="nav_cont">PLACEMENT</a></div>
    <div class="navLink"> <a href="http://localhost:8080/Virtual_Classroom/Logout.jsp" class="nav_cont">LOGOUT</a></div>
  </div>
  <div class="teacher_container">
      
      <%
                        String email=(String)session.getAttribute("email");
 	String name=null,mobile=null,password=null;
 	try
 	{
 		Connection con=Database_Connection.getConnection();
		String query="select * from users where email=?";
		
		PreparedStatement pstmt=con.prepareStatement(query);
        pstmt.setString(1,email);
        ResultSet rs=pstmt.executeQuery();
        
        if(rs.next())
        {
        	name=rs.getString("name");
        	mobile=rs.getString("mobile");
        	password=rs.getString("password");
        }
        
                session.setAttribute("name", name);
		session.setAttribute("email", email);
		session.setAttribute("password", password);
		session.setAttribute("mobile", mobile);
        con.close();
 	}
 	catch(Exception exp)
 	{
 		System.out.println("Exception is "+exp);
 	}
		//	out.println("<h1>Welcome "+email+"</h1>");
			Connection con=Database_Connection.getConnection();
			boolean teacher=false;
			boolean student=false;
			
					try
					{
						
					String query="select 1 from teachers where email=?";
					PreparedStatement preparedStatement=con.prepareStatement(query);
					preparedStatement.setString(1, email);
					ResultSet rs=preparedStatement.executeQuery();
				//	out.println(rs.next());
				
					teacher=rs.next();
					
					String query1="select 1 from students where email=?";
					PreparedStatement preparedStatement1=con.prepareStatement(query1);
					preparedStatement1.setString(1, email);
					ResultSet rs1=preparedStatement1.executeQuery();
				//	out.println(rs1.next());
					student=rs1.next();
					
					
						
						
					}
					catch(Exception e)
					{
						out.println(e);
					}
                                      
       if(teacher)
       {
      %>
      <!--if loop of teacher boolean -->
      <h2 class="teacher_cnt">Teacher</h2>
     
      <button class="create bg-primary text-white" style="width:200px" onclick="create_tes()">Test Options</button>
     
    <div class="wrapper">
    
     <% 
          // out.println("<h1>Your role as a Teacher</h1>");
				try
				{
					//	out.println("<a href='Test_options.jsp'>Create Test</a>");	
						String class_query="select * from teachers where email=?";
						PreparedStatement prepare_class=con.prepareStatement(class_query);
						prepare_class.setString(1, email);
						ResultSet rs=prepare_class.executeQuery();
						
                                                
							
						while(rs.next())
						{
                                                    int count=0;
                                                    
                                                    try
                                                    {
                                                  //   Statement s = con.createStatement();
                                                     PreparedStatement s=con.prepareStatement("SELECT COUNT(*) AS rowcount FROM students where code=?");
                                                     s.setString(1,rs.getString("code") );
                                                     ResultSet r = s.executeQuery();
                        r.next();
                       count = r.getInt("rowcount") ;
                        r.close() ;
                        System.out.println("MyTable has " + count + " row(s).");
                                                    }
                                                    catch(Exception e)
                                                    {
                                                       System.out.println(e);
                                                    }
                                                    
						
            
   %>
         <div class="table basic">
        <div class="price-section">
          <div class="price-area">
            <div class="inner-area">
              <span class="text"></span>
              <span class="price"></span>
            </div>
          </div>
        </div>
        <div class="package-name"></div>
        <ul class="features">
          <li>
            <span class="list-name"><%=rs.getString("subject")%></span>
           
          </li>
          <li>
            <span class="list-name"><%=rs.getString("code")%></span>
            
          </li>
          <li>
            <span class="list-name"><%
            if(count>1)
            {
                out.println(count+" Students");
            }
            else
            {
                out.println(count+" Student");
            }
            %> </span>
            
          </li>
          <li>
            <span class="list-name"></span>
            
          </li>
        </ul>
    
        <div class="btn " onclick="teacher_page(this)"><button>Enter</button></div>
      </div>

        
        <%
                                                } 
        
        }
				catch(Exception e)
				{
					
				}
        
        %>
      
    </div>
        
  </div>
        <%}%>
        
        <%
       if(student)
       {
           %>
        <!-- Student if starts  -->
        
         <div class="student_container">
    <h2 class="student_text">Student</h2>
     <button class="take_test bg-primary text-white"  onclick="take_test()">Take test</button>
     <button class="view_res bg-primary text-white" style="width:200px" onclick="view_res()">View Results</button>
    <div class="wrapper" onclick="testing()">
    
    <% //out.println("<h1>Your role as a Student</h1>");
				try
				{
                                               // out.println("<a href='Take_test.jsp'>Take Test</a><br>");
                                               // out.println("<a href='Student_result.jsp'>view Results</a>");
						String class_query="select * from students where email=?";
						PreparedStatement prepare_class=con.prepareStatement(class_query);
						prepare_class.setString(1, email);
						ResultSet rs=prepare_class.executeQuery();
						
						
						while(rs.next())
						{
                                                    
                                                    String sub_teacher_mail="select email from teachers where code=?";
                                                    PreparedStatement pp=con.prepareStatement(sub_teacher_mail);
                                                    pp.setString(1, rs.getString("code"));
                                                    ResultSet pp_rs=pp.executeQuery();
                                                    String mail_is="";
                                                    if(pp_rs.next())
                                                    {
                                                        mail_is=pp_rs.getString("email");
                                                    }
                                                    
                                                    
                                                    String sub_teacher_name="select name from users where email=?";
                                                    PreparedStatement pp1=con.prepareStatement(sub_teacher_name);
                                                    pp1.setString(1, mail_is);
                                                    ResultSet pp1_rs=pp1.executeQuery();
                                                    String staff_name="";
                                                    if(pp1_rs.next())
                                                    {
                                                        staff_name=pp1_rs.getString("name");
                                                    }
                                                    System.out.println("----------"+mail_is+" "+staff_name);
            
    %>
         <div class="table basic">
        <div class="price-section">
          <div class="price-area">
            <div class="inner-area">
              <span class="text"></span>
              <span class="price"></span>
            </div>
          </div>
        </div>
        <div class="package-name"></div>
        <ul class="features">
          <li>
            <span class="list-name"><%=rs.getString("subject")%></span>
           
          </li>
          <li>
            <span class="list-name"><%=rs.getString("code")%></span>
            
          </li>
          <li>
            <span class="list-name"><%=staff_name%></span>
            
          </li>
          <li>
            <span class="list-name"></span>
<!--              <span class="icon cross"><i class="fas fa-times"></i></span>-->
          </li>
          
        </ul>
    
        <div class="btn" onclick="download(this)"><button>Enter</button></div>
      </div>

        
        <%
                                                }
                                                    }
				catch(Exception e)
				{
					
				}
            
        
        
        
        
        %>


    </div>
  </div>
        
        <% } %>
</div>

  <script>
      function teacher_page(ele)
      {
          var x=ele.parentElement; //table_basics
          var y=x.getElementsByClassName("features"); //features[class[0]]
          var li_child=y[0].children; //childres of ul
          //var span_child=li_child[0].children[0];
         // alert(li_child[0].children[0]);
         //alert(li_child.length);
         var ary=[];
         for(var i=0;i<li_child.length;i++)
         {
             var span_child=li_child[i].children[0];
             console.log(span_child.innerHTML);
             ary[i]=span_child.innerHTML;
         }
         //alert(ary[0]+" "+ary[1]);
         window.location="http://localhost:8080/Virtual_Classroom/UploadFile.jsp?subject="+ary[0]+"&code="+ary[1];
      }
      
       function download(ele)
      {
          var x=ele.parentElement; //table_basics
          var y=x.getElementsByClassName("features"); //features[class[0]]
          var li_child=y[0].children; //childres of ul
          //var span_child=li_child[0].children[0];
         // alert(li_child[0].children[0]);
         //alert(li_child.length);
         var ary=[];
         for(var i=0;i<li_child.length;i++)
         {
             var span_child=li_child[i].children[0];
             console.log(span_child.innerHTML);
             ary[i]=span_child.innerHTML;
         }
         //alert(ary[0]+" "+ary[1]);
         window.location="http://localhost:8080/Virtual_Classroom/DownloadFile.jsp?subject="+ary[0]+"&code="+ary[1];
      }
      
      function create_tes()
      {
        //alert("hai");
        window.location="http://localhost:8080/Virtual_Classroom/Test_options.jsp";
      }
      function take_test()
      {
          //alert("take");
          window.location="http://localhost:8080/Virtual_Classroom/Take_test.jsp";
      }
      function view_res()
      {
          //alert("view");
          window.location="http://localhost:8080/Virtual_Classroom/Student_result.jsp";
      }
  </script>
</body>
</html>