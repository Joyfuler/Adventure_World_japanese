<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 분실물 추가</title>
<style>
table {
    border-collapse: collapse;
    border-spacing: 0;
}

.findfindd {
    position: relative;
    width: 100%;
    margin: 0 auto;
}

.id_foundd {
    position: relative;
    width: 1250px;
    margin: 0 auto;
}

.id_foundd h1 {
    font-size: 50px;
    text-align: center;
    height: 110px;
    margin-top: 40px;
}

.baba {
    position: relative;
    margin: 0 auto;
}

.baba tr {
    position: relative;
    width: 700px;
    height: 100px;
}

.baba th {
    position: relative;
    width: 250px;
    font-size: 30px;
    text-align: center;
}

.baba td {
    position: relative;
    width: 500px;
    margin: 0 auto;
    border: none;
}

.baba td input {
    width: 450px;
    height: 50px;
    font-size: 20px;
    border-radius: 10px;
    border: 1px solid lightgray;
    padding-left: 10px;
    background-color: #f7f7f7;
}

.fileUp {
    position: relative;
    width: 700px;
    height: 80px;
    margin: 0 auto;
    text-align: right;
}

.fileUp input[type=file] {
    width: 190px;
    height: 32px;
    font-size: 13px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding: 3px;
    background-color: rgb(233, 233, 233);
}

.fileUp input[type=button] {
    width: 150px;
    height: 32px;
    font-size: 12px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding: 3px;
    background-color: rgb(233, 233, 233);
}
.update_buttons {
    position: relative;
    width: 100%;
    height: 100px;
    margin: 0 auto;
    text-align: center;
}

.update_buttons input {
    width: 140px;
    height: 56px;
    border-radius: 40px;
    background-color: #6f23f9;
    font-size: 20px;
    color: white;
    margin: 0 3px;
    border: none;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
<article>
    <div class="findfindd">
        <div class="id_foundd">
            <h1>분실물 추가</h1>
            <br><hr><br>  
            <form action="${conPath }/insertItem.do" method="post" enctype="multipart/form-data">
                <table class="baba">
                    <tr>
						<th>분실물 분류</th>
						<td><input type="text" name="litem" size="47"></td>
					</tr>
					<tr>
						<th>분실물 이름</th>
						<td><input type="text" name="lname" size="47"></td>
					</tr>
					 <tr>
			            <th>분실물 이미지</th>
			            <td>
			                <div id="filename"></div>
			                <input type="file" name="tempimg" id="lphoto">
			            </td>
			        </tr>
					<tr>
						<th>분실 장소</th>
						<td><input type="text" name="location" size="47"></td>
					</tr>
					<tr>
						<th>분실일
							 <label for="datepicker" style="margin-left: -80px;">
		                        	<img src="${conPath }/images/themepark/calendar3.png" style="width:34px; height:34px; margin-left: 100px; margin-top: 6px;">
	                        </label>
						</th>
						<td> 
								<input type="text" id="datepicker" name="lrdate" size="10">
						</td>
					</tr>
					<tr>
						<th>처리결과</th>
						<td><input type="text" name="lresult" size="47"></td>
					</tr>
     			</table>
			     <div class="update_buttons">
			         <input type="submit" value="분실물 등록">
			         <input type="reset" value="돌아가기" onclick="history.go(-1)">
			     </div>
   			</form>
	    </div>
    </div>
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