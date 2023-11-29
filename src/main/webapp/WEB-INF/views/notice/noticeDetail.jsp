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
<jsp:include page="../main/header.jsp"/>
<div class="event01">
	<div class="event02">공지사항</div>
    <div class="event03">
		<div class="event04">공지</div>
		<div class="event05">${notice.ntitle}</div>
		<div class="event06"><fmt:formatDate value="${notice.nrdate}" type="date"/></div>
	</div>
	<div class="event08">
		<img src="images/notice_images/${notice.ncontent}" width="1150px"/>
	</div>
	
	<h4>${param.nid }번 글의 댓글들</h4>
	<form action="${conPath }/noticeComment/write.do">
		<input type="text" name="nid" value="${param.nid }">
		<input type="text" name="pageNum" value="${param.pageNum }">
		<input type="text" name="cname" value="${member.mname }" style="width:100px; height:50px; float:left; margin: 5px;" placeholder="글쓴이">
		<textarea rows="2" cols="5" name="cmemo" style="width:50%; height:50px; float:left; margin: 5px;"></textarea>
		<input type="submit" value="댓글저장" class="btn" style="height:50px; float:left; margin: 5px;">
	</form>
	<p style="clear:both;"></p>
	<c:if test="${empty commentList }">등록된 댓글이 없습니다</c:if>
	<c:forEach items="${commentList }" var="comment">
		<div class="reply${comment.cnum }">
			<div>
				<c:forEach var="i" begin="1" end="${comment.cindent }">
					<c:if test="${i==comment.cindent }">
			  			&nbsp; &nbsp; &nbsp; └
			  		</c:if>
					<c:if test="${i!=comment.cindent }">
			  			&nbsp; &nbsp; &nbsp; 
			  		</c:if>
				</c:forEach>
				${comment.cnum }.
				<span style="font-weight: blod; font-size: 1.3em;">${comment.cmemo }</span> 
				<i>from ${comment.cname} ${comment.cip } - at ${comment.cdate }</i>
				<span class="btn" onclick="modifyComment(${comment.cnum}, ${param.pageNum}, ${bDto.bid}, ${comPaging.currentPage})">[ 수정 ]</span>
				<span onclick="location='${conPath}/noticeComment/delete.do?cnum=${comment.cnum }&bid=${param.bid }&pageNum=${param.pageNum }&comPageNum=${comPaging.currentPage }'" class="btn">[ 삭제 ]</span>
				<span id="${comment.cnum }" class="replyView" class="btn" style="cursor: pointer;">[ 답변 ]</span>
			</div>
			<div class="replySpace${comment.cnum }"></div>
		</div>
		<br>
	</c:forEach>
	<div class="paging">
		<c:if test="${comPaging.startPage > comPaging.blockSize }">
			[ <a href="${conPath }/notice/detail.do?nid=${param.nid}&pageNum=${param.pageNum }&comPageNum=${comPaging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${comPaging.startPage }" end="${comPaging.endPage }">
			<c:if test="${i eq comPaging.currentPage }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != comPaging.currentPage }">
				[ <a href="${conPath }/notice/detail.do?nid=${param.nid}&pageNum=${param.pageNum }&comPageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/notice/detail.do?nid=${param.nid}&pageNum=${param.pageNum }&comPageNum=${comPaging.endPage+1}">다음</a> ]
		</c:if>
	</div>
	
	
	<div class="event09">
		<div class="event10">
	   		<input type="button" value="목 록" class="btn" onclick="location.href='${conPath }/notice/list.do'">
		</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>