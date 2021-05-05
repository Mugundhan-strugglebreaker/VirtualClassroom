<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
$color-paid: #7fdbff;
$color-sent: #39cccc;

body, html {
  height: 100%;
}

body {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  font-family: "fira-sans-2", Verdana, sans-serif;
}

#q-graph {
  display: block; /* fixes layout wonkiness in FF1.5 */
  position: relative; 
  width: 600px; 
  height: 300px;
  margin: 1.1em 0 0; 
  padding: 0;
  background: transparent;
  font-size: 11px;
}

#q-graph caption {
  caption-side: top; 
  width: 600px;
  text-transform: uppercase;
  letter-spacing: .5px;
  top: -40px;
  position: relative; 
  z-index: 10;
  font-weight: bold;
}

#q-graph tr, #q-graph th, #q-graph td { 
  position: absolute;
  bottom: 0; 
  width: 150px; 
  z-index: 2;
  margin: 0; 
  padding: 0;
  text-align: center;
}

#q-graph td {
  transition: all .3s ease;
  
  &:hover {
    background-color: desaturate(#85144b, 100);
    opacity: .9;
    color: white;
  }
}
  
#q-graph thead tr {
  left: 100%; 
  top: 50%; 
  bottom: auto;
  margin: -2.5em 0 0 5em;}
#q-graph thead th {
  width: 7.5em; 
  height: auto; 
  padding: 0.5em 1em;
}
#q-graph thead th.sent {
  top: 0; 
  left: 0; 
  line-height: 2;
}
#q-graph thead th.paid {
  top: 2.75em; 
  line-height: 2;
  left: 0; 
}

#q-graph tbody tr {
  height: 296px;
  padding-top: 2px;
  border-right: 1px dotted #C4C4C4; 
  color: #AAA;
}
#q-graph #q1 {
  left: 0;
}
#q-graph #q2 {left: 150px;}
#q-graph #q3 {left: 300px;}
#q-graph #q4 {left: 450px;}
#q-graph #q5 {left: 600px;}
#q-graph #q6 {left: 750px; }
#q-graph #q7 {left: 900px; }
#q-graph #q8 {left: 1050px; border-right: none;}
#q-graph tbody th {bottom: -1.75em; vertical-align: top;
font-weight: normal; color: #333;}
#q-graph .bar {
  width: 60px; 
  border: 1px solid; 
  border-bottom: none; 
  color: #000;
}
#q-graph .bar p {
  margin: 5px 0 0; 
  padding: 0;
  opacity: .4;
}
#q-graph .sent {
  left: 13px; 
  background-color: #39cccc;
  border-color: transparent;
}
#q-graph .paid {
  left: 77px; 
  background-color:#7fdbff;
  border-color: transparent;
}


#ticks {
  position: relative; 
  top: -300px; 
  left: 2px;
  width: 596px; 
  height: 300px; 
  z-index: 1;
  margin-bottom: -300px;
  font-size: 10px;
  font-family: "fira-sans-2", Verdana, sans-serif;
}

#ticks .tick {
  position: relative; 
  border-bottom: 1px dotted #C4C4C4; 
  width: 600px;
}

#ticks .tick p {
  position: absolute; 
  left: -5em; 
  top: -0.8em; 
  margin: 0 0 0 0.5em;
}
</style></head>
<body>

<table id="q-graph">
<caption>Quarterly Results</caption>
<thead>
<tr>
<th></th>
<th class="sent">Invoiced</th>
<th class="paid">Collected</th>
</tr>
</thead>

<tbody>

<%
	out.println("Mugundhan");
    for(int i=1;i<7;i++)
    {
%>
<tr class="qtr" id="q<%=i%>">
<th scope="row">25-03-2021</th>
<td class="sent bar" style="height: 100px;"><p>Rs 100</p></td>
<td class="paid bar" style="height: 90px;"><p>Rs 90</p></td>
</tr>

<%
    }
%>
</tbody>
</table>


</body>
</html>