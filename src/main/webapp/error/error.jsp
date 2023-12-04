<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지를 찾지 못했습니다</title>
<link href = "${conPath }/css/error.css" rel = "stylesheet">
</head>
<style>
div.errorImg{
text-align: center;
}
</style>
<body>
	<jsp:include page="../WEB-INF/views/main/header.jsp"/>
	<h1 class = "errorTitle" style= "border:none;"> 잘못된 페이지 요청입니다. </h1>
	<br>
	<div class = "errorImg">
		<img src = "${conPath }/images/kawa.png" height="350">
	</div>
	<br>	
	<h5 class = "errorContent">웹 브라우저에서 새로고침하거나, 새로고침 후에도 표시되지 않는 경우
		URL을 확인해 주세요.</h5> <br>
	<div class = "linkButton">
		<button class = "errorButton" onclick = "location.href='${conPath }/index.jsp'">▶HOME</button>
		<button class = "errorButton" onclick = "history.back()">▶뒤로가기</button>
	</div> 
	<br><br>
	<jsp:include page="../WEB-INF/views/main/footer.jsp"/>
</body>
</html>