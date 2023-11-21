<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>World</title>
</head>
<body>
<jsp:include page="../main/header.jsp"/>

<article>
<div class="page-title">
	<div class="container">
		<h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 50px; text-align:center;">이달의 혜택</h3>
		<h3 style="font-family:'IBM Plex Sans KR', sans-serif; text-align:center;">2023년 11월 현재 진행중인 이벤트를 확인하세요!</h3>
		<h5 style = "text-align:center;"> 총  <span style = "color: red;">${eventList.size() }</span> 개의 이벤트 진행중 </h5>
	</div>
</div>
<hr style="width:1100px; margin: 0 auto;"/>
<div class="ccontainer">
	<c:forEach var="events" items="${eventList }">
	<div class="slide" style="background-image:url('${conPath}/images/${events.eimage }');">
		<h3 style = "text-shadow: 1px 1px 2px #FFFFFF">
			${events.einfo} <br>
			◎행사기간 : ${events.eperiod }<br>
	 		${events.einfo2 }
	 	</h3>
  	</div>
  	</c:forEach>  	
</div>
</article>
</body>
<jsp:include page="../main/footer.jsp"/>
</html>