<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행중인 퍼레이드</title>
<style>
    @keyframes fadeInUp {
        0% {opacity: 0;transform: translate3d(0, 100%, 0);}
        to {opacity: 1;transform: translateZ(0);}
    }
 	
   .parade_img{ position: relative; animation: fadeInUp 2s;}
   .parade_box{ position: relative; animation: fadeInUp 4s;}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<article>
	<div class="prd_title_img">
    	<h1 id="prd_title_text">Adventure World 퍼레이드</h1>
    	<h1 id="prd_title_exp">신나는 공연, 퍼레이드와 더 재미있는 하루를 만들어요!</h1>
	</div>
	<c:forEach var = "parades" items = "${paradeList }">
	<div class="prd"></div>
	<div class="parade_img">
		<img src="${conPath }/images/${parades.pimg2}">
	</div>
	<div class="prd"></div>
	<div class="parade_box">
		<h1 style="text-align:center; color: violet;">${parades.ptitle }</h1>
		<br><hr><br>
		<h3 style="text-align:center">${parades.pinfo } </h3>
		<br><b>장소</b> <br> 
		<h3 style = "color: violet;">${parades.pplace }</h3>
		<br><b>기간</b>	<br>
		<h3 style = "color: violet;">${parades.pperiod }</h3>
		<br><b>· 주의사항</b><br>	
		<h5 style = "color: lightred;">${parades.pcaution }<br>
		</h5>
	</div>
	</c:forEach>	
	<div style="height:130px;"></div>
</article>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>