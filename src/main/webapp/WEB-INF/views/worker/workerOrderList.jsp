<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 리스트</title>
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
		$('#searchOrder').on('click', function() {
			var mid = $('input[name="mid"]').val();
			location.href = '${conPath}/worker/workerOrderList.do?pageNum=${empty param.pageNum? "1": param.pageNum}&searchword='+mid;
		});		
	});	
</script>
</head>
<body>
<section class="notice">
<jsp:include page="../main/header.jsp"/>
<jsp:include page="workerHeader.jsp"/>
  <div class="page-titlee" style="margin-top:-100 " >
        <div class="containerr">
            <h3 style=" margin-right:70px; font-size: 60px;color: #333333;font-weight: 400;text-align: center;"> 주문내역 리스트 </h3>
        </div>
    </div>
    <div class="board-searchh">
        <div class="containerr">
            <div class="search-window">                            
                    <div class="search-wrap" >
                        <input id="search" type="text" name="mid" placeholder="주문자 아이디 & 주문자명 검색" value="${param.mid}">                        
                        <input type="button" id="searchOrder" class="btn btn-dark" value="검색">                        
                        <input type="button" class="btn btn-dark" value="초기화" onclick="location.href='${conPath}/worker/workerOrderList.do'">                          
                    </div>               
            </div>
        </div>
    </div>
    <div class="board-listt">
        <div class="containerr">
            <table class="board-tablee">
                <thead>
                <tr>
                    <th scope="col" class="th-num">주문번호</th>
                    <th scope="col" class="th-id">주문자아이디</th>
                    <th scope="col" class="th-name">주문자명</th> 
     	            <th scope="col" class="th-email">주문자메일</th>              
     	            <th scope="col" class="th-hp">주문자폰</th>
                    <th scope="col" class="th-date">주문날짜</th>
                    <th scope="col" class="th-method">결제방식</th>
                    <th scope="col" class="th-type">티켓종류</th>                    
                    <th scope="col" class="th-op1">티켓매수<br>(성인/청소년)</th>                    
                    <th scope="col" class="th-point">총액</th>                    
                    <th scope="col" class="th-net">사용포인트</th>                    
                    <th scope="col" class="th-total">결제액</th>
                </tr>                
                </thead>
            <c:if test = "${orderList.size() eq 0 }">
            	<tr>
            		<td colspan="9">
            			주문내역이 없습니다.
            		</td>
            	</tr>
            </c:if>
            <c:if test = "${orderList.size() != 0 }">			 
     		<c:forEach var = "orders" items="${orderList }">
				<tr>
					<td>	
						${orders.oid }
					</td>
		    		<td>
		    			${orders.mid }
		    		</td>
		    		<td>
		    			${orders.oname }
		    		</td>
		    		<td>
		    			${orders.omail }
		    		</td>
			    	<td>
				    	${orders.ophone }
				    </td>
				    <td>
				    	${orders.odate}
				    </td>
				    <td>
				    	${orders.payment }			 		    	
		    		</td>
		    		<td>
		    			${orders.otype eq 0? '자유이용권' : '패스트패스' }
		    		</td>		    		
			    	<td>
				    	${empty orders.op1? '0' : orders.op1 }매 / 
				    	${empty opders.op2? '0' : orders.op2 }매
				    </td>
				    <td>
				    	<fmt:formatNumber value="${orders.oprice1 + orders.oprice2 }" pattern="#,##0"/>원				    	
				   </td>
				   <td>
				   		<fmt:formatNumber value="${orders.ompoint }" pattern="#,##0"/>p
				   	</td>
				   	<td>
				   		<fmt:formatNumber value="${orders.oprice1 + orders.oprice2 - orders.ompoint }" pattern="#,##0"/>원 
				</tr>
	  	</c:forEach>
	  	</c:if>
            </table>            
        </div>
        <br>
</div>
	<div id ="paging">
		<c:if test="${paging.startPage > paging.blockSize}">
			<a href="${conPath }/worker/workerOrderList.do?pageNum=${paging.startPage-1 }&searchword=${param.searchword}">[이전]</a> 
		</c:if>	
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }"> 
				<b>[ ${i } ]</b> 
			</c:if>
			<c:if test="${paging.currentPage != i }">
				<a href="${conPath }/worker/workerOrderList.do?pageNum=${i }&searchword=${param.searchword}">[${i }]</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			<a href="${conPath }/worekr/workerReviewList.do?pageNum=${paging.endPage+1 }&searchword=${param.searchword}">[다음]</a>
		</c:if>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>