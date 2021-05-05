<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<body>
<div id="piechart"></div>
<input type="hidden" id="id" value="8">
<input type="hidden" id="name" value='Beans'>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
// Draw the chart and set the chart values
function drawChart() {
	
var data = google.visualization.arrayToDataTable([
	
['Task', 'Expenditure Chart'],
[document.getElementById("name").value, parseInt(document.getElementById("id").value)],
['Onion', 8],
['Tomato', 4],
['Potato', 2],
['Brinjal', 2],
['Carrot', 2]
]);
// Optional; add a title and set the width and height of the chart
var options = {'title':'Expenditure Chart', 'width':750, 'height':600};
// Display the chart inside the <div> element with id="piechart"
var chart = new google.visualization.PieChart(document.getElementById('piechart'));
chart.draw(data, options);
}
</script>
</body>
</html>   