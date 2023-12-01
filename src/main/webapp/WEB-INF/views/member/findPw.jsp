<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="${conPath }/css/world.css" rel="stylesheet">
<style>
input[type="text"] {
  width: 230px;
  height: 32px;
  font-size: 10px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}
</style>
<script>
function findPwChk() {
		var mid = $('input[name="mid"]').val();
		var mname = $('input[name="mname"]').val();
		var mphone = $('input[name="mphone"]').val();
	if (mid == ''){
		alert("아이디를 입력해 주세요.");
		$('input[name="mid"]').focus();
		return false;
	} else if (mname == '') {
	  alert("이름을 입력해 주세요.");
  	  $('input[name="mname"]').focus();
  	  return false;
	} else if (mphone == '') {
	  alert("전화번호를 입력해 주세요.");
  	  $('input[name="mphone"]').focus();
  	  return false;
	} else {
	  return true;
	}
}
</script>

<script>
const autoHyphen = (target) => {
	 target.value = target.value.replace(/[^0-9]/g, '')
 	.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}
</script>
</head>
<body>
<c:if test="${not empty findPwResult}">
   <script>
      alert('${findPwResult}');
   </script>
</c:if>
<div id="find_div">
	<div class="find_border">
   		<h2 class="findId_title" style = "text-align:center;">비밀번호 찾기</h2>
   		<h5 style="text-align:center; margin-right:7px;">회원가입시 입력한 회원정보를 입력해주세요. </h5>
   		<form action= "${conPath }/member/findPw.do" method = "post" >      
      		<table class="find-id">
         		<tr>
         			<th>
         				&nbsp;&nbsp;&nbsp;아이디&nbsp;&nbsp;&nbsp;&nbsp;
         			</th>
         			<td>
         				<input type="text" name="mid" class="input-text" maxlength="20" placeholder = "아이디입력"/>
       				</td>
         		</tr>
      		</table>
      		<table class="find-id">
      	 		<tr>
            		<th>
            			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름&nbsp;&nbsp;&nbsp;
            		</th>
            		<td>
            			<input type="text" name="mname" class="input-text" maxlength="20" placeholder = "이름입력" />
            		</td>			
      	 		</tr>
      		</table>
      		<table class="find-id">
         		<tr>
	         		<th>
	         	    	전화번호&nbsp;&nbsp;
	         		</th>
	         		<td>
	         			<input type="text" name="mphone" class="input-text" maxlength="13" placeholder = "전화번호입력" oninput="autoHyphen(this)"/>
	         		</td>
         		</tr>
      		</table>
	        <br>
	        <div class="findId-button">
      			<input type="submit" value="찾기" class="button" onclick="return findPwChk()" />
      			<input type = "button" value = "닫기" class = "button" style = "margin-left: 10px; "onclick = "window.close()"/>
      		</div>
	   </form>
   </div>   
</div>
</body>
</html>