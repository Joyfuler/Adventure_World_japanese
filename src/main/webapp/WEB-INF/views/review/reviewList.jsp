<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		
		$('.searchIcon').click(function(){
			$('.searchForm').submit();
		});
		
	});
</script>
<script>
	function noImage(imageElement) {
    	imageElement.src = "${conPath}/images/noimg.jpg";
	}
</script>
</head>
<body>
<c:if test = "${not empty deleteResult }">
	<script>
		alert('${deleteResult eq 1? "리뷰 삭제 완료" : "리뷰 삭제 실패"}');
	</script>
</c:if>
<c:if test = "${not empty successMsg }">
	<script>
		alert('${successMsg}');
	</script>
</c:if>	
<jsp:include page="../main/header.jsp"/>
<div style="clear: both;"></div>
<article>
<div class="attractionForm" style = "padding-bottom: 10px;">
	<div class="page-title" style = "text-align: center; font-weight: bold;">	
		<div class="container" style = "background-color: #7e32f8; color: white;">
			<h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 30px; text-align:center; margin-bottom: 5px;">리뷰 & 후기 게시판</h3>
			<h4> ※리뷰 게시글을 작성해 주신 모든 유저분들께 멤버십 포인트 1000p 를 적립해 드립니다.</h4>					
		</div>		
	</div>
	<br>
	<form id = "sortForm" class = "searchForm" action = "${conPath }/review/reviewList.do" style = "margin-left: 200px;">
	정렬방식	
		<select name = "sort">	
			<option value = "new"
			<c:if test = "${param.sort eq 'new' }">
				selected = "selected"
			</c:if>	
			>최신순
			</option>		
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
		&nbsp; &nbsp; <input type = "text" name = "searchWord" class = "searchWord" placeholder="제목·내용 검색" value="${param.searchWord }"><img src = "${conPath }/images/2866321.png" class = "searchIcon" style = "width: 20px; padding-top: 5px; margin-left: 5px;">
		<c:if test = "${not empty member }">
		<input type = "button" class = "writeReview" value = "리뷰작성" style = "position: absolute; right: 250px; width: 100px; color: white; background-color:#5c10e6; cursor:pointer;">
		</c:if>
		<c:if test = "${empty member }">
		<input type = "button" class = "notLogin" value = "리뷰작성" style = "position: absolute; right: 250px; width: 100px; color: white; background-color:#5c10e6; cursor:pointer;">
		</c:if>
	</form><br>
	<div class = "reviewInfo" style = "margin-left: 200px;">
		<fmt:formatNumber value="${reviewInfo.avg}" pattern="#,##0.00" var="formattedAvg" />			
		<h4>총 리뷰 수: <span style = "color: orange;">${reviewInfo.reviewcount }</span> 개 / 별점 평균: <img src = "${conPath}/images/point_star_on.png"><span style = "color:orange;">${formattedAvg }</span>점</h4>
	</div>
	<div class="att_back">		
		<c:forEach var="reviews" items="${reviewList }">
		<div id="att_list">
			<a href="${conPath }/review/reviewContent.do?rid=${reviews.rid }&pageNum=${param.pageNum eq null? '1':param.pageNum}">				
				<c:choose>
                <c:when test="${not empty reviews.rphoto}">
                    <img src="${conPath }/memberImg/${reviews.rphoto}" onerror="noImage(this)"/>
                </c:when>
                <c:otherwise>   
	                <img src="${conPath }/resources/memberImg/${reviews.rcontentImgFileName}" onerror="noImage(this)"/>                                        	
                </c:otherwise>
            </c:choose>
				<img src = "${conPath }/images/point_star_on.png" style = "width: 15px; height: 15px; margin-top: 5px;"><span style = "font-size: 0.8em; font-weight: bold;">${reviews.rscore }</span>&nbsp;&nbsp;<span style = "font-size: 0.8em; font-weight: bold;">${reviews.rtitle }</span><span style = "font-size: 0.7em; color: red;"> [${reviews.commentcnt }]</span>
				<h6>${reviews.rrdate }</h6>
				<img src = "${conPath }/images/ticketavatar.png" style = "width:25px; height: 25px;"><span style = "font-size:0.66em;">${reviews.otype eq 0? '자유이용권' : '패스트패스'}</span>									
			</a>
		</div>
		</c:forEach>						
	</div>
</article>
<div class = "paging" style = "text-align: center; font-weight: bold;">
		<c:if test="${paging.startPage > paging.blockSize}">
			<a href="${conPath }/review/reviewList.do?pageNum=${paging.startPage-1 }&sort=${param.sort eq null? 'new': param.sort}&searchWord=${param.searchWord}">[이전]</a>
		</c:if>	
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
			<c:if test="${paging.currentPage eq i }"> 
				[<b style = "color: red;"> ${i } </b>] 
			</c:if>
			<c:if test="${paging.currentPage != i }">
				<a href="${conPath }/review/reviewList.do?pageNum=${i }&sort=${param.sort eq null? 'new': param.sort}&searchWord=${param.searchWord}">[${i }]</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			<a href="${conPath }/review/reviewList.do?pageNum=${paging.endPage+1 }&sort=${param.sort eq null? 'new': param.sort}&searchWord=${param.searchWord}">[다음]</a>
		</c:if>
	</div>
	<div style = "float: left; margin-left: 180px;">							
	</div>	
<br><br>
<br><br>
<jsp:include page="../main/footer.jsp"/>	
</body>
</html>