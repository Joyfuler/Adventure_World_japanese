<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNAのリプライ修正</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
	input, button, select, textarea{
	line-height: 0px !important;
	}
</style>
</head>
<body>
<article>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="workerHeader.jsp"/>
	<form action="${conPath}/worker/workerQnamodify.do" method="post">	
		<input type="hidden" name="qno" value="${Qna.qno}">
		<input type="hidden" name = "pageNum" value="${param.pageNum }">
		<input type="hidden" name="mid" value="${Qna.mid}">
		<input type = "hidden" name = "qtitle" value = "${Qna.qtitle }">
		<input type = "hidden" name = "qcontent" value = "${Qna.qcontent }">
		<input type = "hidden" name = "qpw" value = "${Qna.qpw }">
		<input type = "hidden" name = "qpwchk" value = "${Qna.qpwchk }">
		<input type = "hidden" name = "qgroup" value = "${Qna.qgroup }">
		<div class="qna">
			<div class="qnaimg" style="background-image:url('${conPath}/images/qna1.png');"></div>
			<div class="qnaBox">
				<h2> よくあるご質問 </h2>
				<h5 style = "font-weight: bold; text-align: center;">アドベンチャーワールドに関するお問い合わせに誠心誠意お答えいたします</h5>
				<div class="fix02">
					<table class="fix03">
						<tr>
							<th>タイトル</th>
							<td>${Qna.qtitle}</td>
						</tr>
						<tr>
							<th>登録日時</th>
							<td><fmt:formatDate value="${Qna.qrdate}" type="date"/></td>
						</tr>
						<tr>
							<th>内容</th>
							<td>${Qna.qcontent}</td>
						</tr>
						<tr>		
			    			<th>リプライ</th>
			    			<td colspan="2"><textarea id="summernote" name="reply" rows="2" cols="45">${Qna.reply }</textarea>
						</tr>	
					</table>
				</div>
				<br>
				<div class="buttons" style="height:70px;" >
				<input type="submit" style="padding :0;" class="purpleBtn" value="セーブ">
				<input type="button" style="padding :0;" value="一覧へ" class="purpleBtn" onclick="location.href='${conPath}/worker/workerQnaList.do?pageNum=${param.pageNum }'">
				<input type="button" style="padding :0;" value="削除" class="purpleBtn" onclick="location.href='${conPath}/worker/workerQnadelete.do?pageNum=${param.pageNum }&qno=${Qna.qno}'">
				<c:if test="${Qna.isreply =='Y'}">
					<input type="button" style="padding :0;" value="修正" class="purpleBtn" onclick="location.href='${conPath}/worker/workerQnaDetail.do?pageNum=${param.pageNum }&qno=${Qna.qno}'">
				</c:if>
				</div>
				<br>
			</div>
		</div>
	</form>
</article>
<jsp:include page="../main/footer.jsp"/>
</body>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
 $(document).ready(function() {
	 $('#summernote').summernote({
	        height: 150,
	        minHeight: null,
	        maxHeight: null,
	        lang : 'ko-KR',
	        onImageUpload: function(files, editor, welEditable) {
	                sendFile(files[0], editor, welEditable);
	            }
	    });
 });
</script>
</html>