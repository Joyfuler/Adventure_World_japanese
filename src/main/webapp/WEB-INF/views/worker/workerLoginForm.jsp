<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<title>관리자 로그인 페이지</title>
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="${conPath }/script/admin.js"></script>
</head>
<script>
	function loginCheck(){  //관리자 로그인시 아이디 비번 입력 확인	
	if($('input[name="wid"]').val()==""){
		   	alert("아이디를 입력하세요.");
		  	return false;
	} else if($('input[name="wpw"]').val()==""){
		  	alert("비밀번호를 입력하세요.");
		   	return false;
	}	   	
}
</script>
<c:if test="${not empty loginResult}">
		<script>alert('${loginResult}');</script>
	</c:if>
<c:if test="${empty param.after }">
		<c:set var="after" value="worker/workerMain.do"/>
	</c:if>
	<c:if test="${not empty param.after and not empty param.pageNum}">
		<c:set var="after" value="${param.after }&pageNum=${param.pageNum }"/>
	</c:if>
	<c:if test="${not empty param.after and empty param.pageNum}">
		<c:set var="after" value="${param.after }"/>
	</c:if>
<jsp:include page="../main/header.jsp"/>
<body>
<div id=logina>
	<div class="login">
   <div class="join_title">관리자 로그인</div>
   </div>
   <h2 style="color:gray; font-weight:400">관리자 아이디와 비밀번호로 로그인 하세요.</h2>
   <br><br>
   
   <form action = "${conPath }/worker/workerLoginForm.do" method="post">
   <input type="text" name="after" value="${after}">
   <!-- <input type="hidden" name="command" value="login">  action="world.do"-->
   <div id=input>
      <input name="wid" placeholder="&nbsp;아이디" size="40" type="text" style="width:500px ;background:white;"><br>
   </div>
   <br>
   <div id=input>
      <input name="wpw" placeholder="&nbsp;비밀번호" size="40" type="password" style="width:500px"><br>
   </div>
   <div class="menu1">
      <ul>
          <li><a href="#">아이디 찾기 | </a></li>
             <li><a href="#">&nbsp;비밀번호 찾기</a></li>
      </ul>
   </div>
   <div class="ar">&nbsp;&nbsp;&nbsp;${message}</div>
   <div id="buttons">
      <input type="submit" value="로그인" class="submit" onclick="return loginCheck()">
   </div><br><br>
   <div id=content> 문의사항이 있으시면 고객만족센터에 연락하세요.<br>
   고객만족센터 : 1899-0000</div>
   
   
   </form>
</div>
</body>
<jsp:include page="../main/footer.jsp"/>
</html>