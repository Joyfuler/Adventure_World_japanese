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
<form action="${conPath }/noticeComment/reply.do">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="comPageNum" value="${empty param.commentPageNum? '1':param.commentPageNum}">
		<input type="hidden" name="cnum" value="${param.cnum}">
		<input type="hidden" name="nid" value="${comment.nid}">
		<input type="hidden" name="cgroup" value="${comment.cgroup}">
		<input type="hidden" name="cstep" value="${comment.cstep}">
		<input type="hidden" name="cindent" value="${comment.cindent}">
		<input type="text" name="cname" value="${member.mname }" style="width:100px; height:50px; float:left; margin: 5px;" placeholder="글쓴이"  required="required">
		<textarea rows="2" cols="5" name="cmemo" style="width:50%; height:50px; float:left; margin: 5px;" placeholder="댓글내용"  required="required"></textarea>
		<input type="submit" value="댓글저장" class="btn" style="height:50px; float:left; margin: 5px;">
	</form>
	<p style="clear:both;"></p>
</body>
</html>