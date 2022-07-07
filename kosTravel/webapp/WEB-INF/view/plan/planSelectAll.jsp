<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gotrip.java.plan.vo.PlanVO"%>
<%@ page import="java.util.List"%>

<%@ page import="org.apache.log4j.LogManager"%>
<%@ page import="org.apache.log4j.Logger"%>

<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("planSelectAll.jsp 페이지 >>> : ");
	
	Object obj = request.getAttribute("listAll");
	List<PlanVO> list = (List<PlanVO>) obj;
	Object obj_m = request.getAttribute("maxday");
	int maxday = (int) obj_m;
	int nCnt = list.size();
	String nCntS = ":::: 전체 조회 건수  " + nCnt + " 건";
	String tnum = (String)request.getAttribute("tnum");
	%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- 
			<script type="text/javascript" src="/kosmoSpring/js/common.js"></script>
			<link rel="stylesheet" href="/resources/demos/style.css">
		 -->
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<script type="text/javascript">
				
		
			</script>
	
	<style type="text/css">
	td, th {
		padding: 5px;
	}
	
	th {
		text-align: center;
	}
	
	.tt {
		text-align: center;
	}
	</style>
</head>
<body>
	<h3 style="margin: 30px;">일정</h3>
	<hr>

	<!---------------------------------------- Kakao Map ----------------------------------------------->
	<div class="map" id="map"
		style="padding: 200px; margin: 20px 580px; width: 40%; height: 350px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ecc22a86c3597ffd825bb2ce926f6e3b&libraries=services">
	</script>
	
	<script>
	
	$(document).ready(function(){
		
			  var pday = 1;
				
				//alert("pday>>>: "+ pday);
		        let selecturl = "planSelect.gotrip?tnum=${tnum}";
		        let reqType = "POST";
		        let asyncf = false;
		        let dataParam = {
		      		  pday : pday,
		        };
		       
		        $.ajax({
		    		url: selecturl,
		    		data : dataParam,
		    		type: reqType, 
		    		async : asyncf,
		    		contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
		    		success : whenSuccess,
		    		error : whenError
		    		
		    	});
		    	function whenSuccess(data){
					//alert(data);
					var plocation = data.split(',');
					//alert((plocation.length-1));
					var map = null;
					var marker = null;
					
					var markers = [];
					var icon = null;
					for (var i = 0; i < (plocation.length-1); i++) {
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
						alert("히히>>: " + plocation[i]);

						// 주소로 좌표를 검색합니다
						console.log("i 여기는? >>> : " + i);
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(33.450711, 126.570667), // 지도의 중심좌표
							level : 10
						// 지도의 확대 레벨
						};
			
						// 지도를 생성합니다    
						map = new kakao.maps.Map(mapContainer, mapOption);
						console.log("지도를 생성하자");
						// 결과값으로 받은 위치를 마커로 표시합니다	
						// 마커를 생성하고 지도위에 표시하는 함수입니다
						function setMarkers(map) {
							for (var m = 0; m < markers.length; m++) {
								markers[m].setMap(map);
								//console.log(markers[m].getMap(map));
								console.log("마커를 등록하자");
							}
						}
							
						console.log("i다 >>> : " + i);
						var j = 0;
						geocoder.addressSearch(plocation[i],function(result, status) {			
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								
								var img =  '/kosTravel/img/' + j + '.png';
								j++;
								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);
								
								console.log("i >>> : " + i);
								icon = new kakao.maps.MarkerImage(
										img,
										new kakao.maps.Size(31, 35),
										{
											shape : 'poly',
											coords : '16,0,20,2,24,6,26,10,26,16,23,22,17,25,14,35,13,35,9,25,6,24,2,20,0,16,0,10,2,6,6,2,10,0'
										}); // icon
			
								// 마커 하나를 지도위에 표시합니다 
								addMarker(new kakao.maps.LatLng(result[0].y,
										result[0].x));
			
								function addMarker(position) {
			
									// 마커를 생성합니다
									marker = new kakao.maps.Marker({
										position : position,
										image : icon
									});
			
									console.log(position);
			
									// 마커가 지도 위에 표시되도록 설정합니다
									marker.setMap(map);
			
									// 생성된 마커를 배열에 추가합니다
									markers.push(marker);
									console.log(markers);
								} // addMarker end
			
							} // if end
						});// geocorder
					}
			
				//$("#accordion").accordion();
			   	}
				function whenError(){
					alert("request error!");
				}
				// ------------------------ 위치 등록 -------------------------
				$(document).on("click", "#insertBtn", function(){
					console.log("insertBtn >>> : ");			
					//alert("위치를 등록하자 " + pday);
					$("#pday").val(pday);
					var tnum = '<%=tnum%>';
					$("#tnum").val(tnum);
					
					//alert("위치를 등록하자 " + $("#tnum").val());
					$('#planList').attr({
						'action':"location.gotrip",
						'method':'GET',
						'enctype':'multipart/form-data'
					}).submit();
				});
				
				// ------------------------ 위치 삭제 -------------------------
				$(document).on("click", "#deleteBtn", function(){
					console.log("deleteBtn >>> : ");			
					$("#pday").val(pday);
					var tnum = '<%=tnum%>';
					$("#tnum").val(tnum);
					$('#planList').attr({
						'action':"planDelete.gotrip",
						'method':'GET',
						'enctype':'multipart/form-data'
					}).submit();
				});
