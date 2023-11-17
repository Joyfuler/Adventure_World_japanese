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
		$('input.mid').keyup(function(){
			var mid = $(this).val();
			let pattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			if (mid.length < 4){
				$('span#idConfirmResult').text('id는 4글자 이상이어야 합니다.');				
			} else if (mid.match(pattern)){
				$('span#idConfirmResult').text('id는 영문/숫자로만 입력해주세요');
			} else {
				$.ajax({
					url: '${conPath}/midConfirm.do',
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
		
		$('.memail').keyup(function(){
			var memail = $(this).val();
			var patternEmail = "^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
			if (!memail.match(patternEmail)){
				$('span#emailChkResult').text('메일 주소 형식이 맞지 않습니다.');				
			} else {				
					$.ajax({
						url : '${conPath}/memailConfirm.do',
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
	});	
</script>	
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<article>
<div class="join3">
	<div class="join_title">회원가입</div>
	<form method="post" name="joinForm" >		
		<div class="basic_box">
			<div class="basic_box_text">
				<label>아이디</label><br>
				<input type="text" name="mid" class="mid dup">			    
			    <br><span id = "idConfirmResult" style = "color:red;"> &nbsp; &nbsp; &nbsp; </span><br><br>
			    <label>비밀번호</label><br><input type="password" name="mpw" class="dup mpw"><br>
			    <label>비밀번호 확인</label><br><input type="password" name="mpwChk" class="dup mpwChk"><br>
			    <span id = "pwChkResult" style = "color:red;"></span><br><br>
			    <label>이름</label><br><input type="text" name="name" class="dup"><br>
			    <label>휴대폰 번호</label><br><input type="text" name="phone" class="dup" maxlength="13" 
										oninput="autoHyphen(this)"><br>			    
			    <label>우편번호</label><br><input type="text" class="dup"  id="sample6_postcode"   name="zip_num"  style="width:390px; " readonly>      
			    <input type="button" onclick="sample6_execDaumPostcode()" class="dup" value="우편번호 찾기" style="width:140px; float:right; text-align:center; font-family:'IBM Plex Sans KR', sans-serif;"><br>
				<label>주소</label><br>
						<input type="text" class="dup"  id="sample6_address"  size="50" name="address1"  value="${dto.address1}" readonly><br><br>
				<label>상세주소(직접입력)</label><br>
						<input type="text"  class="dup" id="sample6_detailAddress"  name="address2"   value="${dto.address2}" size="50"><br>
						<input type="hidden"  class="dup" id="sample6_extraAddress"  name="address3"   value="${dto.address3}" readonly><br>
				<label>이메일</label><br><input type="text" name="memail" class="memail dup"><br>
				<span id = "emailChkResult" style = "color:red;">&nbsp; &nbsp; &nbsp;</span><br><br>
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
		<div class="join_buttons">
			<div class="join_buttons_text">
		    	<input type="button" value="회원가입" class="join_submit" onclick="go_save()"> 
		    	<input type="reset" value="취소" class="join_cancel">
		    	<input type="button" value="돌아가기" class="join_submit" onclick="location.href='/'">
		    </div>
		</div>
	</form>
</div>
</article>
<br><br><br>
<br><br><br>
<br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>