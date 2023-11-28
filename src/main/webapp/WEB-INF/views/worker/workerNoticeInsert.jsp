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
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
 <script>
 function title(){
	if($('input[name="ntitle"]').val()==""){
		   	alert("제목를 입력하세요.");
		  	return false;
	}
 </script>
</head>
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
    width: 1000px;
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
    height: 100px;
}

.baba th {
    position: relative;
    font-size: 30px;
    text-align: center;
}

.baba td {
    position: relative;
    margin: 0 auto;
    border: none;
}

.baba td input {
    width: 100px;
    height: 50px;
    font-size: 20px;
    border-radius: 10px;
    border: 1px solid lightgray;
    
}
.baba .button input{
	background-color: #6f23f9;
	font-size: 20px;
	color: white;
}


.fileUp {
    position: relative;
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
.baba th {
    position: relative;
    font-size: 30px;
    text-align: center;
}

.baba td {
    position: relative;
    margin: 0 auto;
    border: none;
}

.baba td input[type="text"] {
    width: 90%;
    height: 50px;
    font-size: 20px;
    border-radius: 10px;
    border: 1px solid lightgray;
    margin-left: 10px; 
}

.fileUp input[type=file] {
    width: 80%;
    height: 32px;
    font-size: 13px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding: 3px;
    background-color: rgb(233, 233, 233);
    margin-left: 10px;
}
.update_buttons {
    display: flex;
    align-items: center;
    text-align: center;
    height: 100px; 
    margin: 0 auto;
}
h1{
 text-align: center;
 font-size: 50px;
}
</style>
<body>
<c:set var="SUCCESS" value="1"/>
	<c:if test="${insertResult == SUCCESS }">
		<script>
			alert('공지사항 등록 완료');
		</script>
	</c:if>
	
	
<jsp:include page="../main/header.jsp"/>
<article>
<div class="findfindd">
<h1>공지사항 추가</h1>
<br><hr><br>
<form action= "${conPath }/worker/insert.do" method="post" enctype="multipart/form-data" onsubmit="return title();">
	<table class="baba">
		<tr>
			<th>제목</th> 
			<td><input type="text" name="ntitle" size="47" value="" required="required"></td>
		</tr>
		<tr>
			<th>파일</th>
	    	<td>
	   			<div id="filename";>
	   			<input type="file" name="temp_ncontent" id="mymy" style = "width:90%; ">
	   			</div>
	   		</td>
	   	</tr>
	   	<tr>
			<th>내용</th> 
			<td><input type="text" name="ntext" size="47" value=""></td>
		</tr>
	   	<tr>
	   		<td class="button" colspan="2" style="text-align: center;" >
	   		<!-- <div class="update_buttons"> -->
	   			<input type="submit" value="공지등록" >
				<input type="button" value="목록으로" onClick="location.href='${conPath }/worker/list.do'" >
				<input type="reset" value="재설정"  >
			<!-- </div> -->
	   		</td>
	   	</tr>
	</table>
</form>
</div>
</article>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>