<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<script
  src="https://code.jquery.com/jquery-3.7.1.slim.min.js"
  integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8="
  crossorigin="anonymous"></script>
<link href="${conPath }/css/order.css" rel="stylesheet">  
<script src="${conPath }/js/order.js"></script>
<script>
function go_cart(num){
	var chkCnt = count_check();
	var today = new Date(); // 현재 날짜와 시간을 가지는 Date 객체 생성
	var todayDate = today.toISOString().slice(0, 10); // yyyy-MM-dd 형식의 문자열로 변환
	var dateString = $('#selectedDate').val(); // 비교할 날짜 문자열
	var date = new Date(dateString); // 문자열을 Date 객체로 변환
	if(dateString =='' || dateString == null){
		alert("방문 일자를 선택해주세요");
		return false;
	}		
	else if (todayDate > selectedDate) {
	    alert("방문 일자는 오늘 이후로 선택해주세요.");
		return false;
	} else if($('input[name="p1"]').val() ==0 && $('input[name="p2"]').val() ==0){
		alert("인원을 선택해주세요");
		return false;
	} else if(num==1){
		if ($('#atname1').val() == ''){
			alert("놀이기구 3개를 선택해주세요");
			return false;
		}
	}
}
</script>
<style>
	.container {position:relative; width:900px;} 
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<jsp:include page="../main/header.jsp"/>
<article>
<form action="${conPath }/cart/passTicket.do" method="post" >
	<input type="hidden" name ="type" value="${param.type }">
	<input type="hidden" name ="mid" value="${param.mid }">
	
	<div class="order_box2">
		<div id="calendar"  class="calendar">
			<input type="hidden" id="calendar" name="visitdate2">
		</div>
		<div class="order_box_select2">
			<div class="order_box_title">자유이용권 예매</div>
			<div class="order_box_date">
				<div class="order_box_date_text">방문일자/인원 선택</div>
				<div class="order_box_date_select" onclick="showCalendar()">
					<img src="${conPath }/images/ticket_images/calendar.png" style="width:40px; height:40px;">
				</div>
				<!-- 달력 선택 날짜 표기 -->
				<div id="calendarPopup" class="calendar-popup"></div>
				<div class="order_box_date_date">
					<input type="text" class = "selectedDate" id="selectedDate" name="visitdate">
				</div>
			</div>
			<!-- 수량 표시 -->
			<div class="order_quantity">
				<div class="order_quantity_text">
					<p style="font-weight:bold">어른</p>
					<p style="font-size:14px; color:gray;">만19세이상</p>
				</div>
				<div class="order_quantity_box">	
					<input type="text" name="p1" id="result" value="0" class="order_quantity_count">
				</div>
				<div class="order_quantity_box_button">	
				    <button onclick="decreaseNumber(event, 'result')" class="order_quantity_count_button" style="border-right:1px solid black;">-</button>
					<button onclick="increaseNumber(event, 'result')" class="order_quantity_count_button">+</button> 
				</div>
				<div class="quantityArg"></div>
				<div class="order_quantity_text">
					<p style="font-weight:bold">청소년</p>
					<p style="font-size:14px; color:gray;">만13세~만18세</p>
				</div>
				<div class="order_quantity_box">	
					<input type="text" name="p2" id="result2" value="0" class="order_quantity_count">
				</div>
				<div class="order_quantity_box_button">	
					<button onclick="decreaseNumber(event, 'result2')" class="order_quantity_count_button" style="border-right:1px solid black;">-</button>
					<button onclick="increaseNumber(event, 'result2')" class="order_quantity_count_button">+</button>
				</div>	
			</div>
			<!--  어트랙션 선택 -->
			<!-- 	<div class="order_box_date_text">어트렉션 선택</div>
			<div class="check_wrapp">
							<input type="text" name="atname1" id ="atname1">
			</div> -->
			<div id="reserve_buttons" class="order_box_button">
	        	<input type="submit" value="장바구니" class="purpleButton" onclick="return go_cart(0)">
	       	</div>
			<div id="board-list">
		        <div class="container">
		            <table class="board-table" style="font-size:20px">  
		                <tr>
		                    <th><a href="#!" onclick="toggleAnswer('answer1')">취소/환불</a></th>      
		                </tr>   
		                <tr id="answer1" style="display:none">
		               		 
		                	<th style="font-size:15px; font-weight:normal;background:#F7F7F7;">
								<b>예매취소 안내</b> <br>
								<b>온라인 예매 시 선택한 날짜에만 방문 및 이용이 가능하며, 미사용시에 해당날짜가 지나면 자동 취소 됩니다.</b><br>
								(사용 후에는 취소가 불가능합니다.)<br>
								 - 본인+동반인 티켓 구매 후 동반인 티켓만 사용 시 본인 티켓 취소는 불가합니다. <br>
								 - 본인+동반인 티켓 구매 후 취소하실 경우 동반인 티켓을 먼저 취소하셔야합니다.<br>
								 - 시스템 자동 취소가 될 경우 제휴카드 실적은 은행영업일 기준 2~3일 후에 복구됩니다. <br> 
								 - 별도의 취소 수수료는 없으나 구매 후 환불요청 시 각 카드사에 따라 수수료를 차감합니다. <br>
								 - 예매취소를 원하시는 경우 [마이페이지 > 결제내역]에서 취소하실 수 있습니다. <br>
								 - 예매 후에는 반드시 마이티켓을 통하여 예매내역을 확인해 주시기 바랍니다. <br>
								</th>
		               	</tr>
		               	 <tr>
		                    <th><a href="#!" onclick="toggleAnswer('answer2')">이용안내</a></th>             
		                </tr>
		                <tr id="answer2" style="display:none">
		               		 
		                	<th style="font-size:15px; font-weight:normal; background:#F7F7F7">
								<b>이용 안내</b><br>
								<b> 1. 어드벤처 예매페이지 및 모바일APP을 통한 티켓예매 </b><br>
								<b> 2. 카카오 알림톡(또는 문자메시지)으로 웹티켓 URL 발송 </b><br>
								<b> 3. 웹티켓을 게이트에 제시 후 빠른 입장 </b><br>
								<br>
								※ 예매 후에는 반드시 마이티켓을 통하여 구매하신 웹티켓을 확인해주시기 바랍니다.<br>
								※ 티켓은 선택한 날짜에만 방문 및 이용 가능합니다.(다른 날짜에는 사용 불가)
							</th>					
					</table>
		       </div>
	       </div>
		</div>
	</div>
</form>
</article>