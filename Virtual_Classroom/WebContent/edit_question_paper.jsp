<%-- 
    Document   : edit_qp_new
    Created on : 7 Feb, 2021, 10:44:19 PM
    Author     : N.MEIYAPPAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="Database_Objects.Database_Connection" %>
 <%@ page import="java.sql.Timestamp" %>
    <%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>VIRTUAL CLASSROOM</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="edit.css">
    </head>
    <body>
        <%
        String name=(String)session.getAttribute("name");
        %>
        <h1 class="text-center" >VIRTUAL CLASSROOM</h1>
        <div class="spc"></div>
        
        <div class="container">
            
            <div class="row">
                <div class="col-md-5">
                    <h1 style="margin-left: 50px">WELCOME <%=name%></h1>
                    
                    <%
        String arr[]=new String[100];
        int ind=0;
        String email=(String)session.getAttribute("email");
        //out.println("<h1>"+email+"</h1>");
        
        Connection con=Database_Connection.getConnection();
        String str="select code from teachers where email=?";
        PreparedStatement preparedStatement=con.prepareStatement(str);
        preparedStatement.setString(1, email);
        ResultSet rs=preparedStatement.executeQuery();
        
        while(rs.next())
        {
            System.out.println("code:----- "+rs.getString("code"));
          //  out.println("<h1>"+rs.getString("code")+"<br></h1>");
            String string=rs.getString("code");
            string=string+"_qbinfo";
             System.out.println("exam name:----- "+string);
            String query="select * from "+string;
            PreparedStatement preparedStatement1=con.prepareStatement(query);
            ResultSet res=preparedStatement1.executeQuery();
            
            while(res.next())
            {
               //// out.println(res.getString("testcode")+"<br>");
               
    		
                String or_st_time=res.getString("start_time");
                
                or_st_time=or_st_time.replace("T"," ");
    		
    			 
                //getting current time
                long millis=System.currentTimeMillis();
                
                Timestamp time=new Timestamp(millis);

                SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm");
          
                //string of current time
                String sdformat=sdf.format(time);
                
                //String sdformat="2021-02-01 19:31";

             //   out.println(sdformat);
              //  out.println(or_st_time);
    			 
                //String or_st_time=sdf.format(original_st_time); 
                System.out.println("================="+sdformat.compareTo(or_st_time));
                System.out.println(sdformat+"--------------"+or_st_time);
                if(sdformat.compareTo(or_st_time)>=0)
                {
                    
                    //out.println("Cannot editable");
                }
                else
                {
                   // al.add(res.getString("testcode"));
                    arr[ind++]=res.getString("testcode");
                  //  out.println("Editable");
                }
    		     
            }
            //out.println("-----------------<br>");
            
            
        }
        %>
                    
                    <form method="post" action="show_Edit_Question_Paper.jsp">
                        <div class="row">
                            <div class="move">
                                
                                <select class="form-select" aria-label="Default select example" name="select_qb" required>
                      <option value="">Select QB</option>
    <%
             for(int i=0;i<ind;i++)
      {
          %>
          <option value='<%=arr[i]%>'><%=arr[i]%></option>
          
          <%
      out.println(arr[i]);
      }
    //    out.println(al);
        %>
                  </select>
                            </div>
                        </div>
                        
                        <button class="btn btn-outline-light" type="submit">EDIT TEST</button>
                    </form>

                    <div class="row">
                        <div class="col-md-10">
                            <a href="DashBoard.jsp" class="btn btn-primary btn-outline-lg active" role="button" aria-pressed="true">Home</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/jquery.min.js"></script>
    </body>
</html>