<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<article>
<jsp:include page="../main/header.jsp"/>
<div class="qna">
	<div class="qnaimg" style="background-image:url('images/qnaaa.png');"></div>
	<div class="qnaBox">
		<h2>QnA 게시판</h2>
		<h3>고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>
		<form class="fix02">
	    	<table class="fix03">
				<tr>
					<th>제목</th>
					<td width="500" style="text-align:left;">${Qna.qtitle}</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td align="left" style="text-align:left;">
					<fmt:formatDate value="${Qna.qrdate}" type="date"/>
					</td>
				</tr>
				<tr>
					<th>질문내용</th>
					<td align="left" style="text-align:left;">${Qna.qcontent}</td>
				</tr>
				<tr>
					<th>답변 내용</th>
					<td align="left" style="text-align:left;">${Qna.reply}</td>
				</tr>						
			</table>
		</form>
		<br>
		<div class="buttons">
			<input type="button"  value="목록보기" class="purpleBtn" style="border:none;"
				onclick="location.href='${conPath}/qna/qnaList.do?pageNum=${param.pageNum}'">
			<input type="button"  value="돌아가기"  class="purpleBtn" style="border:none;"
				onclick="history.back()">
			<c:if test="${not empty worker }">
  				<input type="submit"  value="답변달기"  class="purpleBtn" style="border:none;">
		    </c:if>
		</div>
		<br>
	</div>
</div>
</article>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>