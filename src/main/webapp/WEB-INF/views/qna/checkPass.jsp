<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function qnaCheckPass(){
		if(document.frm.qpw.value==''){
			alert("비밀번호를 입력하세요");
			document.frm.qpw.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>

<div align="center">
	<h1 style="font-family:'IBM Plex Sans KR', sans-serif;">비밀번호 확인</h1>
	<form action ="${conPath }/qna/qnaCheckPass.do?qno=${qno}&pageNum=${paging.currentPage}&schWord=${param.schWord}" method="post" name="frm">	
		<table style="width:80%">
				<tr>	
					<th style="font-family:'IBM Plex Sans KR', sans-serif;">열람 비밀번호</th>
					<td><input type="password" id = "qpw" name="qpw" size="20" style="font-family:'IBM Plex Sans KR', sans-serif;"></td>	</tr>
		</table><br>
		<input type="submit" value="확 인 " onclick="return qnaCheckPass()" style="font-family:'IBM Plex Sans KR', sans-serif;">
		<br><br>
		<div style="font-family:'IBM Plex Sans KR', sans-serif;">${message}</div>
	</form>
</div>

</body>
</html>