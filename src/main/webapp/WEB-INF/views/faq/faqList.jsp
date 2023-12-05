<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 리스트</title>
<link href="${conPath }/css/world.css" rel="stylesheet">
<style>
.answer {display: none;}
.submit{display:inline-block; font-size: 18px; font-weight:400; font-family:'IBM Plex Sans KR', sans-serif; background: #CCFF99; 
			border: 2px solid #fff; border-radius: 30px; padding: 14px 58px; margin-top: 40px; cursor:pointer;}
</style>
<script>
function Answer(answerId) {
    var answer = document.getElementById(answerId);
    var answercontent = document.getElementsByTagName("answercontent")
    
    if (answercontent !== null) {
        if (answer.style.display === "none" || answer.style.display === "") {
            answer.style.display = "table-row";
        } else {
            answer.style.display = "none";
        }
    }
}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<article>
	<div class="page-title" style="text-align:center;">
		<div class="container">
			<h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 50px;">FAQ</h3>
		</div>
	</div>
	<div style="position: relative; text-align: center;">
	  <img src="${conPath }/images/qna_image.jpg" style="opacity: 0.5;">
	  <div style="position: absolute; top: 35%; left: 50%; transform: translate(-50%, -50%);">
	    <p style="font-size: 24px; color: white;">
	    <h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 30px; padding-top: 50px;"> 더 궁금하신 사항이 있으면 <br>이용문의를 이용하시기 바랍니다.</h3>
		<div id="buttons" style="float:center">
			<input type="button" value="이용문의" class="submit" onclick="location.href='${conPath}/qna/qnaList.do?first=y'">
		</div>	
	 </div>
 	<br><br><br>
	 <div id="board-search">
	        <div class="container">
	            <div class="search-window">	 		
				</div>
			</div>
	</div>
	<br>
	</div><br><br>
	<div id="board-list">
	        <div class="container">
	            <table class="board-table" style="font-size:20px; width:960px; margin:0 auto;">  
	            <c:set var="i" value="1"/>
	            <c:forEach items="${faqList }" var="faq">
	               <tr>
						<td>
							<img src="${conPath}/images/Q.jpg" style="width: 60px; height: 55px; border-radius: 50%; border: 1px solid blue;">
						</td>
						<th>
							<span onclick="Answer('answerId${i}')" name="answercontent">${faq.ftitle}
							</span>
						</th>
					</tr>
					<tr id="answerId${i}" class="answercontent" style="display: none;"> <!-- Hidden by default -->
						<td></td>
						<th style="font-size: 18px; font-weight: normal">
							${faq.fcontent}
						</th>
					</tr>
					<c:set var="i" value="${i+1 }"/>
	            </c:forEach>
	            </table>
	        </div>
	  </div>
</article>
<br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>