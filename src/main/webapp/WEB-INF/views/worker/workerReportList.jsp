<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고글 리스트</title>
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
		$('#searchReport').on('click', function() {
			var schWord = $('input[name="schWord"]').val();
			location.href = '${conPath}/worker/workerReportList.do?pageNum=${empty param.pageNum? "1": param.pageNum}&searchWord='+schWord;
		});
		
		var allSelected = false;
		  $('.selectAll').on('click', function() {
	            allSelected = !allSelected;
	            $('.removeCheck').prop('checked', allSelected);
	        });
		  
		  $('.deleteReport').on('click', function() {
	            var selectedIds = [];
	            $('.removeCheck:checked').each(function() {
	                selectedIds.push($(this).data('id'));
	            });
	            if (selectedIds.length > 0) {
	            	var url = '${conPath}/worker/workerDeleteReport.do?&rno='+selectedIds.join('&rno=');
	        		location.href = url;
	            } else {
	                alert('선택된 항목이 없습니다.');
	            }
	        });	
		
	});	
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
		alert('${deleteResult eq 0? "삭제 실패": "${deleteResult} 건의 신고건 삭제됨"}');
	</script>
</c:if>
<section class="notice">
<jsp:include page="../main/header.jsp"/>
<jsp:include page="workerHeader.jsp"/>
  <div class="page-titlee" style="margin-top:-100 " >
        <div class="containerr">
            <h3 style=" margin-right:70px; font-size: 60px;color: #333333;font-weight: 400;text-align: center;"> 신고내역 </h3>
        </div>
    </div>

    <div class="board-searchh">
        <div class="containerr">
            <div class="search-window">                            
                    <div class="search-wrap" >                        
                        <input id="search" type="search" name="schWord" placeholder="신고자 아이디 / 리뷰아이디를 검색" value="${param.searchWord}">
                        <input type="button" id="searchReport" class="btn btn-dark" value="검색">                        
                        <input type="button" class="btn btn-dark" value="초기화" onclick="location.href='${conPath}/worker/workerReportList.do'">                          
                    </div>               
            </div>
        </div>
    </div>
    <div class="board-listt">
        <div class="containerr">
            <table class="board-tablee">
                <thead>
                <tr>
                    <th scope="col" class="th-num">신고번호</th>
                    <th scope="col" class="th-thum">게시글제목</th> 
     	            <th scope="col" class="th-id">게시글내용</th>              
     	            <th scope="col" class="th-handle">작성일</th>
                    <th scope="col" class="th-title">작성자</th>
                    <th scope="col" class="th-context">신고자</th>
                    <th scope="col" class="th-score">신고자명</th>                    
                    <th scope="col" class="th-date">사유</th>
                    <th scope="col" class="th-on">신고일</th>
                </tr>                
                </thead>
            <c:if test = "${reportList.size() eq 0 }">
            	<tr>
            		<td colspan="9">
            			신고 내역이 없습니다.
            		</td>
            	</tr>
            </c:if>
            <c:if test = "${reportList.size() != 0 }">			 
     		<c:forEach var = "reports" items="${reportList }">
				<tr>
					<td>		        	
						<input type = "checkbox" data-id ="${reports.rno }" class = "removeCheck"> ${reports.rno }<br>
						<input type = "button" value = "글보기" onclick="goReviewPage(${reports.rid})">
					</td>
		    		<td>
		    			${reports.rtitle }
		    		</td>
		    		<td style = "width: 300px;">
		    			<c:out value="${empty reports.rcontent? '내용없음' : reports.rcontent }" escapeXml="true"/>		    			
		    		</td>
			    	<td>
				    	${reports.rrdate }
				    </td>
				    <td>
				    	${reports.writermid }
				    </td>				
		    		<td>
		    			${reports.reportermid }
		    		</td>
		    		<td>
		    			${reports.mname }
		    		</td>
		    		<td>
		    			${reports.rreason eq 1? '욕설': (reports.rreason eq 2? '도배' : (reports.rreason eq 3? '포인트파밍' : '기타'))}		    									
		    		</td>
			    	<td>
				    	<fmt:formatDate value="${reports.reportdate}" pattern="yyyy-MM-dd" var="formattedDate" />
						<fmt:formatDate value="${reports.reportdate}" pattern="HH:mm:ss" var="formattedTime" />
						${formattedDate}<br>${formattedTime}
				    </td>
				</tr>
	  	</c:forEach>
	  	</c:if>
            </table>            
        </div>
        <br>
        <input type = "button" value = "전체선택" class = "selectAll" style = "margin-left:18%; margin-right: 10px;">
        <input type = "button" value = "삭제하기" class = "deleteReport">
    </div>
	<div id ="paging">	
		<c:if test="${paging.startPage>paging.blockSize}">
			<a href="${conPath }/worker/workerReportList.do?pageNum=${paging.startPage-1 }&searchWord=${param.searchWord}">[이전]</a> 
		</c:if>	
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }"> 
				<b>[ ${i } ]</b> 
			</c:if>
			<c:if test="${paging.currentPage != i }">
				<a href="${conPath }/worker/workerReportList.do?pageNum=${i }&searchWord=${param.searchWord}">[${i }]</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			<a href="${conPath }/worekr/workerReportList.do?pageNum=${paging.endPage+1 }&searchWord=${param.searchWord}">[다음]</a>
		</c:if>
	</div>	
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>