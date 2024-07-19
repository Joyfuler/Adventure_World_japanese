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
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script type="text/javascript"	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
				$('.input_wrap_visitor').hide('fast');				
			} else {
				// 체크 해제시, 원상복구
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
				$('.input_wrap_visitor').show('fast');
			}	
		});
		// 포인트 사용 선택시
		$('#pntChk').click(function(){
			if ($(this).prop('checked')){
				$('#pointInput').prop('disabled', false);
				$('.payForMemberPoint').prop('disabled',false);
			} else {
				$('#pointInput').prop('disabled', true);
				$('.payForMemberPoint').prop('disabled',true);
			}
		});
		// 포인트 입력 시 최종 결제금액에서 차감
		$('#pointInput').keyup(function(){
			var realPointValue = parseInt($('#realPoint').val()) || 0;
			var enteredValue = parseInt($(this).val()) || 0;			
			if (enteredValue > realPointValue){
				alert("입력한 포인트가 현재 포인트를 초과하였습니다.");
				$(this).val(0);
				updateMemberPoint();
			} else if (isNaN(realPointValue) || isNaN(enteredValue) || enteredValue <0) {
				alert("포인트는 숫자로 입력해주세요.");
				$(this).val(0);
			} else {
				updateMemberPoint();
			}			
		});	
		// 멤버십 포인트로 할인받기 클릭시
		$('.payForMemberPoint').click(function(){
			var payPreAmt = parseInt($('#payPreAmt').text()) || 0;
			var enteredValue = parseInt($('#pointInput').val()) || 0;
			if (payPreAmt < enteredValue){				
				alert('결제 금액이 음수가 되지 않도록 포인트를 조정해주세요.');				
				payPreAmt = parseInt($('#totOrderAmt').text()) || 0;
				$('#payPreAmt').text(payPreAmt); 
				$('#pointInput').val(0);
				$('#memberPoint').val('${member.mpoint}');				
			} else {
			$('#disCountmemberPoint').text(enteredValue);
			updateTotalOrderAmount();
			}
		});		
		// 결제하기 버튼 클릭시. 선택된 결제방식에 따라 다른 결제방식창 호출
		$('.payBtn').click(function(){			
			var chk1 = $('#chkAgr1');
			var chk2 = $('#chkAgr2');
			if (!chk1.prop('checked') || !chk2.prop('checked')){
				alert('필수 동의 약관 사항에 동의해주세요.');
			} else {
				var selectedPayment = $('input[name="payment"]:checked');
				var pgValue = selectedPayment.data('id');
				var amount = parseInt($('#payPreAmt').text()) || 0;
				var mid = '${member.mid}';
				var currentTime = new Date();				
				var orderNo = mid + currentTime;				
				IMP.init('imp47220035');
				 IMP.request_pay({				        
				        pg : pgValue,
				        merchant_uid: orderNo,
				        name : 'Adventure World 티켓결제',
				        amount : amount,
				 }, function(rsp){
					 console.log(rsp);
					 if (rsp.success){
						 console.log('결제성공');
						 $('.orderCompleteForm').submit();
					 } else {
						 console.log('결제실패');
						 var msg = "결제에 실패하였습니다.";						 
					 }
				 });
			}	
		});		
	});
	</script>
	<script>
	function updateMemberPoint(){
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
	<script>
	function updateTotalOrderAmount(){
		var payPreAmt = parseInt($('#payPreAmt').text()) || 0;
		var disCountmemberPoint = parseInt($('#disCountmemberPoint').text()) || 0;
		var newTotOrderAmt = payPreAmt - disCountmemberPoint;
		$('#payPreAmt').text(newTotOrderAmt);
		alert('총 금액에서 ' + disCountmemberPoint + '원 만큼 할인이 적용되었습니다.');	}		
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
	<div class="page-title" style="text-align: center; font-weight: bold;">
		<div class="container"
			style="background-color: #5c10e6; color: white;">
			<h3	style="font-family: 'IBM Plex Sans KR', sans-serif; font-size: 50px; text-align: center;">チケット決済ページ</h3>
		</div>
		<br><br>		
	</div>
	<div class="accordion" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header text-center" id="headingOne">
				<button class="accordion-button collapsed bg-light bg-gradient text-center" type="button"					
				data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="false" aria-controls="collapseOne">
					顧客情報 <span style = "color: purple;">&nbsp;&nbsp;&nbsp;${member.mname }</span> &nbsp; &nbsp; 様
				</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse collapsed"
				aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				<div class="accordion-body">			
					<div class="input_wrap clfix">
						<label for="name" style="font-weight: bold;">お名前</label>
						<div id="name-data">${member.mname }</div>
							<input type="hidden" id="mname" value="${member.mname }">
						</div>
						<div class="input_wrap clfix">
							<label for="str_email01" style="font-weight: bold;">Eーメル</label>
							<div id="email-data">
								${member.memail }
							</div>
						<input type="hidden" id="memail" value="${member.memail }">
						</div>
						<div class="input_wrap">
							<div class="clfix">
								<label for="phone" style="font-weight: bold;">携帯番号</label>
								<div class="number txtColorType05 fl" id="mobile-data">
								${member.mphone }
								</div>
							<input type="hidden" id="mphone" value="${member.mphone }">
							</div>
						</div>
					</div>
				</div>
			</div>
		<form action = "${conPath }/order/orderComplete.do" method = "post" class = "orderCompleteForm">
		<input type = "hidden" name = "mid" value = "${member.mid }">		
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingTwo">
				<button class="accordion-button bg-light bg-gradient" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseTwo"
					aria-expanded="true" aria-controls="collapseTwo">来場者情報</button>
			</h2>
			<div id="collapseTwo" class="accordion-collapse collapse show"
			aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<input type="checkbox" id="afterMid" tabindex="1">
					<label for="afterMid">会員情報と同じ</label>
				</div>
				<div class="input_wrap_visitor">
					&nbsp; &nbsp; <label>名前 &nbsp; <sup style = "color: red;">*</sup></label> 
					<input type="hidden" id="visitUserName" name="oname" tabindex="2" value="${member.mname }" style="color: red;"> 
					<input type="text" id="visitUserName_check" name="oname" tabindex="2"> 
					<div class="input_wrap_visitor">
						&nbsp; &nbsp; <label for="str_email01">E-メル <sup style = "color: red;">*</sup></label>				
						<input type="hidden" id="visitUserEmail" name = "omail" value = '${member.memail }'
						placeholder="email 계정" tabindex="3"> 
						<input type="text" id="visitUserEmail_check" name = "omail"
						tabindex="3">					
					</div>
					<div class="input_wrap_visitor">
						<div class="cellPhone">
							&nbsp; &nbsp; <label for="phone">携帯番号 <sup style = "color: red;">*</sup></label>					
							<input type="hidden" id = "visitUserPhone" name = "ophone" placeholder="携帯番号を入力してください" 　tabindex="7"
							value = "${member.mphone }"> 
							<input type="text" id="visitUserPhone_check"
							placeholder = "番号を入力" tabindex="7" name = "ophone"
							oninput="autoHyphen(this)" maxlength="13s">
						</div>
					</div>	
					<div class="listBox">
						<ul class="listTypeDot import">							
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
				ポイント割引
			</button>
			</h2>
			<div id="collapseThree" class="accordion-collapse collapse"
			aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				<br><br>			
				&nbsp; &nbsp;<input type="checkbox" name="pntChk" id="pntChk" tabindex="9">
				<label>メンバポイントを使って割引</label>
				<br><br>
				<div class = "memberPoint">					
					&nbsp; &nbsp; <span>(使えるポイント: <em id="memberPoint">0</em> P)</span>
					<input type = "hidden" id = "realPoint" value = "${member.mpoint }">							
					<input type="text" id="pointInput" name = "ompoint" disabled="disabled" value = "0">
					<input type="button" value = "ポイントを使用" class = "payForMemberPoint" disabled="disabled">
					<br><br>
				</div>					
			</div>
		</div>	
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingFour">
			<button class="accordion-button collapsed bg-light bg-gradient" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapseFour"
				aria-expanded="false" aria-controls="collapseFour">
				決済手段を選択
			</button>
		</h2>
		<div id="collapseFour" class="accordion-collapse collapse show"
			aria-labelledby="headingFour" data-bs-parent="#accordionExample">
			<br>						
			<div class="itemTit" style = "padding-left: 10px;">
				<strong>決済手段</strong>
			<br><br>
			</div>			
			<div class="pay-check-list" style = "padding-left: 10px;">
				<p class="checks">
					<input type="radio" name="payment" value="kakaoPay" id="payment1" checked = "checked" data-id="kakaopay.TC0ONETIME">
					<label for="payment1">
						<img src = "${conPath }/images/kakaopay.png" style = "height:25px;">KAKAOPAY
					</label>	
					<label for = "payment2">
						&nbsp; &nbsp; <input type = "radio" name = "payment" value = "cardPay" id = "payment2" data-id = "kcp.AO09C"> クレジットカード決済				
					</label>
					<label for="payment3">
						&nbsp; &nbsp; <input type="radio" name="payment" value="naverPay" id="payment3" data-id = "naverco" disabled = "disabled">					
						<img src = "${conPath }/images/naverpay.png" style = "height:25px;">NAVERPAY
					</label>
				</p>
				<div class="methodWrap" id="pay_tab07">
					<div>
							· NAVERPAYはNAVERのIDにクレジットカードもしくは銀行口座情報を登録して決済できる簡単決済サービスです。<br>							
							· 対応している決済手段 : NAVERPAY決済ページで選択できるクレジットカード・口座全部<br>
					</div>
				</div>
				<div class="methodWrap" id="pay_tab08">
					<div>
							· KAKAOPAYはカカオトークに個人のクレジットカードを登録し、PWで簡単に決済できる
							モバイル決済サービスです。携帯名義とカードの名義を一致させる事で使用できます。<br> 
							· KAKAOPAYで決済する場合、レシートは （株）KAKAOPAYにて発行できます。
					</div>
					<br><br>
				</div>
				<div class="payWrap">
					<strong>구매예정 내역</strong>
					<div class="amountWrap">
						<div class="totalOrder">							
								<ul>								
									<c:if test = "${amountInfo.type0sum != 0 }">
										<li> 자유이용권 ( 어른 : ${amountInfo.type0adult } 매 / 청소년 : ${amountInfo.type0youth } 매)
										<span> 
											합 계 ( ${amountInfo.type0sum } )원			
										</span>
										</li>
									</c:if>
									<c:if test = "${amountInfo.type1sum != 0 }">
										<li> 패스트티켓  (어른 : ${amountInfo.type1adult } 매 / 청소년 : ${amountInfo.type1youth } 매)
										<span> 
										합 계 ( ${amountInfo.type1sum } )원
										</span>
										</li>
									</c:if>
									<li class="total">총 주문금액 
										<span class="price">
											<b id="totOrderAmt">${amountInfo.type0sum + amountInfo.type1sum }</b> 원
										</span>
									</li>
								</ul>
							</div>
							<div class="totalDiscount">
								<ul>									
									<li id="discntDpPnt">포인트사용
										<span class="price"><b id="disCountmemberPoint">0</b> 원</span>
									</li>
								</ul>
							</div>
							<div class="scheduledPay">
								<div class="total">
									결제예정금액									
									<span class="price"> <b id="payPreAmt">
									${amountInfo.type0sum + amountInfo.type1sum }</b> 원</span>
								</div>
							</div>
						</div>				
					<div class="termsAgree">
						<span style = "font-size: 12px; font-weight: bold;"> &nbsp; ※결제하신 금액의 10%만큼 멤버십 포인트가 적립됩니다.</span><br>				
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
							<label for="chkAgr3">개인정보 제3자 제공 동의 <span
								id="hspanAgreePrivacyCmt" class="txtColorType03">(선택)</span></label>					
						</div>
					</div>
					<div class="listBox">
						<p class="dotStyle">필수 항목에 모두 동의하셔야 서비스를 이용하실 수 있습니다.</p>
					</div>
				</div>
				<div class="btnArea">
					<input type = "button" id = "paymentBtn" class = "btn btn-primary bg-dark payBtn" value = "결제하기">
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