<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 분실물 센터</title>
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
<link href="${conPath }/css/order.css" rel="stylesheet">  
<style>
input[name=schDate]{
  width: 100px;
  height: 42px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: white;
  margin-left:5px;
}
input[name=schWord] {
 margin-left:10px;
  width: 400px;
  height: 42px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: white;
}
.buts input[type=button]{border-radius: 12px 12px 12px 12px; height: 40px; margin-top:10px; 
 text-align:center;  margin-bottom: 50px; background-color: lightgray; border-color: white; cursor: pointer;}
</style>
	
</head>
<script>
$(function(){
	$('.lostItemSch').click(function(){
		
		var schDate = $('input[name="schDate"]').val();
		var schWord = $('input[name="schWord"]').val();
		if (schDate == null || schDate == ''){
			location.href = '${conPath}/workerlostItemList.do?schWord='+schWord;
		} else {
			location.href = '${conPath}/workerlostItemList.do?schWord='+schWord+'&schDate='+schDate;
		}		
	});
});
</script>
<script>
	$(document).ready(function() {
		$('#modifyItem').on('click', function() {
			var selectedCids= [];
			$('input[name="lno"]:checked').each(function(){
				selectedCids.push($(this).val());
			});	
			if (selectedCids.length >0){
				var url = '${conPath}/modifyItem.do?lno='+selectedCids;
				location. href = url;	
		    } else {
		        alert('선택된 항목이 없습니다.');  // 선택된 항목이 없을 때 경고 메시지 추가
		    }
		});
	});
</script>
<script>	
	$(document).ready(function() {
		$('#updateItem').on('click', function() {
			var selectedCids= [];
			$('input[name="lno"]:checked').each(function(){
				selectedCids.push($(this).val());
			});	
			if (selectedCids.length >0){
				var url = '${conPath}/updateItem.do?lno='+selectedCids;
				location. href = url;	
		    } else {
		        alert('선택된 항목이 없습니다.');  // 선택된 항목이 없을 때 경고 메시지 추가
		    }
		});
	});
</script>
<script>
	$(document).ready(function() {
		$('#deleteItem').on('click', function() {
			var selectedCids= [];
			$('input[name="lno"]:checked').each(function(){
				selectedCids.push($(this).val());
			});	
			if (selectedCids.length >0){
				var url = '${conPath}/deleteItem.do?lno='+selectedCids;
				location. href = url;	
		    } else {
		        alert('선택된 항목이 없습니다.');  // 선택된 항목이 없을 때 경고 메시지 추가
		    }
		});
	});	
</script>
<script >
	$(document).ready(function(){
		$('.check_btnbtn').click(function(){
			let chkCnt = 0;// chkCnt 초기값 0 설정
			var chkBox = $('input[name="lno"]');
			for ( var i = 0; i < chkBox.length; i++){
				if (chkBox[i].checked){ // chkBox가 체크 됐을 경우
					chkCnt++; // 1증가
				}	
			}
			if (chkCnt > 1){ // 3개 
				alert("1개까지만 선택 가능합니다."); // 경고문
				$(this).prop('checked',false);
			}
		});
	});
</script>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="workerHeader.jsp"/>
<article>
	<form action="${conPath }/workerlostItemList.do" method="get" class = "lostItemForm">
		<section class="notice">
		<c:if test="${not empty ItemModyfyReult }">
			<script>
				alert("수정이 완료되었습니다");
			</script>
		</c:if>
		<c:if test="${not empty updateItemReult }">
			<script >
			alert("처리결과 수정이 완료되었습니다");
			</script>
		</c:if>
		<c:if test="${not empty deleteItemReult }">
			<script >	
			alert("삭제가 완료되었습니다");
			</script>
		</c:if>
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
	                        	<img src="${conPath }/images/themepark/calendar3.png" style="width:34px; height:34px; margin-left: 100px; margin-top: 6px;">
	                        </label>
	                        <input type="text" id="datepicker" name="schDate" value="${param.schDate}" 
	                        	autocomplete="off" placeholder="분실 날짜" >
	                        <input id="search" type="text" name="schWord" placeholder="분실한 소지품을 입력해주세요." value="${param.schWord}" size="50">
	                        <input type="button" class="btn btn-dark lostItemSch" value="검색" style="margin-left: 20px;">
	                 		<input type="button" name="list" class="btn btn-dark" value="전체보기" onclick="location.href='${conPath}/workerlostItemList.do'">
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
			                    <c:if test="${not empty worker }">
			                    	<th scope="col" class="th-title"></th>
			                    </c:if>
			                </tr>
		                </thead>
		                <tbody>
			                <c:forEach items="${lostItem}" var="lostItem">
				                <tr>
				                    <td>${lostItem.litem}</td>
				                    <td>${lostItem.lname }</td> 
				                    <td>
				                    <img src="${conPath }/images/themepark/placeholder.png" style="width:24px; height:24px;">
				                    ${lostItem.location }</td> 
				                    <td><img src="${conPath }/lostitemimg/${lostItem.lphoto} " style="width:100px; height:100px;"/></td>
				                    <td><fmt:formatDate value="${lostItem.lrdate}" type="date"/></td>
				                    <td>${lostItem.lresult }</td>
				                     <c:if test="${not empty worker}">
				                     <td> 
					                    <input type="checkbox" name="lno" value="${lostItem.lno }" style="width: 20px; height: 20px;" class="check_btnbtn">		        	
				                    </td>  
			                 		</c:if> 
				                </tr>
				          	</c:forEach>
		                </tbody>
		            </table>
		            <div class="buts">
						<input type="button" class="btn btn-dark" value="수정" id="modifyItem" >
	           			<input type="button" class="btn btn-dark" value="수령" id="updateItem" >
	           			<input type="button" class="btn btn-dark" value="삭제" id="deleteItem" >
	           			<input type="button"  class="btn btn-dark" value="추가" onclick="location.href='${conPath}/insertItem.do'">
					</div>
		        </div>
		    </div>
		</section>
	<div style="text-align: center; margin-top: 20px;">
		<c:if test="${paging.startPage>paging.blockSize}">
			[ <a href="${conPath }/workerlostItemList.do?pageNum=${paging.startPage-1 }&schWord=${param.schWord}&schDate=${param.schDate}">이전</a> ]
		</c:if>	
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }"> 
				<b>[ ${i } ]</b> 
			</c:if>
			<c:if test="${paging.currentPage != i }">
				[ <a href="${conPath }/workerlostItemList.do?pageNum=${i }&schWord=${param.schWord}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			[ <a href="${conPath }/workerlostItemList.do?pageNum=${paging.endPage+1 }&schWord=${param.schWord}&schDate=${param.schDate}">다음</a> ]
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
