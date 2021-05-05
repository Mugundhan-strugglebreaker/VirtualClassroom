<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*"%>

<%
    String date="2021-01-30T19boo:37";
    
    String dateformat=date.replace("T"," ");
    long millis=System.currentTimeMillis();
    
    Timestamp time=new Timestamp(millis);
    SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-DD HH.mm");
    String sdformat=sdf.format(time);
    
    out.println(dateformat+" <br>");
    out.println(sdformat+"<br>");
    
    if(sdformat.compareTo(dateformat)>=1)
    	out.println("Time Exceeded");
    else
    	out.println("Time Remaining");
    	
%>