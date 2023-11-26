<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>주문내역</title>
<link href="${conPath }/css/world.css" rel="stylesheet">
<script>
	function orderDelete () {
	var selectedOids = [];
	$('input[name="oid"]:checked').each(function(){
		selectedOids.push($(this).val());
	})	
	if (selectedOids.length >0){
		var url = '${conPath}/order/delete.do?mid=${member.mid}&oid='+selectedOids.join('&oid=');
		location.href = url;
	} else {
		alert('선택된 항목이 없습니다.');
	}
}	
</script>
<script>
$(document).ready(function(){
	$(".selectAll").click(function(){
		$('input:checkbox').prop('checked', function(i,value){
			return !value;
		});
	});
});
</script>
</head>
<body>
<c:if test = "${empty member }">
	<script>
		alert('세션이 만료되어 로그아웃 되었습니다. 다시 로그인해주세요.');
		location.href='${conPath}/main.do';
	</script>
</c:if>
<c:if test = "${not empty orderComplete }">
	<script>
		alert('${orderComplete}');
	</script>
</c:if>
<c:if test = "${not empty deleteResult }">
	<script>
		alert('${deleteResult != 0 ? "선택하신 목록이 주문내역에서 삭제되었습니다." : "삭제 실패"}');
	</script>
</c:if>	
<jsp:include page="../main/header.jsp"/>
	<section class="notice">
	   <div class="page-title">
	        <div class="container">
	            <h3 style="font-size: 28px;color: #333333;font-weight: 400;text-align: center;">주문내역</h3>
	            <br>
	            <h1 style="font-size: 15px; text-align:center;">${member.mname} 님의 티켓 주문내역입니다.</h1>	            
	            <h5 style = "font-size: 10px;"> (최근 결제한 순으로 페이지당 5건씩 출력됩니다)</h5>
	        </div>
	    </div>  
	     <div class="board-list">
	        <div class="container" style="width:1000px;">
		        <div class="mypage-btn-dede-wrap">
		        	<input type = "button" value = "모두선택" class = "selectAll" style = "float: left; margin-top: 25px;">
		 			<nav id="sub_mypage" style="float:right;">
					<ul style= "font-weight:bold; color:#5c10e6;">
						<li>
							<input type = "button" onclick = "location.href='${conPath }/cart/list.do?mid=${member.mid}'" value = "장바구니 이동 ">
						</li>
					</ul>
					</nav>
		    	</div>
				 <table class="board-table">
                	<thead>
		                <tr>
		                	<th scope="col" class="th-num">주문일자</th>
		                    <th scope="col" class="th-num">주문번호</th>
		                    <th scope="col" class="th-num">티켓유형</th>
		                    <th scope="col" class="th-date">인원수</th>
		                    <th scope="col" class="th-num">가격</th>
		                    <th scope="col" class="th-date">어트랙션</th>
		                    <th scope="col" class="th-num">방문일자</th>
		                    <th scope="col" class="th-num">총액<br>(포인트할인액)</th>
		                    <th scope="col" class="th-num">처리 상태</th>
		                    <th scope="col" class="th-date">선택</th>
		                </tr>
              	  	</thead>
               	  	<tbody>
               		<c:if test = "${empty orderList }">
               			<tr>
               				<td colspan = "10">
               					<strong> 주문한 내역이 없습니다.</strong>	
               				</td>
               			</tr>
               		</c:if>
               		<c:if test = "${not empty orderList }">		
               		<c:set var = "oid" value = "0"/>
					<c:forEach var="orderLists" items="${orderList }">
						<c:if test = "${oid eq orderLists.oid }">
					 		<tr class = "hidden-row">					 	
					 	</c:if>
					 	<c:if test = "${oid != orderLists.oid }">
					 		<tr>
					 	</c:if>	
	                	<td>
	                		<c:if test = "${oid != orderLists.oid }">
	                			<fmt:formatDate value="${orderLists.ocrdate}" type="date"/>
	                		</c:if>
	                	</td>
	                    <td>
	                    	<c:if test = "${oid != orderLists.oid }">
	                    		${orderLists.oid}
	                    	</c:if>
	                    </td>
	                    <td>
                          <c:choose>
                             <c:when test = "${orderLists.otype eq 0}">
                               	자유이용권 
                             </c:when>
                             <c:otherwise>
                               	패스트패스   
                             </c:otherwise>
                          </c:choose>
                       </td>
	                    <th>
	                    	어른 : ${orderLists.op1}매<br> 
	                    	청소년 : ${orderLists.op2}매
	                    </th>
	                    <th> 
	                    	<fmt:formatNumber type="currency" value="${orderLists.oprice1}" /><br> 
	                 		<fmt:formatNumber type="currency" value="${orderLists.oprice2}" />
	                    </th>
	                    <c:if test = "${orderLists.otype eq 0 }">
	                    	<td> - </td>
	                    </c:if>
	                    <c:if test = "${orderLists.otype eq 1 }">	                    
	                    	<td>
	                    		${orderLists.oatname1}<br> 
	                    		${orderLists.oatname2}<br>  
	                    		${orderLists.oatname3} 
	                    	</td>            
	                    </c:if>      
	                    <td>
	                    	${orderLists.ovisitdate} 
	                    </td>
	                	<td>	                		
	                		<fmt:formatNumber type="currency" value="${orderLists.oprice1 + orderLists.oprice2}" />
	                		<br>
	                		(<fmt:formatNumber type= "currency" value = "${orderLists.ompoint eq null? '0' : orderLists.ompoint}"/>)	                		
	                	</td>
	                	<td>
	                		<c:if test = "${oid != orderLists.oid }">
                         	<c:choose>
                        		<c:when test='${orderLists.oresult eq 0}'>
                        			결제 완료
                        		</c:when>                  
                         		<c:otherwise>
                         			<b style="color:red;">결제 취소됨</b>
                         		</c:otherwise>
                     			</c:choose>
                     		</c:if>	
                  		</td>
	                	<td>
	                		<c:if test = "${oid != orderLists.oid }">	                    	
	                			<c:choose>
                        			<c:when test='${orderLists.oresult eq 0}'>
	                					<input type="checkbox" name="oid" value="${orderLists.oid}">
	                				</c:when>
	                				<c:otherwise>
										-
	                				</c:otherwise>
	                			</c:choose>
	                		</c:if>	
	                	</td>	                	
	                </tr>  
	              <c:set var="oid" value="${orderLists.oid }"/>	                              
	          	</c:forEach>
	          </c:if>	
              </tbody>
           </table>
           <div class="mypage-btn-dede-wrap">
           		<input type="button" onclick="orderDelete()" value="삭제하기" class="dede" style="float:right;">
				<input type="submit" value="결제 취소" class="dede" style="float:right;" onclick = "alert('결제 취소건은 Q&A 게시판을 통해 문의해주세요.')">			   
        	</div>
    	</div>
    </div>
</section>
<div id = "paging" style = "font-size: 15px; font-weight: 500;">
		<c:if test="${paging.startPage>paging.blockSize}">
			<a href="${conPath }/order/orderList.do?mid=${member.mid }&pageNum=${paging.startPage-1 }">[이전]</a>
		</c:if>	
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }"> 
				[<b style = "color: red;"> ${i } </b>] 
			</c:if>
			<c:if test="${paging.currentPage != i }">
				<a href="${conPath }/order/orderList.do?mid=${member.mid }&pageNum=${i }">[${i }]</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			<a href="${conPath }/order/orderList.do?mid=${member.mid }&pageNum=${paging.endPage+1 }">[다음]</a>
		</c:if>
</div>
<jsp:include page="../main/footer.jsp" />
</body>
</html>