<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gotrip.java.cart.vo.CartVO"%>    
<%@ page import="gotrip.java.travel.vo.TravelVO"%>
<%@ page import="java.util.List" %>  
<% request.setCharacterEncoding("UTF-8");%> 
<%

	Object obj = request.getAttribute("listC");
	List<CartVO> list = (List)obj;
	//String mnum = (String)request.getAttribute("mnum");
	Object obj_1 = request.getAttribute("listAll");
	List<TravelVO> list_1 = (List<TravelVO>) obj_1;
	int nCnt = list_1.size();
	String nCntS = ":::: 전체 조회 건수  " + nCnt + " 건";
%>       
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<!-- Iamport 결제 api   -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<script type="text/javascript">
		$(document).ready(function(){
			$("#a_select_btn").click(function(){
				alert("항공 다시예약하기 ! >>> :");
				
				$("#cartSelectForm").attr({
					"method":"GET",
					"action":"#airSelectAll.gotrip"
				}).submit();
			});
			$("#h_select_btn").click(function(){
				alert("호텔 다시예약하기 ! >>> :");
				
				$("#cartSelectForm").attr({
					"method":"GET",
					"action":"#hotelSelectAll.gotrip"
				}).submit();
			});
			$("#c_select_btn").click(function(){
				alert("렌트 다시예약하기 ! >>> :");
				
				$("#cartSelectForm").attr({
					"method":"GET",
					"action":"#carSelectAll.gotrip"
				}).submit();
			});
			$("#order_btn").click(function(){
				alert("계산하러가기 ! >>> :");
				var total = $("#total").val();
				//alert("gg");
				// 가맹점 식별코드
				IMP.init('imp40697643');
				IMP.request_pay({
					pg : 'TC0ONETIME',
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : "예약결제" , //결제창에서 보여질 이름
				    amount : total, //실제 결제되는 가격
				    buyer_email : '',
				    buyer_name : '홍길동',
				    buyer_tel : '010-1234-5678',
				    buyer_addr : '서울 양찬구 목동',
				    buyer_postcode : '123-456'
				}, function(rsp) {
					console.log(rsp);
				    if ( rsp.success ) {
				    	var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				    } else {
				    	 var msg = '결제에 실패하였습니다.';
				         msg += '에러내용 : ' + rsp.error_msg;
				    }
				    alert(msg);
				});
			});
			
			$(document).on("click", "#travel_btn", function(){
				location.href="/kosTravel/travelInsertForm.gotrip";
			});
		
		});
	</script>
	<style type="text/css">
		
		div {		 
			margin: 0 auto; 		
			border:1px solid #6d82f3;
			display:table;
		}			
	
		td, th {
			 padding: 5px;
		}

	</style>
</head>
<body>
	<h3>여행목록</h3>
	<hr>
		<form name="productList" id="productList">
			<table border="1">
				<tr>
					<th>여행이름</th>
					<th>여행시작일</th>
					<th>여행종료일</th>
				</tr>
			<%
				for(int i=0; i<nCnt; i++){
					TravelVO _tvo = list_1.get(i);
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
			<br>
			<input type="button" id="travel_btn" value="여행추가">
		</form>
	<hr>
	<h3>예약 목록이에욤</h3>
	<hr>
	<form name="cartSelectForm" id="cartSelectForm">
	<%
		CartVO _cvo = null;
		_cvo = list.get(0);
		String fprice = _cvo.getFprice();
		String hprice = _cvo.getHprice();
		String carprice = _cvo.getCarprice();
		int fprice_i = Integer.parseInt(fprice);
		int hprice_i = Integer.parseInt(hprice);
		int carprice_i = Integer.parseInt(carprice);
		
		int total = fprice_i + hprice_i + carprice_i;
	%>
	<input type="hidden" id="mnum" name="mnum" value="<%= _cvo.getMnum()%>">
		<table border="1">
			<tr>
				<td class="table-success" align="center">출발지-도착지</td>
				<td class="table-success" align="center">출발일-도착일</td>
				<td class="table-success" align="center">출발시간-도착시간</td>
				<td class="table-success" align="center">항공사</td>
			</tr>		
			<tr>
				<td align="center"><%= _cvo.getFstartday()%></td>	
				<td align="center"><%=_cvo.getFstart()%></td>
				<td align="center"><%=_cvo.getFstarttime()%></td>
				<td align="center"><%=_cvo.getFname()%></td>
			</tr>
			<tr>
				<td align="center"><%=_cvo.getFdetday()%></td>
				<td align="center"><%=_cvo.getFdest()%></td>
				<td align="center"><%=_cvo.getFdettime()%></td>
				<td align="center"><%=_cvo.getFname()%></td>
			</tr>
			<tr>
				<td colspan="4" align="right"><%=_cvo.getFprice()%></td>
			</tr>
			<!-- <%=_cvo.getFprice()%> -->
		</table>
		<br>
		<input type="button" id="a_select_btn" value="다시예약하기">
		
		<table border="1">
			<tr>
				<td class="table-success" align="center">호텔명/호텔주소</td>
				<td class="table-success" align="center">체크인-체크아웃</td>
			</tr>		
			<tr>
				<td align="center"><%=_cvo.getHname()%></td>
				<td align="center"><%=_cvo.getHcheckin()%></td>
			</tr>
			<tr>
				<td align="center"><%=_cvo.getHaddr()%></td>
				<td align="center"><%=_cvo.getHcheckout()%></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><%=_cvo.getHprice()%></td>
			</tr>
			<!-- <td><%=_cvo.getHprice()%></td> -->
		</table>
		<br>
		<input type="button" id="h_select_btn" value="다시예약하기">
		<table border="1">
			<tr>
				<td class="table-success" align="center">대여일-반납일</td>
				<td class="table-success" align="center">업체주소/전화번호</td>
			</tr>	
			
			<tr>
				<td align="center"><%=_cvo.getCaraddr()%></td>
				<td align="center"><%=_cvo.getCarstartday()%></td>
			</tr>
			<tr>
				<td align="center"><%=_cvo.getCarendday()%></td>
				<td align="center"><%=_cvo.getCarphone()%></td>		
			</tr>
			<tr>
				<td colspan="2" align="right"><%=_cvo.getCarprice()%></td>
			</tr>
			<!-- 		<td><%=_cvo.getCarprice()%></td> -->
		</table>
		<br>
		<input type="button" id="c_select_btn" value="다시예약하기"><br><hr><br>
		<%=total %>
		<input type="hidden" id="total" value="<%=total %>">
		<input type="button" id="order_btn" value="장바구니로 가기">
	</form>
	
	
</body>
</html>