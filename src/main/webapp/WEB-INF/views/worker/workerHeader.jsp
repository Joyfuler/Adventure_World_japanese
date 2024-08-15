<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#adminmains{position: relative; width:100%; display: grid; height:70px; margin: 0 auto; text-align: center;}
#adminmains #login {position: relative; width:100%; height:200px; margin: 0 auto; line-height: 160px; text-align: center; font-size:200%}
#adminmains .buttons {float:left; margin:0 auto;}
#adminmains .buttons input:hover {background-color: #66b3ff; color: #ffffff;
}
#adminmains input{margin-left:10px;width:60px;height:40px;border: 1px solid #666;border-radius: 10px;box-shadow: 3px 3px 2px #ccc;font-size:150%;float:left;background : #99ccff;color:#212529; font-size: 0.6em;}
#adminmains #main2 {position: relative; height:50px;float:left; line-height:100px; text-align: center; margin:0 auto;}	
</style>
</head>
<body>	
	<div id = "adminmains">
	 <div id="main2" style = "margin: 0 0 100px 250px; width: 1100px; text-align: center;">
   	<div class="buttons">
      	<input type="button" value="アトラクション" onclick="location.href='${conPath }/workerAttraction/attractionListP.do'" style="cursor:pointer; width: 80px;">
   	</div>
    <div class="buttons">
		<input type="button" value="お知らせ管理" onclick="location.href='${conPath }/worker/list.do'" style="cursor:pointer; width: 80px;">
	</div>
    <div class="buttons">
		    <input type="button" value="会員管理" onclick="location.href='${conPath}/memberList.do'" style="cursor:pointer; width: 80px;">
   	</div>	
   	<div class="buttons">
		    <input type="button" value="Q&A管理" onclick="location.href='${conPath}/qna/qnaList.do'" style="cursor:pointer; width: 80px;">
	</div>
	<div class="buttons">
		    <input type="button" value="FAQ管理" onclick="location.href='${conPath}/workerFaqList.do'" style="cursor:pointer; width: 80px;">
	</div>
	<div class="buttons">
		<input type="button" value="バナー管理" onclick="location.href='${conPath}/workerBanner/list.do?from=admin'" style="cursor:pointer; width: 80px;">
	</div>
	<div class = "buttons">
		<input type="button" value="レビュー管理" onclick="location.href='${conPath}/worker/workerReviewList.do'" style="cursor:pointer; width: 80px;">
	</div>
	<div class = "buttons">
		<input type = "button" value = "注文履歴" onclick = "location.href='${conPath}/worker/workerOrderList.do'" style = "cursor:pointer; width: 80px;">
	</div>
	<div class = "buttons">
		<input type = "button" value = "遺失物" onclick = "location.href='${conPath}/lostItemList.do'" style = "cursor:pointer; width: 80px;">
  </div>
	<div class = "buttons">
		<input type = "button" value = "通報管理" onclick = "location.href='${conPath}/worker/reportList.do'" style = "cursor:pointer; width: 80px;">
	</div>	
	</div>
</div>
</body>
</html>