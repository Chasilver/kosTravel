<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pday = (String)request.getAttribute("pday");
	String tstartdate = (String)request.getAttribute("tstartdate");
	String tnum = (String)request.getAttribute("tnum");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<h3>planInsert.jsp</h3>
	<hr>
	<script>
	location.href="/kosTravel/planSelectAll.gotrip?pday=${pday}&tnum=${tnum}";
	</script>
</body>
</html>