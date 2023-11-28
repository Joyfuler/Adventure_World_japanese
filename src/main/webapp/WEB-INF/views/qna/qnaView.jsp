<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.qnaBox{margin-bottom: 300px;}
.qnaimg{
width: 700px;
font-family: AppleSDGothicNeo-Regular, 'Malgun Gothic', '맑은 고딕', dotum, '돋움', sans-serif;
  -webkit-font-smoothing: antialiased;
font-size: 16px;
letter-spacing: -0.6px;
-webkit-text-size-adjust: 100%;
line-height: 1;
margin: 0;
padding: 42px 50px 35px;
border: 1px solid #e4e4e4;
background: #f9f9f9 url('${conPath}/images/roler2.jpg') no-repeat right bottom;
color: #000;
}
</style>
</head>
<body>
<article>
<jsp:include page="../main/header.jsp"/>
<div class="qna">
	<div class="qnaimg" style="background-image:url('${conPath}/images/qna1.png');"></div>
	<div class="qnaBox">
		<h2>QnA 게시판</h2>
		<h3>고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>
		<form class="fix02">
		<input type="hidden" name ="pageNum" value="${param.pageNum }">
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
				<c:if test="${Qna. isreply =='Y' }">
					<th>답변내용</th>
					<td align="left" style="text-align:left;">${Qna.reply}</td>
				</c:if>
				</tr>						
			</table>
		</form>
		<br>
		<div class="buttons">
			<input type="button"  value="목록보기" class="purpleBtn" style="border:none;"
				onclick="location.href='${conPath}/qna/qnaList.do?pageNum=${param.pageNum}'">
			<input type="button"  value="돌아가기"  class="purpleBtn" style="border:none;"
				onclick="history.back()">
		</div>
		<br>
	</div>
</div>
</article>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>