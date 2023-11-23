<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
function go_reply(qno){
	document.frm.action='${conPath}/qna/adminqnqreply.do?qno='+qno+'$wid=${worer.mid}';
	document.frm.submit();
}
</script>
</head>
<body>
<article>
<jsp:include page="../main/header.jsp"/>
<%-- <form action="${conPath}/qna/adminqnqreply.do" method="post" > --%>
<form name="frm" method="get">
<input type="hidden" name="qno" value="${Qna.qno}">
<div class="qna">
	<div class="qnaimg" style="background-image:url('images/qnaaa.png');"></div>
	<div class="qnaBox">
		<h2> QnA 게시판 </h2>
		<h3>고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>
		<div class="fix02">
			<table class="fix03">
				<tr>
					<th>제목</th>
					<td>${Qna.qtitle}</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><fmt:formatDate value="${Qna.qrdate}" type="date"/></td>
				</tr>
				<tr>
					<th>질문내용</th>
					<td>${Qna.qcontent}</td>
				</tr>
				<tr>
					<c:choose>          
						<c:when test='${Qna.isreply=="N"}'> <!-- 관리자 답변 전 표시 -->		
			    			<th>답변내용</th>
			    			<td colspan="2"><textarea name="reply" rows="2" cols="45"></textarea>
						</c:when>
						<c:otherwise>  <!-- 관리자 답변 후 표시 -->
							<th>답변내용</th>
							<td align="left" style="text-align:left;">
							<pre>${Qna.reply}</pre>
						</c:otherwise>
					</c:choose>	
				</tr>	
			</table>
		</div>
		<br>
		<div class="buttons" style="height:70px;" >
			<c:choose>
				<c:when test='${Qna.isreply=="N" }'>
					<input type="button" style="padding :0;" class="purpleBtn" value="저장" onClick="go_reply(${Qna.qno})">
					<input type="button" style="padding :0;" value="목록보기" class="purpleBtn" onclick="location.href='${conPath}/qna/qnaList.do'">
				</c:when>
				<c:otherwise>
					<input type="button" style="padding :0;" value="목록보기" class="purpleBtn" onclick="location.href='${conPath}/qna/qnaList.do'">
				</c:otherwise>
			</c:choose>
		</div>
		<br>
	</div>
</div>
</form>
</article>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>