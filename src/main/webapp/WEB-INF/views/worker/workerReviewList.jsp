<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시글 리스트</title>
<link href="${conPath }/css/admincss.css" rel="stylesheet">

<style>
.notice{height: auto;}
#buttons{text-align:center;}
.submit{position:relative; font-size: 20px;padding-bottom:10px; width:200px; height:55px;color: #fff; background:rgb(111, 35, 249);;font-weight:bold;border-radius: 28px;border:1px solid #6317ed;}
.cancel{position:relative; font-size: 20px;padding-bottom:10px; width:200px; height:55px;color:#6317ed; background:white;font-weight:bold;border-radius: 28px;border:1px solid #6317ed;}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	$(document).ready(function() {
		$('#searchReview').on('click', function() {
			var schWord = $('input[name="schWord"]').val();
			location.href = '${conPath}/worker/workerReviewList.do?pageNum=${empty param.pageNum? "1": param.pageNum}&searchWord='+schWord;
		});
		
		var allSelected = false;
		  $('.selectAll').on('click', function() {
	            allSelected = !allSelected;
	            $('.removeCheck').prop('checked', allSelected);
	        });
		  
		  $('.deleteReview').on('click', function() {
	            var selectedIds = [];
	            $('.removeCheck:checked').each(function() {
	                selectedIds.push($(this).data('id'));
	            });
	            if (selectedIds.length > 0) {
	            	var url = '${conPath}/worker/workerDeleteReview.do?&rid='+selectedIds.join('&rid=');
	        		location.href = url;
	            } else {
	                alert('선택된 항목이 없습니다.');
	            }
	        });	
		
	});	
</script>
<script>
	function noImage(imageElement) {
		imageElement.src = "${conPath}/images/noimg.jpg";
	}
</script>
<script>
	function goReviewPage(rid){
		window.open("${conPath}/review/reviewContent.do?rid="+rid, "_blank");
	}
</script>
</head>
<body>
<c:if test = "${not empty deleteResult }">
	<script>
		alert('${deleteResult eq 1? "리뷰게시글 삭제 완료": "리뷰게시글 삭제 실패"}');
	</script>
</c:if>
<c:if test = "${not empty workerReviewDeleteResult }">
	<script>
		alert('${workerReviewDeleteResult}개의 리뷰 및 해당 리뷰의 댓글이 삭제되었습니다.');
	</script>
</c:if>
<section class="notice">
<jsp:include page="../main/header.jsp"/>
<jsp:include page="workerHeader.jsp"/>
  <div class="page-titlee" style="margin-top:-100 " >
        <div class="containerr">
            <h3 style=" margin-right:70px; font-size: 60px;color: #333333;font-weight: 400;text-align: center;"> 리뷰게시글 리스트 </h3>
        </div>
    </div>

    <div class="board-searchh">
        <div class="containerr">
            <div class="search-window">                            
                    <div class="search-wrap" >
                        <label for="search" class="blind"> 리뷰게시글 검색 </label>
                        <input id="search" type="search" name="schWord" placeholder="게시글 제목 & 내용 검색" value="${param.searchWord}">
                        <input type="button" id="searchReview" class="btn btn-dark" value="검색">                        
                        <input type="button" class="btn btn-dark" value="초기화" onclick="location.href='${conPath}/worker/workerReviewList.do'">                          
                    </div>               
            </div>
        </div>
    </div>
    <div class="board-listt">
        <div class="containerr">
            <table class="board-tablee">
                <thead>
                <tr>
                    <th scope="col" class="th-num">게시글번호</th>
                    <th scope="col" class="th-thum">썸네일</th> 
     	            <th scope="col" class="th-id">회원아이디</th>              
     	            <th scope="col" class="th-handle">닉네임</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-context">내용</th>
                    <th scope="col" class="th-score">평점</th>                    
                    <th scope="col" class="th-date">작성일</th>
                    <th scope="col" class="th-on">주문번호</th>                    
                </tr>                
                </thead>
            <c:if test = "${reviewList.size() eq 0 }">
            	<tr>
            		<td colspan="9">
            			등록된 리뷰가 없습니다.
            		</td>
            	</tr>
            </c:if>
            <c:if test = "${reviewList.size() != 0 }">			 
     		<c:forEach var = "reviews" items="${reviewList }">
				<tr>
					<td>		        	
						<input type = "checkbox" data-id ="${reviews.rid }" class = "removeCheck"> ${reviews.rid }<br>
						<input type = "button" value = "글보기" onclick="goReviewPage(${reviews.rid})">
					</td>
		    		<td>
		    			<c:choose>
                			<c:when test="${not empty reviews.rphoto}">
                    			<img src="${conPath }/memberImg/${reviews.rphoto}" onerror="noImage(this)" style = "width: 35px; height: 35px;"/>
                			</c:when>
                			<c:otherwise>   
	                			<img src="${conPath }/resources/memberImg/${reviews.rcontentImgFileName}" onerror="noImage(this)" style = "width: 35px; height: 35px;"/>                                        	
                			</c:otherwise>
            			</c:choose>
		    		</td>
		    		<td>
		    			${reviews.mid }
		    		</td>
			    	<td>
				    	${reviews.mname }
				    </td>
				    <td>
				    	${reviews.rtitle}
				    </td>
				    <td style = "width: 300px;">
				    	<c:out value="${reviews.rcontent }" escapeXml="true"/>
				    </td>
		    		<td>
		    			<img src = "${conPath}/images/point_star_on.png" style = "width: 20px;">${reviews.rscore }점
		    		</td>
		    		<td>
		    			<fmt:formatDate value="${reviews.rrdate}" pattern="yyyy-MM-dd" var="formattedDate" />
						<fmt:formatDate value="${reviews.rrdate}" pattern="HH:mm:ss" var="formattedTime" />
						${formattedDate}<br>${formattedTime}						
		    		</td>
			    	<td>
				    	${reviews.odid }
				    </td>
				</tr>
	  	</c:forEach>
	  	</c:if>
            </table>            
        </div>
        <br>
        <input type = "button" value = "전체선택" class = "selectAll" style = "margin-left:18%; margin-right: 10px;">
        <input type = "button" value = "삭제하기" class = "deleteReview">        
<br><br><br>
<br><br><br>
</div>
	<div id ="paging">
		<c:if test="${paging.startPage>paging.blockSize}">
			<a href="${conPath }/worker/workerReviewList.do?pageNum=${paging.startPage-1 }&searchWord=${param.searchWord}">[이전]</a> 
		</c:if>	
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }"> 
				<b>[ ${i } ]</b> 
			</c:if>
			<c:if test="${paging.currentPage != i }">
				<a href="${conPath }/worker/workerReviewList.do?pageNum=${i }&searchWord=${param.searchWord}">[${i }]</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			<a href="${conPath }/worekr/workerReviewList.do?pageNum=${paging.endPage+1 }&searchWord=${param.searchWord}">[다음]</a>
		</c:if>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>