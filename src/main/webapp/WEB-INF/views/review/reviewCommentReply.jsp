<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
	form#reply {margin-left: 30px;}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script>
	$(document).ready(function(){
		$('.notMemberSubmit').on("click",function(){
			alert('먼저 로그인하셔야 합니다.');
			location.href = "${conPath}/member/loginMember.do?next=review/reviewContent.do?rid=${param.rid}";
		});
		
		$('.submitChk').on("click",function(){
			var comment = $('textarea[name="rccontent"]').val().trim();
			if (comment == ''){
				alert('댓글 내용을 확인해주세요.');
			} else if (comment.length <= 10){
				alert('댓글 내용은 10글자 이상으로 작성해주세요.');			
			} else {
				$('form#reply').submit();
			}
		});
	});
</script>

<body>
	<form action = "${conPath }/review/reviewCommentReply.do" id = "reply" method = "get">
		<table>
			<tr>
				<td>
					<input type = "hidden" name = "replyPageNum" value = "${empty param.replyPageNum? '1':param.replyPageNum }">					
				</td>
				<td>	
					<input type = "hidden" name = "rid" value = "${param.rid }" placeholder = "리뷰아이디">					
					<input type = "hidden" name = "mid" value = "${member.mid }" placeholder="멤버id">
					<input type = "hidden" name = "rcgroup" value = "${originalCommentInfo.rcgroup }">
					<input type = "hidden" name = "rcstep" value = "${originalCommentInfo.rcstep }"> 
					<input type = "hidden" name = "rcindent" value = "${originalCommentInfo.rcindent }">									
				</td>
			</tr>
			<tr>
				<td>					
					대댓글 달기<br>
					<b>${member.mname }</b>
				</td>
				<td>				
					<textarea rows="3" cols="30" name="rccontent" style="width:500px; height:80px; float:left; margin: 5px; margin-left: 20px;" placeholder="댓글내용"></textarea>
				</td>
				<td>	
					<c:if test = "${not empty member }">
						<input type="button" value="작성하기" class = "submitChk">
					</c:if>					
					<c:if test = "${empty member }">
						<input type = "button" value = "작성하기" class = "notMemberSubmit">
					</c:if>								
				</td>
			</tr>		
		</table>	
	</form>
	<p style="clear:both;"></p>	
</body>
</html>