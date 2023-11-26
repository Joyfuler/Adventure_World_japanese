<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어드벤처 월드 리뷰 페이지</title>
<link href = "${conPath }/css/world.css" rel = "stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
	$(document).ready(function(){
		$('select[name="sort"]').on('change', function(){
			$('#sortForm').submit();
		});
		
		$('.writeReview').click(function(){
			location.href = '${conPath}/review/reviewWrite.do';
		});
		
		$('.notLogin').click(function(){
			alert('먼저 로그인한 후 리뷰 작성이 가능합니다.');
			location.href = '${conPath}/member/loginMember.do?next=review/reviewWrite.do';
		});
		
	});
	

</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div style="clear: both;"></div>
<article>
<div class="attractionForm">
	<div class="page-title" style = "text-align: center; font-weight: bold;">	
		<div class="container" style = "background-color: #5c10e6; color: white;">
			<h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 30px; text-align:center; margin-bottom: 5px;">방문해 주신 분들의 리뷰입니다.</h3>
			<h4> ※리뷰 게시글을 작성해 주신 모든 유저분들께 멤버십 포인트 1000p 를 적립해 드립니다.</h4>					
		</div>		
	</div>
	<br>
	<form id = "sortForm" action = "" style = "margin-left: 200px;">
	정렬방식	
		<select name = "sort">			
			<option value = "highScore"
			<c:if test = "${param.sort eq 'highScore' }">
				selected = "selected"
			</c:if>				
			> 평점 높은순 정렬</option>			
			<option value = "lowScore"
			<c:if test = "${param.sort eq 'lowScore' }">
				selected = "selected"
			</c:if>				
			> 평점 낮은순 정렬</option>
		</select>
		<c:if test = "${not empty member }">
		<input type = "button" class = "writeReview" value = "리뷰작성" style = "position: absolute; right: 250px; width: 100px; color: white; background-color:#5c10e6; cursor:pointer;">
		</c:if>
		<c:if test = "${empty member }">
		<input type = "button" class = "notLogin" value = "리뷰작성" style = "position: absolute; right: 250px; width: 100px; color: white; background-color:#5c10e6; cursor:pointer;">
		</c:if>
	</form>
	
	<div class="att_back">		
		<div id="att_list">
			<a href="${conPath }/review/reviewContent.do">
				<img src="${conPath }/images/attraction_images/lotty_kingdom.jpg"/>
				<img src = "${conPath }/images/point_star_on.png" style = "width: 15px; height: 15px; margin-top: 5px;"><span style = "font-size: 0.8em; font-weight: bold;">5</span>&nbsp;&nbsp;<span style = "font-size: 0.8em; font-weight: bold;">행복의 나라에서</span>
				<h6>2023.11.20</h6>
				<img src = "${conPath }/images/attraction_images/lotty_kingdom.jpg" style = "width:25px; height: 25px;"><span style = "font-size:0.66em;">종합이용권</span>									
			</a>
		</div>
		<div id="att_list">
			<a href="${conPath }/attraction/attractionDetail.do?aid=${attractions.aid }">
				<img src="${conPath }/images/attraction_images/lotty_kingdom.jpg"/>
				<h5>행복의 나라에서</h5>
				<h6>2023.11.20</h6>
				<img src = "${conPath }/images/attraction_images/lotty_kingdom.jpg" style = "width:25px; height: 25px;"><span style = "font-size:0.66em;">종합이용권</span>									
			</a>
		</div>
		<div id="att_list">
			<a href="${conPath }/attraction/attractionDetail.do?aid=${attractions.aid }">
				<img src="${conPath }/images/attraction_images/lotty_kingdom.jpg"/>
				<h5>행복의 나라에서</h5>
				<h6>2023.11.20</h6>
				<img src = "${conPath }/images/attraction_images/lotty_kingdom.jpg" style = "width:25px; height: 25px;"><span style = "font-size:0.66em;">종합이용권</span>									
			</a>
		</div>
		<div id="att_list">
			<a href="${conPath }/attraction/attractionDetail.do?aid=${attractions.aid }">
				<img src="${conPath }/images/attraction_images/lotty_kingdom.jpg"/>
				<h5>행복의 나라에서</h5>
				<h6>2023.11.20</h6>
				<img src = "${conPath }/images/attraction_images/lotty_kingdom.jpg" style = "width:25px; height: 25px;"><span style = "font-size:0.66em;">종합이용권</span>									
			</a>
		</div>
		<div id="att_list">
			<a href="${conPath }/attraction/attractionDetail.do?aid=${attractions.aid }">
				<img src="${conPath }/images/attraction_images/lotty_kingdom.jpg"/>
				<h5>행복의 나라에서</h5>
				<h6>2023.11.20</h6>
				<img src = "${conPath }/images/attraction_images/lotty_kingdom.jpg" style = "width:25px; height: 25px;"><span style = "font-size:0.66em;">종합이용권</span>									
			</a>
		</div>
		<div id="att_list">
			<a href="${conPath }/attraction/attractionDetail.do?aid=${attractions.aid }">
				<img src="${conPath }/images/attraction_images/lotty_kingdom.jpg"/>
				<h5>행복의 나라에서</h5>
				<h6>2023.11.20</h6>
				<img src = "${conPath }/images/attraction_images/lotty_kingdom.jpg" style = "width:25px; height: 25px;"><span style = "font-size:0.66em;">종합이용권</span>									
			</a>
		</div>
		<div id="att_list">
			<a href="${conPath }/attraction/attractionDetail.do?aid=${attractions.aid }">
				<img src="${conPath }/images/attraction_images/lotty_kingdom.jpg"/>
				<h5>행복의 나라에서</h5>
				<h6>2023.11.20</h6>
				<img src = "${conPath }/images/attraction_images/lotty_kingdom.jpg" style = "width:25px; height: 25px;"><span style = "font-size:0.66em;">종합이용권</span>									
			</a>
		</div>
		<div id="att_list">
			<a href="${conPath }/attraction/attractionDetail.do?aid=${attractions.aid }">
				<img src="${conPath }/images/attraction_images/lotty_kingdom.jpg"/>
				<h5>행복의 나라에서</h5>
				<h6>2023.11.20</h6>
				<img src = "${conPath }/images/attraction_images/lotty_kingdom.jpg" style = "width:25px; height: 25px;"><span style = "font-size:0.66em;">종합이용권</span>									
			</a>
		</div>
		<div id="att_list">
			<a href="${conPath }/attraction/attractionDetail.do?aid=${attractions.aid }">
				<img src="${conPath }/images/attraction_images/lotty_kingdom.jpg"/>
				<h5>행복의 나라에서</h5>
				<h6>2023.11.20</h6>
				<img src = "${conPath }/images/attraction_images/lotty_kingdom.jpg" style = "width:25px; height: 25px;"><span style = "font-size:0.66em;">종합이용권</span>									
			</a>
		</div>
		<div id="att_list">
			<a href="${conPath }/attraction/attractionDetail.do?aid=${attractions.aid }">
				<img src="${conPath }/images/attraction_images/lotty_kingdom.jpg"/>
				<h5>행복의 나라에서</h5>
				<h6>2023.11.20</h6>
				<img src = "${conPath }/images/attraction_images/lotty_kingdom.jpg" style = "width:25px; height: 25px;"><span style = "font-size:0.66em;">종합이용권</span>													
			</a>
			<br>		
		</div>				
</div>
</article>
<div class = "paging" style = "text-align: center; font-weight: bold;">
		[이전] 1 2 3 4 5 [다음]
	</div>
	<div style = "margin-top: 30px; float: right; margin-right: 20px;">		
		&nbsp; &nbsp; <input type = "text" class = "searchWord" placeholder="리뷰검색"><input type = "submit" value = "검색">					
	</div>	
<br><br>
<br><br>
<jsp:include page="../main/footer.jsp"/>	
</body>
</html>