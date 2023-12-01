<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 FAQ 수정</title>
<style>
.faq{position:relaive; width:100%; height:1300px; margin:0 auto; font-family:'IBM Plex Sans KR', sans-serif;}
.faqBox{position:relative; width:900px; margin:0 auto; }
.faqBox h2{font-size:30px; text-align:center; padding:15px; border-bottom:1px dashed gray;}
.buttons{text-align:center;}
.search-wrap {position: relative;margin: 0 auto; text-alignc:center; width: 100%;max-width: 1000px;}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="faq">
	<form action="${conPath }/faqModify.do" method="post">
		<input type="hidden" name="fno" value="${faq.fno }">
			<div class="faqBox">
				 <div class="search-window">
			 	 	<div class="search-wrap"></div>
				</div>
				<h2> FAQ 게시판 </h2> 
				<table class="box1">
					<tr>
						<legend>제목
							<input type="text" name="ftitle" size="70" value="${faq.ftitle }" autofocus="autofocus">
						</legend>
					</tr>
					<tr>
						<legend>내용
							<textarea id="summernote" name="fcontent" value="${faq.fcontent }">	</textarea>			
						</legend>
					</tr>
				</table>
			</div> 
		<div class ="buttons">
			 <input type="submit" value="글쓰기" class="purpleBtn" style="border:none;"> 
	         <input type="button" value="목록가기" class="purpleBtn" style="border:none;" onclick="location.href='${conPath}/workerFaqList.do'">  
		</div>
	</form>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
	 $(document).ready(function() {
		 $('#summernote').summernote({
		        height: 300,
		        minHeight: null,
		        maxHeight: null,
		        lang : 'ko-KR',
		        onImageUpload: function(files, editor, welEditable) {
		                sendFile(files[0], editor, welEditable);
		            }
	
		    });
	 });
</script>