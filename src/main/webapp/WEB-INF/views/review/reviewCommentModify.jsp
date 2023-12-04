<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<script>
	$(document).ready(function(){
		var rid = '${comment.rid}';		
		$('.cancelBtn').click(function(){
			location.href='${conPath}/review/reviewContent.do?rid='+rid;			
		});
	});
</script>

<body>
	<br>	
		<form action="${conPath}/review/modifyComment.do" method = "post">
			<input type ="hidden" name = "rid" value = "${comment.rid }">
			<input type="hidden" name="rcid" value="${comment.rcid }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="replyPageNum" value="${param.replyPageNum}">			
			<c:forEach var="i" begin="1" end="${comment.rcindent }">
				<c:if test="${i eq comment.rcindent }">
					<b>└─${member.mname }</b>
				</c:if>
				<c:if test="${i!=comment.rcindent }">
					&nbsp; &nbsp; &nbsp;  
				</c:if>
			</c:forEach>
			<table>
				<tr>
					<td>
						댓글 수정 <br>						
					</td>
					<td>
						<textarea rows="3" cols="30" name="rccontent" style="width:500px; height:80px; float:left; margin: 5px; margin-left: 20px;" placeholder="댓글내용">${comment.rccontent }</textarea>
					</td>
				</tr>		
			</table>
			<input type ="submit" value="수정" class="btn" style="margin: 5px;">
			<input type ="button" value = "취소" class = "cancelBtn btn">
		</form>	
	<p style="clear:both;"></p>
	<br>
</body>
</html>