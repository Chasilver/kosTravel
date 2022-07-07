<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String pday = (String)request.getAttribute("pday");
	String tnum = (String)request.getAttribute("tnum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		location.href="/kosTravel/planSelectAll.gotrip?pday=${pday}&tnum=${tnum}";
	</script>
</body>
</html>