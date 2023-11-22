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
</head>
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
<form action= "${conPath }/worker/insert.do" method="post" enctype="multipart/form-data">
	<table class="baba">
		<tr>
			<th>제목</th> 
			<td><input type="text" name="ntitle" size="47" value="" required="required"></td>
		</tr>
		<tr style="height:250px">
			<th>내용</th>
	    	<td>
	   			<input type="hidden" name="ncontent" id="image" >
	   			<div id="filename"></div>
	   			<input type="file" name="fileimage" id="mymy">
	   		</td>
	   	</tr>
	   	<tr>
	   		<td>
	   			<input type="submit" value="공지등록" onclick="location.href='${conPath }/worker/insert.do'">
				<input type="button" value="목록으로" onClick="location.href='${conPath }/worker/list.do'" >
				<input type="RESET" value="재설정"  >
	   		</td>
	   	</tr>
	</table>
</form>
</div>
</article>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>