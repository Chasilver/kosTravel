<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("hotelInsertForm.jsp");
	

	String city = (String)request.getAttribute("city");
	String weather = (String)request.getAttribute("weather");
	String time = (String)request.getAttribute("time");

	
	//var plocation = data.split(',');
	String sp = ",";
	String[] weather_kArray = weather.split(sp);
	String[] time_kArray = time.split(sp);
	
	
	logger.info("sArray :: " + weather_kArray[0]);
	
	for(int i=0;i<=weather_kArray.length-1;i++){
		
		logger.info(i);
		logger.info(weather_kArray[i]);
	
	}
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<div id="openweathermap-widget-11"></div>
<script src='//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/d3.min.js'></script>
<script>window.myWidgetParam ? window.myWidgetParam : window.myWidgetParam = [];  window.myWidgetParam.push({id: 11,cityid: '1846266',appid: '199ebb759fa6ff0300e0fdccf4096809',units: 'metric',containerid: 'openweathermap-widget-11',  });  
(function() {var script = document.createElement('script');script.async = true;script.charset = "utf-8";script.src = "//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/weather-widget-generator.js";var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(script, s);  })();
</script>
<div id="openweathermap-widget-12"></div>
<script>window.myWidgetParam ? window.myWidgetParam : window.myWidgetParam = [];  window.myWidgetParam.push({id: 12,cityid: '1835848',appid: '199ebb759fa6ff0300e0fdccf4096809',units: 'metric',containerid: 'openweathermap-widget-12',  });  
(function() {var script = document.createElement('script');script.async = true;script.charset = "utf-8";script.src = "//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/weather-widget-generator.js";var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(script, s);  })();
</script>
</head>
<body>
	<fmt:setLocale value="ko_KR"/>
	<h3>날씨 위치: <fmt:bundle basename="gotrip.resources.weather"><fmt:message key="weather.city_1"></fmt:message></fmt:bundle></h3>
	<fmt:setLocale value="en_US"/>
	<h3><fmt:bundle basename="gotrip.resources.weather"><fmt:message key="weather.city_1"></fmt:message></fmt:bundle></h3>
	<%
	for(int i=0;i<=weather_kArray.length-1;i++){
		
		logger.info(i);
		logger.info(weather_kArray[i]);
	
%>

	<form id="insertForm" name="insertForm">
		 <table>
		  <tr>
			<td>날씨</td>
			<td>
				<input type="text" id="hname"name="hname" class="hname"size="20" value="<%=weather_kArray[i]%>"/>
			</td>
		  </tr>
		  <tr>
			<td>시간</td>
			<td>
				<input type="text"id="hkind"name="hkind"class="hkind"size="20"value="<%=time_kArray[i]%>" />
			</td>
		  </tr>
		  <tr>
			<td>날씨이미지</td>
			<td> 
			<%
				if(weather_kArray[i].equals("흐리고 비")){
			%>		
				<img src="/kosTravel/data/NB20.png">
			<%
				}else if(weather_kArray[i].equals("구름많음")){
			%>		
				<img src="/kosTravel/data/NB03.png">
			<%	
				}else if(weather_kArray[i].equals("흐림")){
			%>		
				<img src="/kosTravel/data/NB02.png">
			<%	
				}
			%>
			
   			</td>
		  </tr>
		  <br>
		  <hr>
		  <br>
<%
	
	}
%>
	<tr>
		<td colspans="2"> 
			<input type="button"id="insertBtn"value="확인"/><br>
  			</td>
	  </tr>
	  </table>
	</form>
</body>
</html>