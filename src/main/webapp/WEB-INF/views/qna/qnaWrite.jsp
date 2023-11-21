<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
$(document).ready(function(){
	$('form').submit(function(){
		var qtitle = $('input[name="qtitle"]');
		var qcontent = $('textarea[name="qcontent"]');
		var checkbox = $('input[name="check"]');
		if(!qtitle.val()){
			alert('제목을 입력하세요');
			qtitle.focus();
			return false;
		}else if(!qcontent.val()){
			alert('문의 내용을 입력하세요');
			qcontent.focus();
			return false;
		}else if(checkbox.checked){
			if(!checkbox.val()){
				alert("비밀번호를 입력해주세요");
				document.qna.pass.focus();
				return false;
			}
		}
	});
});
</script>
<script>
function enabled1() {
	if(document.qna.check.checked==true) {
		document.qna.qpw.disabled = false;
	} else {
		document.qna.qpw.disabled = true;
		document.qna.qpw.value="";
	}
}

</script>
<script>
inputTextarea.addEventListener('input', function (e) {
    const inputTextarea = document.getElementById('inputTextarea');

    console.log(inputTextarea.selectionStart); // 커서의 시작 위치
    console.log(inputTextarea.selectionEnd); // 커서의 끝 위치
});
</script>
 <jsp:include page="../main/header.jsp"/>
<article>
<div class="qna">
	<div class="qnaimg" style="background-image:url('images/qnaaa.png');"></div>
	<div class="qnaBox">
		<h2> 1:1 고객 게시판 </h2>
		<h3>고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>

		<form action="${conPath }/qna/qnaWrite.do" class="fix02" name="qna" method="post">
			<input type="hidden" name="command" value="qnaWrite">

	    	<table class="fix03">
	    		<tr>
	    			<th>Secret mode</th>
	    			<td>	
	    				<input type="checkbox" name="check" value="secret" onchange="enabled1()">
    						&nbsp;비밀글로 하기&nbsp;&nbsp;
    					<input type="password" name="qpw" id="pass" size="15" 
    					 style= "background: lightgray;" disabled="disabled" >
					</td>
	    		</tr>
				<tr>
					<th>제목</th>
					<td width="500" style="text-align:left;">
						<input type="text" name="qtitle" size="50" autofocus="autofocus" >
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td align="left" style="text-align:left;font-size:115%;">
						<textarea rows="8" cols="52" name="qcontent" ></textarea>
					</td>
				</tr>
				<%-- <tr>
				<c:if test="${not empty worker }"> 
					<th>내용</th>
					<td align="left" style="text-align:left;font-size:115%;">
						<textarea rows="8" cols="52" name="reply" ></textarea>
					</td>
				</c:if>
				</tr> --%>
			</table>
		<br>
		<div class="buttons">
			<input type="submit" value="글쓰기" class="purpleBtn" style="border:none;" > 
			<input type="reset" value="취소" class="purpleBtn" style="border:none;"  
				onclick="location.href='${conPath}/qna/qnaList.do'">
		</div>
		<br>
		</form>
	</div>
</div>
</article>