<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>여행추가</title>
	<link rel="stylesheet" href="/kosTravel/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="/kosTravel/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#insert_btn").click(function(){
				alert("여행추가 클릭 ! >>> : 여행추가 컨트롤러로 이동");
				
				$("#plandate").attr({
					"method":"GET",
					"action":"travelInsert.gotrip"
				}).submit();
			});
			
			$("#tstartdate").datepicker({
				showOn:"button",
				buttonImage:"/kosTravel/calendar_datepicker/images/calendar.gif",
				dateFormat: 'yy-mm-dd',
				buttonImageOnly:false,
				buttonText:"Select date"
			});
			
			$("#tenddate").datepicker({
				showOn:"button",
				buttonImage:"/kosTravel/calendar_datepicker/images/calendar.gif",
				dateFormat: 'yy-mm-dd',
				buttonImageOnly:false,
				buttonText:"Select date"
			});
			
			/*
			showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다. 
			buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지 
			buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다. 
			changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다. 
			changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다. 
			minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다. 
			nextText: '다음 달', // next 아이콘의 툴팁. 
			prevText: '이전 달', // prev 아이콘의 툴팁. 
			numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다. 
			stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
			yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가. 
			showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
			currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널 
			closeText: '닫기', // 닫기 버튼 패널 
			dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식. 
			showAnim: "slide", //애니메이션을 적용한다. 
			showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식. 
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식. 
			yearRange: "2010:2013" //연도 범위
		*/
		});
	</script>
</head>
<body>
	<h3>여행을 추가하세요</h3>
	<hr>
	<form name="plandate" id="plandate">
		여행이름을 적어주세요 : <input type="text" id="tname" name="tname"/>
		<input type="text" id="tstartdate"name="tstartdate" size="10" placeholder="시작일">
		<input type="text" id="tenddate" name="tenddate" size="10" placeholder="종료일"><br>
		<input type="button" id="insert_btn" name="insert_btn" value="추가">
	</form>
</body>
</html>