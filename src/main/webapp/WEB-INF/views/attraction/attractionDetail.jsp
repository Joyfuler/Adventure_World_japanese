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
<title>어트랙션 목록</title>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<article>
<div class="att_Detail_title">
   	<div id="att_Detail_text">${attractionDetail.aname}</div>
   	<div id="att_Detail_exp">${attractionDetail.acontent}</div>
   	<div id="att_Detail_tag">
   		<ul>
   			<li>${attractionDetail.tag1}</li>
   			<li>${attractionDetail.tag2}</li>
   		</ul>
   	</div>
</div>
<div id="att_Detail_img_tool">
	<img id="att_Detail_img" src="${conPath }/images/attraction_images/${attractionDetail.aimage}"/>
</div>
<div id="att_Info_back">
	<div id="att_Info_box_tool">
		<div class="att_Info_box">
			<div class="att_Info_icon"><img src="${conPath }/images/icons/rideInfo_card_icon3.png"/></div>
			<div class="att_Info_text">탑승인원</div>
			<div id="att_Info_pnum">${attractionDetail.headcount}명</div>
		</div>
		<div class="att_Info_box">
			<div class="att_Info_icon"><img src="${conPath }/images/icons/rideInfo_card_icon4.png"/></div>
			<div class="att_Info_text">이용정보</div>
			<div id="att_Info_limit">
				${attractionDetail.height }<br>
				${attractionDetail.age}
			</div>
		</div>
	</div>
	<p id="att_Info_text2">아래와 같은 분들은 탑승이 제한됩니다.</p>
	<div id="att_Info_bottom"><br>
		<div id="att_Info_bottom_tool">	
			<div id="att_Info_icon_tool">
				<div id="att_Info_icon2"><img src="${conPath }/images/icons/rideInfo_rest_icon1.png"></div>
				<div id="att_Info_icon_text2">음주 후 2시간 이내 이용자</div>
			</div>
			<div id="att_Info_icon_tool">
				<div id="att_Info_icon2"><img src="${conPath }/images/icons/rideInfo_rest_icon2.png"></div>
				<div id="att_Info_icon_text2">임산부</div>
			</div>
			<div id="att_Info_icon_tool">
				<div id="att_Info_icon2"><img src="${conPath }/images/icons/rideInfo_rest_icon3.png"></div>
				<div id="att_Info_icon_text2">심/혈관계 질환자</div>
			</div>
			<div id="att_Info_icon_tool">
				<div id="att_Info_icon2"><img src="${conPath }/images/icons/rideInfo_rest_icon4.png"></div>
				<div id="att_Info_icon_text2">디스크 환자</div>
			</div>
		</div>
	</div>
</div><br>
<p id="att_Info_text2">운휴일정</p>
<div class="closeInfo">
	<div class="att_holiday_tool">
		<p class="att_holiday_txt">			
				<c:if test = "${attractionDetail.stopday eq 'Y'}">
					<span style = "font-size: 1.5em; color: red;">
					이 어트랙션은 ${weekSchedule } 까지 운휴 중입니다.
					</span>	  
				</c:if>
				<c:if test = "${attractionDetail.stopday eq 'N'}">
					<span style = "font-size: 1.5em;">
					이 어트랙션은 ${weekSchedule } 까지 휴일 없이 운영됩니다.
					</span>	
				</c:if>				
		</p>
	</div>
	<p class="txt">
		<span style="color:#550adf;"> ※ 이번 주 일요일부터 토요일까지의 운휴정보입니다.</span>
		<br>
		※ 기상 변화 및 파크 상황에 따라 운휴 일정은 다소 변경될 수 있습니다.
	</p>
	<p class="link">
		<a href="${conPath }/attraction/stopdayInfo.do" class="grayBtn">이번 달 운휴 달력 보러가기</a>
	</p>
	<div class="btnArea">
		<a href="${conPath }/attraction/attractionList.do" class="purpleBtn">목록</a>
	</div>
</div>
</article>
</body>
<jsp:include page="../main/footer.jsp"/>
</html>