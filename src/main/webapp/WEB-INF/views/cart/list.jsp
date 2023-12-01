<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	function cartDelete () {
	var selectedCids= [];
	$('input[name="cid"]:checked').each(function(){
		selectedCids.push($(this).val());
	});	
	if (selectedCids.length >0){
		var url = '${conPath}/cart/delete.do?mid=${member.mid}&cid='+selectedCids.join('&cid=');
		location. href = url;	
    } else {
        alert('선택된 항목이 없습니다.');  // 선택된 항목이 없을 때 경고 메시지 추가
    }
}
</script>
<script>
	// submit시에 체크된 요소가 단 하나도 없다면 alert 출력 후 submit 이벤트 false로 리턴.
	function submitChk(){
		var checkboxes = document.getElementsByName('cid');
		var cnt = 0;
		
		for (let i = 0; i < checkboxes.length; i++){
			if (checkboxes[i].checked){
				cnt++;
			}
		}
		
		if (cnt == 0){
			alert('결제 시 적어도 1개 이상의 항목을 선택해 주세요.');
			return false;
		} else {		
			return true;
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
<link href="${conPath }/css/world.css" rel="stylesheet">
</head>
<body>
<c:if test="${not empty deleteResult }">
	<script>alert('삭제 성공');</script>
</c:if>
<c:if test = "${not empty passTicketResult }">
	<script>
		alert('${passTicketResult eq 1 ? "자유이용권이 장바구니에 추가되었습니다." : "장바구니 추가 실패"}');
	</script>	
</c:if>
<c:if test = "${not empty fastTicketResult }">
	<script>
		alert('${fastTicketResult eq 1 ? "패스트티켓이 장바구니에 추가되었습니다." : "장바구니 추가 실패"}');
	</script>
</c:if>
<c:if test = "${empty member }">
	<script>
		alert('세션이 만료되어 로그아웃 되었습니다. 다시 로그인해주세요.');
		location.href='${conPath}/main.do';
	</script>
</c:if>	
<jsp:include page="../main/header.jsp"/>
<form action="${conPath }/order/orderForm.do" method="get">
<c:if test="${not empty deleteResult }">
	<script>
		alert('삭제가 성공적으로 완료되었습니다.');
	</script>
</c:if>
<input type = "hidden" name="mid" value="${member.mid}"> 
	<section class="notice">
	   <div class="page-title">
	        <div class="container">
	            <h3 style="font-size: 28px;color: #333333;font-weight: 400;text-align: center;">장바구니</h3>
	            <br><h1 style="font-size: 15px; text-align:center;">${member.mname} 님의 장바구니 목록입니다</h1>
	        </div>
	    </div>  
	     <div class="board-list">
	        <div class="container" style="width:1000px; ">
		        <div class="mypage-btn-dede-wrap">
		        	<input type = "button" value = "모두선택" class = "selectAll dede" style = "float: left; margin-top: 25px;">
		 			<nav id="sub_mypage" style="float:right;">
					<ul style= "font-weight:bold; color:#5c10e6;">
						<li>
							<input type = "button" class = "dede" onclick = "location.href='${conPath }/order/orderList.do?mid=${member.mid}'" value = "주문내역 이동">
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
		                    <th scope="col" class="th-num">총액</th>
		                    <th scope="col" class="th-num">처리 상태</th>
		                    <th scope="col" class="th-date">선택</th>
		                </tr>
	             	  </thead>
               		<tbody>
	               	<c:if test = "${empty cartList }">
	               		<tr>
	               			<td colspan = "10">
	               		<strong> 장바구니에 추가한 목록이 없습니다.</strong>	
	               			</td>
	               		</tr>
	               	</c:if>
	               	<c:if test = "${not empty cartList }">		
						<c:forEach var="dto" items="${cartList }">
							 <tr>
			                	<td><fmt:formatDate value="${dto.crdate}" type="date"/></td>
			                    <td>${dto.cid}</td>
			                     <td>
		                          <c:choose>
		                             <c:when test = "${dto.type==0}">
		                            	    자유이용권 
		                             </c:when>
		                             <c:otherwise>
		                               	 패스트패스   
		                             </c:otherwise>
		                          </c:choose>
		                       	</td>
			                    <th>어른 : ${dto.p1}<br> 
			                    	청소년 : ${dto.p2}
			                    </th>
			                    <th> 
			                    	<fmt:formatNumber type="currency" value="${dto.price1}" /><br> 
			                 		<fmt:formatNumber type="currency" value="${dto.price2}" />
			                    </th>
			                    <td>${dto.atname1}<br> 
				                    ${dto.atname2}<br>  
				                    ${dto.atname3} </td>                  
		                    	<td>${dto.visitdate} </td>
			                	<td><fmt:formatNumber type="currency" value="${dto.price1+dto.price2}" /></td>
			                	<td>
		                         	<c:choose>
			                        	<c:when test='${dto.result == 0}'>결제 대기</c:when>                  
			                         	<c:otherwise><b style="color:red;">결제 완료</b></c:otherwise>
		                     		</c:choose>
		                  		</td>
			                	<td>
			                	<c:choose>
		                        	<c:when test='${dto.result == 0}'>
			                			<input type="checkbox" name="cid" value="${dto.cid}">
			                		</c:when>
			                		<c:otherwise>-</c:otherwise>
			                	</c:choose>
			                	</td>
			                </tr>                
			          	</c:forEach>
	          		</c:if>	
             </tbody>
         </table>
	             <div id ="paging" style = "font-size: 15px; font-weight: 500;">
					<c:if test="${paging.startPage > paging.blockSize}">
						[ <a href="${conPath }/qna/qnaList.do?pageNum=${paging.startPage-1 }&schWord=${param.schWord}">이전</a> ]
					</c:if>	
					<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
						<c:if test="${paging.currentPage eq i }"> 
							[<b style = "color:red;">${i }</b>] 
						</c:if>
						<c:if test="${paging.currentPage != i }">
							[ <a href="${conPath }/qna/qnaList.do?pageNum=${i }&schWord=${param.schWord}">${i }</a> ]
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage<paging.pageCnt }">
						[ <a href="${conPath }/qna/qnaList.do?pageNum=${paging.endPage+1 }&schWord=${param.schWord}">다음</a> ]
					</c:if>
				</div>
	        	<div class="mypage-btn-dede-wrap">
	        		<input type="button" onclick="cartDelete()" value="삭제하기" class="dede" style="float:right;">
	   				<input type="submit" value="결제하기" class="dede" style="float:right;" onclick = "return submitChk()">			   
	     		</div>
	    		</div>
    		</div>
		</section>
	</form>
<br>	
<jsp:include page="../main/footer.jsp" />
</body>
</html>