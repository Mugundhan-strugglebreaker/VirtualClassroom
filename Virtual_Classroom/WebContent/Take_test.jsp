
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="Database_Objects.Database_Connection" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.sql.Timestamp" %>
    <%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>VIRTUAL CLASSROOM</title>
       <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="student_result.css">
    </head>
    <body>
        
        <%
	String email=(String)session.getAttribute("email");
        String name=(String)session.getAttribute("name");
//	out.println("<h1>Welcome "+email+"</h1>");
	int sno=1;
	ArrayList<String> al=new ArrayList<String>();
    try
    {
    	Connection con=Database_Connection.getConnection();
    	String query="select code from students where email=?";
    	PreparedStatement preparedStatement=con.prepareStatement(query);
    	preparedStatement.setString(1, email);
    	ResultSet rs=preparedStatement.executeQuery();
    	
    		    	  %>
        
            <div class="container">
                <header>
                    <div class="container-fluid bg-dark">
                        <h3 class="text-white">WELCOME <%=name%></h3>
                    </div>
                </header>
                <h2 class="text-center text-white">TAKE TEST</h2>
                <table class="table table-striped table-dark">
                    <thead>
                    <tr>
                        <th scope="col">S.NO</th>
                        <th scope="col">TEST CODE</th>
                        <th scope="col">START TIME</th>
                        <th scope="col">END TIME</th>
                    </tr>
                    </thead>
                    <%
                    
                    while(rs.next())
    	{
    		//out.println("<h1>QBCODE:"+rs.getString("code")+"</h1><br>");
    		String str=rs.getString("code");
    		str=str+"_qbinfo";
    		String query_in="select * from "+str;
    		PreparedStatement preparedStatement2=con.prepareStatement(query_in);
    		ResultSet rs1=preparedStatement2.executeQuery();
    		while(rs1.next())
    		{
    			// out.println("<h1>"+rs1.getString("testcode")+"--->"+rs1.getTimestamp("start_time")+"--->"+rs1.getTimestamp("end_time")+"</h1><br>");
    			 
    			 String end_time=rs1.getString("end_time");
                         
                        end_time=end_time.replace("T", " ");
                        end_time=end_time+":00";
                        //System.out.println("start time: "+st_time);
                        Timestamp ts2=Timestamp.valueOf(end_time);
    			 
    			 String original_st_time=rs1.getString("start_time");
                         
                        original_st_time=original_st_time.replace("T", " ");
                        original_st_time=original_st_time+":00";
                        //System.out.println("start time: "+st_time);
                        Timestamp ts1=Timestamp.valueOf(original_st_time);
                         
    			 //getting start time from database and 5 min to the start time
    			 String starttime=rs1.getString("start_time");
                         starttime=starttime.replace("T", " ");
                         starttime=starttime+":00";
                        //System.out.println("start time: "+st_time);
                        Timestamp ts3=Timestamp.valueOf(starttime);
                        
    			 long now=ts3.getTime();
    			 long nowPlus5Minutes = now + TimeUnit.MINUTES.toMillis(5);
    			 
    			 // convertion start+5min to Timestamp
    	         Timestamp start_time=new Timestamp(nowPlus5Minutes);
    			 
    			 //getting current time
    			 long millis=System.currentTimeMillis();
    			 Timestamp time=new Timestamp(millis);
    		     
    			 SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm");
    		     
    			 //string of current time
    			 String sdformat=sdf.format(time);
    		     
    			 //string of start_time+5min
    		     String st_time=sdf.format(start_time);
    			 
    			 String or_st_time=sdf.format(ts1); 
    		     
    			 String en_time=sdf.format(ts2);
    			 
    		 //    out.println(st_time+"--->");
    		   //  out.println(en_time);
    		     
    		     if(sdformat.compareTo(en_time)>=1)
    		     {
    		       //out.println("<h1>Test yet not started</h1>");
    		    	 //out.println("<h1>Time exceeded</h1>");
	    		       
    		     }
    		     else
    		     {
                    %>
                    <tbody>
                    <tr>
                        <th scope="row"><%=sno %></th>
                        <td><%=rs1.getString("testcode") %></td>
                        <td><%=rs1.getString("start_time") %></td>
                        <td><%=rs1.getString("end_time") %></td>
                    </tr>
                    </tbody>
                      <%
    		    	  
    		    	   if(sdformat.compareTo(or_st_time)>=0 && sdformat.compareTo(st_time)<1 )
                            {
                                
                            String check_query="select qcode from results where email=?";
                            PreparedStatement pst_check=con.prepareStatement(check_query);
                            pst_check.setString(1, email);
                            ResultSet rs_check=pst_check.executeQuery();
                            int fl=0;
                            String qp=rs1.getString("testcode");
                            while(rs_check.next())
                            {
                                if(rs_check.getString("qcode").equals(qp))
                                {
                                    fl=1;
                                    break;
                                }
                            }
                            if(fl==0)
                            al.add(rs1.getString("testcode"));
                                         //out.println("<h1>Ur are allowed to take test</h1>");
                            }
	     		       else if(sdformat.compareTo(st_time)>=1)
	     		       {
	     		    		//out.println("<h1>Ur are late to test not allowed to take test</h1>");
	     		       }
	     		       else
	     		       {
	     		    	   //out.println("<h1>Test yet not started </h1>");
	     		       }
    		    	  sno++;
    		    
    		     }
    		        	
    		        	
    		        
    		       
    			
    		}
    		
    		
    		
    	}
    	
    }
    catch(Exception e)
    {
    	
    }

   // out.println(al);
%>
                </table>
                <div class="spc">
                    
                </div>
                <form action="demoexam.jsp">
                    <div class="row">
                        <div class="move">
                            <select class="form-select" name="select_code" aria-label="Default select example" required>
                                <option value="" selected>Open this select menu</option>
                                <%
  for(int i=0;i<al.size();i++)
  {%>
    <option value='<%=al.get(i) %>'><%=al.get(i) %></option>
  <% 
	  
  }

%>
                                
                            </select>
                        </div>
                    </div>
                    
                    <button class="btn btn-outline-light" type="submit">TAKE TEST</button>
                </form>

            </div>

        <script src="bootstrap.min.js"></script>
   <script src="./assets/js/jquery.min.js"></script>
    </body>
</html>
