<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gotrip.java.travel.vo.TravelVO"%>
<%@ page import="java.util.List"%>

<%@ page import="org.apache.log4j.LogManager"%>
<%@ page import="org.apache.log4j.Logger"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("travelSelectAll.jsp 페이지 >>> : ");
	
	Object obj = request.getAttribute("listAll");
	List<TravelVO> list = (List<TravelVO>) obj;
	int nCnt = list.size();
	String nCntS = ":::: 전체 조회 건수  " + nCnt + " 건";
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="/kosTravel/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		
			$(document).on("click", "#travel_btn", function(){
				location.href="/kosTravel/travelInsertForm.gotrip";
				
			});
		});
	</script>
</head>
<body>
	<h3 align="center">여행목록</h3>
	<form name="productList" id="productList">
		<table class="table">
			<tr>
				<th>여행이름</th>
				<th>여행시작일</th>
				<th>여행종료일</th>
			</tr>
		<%
			for(int i=0; i<nCnt; i++){
				TravelVO _tvo = list.get(i);
		%>
			<tr>
				<td><a href="planSelectAll.gotrip?tnum=<%= _tvo.getTnum() %>"><%= _tvo.getTname() %></a></td>
				<td><%= _tvo.getTstartdate() %></td>
				<td><%= _tvo.getTenddate() %></td>
			</tr>	

			<%
				}
			%>
			
		</table>
		<input type="button" id="travel_btn" value="여행추가">
	</form>
</body>
</html>