<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 FAQ 리스트</title>
<style>
.btt{width: 50px; height: 25px; border-radius:13px; background-color: #8b00ff ; color: white; border-color: #9400D3; }
.answer {display: none;}
.submit{display:inline-block; font-size: 18px; font-weight:400; font-family:'IBM Plex Sans KR', sans-serif; background: #CCFF99; 
			border: 2px solid #fff; border-radius: 30px; padding: 14px 58px; margin-top: 40px; cursor:pointer;}
</style>
<script>
function go_search(){
	 if($('input[name="schWord"]').val() == "" ){
		alert("검색버튼 사용시에는 검색어 입력이 필수입니다");
	 	return false;
	} 
}
</script>
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
<jsp:include page="workerHeader.jsp"/>
<c:if test="${not empty faqDeleteResult }">
	<script>
		alert('삭제가 완료되었습니다.');
	</script>
</c:if>
<c:if test="${not empty faqInsertResult }">
	<script>
		alert('작성이 완료되었습니다.');
	</script>
</c:if>
<article>
<form action="${conPath }/workerFaqList.do" method="get">
<div class="page-title" style="text-align:center;">
	<div class="container">
		<h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 50px;">FAQ</h3>
	</div>
</div>
 <br><br><br>
 <div class="board-searchh">
        <div class="container">
            <div class="search-window">
                      <div class="search-wrap">
                        <label for="search" class="blind">FAQ 검색</label>
                        <input id="search" type="text" name="schWord" placeholder="FAQ 제목 및 내용을 입력하세요" value="${param.schWord}">
                        <input type="submit" class="btn btn-dark" value="검색" onClick="return go_search()">
                 		<input type="button" class="btn btn-darkkk" value="전체보기" onClick="location.href='${conPath }/workerFaqList.do'">
                 		<input type="button" class="btn btn-dark" value="추가" onClick="location.href='${conPath }/faqInsert.do'">   
                    </div>
                
            </div>
        </div>
</div>
<br>
<div id="board-list">
        <div class="container">
            <table class="board-table" style="font-size:20px; width:960px; margin:0 auto;">  
            <c:set var="i" value="1"/>
            <c:forEach items="${faqList }" var="faq">
               <tr>
					<th>${faq.fno}</th>
					<th><span onclick="Answer('answerId${i}')" name="answercontent">${faq.ftitle}
					</span></th>
					<th> 
						<button class="btt" onclick="location.href='${conPath}/faqdelete.do?fno=${faq.fno}'">삭제</button>
						<input class="btt" type="button" onclick="location.href='${conPath}/faqModify.do?fno=${faq.fno}'"  value="수정">
					</th>
				</tr>
				<tr id="answerId${i}" class="answercontent" style="display: none;"> <!-- Hidden by default -->
					<td></td>
					<th style="font-size: 18px; font-weight: normal">${faq.fcontent}</th>
				</tr>
				<c:set var="i" value="${i+1 }"/>
            </c:forEach>
            </table>
        </div>
    </div>
  </form>
</article>
<br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>