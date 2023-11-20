<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<title>회원가입 페이지</title>
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
const autoHyphen = (target) => {
	 target.value = target.value.replace(/[^0-9]/g, '')
	 .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}
</script> 
<script>
	$(document).ready(function(){
		/* 아이디 중복확인 */
		$('input.mid').keyup(function(){
			var mid = $(this).val();
			let pattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			if (mid.length < 4){
				$('span#idConfirmResult').text('id는 4글자 이상이어야 합니다.');				
			} else if (mid.match(pattern)){
				$('span#idConfirmResult').text('id는 영문/숫자로만 입력해주세요');
			} else {
				$.ajax({
					url: '${conPath}/member/midConfirm.do',
					type: 'post',
					data: {mid : mid},
					dataType : 'html',
					success : function(data){						
						$('span#idConfirmResult').css('color','#212529');
						$('span#idConfirmResult').html(data);
					},
				});
			}
		});
		
		$('.mpw, .mpwChk').keyup(function(){
			var pw = $('.mpw').val();
			var pwChk = $('.mpwChk').val();
			var patternNum = /[0-9]/;
	        var patternEng = /[a-zA-Z]/;        
	        var patternSpc = /[~`!@#$%^&*()_\-+={}\[\]\\|:;<>,.?\/]/;        
			if(!pw && !pwChk){
				$('#pwChkResult').text('비밀번호를 입력하세요.');
			} else if (pw.length <4 || !pw.match(patternNum) || !pw.match(patternEng) || !pw.match(patternSpc)){
				$('#pwChkResult').text('비밀번호는 4자리 이상, 영문과 숫자·특수문자를 포함하여 입력해야 합니다.');
			} else if (pw != pwChk) {
				$('#pwChkResult').text('비밀번호가 일치하지 않습니다.');			
			} else if(pw == pwChk) {
				$('#pwChkResult').css('color','#212529');
				$('#pwChkResult').text('비밀번호가 일치합니다.');
			}
		});
		/* 이메일 중복확인 */
		$('.memail').keyup(function(){
			var memail = $(this).val();
			var patternEmail = "^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
			if (!memail.match(patternEmail)){
				$('span#emailChkResult').text('메일 주소 형식이 맞지 않습니다.');				
			} else {				
					$.ajax({
						url : '${conPath}/member/memailConfirm.do',
						type : 'post',
						data: {memail : memail},
						dataType : 'html',
						success : function(data){
							$('span#emailChkResult').css('color','#212529');
							$('span#emailChkResult').html(data);
						},
						error : function(code){
							$('span#emailChkResult').html(code.statusText);
						},
					});
				}			
		});
		
		/* 이메일 본인인증 */
		$('#mail-Check-Btn').click(function(){
			var memail = $('.memail').val();
			var checkInput = $('.mail-check-Input');
			var authCodeCompare = $('.authCodeCompare');
			$.ajax({
				type : 'get',
				url : '${conPath}/member/mailCheck.do',
				data: {memail : memail},
				success: function(data){
					var textData = $(data).text().trim();
					checkInput.prop('disabled', false);					
					alert('이메일로 인증번호를 발송했습니다.');												
					authCodeCompare.val(textData);
				},
				error : function(error){					
					console.error('에러 발생 - ajax' + error);
				}
			});			
		});
		
		$('.mail-check-Input').keyup(function(){
			var checkInput = $('.mail-check-Input');
			var authCodeCompare = $('.authCodeCompare');
			if (checkInput.val() == '' || checkInput.val() != authCodeCompare.val()){
				$('.emailAuthResult').text('전송된 인증번호와 입력한 인증번호가 서로 다릅니다.');
			} else {
				$('.emailAuthResult').css('color','#212529');
				$('.emailAuthResult').text('인증번호가 일치합니다.');
			}
		});
	});		
</script>	
<script>
function submitChk(){
	var idConfirmResult = $('span#idConfirmResult').text().trim();	
	var pwChkResult = $('#pwChkResult').text().trim();	
	var memailChkResult = $('span#emailChkResult').text().trim();
	var emailAuthResult = $('.emailAuthResult').text().trim();
	var mname = $('.mname').val();
	var mphone = $('.mphone').val();
	if (idConfirmResult != '사용 가능한 아이디입니다'){
		alert('아이디 중복체크를 해 주세요');
		return false;	
	} else if (pwChkResult != '비밀번호가 일치합니다.'){
		alert('비밀번호 형식을 체크하세요');
		return false;
	} else if (memailChkResult != '사용 가능한 이메일입니다'){
		alert('메일 형식을 체크하세요.');
		return false;
	} else if (mname == ''){
		alert('이름은 필수 입력사항입니다.');
		return false;
	} else if (mphone == ''){
		alert('휴대폰번호는 필수 입력사항입니다.');
		return false;			
	} else if (emailAuthResult != '인증번호가 일치합니다.'){
		alert('메일로 전송한 인증코드를 다시 확인해주세요.');
		return false;
	}
}
</script>
</head>
<c:if test = "${not empty member }">
	<script>
		location.href='${conPath}/main.do';
	</script>
</c:if>
<body>
<jsp:include page="../main/header.jsp"/>
<article>
<div class="join3">
	<div class="join_title">회원가입</div>
	<form method="post" name="joinForm" action = "${conPath }/member/join.do">		
		<div class="basic_box">
			<div class="basic_box_text">
				<label>아이디</label><span style = color:red;>*</span><br>
					<input type="text" name="mid" class="mid dup">			    
			    	<br>
			    	<span id = "idConfirmResult" style = "color:red;"> &nbsp; &nbsp; &nbsp; </span>
			    	<br><br>
			    <label>비밀번호</label><span style = color:red;>*</span>
			    	<br>
			    	<input type="password" name="mpw" class="dup mpw">
				    <br>
			    <label>비밀번호 확인</label><span style = color:red;>*</span>
				    <br>
			    	<input type="password" name="mpwChk" class="dup mpwChk">
				    <br>
			    	<span id = "pwChkResult" style = "color:red;"></span>
				    <br><br>
			    <label>이름</label><span style = color:red;>*</span>
			    	<br>
			    	<input type="text" name="mname" class="dup mname">
			    	<br>
			    <label>휴대폰 번호</label><span style = color:red;>*</span>
			    	<br>
			    	<input type="text" name="mphone" class="dup mphone" maxlength="13" 
					oninput="autoHyphen(this)">
					<br>			    
			    <label>우편번호</label>
			    	<br>
			    	<input type="text" class="dup" id="sample6_postcode" name="maddress1"  style="width:390px;" readonly= "readonly">      
			    	<input type="button" onclick="sample6_execDaumPostcode()" class="dup" value="우편번호 찾기" style="width:140px; float:right; text-align:center; font-family:'IBM Plex Sans KR', sans-serif;">
			   		<br>
				<label>주소</label>
					<br>
					<input type="text" class="dup"  id="sample6_address" name = "maddress2"  size="50" name="address2"  value="${dto.address1}" readonly = "readonly">
					<br><br>
				<label>상세주소(직접입력)</label>
					<br>
					<input type="text"  class="dup" id="sample6_detailAddress"  name="maddress3"   value="${dto.address2}" size="50">
					<br>
					<input type="hidden"  class="dup" id="sample6_extraAddress" value="${dto.address3}" readonly>
					<br>
				<label>이메일</label><span style = color:red;>*</span>
				<br>
					<input type="text" name="memail" class="memail dup" style = "width:430px;">
					<input type="button" id = "mail-Check-Btn" value="이메일인증" style="width:100px; float:right;"><br>
					<span id = "emailChkResult" style = "color:red;">&nbsp; &nbsp; &nbsp;</span>					
					<div class="mail-check-box">
						<input class="form-control mail-check-Input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
						<br>
						<span class = "emailAuthResult" style = "color:red;">&nbsp; &nbsp; &nbsp;</span>
						<br>
						<input type = "hidden" class = "authCodeCompare">
					</div>
				<br>
			</div>
		</div>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>		
		<script>
		    function sample6_execDaumPostcode() {
		        new daum.Postcode( {
		            oncomplete: function(data) {
		                var addr = '';
		                var extraAddr = ''; 
		                if (data.userSelectedType === 'R') { 
		                    addr = data.roadAddress;
		                } else { 
		                    addr = data.jibunAddress;
		                }

		                if(data.userSelectedType === 'R'){
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }

		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                document.getElementById("sample6_detailAddress").focus();
		            }
		        }).open();
		    }
		</script>
		<br><br><br>
		<br><br><br>
		<br><br><br>
		<br><br><br>
		<div class="join_buttons">
			<div class="join_buttons_text">		    	
		    	<input type="submit" value="회원가입" class="join_submit" style = "margin-left: 100px;" onclick = "return submitChk()">		    	
		    	<input type="button" value="돌아가기" class="join_submit" onclick="history.back()">
		    </div>
		</div>
	</form>
</div>
</article>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>