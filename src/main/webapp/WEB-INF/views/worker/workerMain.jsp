<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#adminmain{position: relative; width:1180px; display: grid; min-height: 10vh; height:600px; margin: 0 auto; text-align: center;}
#adminmain #login {position: relative; width:100%; height:200px; margin: 0 auto; line-height: 160px; text-align: center; font-size:200%}
#adminmain .buttons {float:left; margin:0 auto;}
#adminmain input{margin:20px 15px  ; width:200px; height:60px; border: 1px solid #666; 
border-radius: 10px; box-shadow: 3px 3px 2px #ccc; font-size:150%; float:left; background : #6317ed; color:white;}
#adminmain #main2 {position: relative; height:100px;float:left; line-height:100px; text-align: center; margin:0 auto;}
</style>
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<jsp:include page="../main/header.jsp"/>
<body>
<div id=adminmain>

   <div id="login">
   <h1>관리자로 로그인 되었습니다</h1>
   <hr>
   </div>
   <h1>하실일을 선택하세요</h1>
   <div id=main2>
<form method="post" name="frm">

   	<div class="buttons">
      	<input type="button" value="어트랙션 관리" onclick="location.href='adminAttraction'" style="cursor:pointer">
   	</div>
    <div class="buttons">
		<input type="button" value="공지사항 관리" onclick="location.href='${conPath }/worker/list.do'" style="cursor:pointer">
	</div>
    <div class="buttons">
		<input type="button" value="회원 관리" onclick="location.href='adminMember'" style="cursor:pointer">
   	</div>
	<div class="buttons">
      <input type="button" value="Q & A 관리" onclick="location.href='${conPath}/qna/qnaList.do?wid=${worker.wid}'" style="cursor:pointer">
      <input type="button" value="Q & A 관리" onclick="location.href='${conPath}/qna/qnaList.do?wid=${worker.wid} '" style="cursor:pointer">
	</div>
	<div class="buttons">
		<input type="button" value="배너 관리" onclick="location.href='adminBannerList'" style="cursor:pointer">
	</div>
</form>
</div>
</div>
</body>
<jsp:include page="../main/footer.jsp"/>
</html>