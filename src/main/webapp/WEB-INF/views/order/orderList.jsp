<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 /결제</title>
<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js"></script>
<script>
const autoHyphen = (target) => {
	 target.value = target.value.replace(/[^0-9]/g, '')
	 .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}
</script>
<script>
	$(document).ready(function(){	
	var realPointValue = parseInt($('#realPoint').val()) || 0;
	updateMemberPoint();
		// 구매자정보와 동일 체크
		$('#afterMid').click(function(){
			var chargeUserName = $('#mname').val();		// 구매자명
			var chargeUserEmail = $('#memail').val();	// 구매자이메일
			var chargeUserPhone = $('#mphone').val();	
			if ($(this).is(":checked")){				
				// 이름 자동입력
				$('#visitUserName').prop("disabled", false);
				$('#visitUserName').val(chargeUserName);
				$('#visitUserName_check').prop("disabled",true);
				$('#visitUserName_check').val(chargeUserName);
				// 이메일 자동입력
				$('#visitUserEmail').prop("disabled", false);
				$('#visitUserEmail').val(chargeUserEmail);
				$('#visitUserEmail_check').prop("disabled",true);
				$('#visitUserEmail_check').val(chargeUserEmail);
				// 휴대폰번호 자동입력
				$('#visitUserPhone').prop("disabled", false);
				$('#visitUserPhone').val(chargeUserPhone);
				$('#visitUserPhone_check').prop("disabled", true);
				$('#visitUserPhone_check').val(chargeUserPhone);
				$('.input_wrap_visitor').hide('slow');				
			} else {
				$('#visitUserName').val('');
				$('#visitUserName').prop("disabled", true);
				$('#visitUserName_check').val('');
				$('#visitUserName_check').prop("disabled",false);				
				$('#visitUserEmail').val('');
				$('#visitUserEmail').prop("disabled", true);
				$('#visitUserEmail_check').val('');
				$('#visitUserEmail_check').prop("disabled",false);				
				$('#visitUserPhone').val('');
				$('#visitUserPhone').prop("disabled", true);
				$('#visitUserPhone_check').val('');
				$('#visitUserPhone_check').prop("disabled",false);				
				$('.input_wrap_visitor').show('slow');
			}	
		});
		
		$('#pntChk').click(function(){
			if ($(this).prop('checked')){
				$('#pointInput').prop('disabled', false);
			} else {
				$('#pointInput').prop('disabled', true);
			}
		});
		
		$('#pointInput').keyup(function(){
			var realPointValue = parseInt($('#realPoint').val()) || 0;
			var enteredValue = parseInt($(this).val()) || 0;			
			if (enteredValue > realPointValue){
				alert("입력한 포인트가 현재 포인트를 초과하였습니다.");
				$(this).val(0);
				updateMemberPoint();
			} else if (isNaN(realPointValue) || isNaN(enteredValue)){
				alert("포인트는 숫자로 입력해주세요.");
				$(this).val(0);
			} else {
				updateMemberPoint();
			}			
		});		
	});		
	function updateMemberPoint(realPointValue){
		var realPointValue = parseInt($('#realPoint').val()) || 0;
		var enteredValue = parseInt($('#pointInput').val()) || 0;
		var result = realPointValue - enteredValue;
		if (result <0){
			alert('사용할 수 있는 포인트가 부족합니다.');
			result = 0;
			$('#memberPoint').text(realPointValue);
		} else {		
			$('#memberPoint').text(result);
		}
	}	
</script>
</head>
<link href="${conPath }/css/order.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<body style="background-image: url('${conPath}/images/bg_pc_visual.png'); background-repeat: no-repeat;">
	<jsp:include page="../main/header.jsp" />
	<c:if test = "${empty member }">
		<script>
		alert('로그인 후 이용 가능합니다.');
		location.href='${conPath}/member/loginMember.do';
		</script>
	</c:if>		
	<c:if test = '${not empty orderAddMsg }'>
		<script>
			alert('${orderAddMsg}');
		</script>
	</c:if>	
	<c:if test = "${not empty orderList }">
		<script>
			alert('${orderList}');
		</script>
	</c:if>	
	<div class="page-title" style="text-align: center; font-weight: bold;">
		<div class="container"
			style="background-color: #5c10e6; color: white;">
			<h3	style="font-family: 'IBM Plex Sans KR', sans-serif; font-size: 50px; text-align: center;">이용권 결제 페이지</h3>
		</div>
		<br><br>
		${orderList }
		
	</div>
	<div class="accordion" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header text-center" id="headingOne">
				<button class="accordion-button collapsed bg-light bg-gradient text-center
" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="false" aria-controls="collapseOne">
					구매자정보 <span style = "color: purple;">&nbsp;&nbsp;&nbsp;${member.mname }</span> &nbsp; &nbsp; 님
				</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse collapsed"
				aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				<div class="accordion-body">			
					<div class="input_wrap clfix">
						<label for="name" style="font-weight: bold;">이름</label>
						<div id="name-data">${member.mname }</div>
						<input type="hidden" id="mname" value="${member.mname }">
					</div>
					<div class="input_wrap clfix">
						<label for="str_email01" style="font-weight: bold;">이메일</label>
						<div id="email-data">${member.memail }</div>
						<input type="hidden" id="memail" value="${member.memail }">
					</div>
					<div class="input_wrap">
						<div class="clfix">
							<label for="phone" style="font-weight: bold;">휴대폰</label>
							<div class="number txtColorType05 fl" id="mobile-data">${member.mphone }
							</div>
							<input type="hidden" id="mphone" value="${member.mphone }">
						</div>
					</div>
				</div>
			</div>
		</div>
		<form action = "">
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingTwo">
				<button class="accordion-button bg-light bg-gradient" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseTwo"
					aria-expanded="true" aria-controls="collapseTwo">방문자정보</button>
			</h2>
		<div id="collapseTwo" class="accordion-collapse collapse show"
		aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
			<div class="accordion-body">
				<input type="checkbox" id="afterMid" name="mid" tabindex="1">
				<label for="chkChgUsr">구매자 정보와 동일</label>
		</div>
		<div class="input_wrap_visitor">
			&nbsp; &nbsp; <label>이름 &nbsp; <sup style = "color: red;">*</sup></label> 
			<input type="hidden" id="visitUserName" name="mname" tabindex="2" value="${member.mname }" style="color: red;"> 
			<input type="text" id="visitUserName_check" name="mname" tabindex="2"> 
			<div class="input_wrap_visitor">
				&nbsp; &nbsp; <label for="str_email01">이메일 <sup style = "color: red;">*</sup></label>				
				<input type="hidden" id="visitUserEmail" name = "memail" value = '${member.memail }'
				placeholder="email 계정" tabindex="3"> 
				<input type="text" id="visitUserEmail_check" name = "memail"
				tabindex="3">					
			</div>
			<div class="input_wrap_visitor">
				<div class="cellPhone">
				&nbsp; &nbsp; <label for="phone">휴대폰 <sup style = "color: red;">*</sup>
					</label>
					<input type="hidden" id = "visitUserPhone" name = "mphone" placeholder="휴대폰 번호를 입력하세요" tabindex="7"
						value = "${member.mphone }"> 
					<input type="text" id="visitUserPhone_check"
						placeholder = "전화번호 입력" tabindex="7" name = "mphone"
						oninput="autoHyphen(this)" maxlength="13s">
				</div>
			</div>	
				<div class="listBox">
					<ul class="listTypeDot import">
						<li>방문자 정보의 이메일 주소로 티켓 정보 URL이 전송됩니다.</li>
					</ul>
				</div>		
		</div>			
	</div>
	</div>
	<div class="accordion-item">
		<h2 class="accordion-header" id="headingThree">
			<button class="accordion-button collapsed bg-light bg-gradient" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapseThree"
				aria-expanded="false" aria-controls="collapseThree">
				포인트 할인
			</button>
		</h2>
		<div id="collapseThree" class="accordion-collapse collapse"
			aria-labelledby="headingThree" data-bs-parent="#accordionExample">
					<br><br>			
					&nbsp; &nbsp;<input type="checkbox" name="pntChk" id="pntChk" tabindex="9">
					<label>멤버십 포인트로 할인받기 </label>
					<br><br>
					<div class = "memberPoint">					
					&nbsp; &nbsp; <span>(가용 멤버십 포인트: <em id="memberPoint">1000</em> P)</span>
					<input type = "hidden" id = "realPoint" value = "1000">							
					<input type="text" id="pointInput" name = "mpoint" disabled="disabled">
					<input type="button" value = "포인트사용">
					<br><br>
					</div>					
		</div>
	</div>
	<!--  여기서부터 -->
	<div class="accordion-item">
		<h2 class="accordion-header" id="headingFour">
			<button class="accordion-button collapsed bg-light bg-gradient" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapseFour"
				aria-expanded="false" aria-controls="collapseFour">
				결제방식 선택
			</button>
		</h2>
		<div id="collapseFour" class="accordion-collapse collapse"
			aria-labelledby="headingFour" data-bs-parent="#accordionExample">
			<br>						
			<div class="itemTit" style = "padding-left: 10px;">
				<strong>결제수단</strong>
			<br><br>
			</div>			
				<div class="pay-check-list" style = "padding-left: 10px;">
					<p class="checks">
						<input type="radio" name="payment" class="kakaopay" id="payment1" checked = "checked">
							<label for="payment1">
							<img src = "${conPath }/images/kakaopay.png" style = "height:25px;">카카오페이</label>					
						&nbsp; &nbsp; <input type="radio" name="payment" class="naverPay" id="payment2">
							<label for="payment2">
							<img src = "${conPath }/images/naverpay.png" style = "height:25px;">네이버페이</label>
					</p>
					<div class="methodWrap" id="pay_tab07">
						<div>
							· 네이버페이는 네이버ID로 신용카드 또는 은행계좌 정보를 등록하여 결제할 수 있는 간편결제 서비스입니다.<br>
							· 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.<br>
							· 지원 가능 결제수단 : 네이버페이 결제창 내 노출되는 모든 카드/계좌<br>
						</div>
					</div>
					<div class="methodWrap" id="pay_tab08">
						<div>
							· 카카오페이는 카카오톡에 개인 신용/체크 카드를 등록하여 간단하게 비밀번호 만으로 결제할 수 있는 모바일
							결제 서비스 입니다. 등록 시 휴대폰과 카드 명의자가 동일해야 합니다.<br> · 무이자 할부 서비스
							및 신용카드 전용쿠폰 서비스는 이용이 제한 됩니다.<br> · 카카오머니로 결제 시, 현금영수증
							발급은 (주)카카오페이에서 발급 가능합니다.							
						</div>
						<br><br>
					</div>
					<div class="payWrap">
						<div class="amountWrap">
							<div class="totalOrder">
								<ul>
									<li>어른 X 1
									<span class="price1"> 
									<input type="hidden" name="ticketTotPrice" value="25000.00000">									
									<input type="hidden" name="ticketTotCnt" value="1">
									<input type="hidden" name="ticketGoodsName"
									value="어른">								
									</span>
									</li>
									<li class="total">총 주문금액 <span class="price">
									<b id="totOrderAmt">25,000</b> 원
									</span>
									</li>
								</ul>
							</div>
							<div class="totalDiscount">
								<ul>									
									<li id="discntDpPnt" style="display: none;">포인트사용
									<span class="price"><b id="pntAmtDp">0</b> 원</span>
									</li>									
								
								</ul>
							</div>
							<div class="scheduledPay">
								<div class="total">
									결제예정금액 
									<span class="price"> <b id="payPreAmt">25,000</b> 원</span>
								</div>
							</div>
						</div>				
				<div class="termsAgree">
					<h3 class="tit">
					약관 동의
					</h3>
				</div>	
				<div class="termsArea">
					<div class="checks">
						<div class="group">
							<input type="checkbox" name="chkAgr1" id="chkAgr1" tabindex="13">
							<label for="chkAgr1">전자상거래 이용약관 <span
								class="txtColorType03">(필수)</span></label>
						</div>
						<div class="group">
							<input type="checkbox" name="chkAgr2" id="chkAgr2" tabindex="15">
							<label for="chkAgr2">개인정보 수집·이용 <span
								class="txtColorType03">(필수)</span></label>				
						</div>
						<div class="group">
							<input type="checkbox" name="chkAgr4" id="chkAgr4" tabindex="15">
							<label for="chkAgr4">개인정보 제3자 제공 동의 <span
								id="hspanAgreePrivacyCmt" class="txtColorType03">(선택)</span></label>					
						</div>
					</div>
					<div class="listBox">
						<p class="dotStyle">필수 항목에 모두 동의하셔야 서비스를 이용하실 수 있습니다.</p>
					</div>
				</div>
				<div class="btnArea">					
					<button id = "naverPayBtn" class = "btn btn-primary bg-dark" onclick = "return submitChk()">
						결제하기
					</button>
				</div>
			</div>								
		</div>		
	</div>	
</div>
</form>
</div>
<br><br><br><br>
<br><br><br><br>
<br><br><br><br>
<jsp:include page="../main/footer.jsp" />
</body>
</html>