//		});

		
	
		$(document).on("click", ".group",function(){
			
			var pday = $(this).find('.pday').text();
			//alert("pday>>>: "+ pday);
	        let selecturl = "planSelect.gotrip?tnum=${tnum}";
	        let reqType = "POST";
	        let asyncf = false;
	        let dataParam = {
	      		  pday : pday,
	        };
	       
	        $.ajax({
	    		url: selecturl,
	    		data : dataParam,
	    		type: reqType, 
	    		async : asyncf,
	    		contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
	    		success : whenSuccess,
	    		error : whenError
	    		
	    	});
	    	function whenSuccess(data){
				//alert(data);
				var plocation = data.split(',');
				//alert(plocation[0]);
				//alert((plocation.length-1));
				var map = null;
				var marker = null;

				var markers = [];
				var icon = null;
				
				for (var i = 0; i < (plocation.length-1); i++) {
					//PlanVO _pvo = list.get(i);
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					//alert("히히>>: " + plocation[i]);
					// 주소로 좌표를 검색합니다
					console.log("i 여기는? >>> : " + i);
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(33.450711, 126.570667), // 지도의 중심좌표
						level : 10
					// 지도의 확대 레벨
					};
	
					// 지도를 생성합니다    
					map = new kakao.maps.Map(mapContainer, mapOption);
					console.log("지도를 생성하자");
					// 결과값으로 받은 위치를 마커로 표시합니다	
					// 마커를 생성하고 지도위에 표시하는 함수입니다
					function setMarkers(map) {
						for (var m = 0; m < markers.length; m++) {
							markers[m].setMap(map);
							//console.log(markers[m].getMap(map));
							console.log("마커를 등록하자");
						}
					}
						
					var j = 0;
					geocoder.addressSearch(plocation[i],function(result, status) {
						console.log("i >>> : " + i);
						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {
							var img =  '/kosTravel/img/' + j + '.png';
							j++;
							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);
							
							//console.log("i >>> : " + i);
							icon = new kakao.maps.MarkerImage(
									img,
									new kakao.maps.Size(31, 35),
									{
										shape : 'poly',
										coords : '16,0,20,2,24,6,26,10,26,16,23,22,17,25,14,35,13,35,9,25,6,24,2,20,0,16,0,10,2,6,6,2,10,0'
									}); // icon
	
							// 마커 하나를 지도위에 표시합니다 
							addMarker(new kakao.maps.LatLng(result[0].y,
									result[0].x));
	
							function addMarker(position) {
	
								// 마커를 생성합니다
								marker = new kakao.maps.Marker({
									position : position,
									image : icon
								});
	
								console.log(position);
	
								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
	
								// 생성된 마커를 배열에 추가합니다
								markers.push(marker);
								console.log(markers);
							} // addMarker end
	
						} // if end
					});// geocorder
				}
		
			//$("#accordion").accordion();
	    	}
			function whenError(){
				alert("request error!");
			}
			
			// ------------------------ 위치 등록 -------------------------
			$(document).on("click", "#insertBtn", function(){
				console.log("insertBtn >>> : ");			
				//alert("위치를 등록하자 " + pday);
				$("#pday").val(pday);
				var tnum = '<%=tnum%>';
				$("#tnum").val(tnum);
				
				alert("위치를 등록하자 " + $("#tnum").val());
				$('#planList').attr({
					'action':"location.gotrip",
					'method':'GET',
					'enctype':'multipart/form-data'
				}).submit();
			});
			
			// ------------------------ 위치 삭제 -------------------------
			$(document).on("click", "#deleteBtn", function(){
				console.log("deleteBtn >>> : ");			
				$("#pday").val(pday);
				$("#tnum").val(<%=tnum%>);
				$('#planList').attr({
					'action':"planDelete.gotrip",
					'method':'GET',
					'enctype':'multipart/form-data'
				}).submit();
			});
		});
		// ------------------------ 체크박스 설정 -------------------------
		$(document).on("click", "#pnum",function(){
			
			if($(this).prop("checked", false)){
				$(".pnum").prop("checked", false);
				$(this).prop("checked", true);
			}


			  
		});
		
		
		/*
		$("#pday").change(function(){
			var pday = $(".pday option:selected").val();
			$('#planList').attr({
				'action':"planSelectAll.gotrip",
				'method':'GET',
				'enctype':'multipart/form-data'
			}).submit();
		});
		*/
		
		// ---------------------- accordion ----------------------
		$( function() {
			$( "#accordion" )
		      .accordion({
		        header: "> div > h3"
		        
		      })
		      .sortable({
		        axis: "y",
		        handle: "h3",
		        stop: function( event, ui ) {
		          // IE doesn't register the blur when sorting
		          // so trigger focusout handlers to remove .ui-state-focus
		        	
	
		          ui.item.children( "h3" ).triggerHandler( "focusout" );
		          // Refresh accordion to handle new order
		          $( this ).accordion( "refresh" );	
		       }
			
		 });
		});

	});
	//.responseText 에라잇
	
	</script>
	<!------------------------------------- Kakao Map End ---------------------------------------------->
	<form name="planList" id="planList">
		<input type="hidden" id="pday" name="pday"/>
		<input type="hidden" id="tnum" name="tnum"/>
		
		<div class="map_1"></div>
		<!------------------------------------ accordion 시작 --------------------------------------------->
		<div id="accordion">
			<%
				for (int j = 1; j <= maxday; j++) {
			%>

			<div class="group">
				<!-- <input type="hidden" name="pday" class="pday" value="<%= j %>"/> -->
				<h3><span class="pday"><%=j%></span>일차</h3>
				<table class="table"
					style="width: 800px; margin: 30px 0px 0px 620px;">
					<thead class="table-success">

						<tr>
							<th><input type="checkbox" name="chkAll" id="chkAll"></th>
							<th>순번</th>
							<th>날짜</th>
							<th>일차</th>
							<th>주소</th>
							<th>이름</th>
							<th>메모</th>
						</tr>
					</thead>
					<%
						int a = 0;
					for (int i = 0; i < nCnt; i++) {
						PlanVO _pvo = list.get(i);
					%>
					<tbody>
						<%
							if (Integer.parseInt(list.get(i).getPday()) == j) {
							
							a++;
						%>
						<tr>
							<td class="tt"><input type="checkbox" id="pnum" name="pnum"
								class="pnum" value=<%=_pvo.getPnum()%>></td>
							<td class="tt"><%=a%></td>
							<td class="tt"><%=_pvo.getPday()%></td>
							<td class="tt"><%=_pvo.getPlocation()%></td>
							<td class="tt"><%=_pvo.getPname()%></td>
							<td class="tt"><%=_pvo.getPmemo()%></td>						
						</tr>

						<%
							}
						}
						%>
						<tr>
							<td colspan="7" align="right"><input type="button"
								value="일정추가하기 " id="insertBtn"> <input type="button"
								value="일정삭제" id="deleteBtn"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%
				}
			%>
		</div>
		<!------------------------------------ accordion 끝 --------------------------------------------->
	</form>


</body>
</html>