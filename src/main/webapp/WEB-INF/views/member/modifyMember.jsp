<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<title>会員情報修正</title>
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<c:if test = "${empty member }">
	<script>
		location.href='${conPath}/main.do';
	</script>	
</c:if>
<body>
<script>
	$(document).ready(function(){
		$('.dbmpwChk').keyup(function(){
			var dbmpwChk = $(this).val();
			var dbmpw = $('.dbmpw').val();
			if (dbmpwChk == ''){
				$('.dbmpwChkMsg').text('사용하던 비밀번호를 입력해주세요.');
			} else if (dbmpwChk != dbmpw){
				$('.dbmpwChkMsg').text('기존 비밀번호가 일치하지 않습니다.');
			} else {
				$('.dbmpwChkMsg').css('color','#212529');
				$('.dbmpwChkMsg').text('비밀번호가 일치합니다.');
			}
		});
		
		$('.withdrawal_button').click(function(){
			var answer = confirm('정말로 탈퇴하시겠습니까? 탈퇴한 회원은 동일한 아이디로 가입할 수 없습니다.');
			if (answer){				
				location.href='${conPath}/member/withdrawal.do?mid=${member.mid }';
			}
		})
		
	});			
</script>
<script>
	function modifyChk(){
		var dbmpwChkMsg = $('span.dbmpwChkMsg').text();
		var mpw = $('input[name="mpw"]').val();
		var patternNum = /[0-9]/;
        var patternEng = /[a-zA-Z]/;        
        var patternSpc = /[~`!@#$%^&*()_\-+={}\[\]\\|:;<>,.?\/]/;
        var mphone = $('input.mphone').val();
        var mname = $('input[name="mname"]').val();
		if (dbmpwChkMsg != '비밀번호가 일치합니다.'){
			alert('비밀번호를 다시 확인해주세요.');
			return false;			
		} else if (mpw == ''){
			alert('새 비밀번호를 입력해주세요.'); 
			return false;
		} else if (mpw.length <4 || !mpw.match(patternNum)){
			alert('비밀번호는 4자리 이상, 영문과 숫자·특수문자를 포함하여 입력해야 합니다.');
			return false;			
		} else if (mphone ==''){
			alert('휴대폰 번호는 필수 입력사항입니다.');
			return false;
		} else if (mname ==''){
			alert('이름을 입력해주세요.');
			return false;
		}
	}
</script>
<jsp:include page="../main/header.jsp"/>
<article>
<div class="join3">
	<div class="join_title">会員情報修正</div>
	<form action = "${conPath }/member/modify.do" method="post" name="joinForm">
		<input type = "hidden" name = "dbmpw" class = "dbmpw" value = "${member.mpw }"> 
		<div class="basic_box">
			<div class="basic_box_text">
					<label>IDの確認</label>
					<br>
					<input type = "text" name = "mid" value = "${member.mid }" class = "dup" readonly = "readonly">
					<br>				
				    <label>現在のパスワード</label><span style = "color: red;">*</span>
			    	<br>
			    	<input type="password" class="dup dbmpwChk">
			    	<br> 
			    	<span class = "dbmpwChkMsg" style = "color: red; font-size : 0.9em;">&nbsp; &nbsp; </span>
			    	<br><br>
				    <label>変更するパスワード</label><span style = "color: red;">*</span>
			    	<br>
			    	<input type="password" name="mpw" class = "mpw">
			    	<br>
				    <label>名前</label><span style = "color: red;">*</span>
			    	<br>
			    	<input type="text" name="mname" class="dup" value="${member.mname}">
			    	<br>
				    <label id=last>携帯番号</label><span style = "color: red;">*</span>
			    	<input type="text" name="mphone" class = "mphone" class="dup" value="${member.mphone}"><br>			   
			    	<label>郵便番号</label>
			    	<br>
			    	<input type="text" class="dup"  id="sample6_postcode" name="maddress1" value="${member.maddress1}"  style="width:400px;" readonly = "readonly">      
			    	<input type="button" onclick="sample6_execDaumPostcode()" class="dup" value="郵便番号検索" style="width:140px; float:right; text-align:center" ><br>
					<label>住所</label>
					<br>
					<input type="text" class="dup" id="sample6_address"  size="50" name="maddress2" value="${member.maddress2}" readonly><br><br>
					<label>住所の詳細</label>
					<br>
					<input type="text" class="dup" id="sample6_detailAddress"  name="maddress3" value="${member.maddress3}" size="50"><br>
					<input type="hidden" class="dup" id="sample6_extraAddress">
					<br>				
					<label>メール(変更は不可)</label>
					<br>
					<input type="text" name="memail" class="dup" value = "${member.memail }" readonly = "readonly">
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
		<br><br>
		<br><br>
		<div class="join_buttons">
			<div class="join_buttons_text">
			    <input type="submit" value="修正" class="join_submit" onclick="return modifyChk()"> 
			    <input type="reset" value="初期化" class="join_cancel">
			    <input type="button" value="会員脱退" class="withdrawal_button join_cancel">
			</div>
		</div>
	</form>
</div>
</article>
<br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>