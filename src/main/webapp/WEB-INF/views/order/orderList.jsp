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
</head>
<c:if test = "${empty member }">
	<script>
		alert('세션이 만료되어 로그아웃 되었습니다. 다시 로그인해주세요.');
		location.href='${conPath}/main.do';
	</script>
</c:if>
<body>
<jsp:include page="../main/header.jsp"/>
	<section class="notice">
	   <div class="page-title">
	        <div class="container">
	            <h3 style="font-size: 28px;color: #333333;font-weight: 400;text-align: center;">주문내역</h3>
	            <br><h1 style="font-size: 15px; text-align:center;">${member.mname} 님의 티켓 주문내역입니다.</h1>
	        </div>
	    </div>  
	     <div class="board-list">
	        <div class="container" style="width:1000px; ">
		        <div class="mypage-btn-dede-wrap">
		        	<input type = "button" value = "모두선택" class = "selectAll" style = "float: left;">
		 			<nav id="sub_mypage" style="float:right;">
					<ul style= "font-weight:bold;
								color:#5c10e6;">
						<li><a href='${conPath }/cart/List.do?mid=${member.mid}'>장바구니 이동 </a></li>
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
               		<strong> 주문한 내역이 없습니다.</strong>	
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
	                    <th> <fmt:formatNumber type="currency" value="${dto.price1}" /><br> 
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
	                		<c:otherwise><a href="#"onClick="go_orderList()">주문내역 확인</a></c:otherwise>
	                	</c:choose>
	                	</td>
	                </tr>
                
	          	</c:forEach>
	          </c:if>	
                </tbody>
            </table>
            	 <div class="mypage-btn-dede-wrap">
            		<input type="button" onclick="cartdelete()" value="삭제하기" class="dede" style="float:right;">
			  
			    	<input type="submit" value="결제하기" class="dede" style="float:right;" onclick = "return submitChk()">
			   
        	</div>
    	</div>
    </div>
</section>



<jsp:include page="../main/footer.jsp" />
</body>
</html>