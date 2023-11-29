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
<script>
function go_deleteNotice(nid){
		if(confirm('정말 삭제하시겠습니까?')){
			var url="${conPath }/worker/delete.do?nid=${notice.nid }&pageNum=${param.pageNum }"; 
			location.href=url;
			}
		}
</script>
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
		<img src="${conPath }/noticeImg/${notice.ncontent}" width="1150px"/>
		<div class="event-text">
        	<h3 style="text-align: center;">${notice.ntext}</h3>
    	</div>
	</div>
	
	<div class="event09">
		<div class="event10">
	   		<input type="button" value="목 록" class="btn" onclick="location.href='${conPath }/worker/list.do'">
	   		<input type="button" value="수 정" class="btn" onclick="location.href='${conPath }/worker/update.do?nid=${notice.nid }&pageNum=${param.pageNum }'">
	   		<input type="button" value="삭 제" class="btn" onclick="go_deleteNotice('${notice.nid}')">
		</div>
	</div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>