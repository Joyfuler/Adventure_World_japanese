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
			alert('공지사항 수정 완료');
		</script>
	</c:if>
<jsp:include page="../main/header.jsp"/>

<article>
<div class="findfindd">
<h1>공지사항 수정</h1>
<br><hr><br>
<form action= "${conPath }/worker/update.do" method="post" enctype="multipart/form-data">
	<table class="baba">
		<tr>
			<th>제목</th> 
			<td><input type="text" name="ntitle" size="47" value="${notice.ntitle }" required="required"></td>
		</tr>
		<tr style="height:250px">
			<th>현재이미지</th>
	    	<td>
	   			<input type="hidden" name="ncontent" id="image" >
	   			<div id="filename"></div>
	   			<input type="file" name="fileimage" id="mymy" value="${notice.ncontent }">
	   		</td>
	   	</tr>
	   	<tr>
	   		<td>
	   			<input type="submit" value="공지수정" onclick="location.href='${conPath }/worker/update.do'">
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