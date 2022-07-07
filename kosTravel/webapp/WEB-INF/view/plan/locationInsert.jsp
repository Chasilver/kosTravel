<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String pname = (String) request.getAttribute("pname");
	String ploaction = (String) request.getAttribute("ploaction");
	String pday = (String)request.getAttribute("pday");
	String tnum = (String)request.getAttribute("tnum");
%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
		$(document).ready(function(){	
			$(document).on("click", "#l_insert", function(){
				console.log("l_insert >>> : ");			
				
				$('#location_form').attr({
					'action':'planInsert.gotrip',
					'method':'GET'
				}).submit();
			});
		});
	</script>
</head>
<body>
	<p style="margin-top: -12px">
		<em class="link"> <a href="javascript:void(0);"
			onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
				혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. </a>
		</em>
	</p>
	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ecc22a86c3597ffd825bb2ce926f6e3b&libraries=services">
	</script>
	<script>
		

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						'<%=ploaction %>',
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new kakao.maps.LatLng(result[0].y,result[0].x), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};

								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer, mapOption);
								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">' + '<%= pname %>' + '</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>
	<form id="location_form">
		<input type="hidden" name="pname" value='<%= pname %>'></input>
		<input type="hidden" name="pday" value='<%= pday %>'></input>
		<input type="hidden" name="ploaction" value='<%= ploaction %>'></input>
		<input type="hidden" name="tnum" value='<%= tnum %>'></input>
		메모를 적어주세요 : <input type="text" name="pmemo"></input><br>
		<input type="button" id="l_insert" value="위치등록"></input>
	</form>
	
</body>
</html>