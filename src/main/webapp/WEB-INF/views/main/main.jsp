<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어드벤처 월드</title>	
<script src = "${conPath }/js/order.js"></script>
<script src="${conPath }/script/script.js"></script>
<script src="${conPath }/script/event02.js"></script>  
<script src="${conPath }/script/member.js"></script>	
<script
  src="https://code.jquery.com/jquery-3.7.1.slim.min.js"
  integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8="
  crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	var num=0;
	setInterval(function(){
        	$('#imgs').animate({ left : num * -1355 },2500);
        num++;
    	if(num==(Number('${bannerList.size()}'))){
    		num=0;    	
    	}
    }, 6000);
});
</script>	
<style>
    @keyframes fadeInUp {
        0% {opacity: 0;transform: translate3d(0, 100%, 0);}
        to {opacity: 1;transform: translateZ(0);}
    }
 	.mainTit{ position: relative;animation: fadeInUp 3s;}
    .mainTxt{ position: relative; animation: fadeInUp 4s;}
    #mainTodayArea{ position: relative; animation: fadeInUp 2s;}
    .boxArea{ position: relative; animation: fadeInUp 5s;}
	#mainback{ position: relative; animation: fadeInUp 7s;}
    .main_bottom{ position: relative; animation: fadeInUp 7s;}
</style>
</head>
<body>
<c:if test = "${not empty param.loginResult }">
	<script>
		alert('${param.loginResult}');
	</script>
</c:if>	
<c:if test = "${not empty logoutResult }">
	<script>
		alert('${logoutResult}');
	</script>
</c:if>
<c:if test = "${not empty modifyResult }">
	<script>
		alert('${modifyResult eq 1 ? "회원정보 수정이 완료되었습니다." : "회원정보 수정 실패"}');
	</script>
</c:if>	
<c:if test = "${not empty withdrawalResult }">
	<script>
		alert('${withdrawalResult eq 1 ? "회원 탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다." : "회원 탈퇴 실패"}');
	</script>
</c:if>	
<c:if test = "${not empty orderComplete }">
	<script>
		alert('${orderComplete}');
	</script>
</c:if>	


<jsp:include page="header.jsp"/>
<div id = "main_img">
	<div id = "view" style="position:relative; width:1350px; overflow:hidden; height:506px; border-radius:20px; margin: 0 auto;">
		<div id ="imgs" style="position:absolute; width:6750px;">
			<c:forEach items="${bannerList}" var="banners">
				<img src="${conPath }/adminImg/${banners.bimg}" style="width:1350px; object-fit: fill; margin:0;">
		 	</c:forEach>
		</div>
	</div>
</div>
<div id="mainTodayArea" >
	<a href="guide">
 		<img src="${conPath }/images/icons/mainTodayArea_tit_icon.png"/>&nbsp;&nbsp;&nbsp;오늘의 파크 운영시간 : &nbsp;&nbsp;오전 10시 ~ 오후 9시
	</a>
</div>	
<br>
<div class="mainbox">
	<div class="mainCon mainCon1">
		<p class="mainTit"><span style="font-weight:bold">자신에게 맞는 혜택</span> 알아볼까요?</p><br>
		<p class="mainTxt">현재 진행 중인 할인혜택을 알아보세요!</p>		 
		<div class="boxArea">                             
			<div class="box-tr">
				<c:forEach var="events" items="${eventList }" begin="0" end="3">
				<div class="box-td">
					<a href="${conPath }/event.do">
						<span class="eventImg"><img src="${conPath }/images/${events.eimage }" width="248" height="198"/></span>
						<span class="price1">${events.einfo }</span>		
					</a>
				</div>
				</c:forEach>					
			</div>				
			<div class="box-tr">
				<c:forEach var="events" items="${eventList }" begin="4" end="7">
				<div class="box-td">
					<a href="${conPath }/event.do">
						<span class="eventImg"><img src="${conPath }/images/${events.eimage }" width="248" height="198"/></span>
						<span class="price1">${events.einfo }</span>		
					</a>
				</div>
				</c:forEach>					
			</div>
		</div>
     </div>
</div>
<!--  main3  -->

<div id="mainback">
	<div id="maintitle">재미있고 즐거운&nbsp;<span style="font-weight:bold;">다양한 어트랙션!</span>
	</div>
	<div class="tag">
		<ul>
			<li>아이와 함께 </li>
			<li>야외에서 신나게 </li>
			<li>실내에서 쾌적하게!</li>
		</ul>
	</div>
	<h2 style="font-size:30px; text-align:center; line-height:80px;">인기 어트랙션</h2>
	<div id="mainimg">
		<c:forEach var="attractions" items="${bestList}" begin="0" end="5">
		 		<div id="att_list">
		 			<a href="${conPath }/attraction/attractionDetail.do?aid=${attractions.aid}">				
						<img src="${conPath }/images/attraction_images/${attractions.aimage}"/>
						<h3 style="font-weight:400">${attractions.aname}</h3>
					</a>
				</div>						
		</c:forEach>
	</div>
	<div class="tag">
	<ul>
		<li>
			<a href="${conPath }/attractionList.do">더 많은 어트랙션 보기</a>
		</li>
		<li>
			<a href='${conPath }/stopDayInfo.do'>운휴 정보 보러 가기</a>
		</li>
	</ul>
</div>
</div>
<div class="main_bottom">
	<div id="line">
		<h1>진행중인 퍼레이드</h1>
	</div>  
	<h3>꿈과 환상의 세계로 어서오세요!</h3>
	<div id="main_view_">     
		<c:forEach var="parades" items="${paradeList }">         
		<div id="parade">		   
		    <div class="scale">
		        <a href="parade">
		        	<img src="${conPath }/images/${parades.pimg}" width="250" height="170" >
		        </a>	
		    </div>
		    <div class="title">
		        	${parades.ptitle }
		    </div>		    		    
		</div>  
		</c:forEach> 
	</div>      
</div>
<jsp:include page="footer.jsp"/>
</body>