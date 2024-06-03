<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>운영시간 / 운휴 안내</title>	
<style>
    @keyframes fadeInUp {
        0% {opacity: 0;transform: translate3d(0, 100%, 0);}
        to {opacity: 1;transform: translateZ(0);}
    } 	
   .operation_box_title{position:relative; animation:fadeInUp 2s;}
   .operation_date_box{position:relative; animation:fadeInUp 2s;}
   .operation_time_box{position:relative; animation:fadeInUp 2s;}
   .toto{ position: relative; animation: fadeInUp 4s;}
   #rest_box{ position: relative; animation: fadeInUp 4s;}
   .holidayBox{position:relative; animation:fadeInUp 2s;} 
   .operation_time_box{ position:relative; width:100%; height:200px; background-size : contain; 
	background-image : url('${conPath}/images/timeVisual_bg_on.jpg'); margin: 0 auto; border-bottom: 2px solid #e1e1e1;
 	font-weight: bold; text-align: center; float:left; color:white;}  
</style>	
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div class="operation_box">
		<div class="operation_box_title">
			<h2 style="text-align:center;">今週の運休施設情報のご案内</h2>
		</div>
		<div class="operation_date_box">
			<c:set var="now" value="<%=new java.util.Date() %>"></c:set>
			<h5 style = "text-align:center;"> 今日は：</h5>
			<h3 style="text-align:center;">
				<fmt:formatDate value="${now}"></fmt:formatDate>
			</h3>
		</div>		
		<div class="operation_time_box">
			<div class="time_box_title" style = "background-color: ">
				運営時間
			</div>
			<div class="time_box_time"> 
				午前10時 ～ 午後 10時 
			</div>
		</div>		
		<br><br>
		<h2 style="font-size:30px; text-align:center; line-height:100px;">今週の運休施設</h2>
		<h3 style = "text-align:center;">運休期間 : ${weekSchedule }</h3>		 
		<div id="rest_box">
			<c:forEach var="stopAttractions" items="${stopdayAttractionList}">
				<a href="${conPath }/attraction/attractionDetail.do?aid=${stopAttractions.aid}">
					<div id="att_list">
						<img src="${conPath }/images/attraction_images/${stopAttractions.aimage}"/>
						<h3 style="font-weight:400">${stopAttractions.aname}</h3>
					</div>
				</a>
			</c:forEach>
		</div>	
		<div class="holidayBox">      
			<p>※주의사항
				기상상태에 따라 (0℃ 이하 또는 30℃ 이상, 7~14㎧ 이상의 풍속, 0.2㎜ 이상의 비가 내리는 경우)<br>
				일부 어트랙션 운행이 일정에 관계없이 중단될 수 있습니다.</p>
			<p>기상상태와 별개로 현장 상황에 따라 예고 없이 운휴하거나 중간 점검을 할 수 있습니다</p>
		</div>
		<br><br>
	</div>
<jsp:include page="../main/footer.jsp"/>	
</body>
</html>