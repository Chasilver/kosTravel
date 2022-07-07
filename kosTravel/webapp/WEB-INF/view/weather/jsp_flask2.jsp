<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>  
    

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("jsp_flask2.jsp");
	
	
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>  
	<script>

	$(document).ready(function(){
		
		var param = ${test1}
		console.log(param);
		
		var data = param['rss']['channel']['item']['description']['body']['location'][0]['data']
		console.log("data.length :: " + data.length);
		
		var weather=""
		var city=""
		var time=""
		city = param['rss']['channel']['item']['description']['body']['location'][0]['city']
		console.log(city);
		for(var i=0;i<=data.length-3;i++){
		
		
		weather_1 = param['rss']['channel']['item']['description']['body']['location'][0]['data'][i]['wf']
		console.log(weather);

		time_1 = param['rss']['channel']['item']['description']['body']['location'][0]['data'][i]['tmEf']
		console.log(time);
		
		weather += weather_1 + ",";
		time += time_1 + ",";
		
		$('#city').val(city);
		$('#weather').val(weather);
		$('#time').val(time);
		}
	});

</script>
</head>
<body>
	<h1>jsp_flask2.jsp</h1><hr>
	<form action="weatherInsertForm.gotrip" method="get">
		<input type="hidden" id="city" name="city">
		<input type="hidden" id="weather" name="weather">
		<input type="hidden" id="time" name="time">
		<input type="submit" value="전송">
	</form>
</body>
</html>