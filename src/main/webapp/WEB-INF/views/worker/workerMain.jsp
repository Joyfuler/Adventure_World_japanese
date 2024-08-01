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
<c:if test = "${empty worker}">
<script>
	alert('管理者アカウントからログアウトされました。もう一度ログインしてください');
	location.href = '${conPath }/main.do';
</script>
</c:if>  
</head>
<jsp:include page="../main/header.jsp"/>
<body>
<div id="adminmain">
   <div id="login">
   <h1>管理者 ${worker.wid}としてログイン完了</h1>
   <hr>
   </div>
   <h1>メニューを選んでください</h1>
   <div id="main2" style = "margin-bottom: 100px;">
   	<div class="buttons">
      	<input type="button" value="アトラクション" onclick="location.href='${conPath }/workerAttraction/attractionListP.do'" style="cursor:pointer">
   	</div>
    <div class="buttons">
		<input type="button" value="お知らせ管理" onclick="location.href='${conPath }/worker/list.do'" style="cursor:pointer">
	</div>
    <div class="buttons">
		<input type="button" value="会員管理" onclick="location.href='${conPath}/memberList.do'" style="cursor:pointer">
   	</div>
	<div class="buttons">
		<input type="button" value="Q & A 管理" onclick="location.href='${conPath}/worker/workerQnaList.do'" style="cursor:pointer">
	</div>
	<div class="buttons">
		<input type="button" value="FAQ 管理" onclick="location.href='${conPath}/workerFaqList.do'" style="cursor:pointer">
	</div>
	<div class="buttons">
		<input type="button" value="バナー管理" onclick="location.href='${conPath}/workerBanner/list.do?from=admin'" style="cursor:pointer">
	</div>
	<div class = "buttons">
		<input type="button" value="レビュー管理" onclick="location.href='${conPath}/worker/workerReviewList.do'" style="cursor:pointer">
	</div>
	<div class = "buttons">
		<input type = "button" value = "ユーザ注文履歴" onclick = "location.href='${conPath}/worker/workerOrderList.do'" style = "cursor:pointer;">
	</div>
	<div class = "buttons">
		<input type = "button" value = "紛失物センター" onclick = "location.href='${conPath}/workerlostItemList.do'" style = "cursor:pointer;">
  </div>
  <div>
		<input type = "button" value = "通報管理" onclick = "location.href='${conPath}/worker/reportList.do'" style = "cursor:pointer;">
	</div>
</div>
</div>
</body>
<jsp:include page="../main/footer.jsp"/>
</html>