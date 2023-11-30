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
#adminmain{position: relative; width:1300px; display: grid; height:70px; margin: 0 auto; text-align: center;}
#adminmain #login {position: relative; width:100%; height:200px; margin: 0 auto; line-height: 160px; text-align: center; font-size:200%}
#adminmain .buttons {float:left; margin:0 auto;}
#adminmain .buttons input:hover {background-color: #66b3ff; color: #ffffff;
}
#adminmain input{margin-left:10px;width:100px;height:50px;border: 1px solid #666;border-radius: 10px;box-shadow: 3px 3px 2px #ccc;font-size:150%;float:left;background : #99ccff;color:#212529; font-size: 0.8em;}
#adminmain #main2 {position: relative; height:50px;float:left; line-height:100px; text-align: center; margin:0 auto;}	
</style>
</head>
<body>	
	<div id = "adminmain">
	 <div id="main2" style = "margin-bottom: 100px; width: 1000px;">
   	<div class="buttons">
      	<input type="button" value="어트랙션 관리" onclick="location.href='${conPath }/workerAttraction/attractionListP.do'" style="cursor:pointer; width: 100px;">
   	</div>
    <div class="buttons">
		<input type="button" value="공지사항 관리" onclick="location.href='${conPath }/worker/list.do'" style="cursor:pointer; width: 100px;">
	</div>
    <div class="buttons">
		<input type="button" value="회원 관리" onclick="location.href='${conPath}/memberList.do'" style="cursor:pointer; width: 100px;">
   	</div>	
	<div class="buttons">
		<input type="button" value="FAQ 관리" onclick="location.href='${conPath}/faqList.do'" style="cursor:pointer; width: 100px;">
	</div>
	<div class="buttons">
		<input type="button" value="배너 관리" onclick="location.href='${conPath}/workerBanner/list.do?from=admin'" style="cursor:pointer; width: 100px;">
	</div>
	<div class = "buttons">
		<input type="button" value="리뷰글 관리" onclick="location.href='${conPath}/worker/workerReviewList.do'" style="cursor:pointer; width: 100px;">
	</div>
	<div class = "buttons">
		<input type = "button" value = "유저주문내역" onclick = "location.href='${conPath}/worker/workerOrderList.do'" style = "cursor:pointer; width: 100px;">
	</div>
	<div class = "buttons">
		<input type = "button" value = "신고관리" onclick = "location.href='${conPath}/worker/reportList.do'" style = "cursor:pointer; width: 100px;">
	</div>
	</div>
</div>
</body>
</html>