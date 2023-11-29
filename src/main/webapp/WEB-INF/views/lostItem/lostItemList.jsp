<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/order.css" rel="stylesheet">  
<style>
#buttons{text-align:center;}
.submit{position:relative; font-size: 20px;padding-bottom:10px; width:200px; height:55px;color: #fff; background:rgb(111, 35, 249);;font-weight:bold;border-radius: 28px;border:1px solid #6317ed;}
.cancel{position:relative; font-size: 20px;padding-bottom:10px; width:200px; height:55px;color:#6317ed; background:white;font-weight:bold;border-radius: 28px;border:1px solid #6317ed;}
input{border: 2px solid black;  }
</style>
	
</head>
<script>
function go_search(){
	 if($('input[name="key"]').val() == "" ){
		alert("검색버튼 사용시에는 검색어 입력이 필수입니다");
	 	return false;
	} 
}
</script>
<body>
<jsp:include page="../main/header.jsp"/>
<article>
<form action="${conPath }/lostItemList.do" method="get">
<section class="notice">
<div class="page-title">
	<div class="container">
		<h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 50px; text-align:center;">분실물 검색</h3>
	</div>
</div>

    <div class="board-searchh">
        <div class="container">
                      <div class="search-wrap">
				
				<div class="order_box_date_date">
					<div id="calendarPopup" class="calendar-popup"></div>
                  	
				</div>
            <div class="search-window">	
                        <label for="datepicker">
                        	<img src="${conPath }/images/ticket_images/calendar.png" style="width:30px; height:30px;">
                        </label>
                        <input type="text" id="datepicker" name="schDate" value="${param.schDate}" 
                        	autocomplete="off" placeholder="분실한 날짜를 입력해주세요." >
                        <input id="search" type="text" name="schWord" placeholder="분실한 소지품을 입력해주세요." value="${param.schWord}" size="50">
                        <input type="submit" class="btn btn-dark" value="검색" onClick="return go_search()">
                 		<input type="button" class="btn btn-darkkk" value="전체보기" onClick="${conPath }/lostItemList.do"></button>  
                    </div>
                
            </div>
        </div>
    </div>
   
    <div class="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">분류</th>
                    <th scope="col" class="th-title">습득물</th>
                    <th scope="col" class="th-date">습득장소</th>
                     <th scope="col" class="th-num">습득물 사진</th>
                    <th scope="col" class="th-num">습득일</th>
                    <th scope="col" class="th-title">처리결과</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${lostItem}" var="lostItem">
	                <tr>
	                    <td>${lostItem.litem}</td>
	                    <td>${lostItem.lname }</td> 
	                    <td>${lostItem.location }</td> 
	                    <td><img src="${conPath }/lostitemImg/${lostItem.lphoto}"/></td>
	                    <td><fmt:formatDate value="${lostItem.lrdate}" type="date"/></td>
	                    <td>${lostItem.lresult }</td> 
	                </tr>
	          	</c:forEach>
                
                </tbody>
            </table>
        </div>
    </div>
</section>
<div style="text-align: center; margin-top: 20px;">
	<c:if test="${paging.startPage>paging.blockSize}">
		[ <a href="${conPath }/lostItemList.do?pageNum=${paging.startPage-1 }&schWord=${param.schWord}&schDate=${param.schDate}">이전</a> ]
	</c:if>	
	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
		<c:if test="${paging.currentPage==i }"> 
			<b>[ ${i } ]</b> 
		</c:if>
		<c:if test="${paging.currentPage != i }">
			[ <a href="${conPath }/lostItemList.do?pageNum=${i }&schWord=${param.schWord}&schDate=${param.schDate}">${i }</a> ]
		</c:if>
	</c:forEach>
	<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a href="${conPath }/lostItemList.do?pageNum=${paging.endPage+1 }&schWord=${param.schWord}&schDate=${param.schDate}">다음</a> ]
	</c:if>
</div>
</form>
<br>
<br><br><br><br><br><br><br>
</article>
<jsp:include page="../main/footer.jsp"/>
</body>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$( function() {
    $( "#datepicker" ).datepicker({
    	dateFormat: "yy-mm-dd",
    	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
    	changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
    	changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
    	showMonthAfterYear: true,
    	yearSuffix: '년',
    	showOtherMonths: true, // 현재 달이 아닌 달의 날짜도 회색으로 표시
    	//minDate: '-100y',	 // 현재날짜로부터 100년이전까지 년을 표시한다.
    	minDate: new Date(1950, 1 - 1, 1), // 1950년 1월1일을 최소 날짜로 세팅
    	maxDate : 'y', // 현재 날짜 이전만 선택 가능
    	yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 
    });
});
  </script>
</html>
