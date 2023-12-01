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
<style>
#plusebtn{position: absolute; right:45px; bottom:15px;  }
#btn2{width:110px; background: #555;color: #fff; font-size: 25px;}
</style>
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<script>
function go_search(){
	 if($('input[name="key"]').val() == "" ){
		alert("검색버튼 사용시에는 검색어 입력이 필수입니다");
	 	return false;
	} 
}
</script>
<body>
<jsp:include page="../main/header.jsp"/>
<article>
<form action="${conPath }/notice/list.do" method="post">
<section class="notice">
<div class="page-title">
	<div class="container">
		<h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 50px; text-align:center;">공지사항</h3>
	</div>
</div>
    <div class="board-searchh">
        <div class="container">
            <div class="search-window">
                 <div class="search-wrap">
                   <label for="search" class="blind"> 공지사항검색</label>
                   <input id="search" type="text" name="schTitle" placeholder="검색어를 입력해주세요." value="${param.schTitle}">
                   <input type="submit" class="btn btn-dark" value="검색" onClick="return go_search()">
            		<input type="button" class="btn btn-darkkk" value="전체보기" onClick="location.href='${conPath }/notice/list.do'"></button>  
               	</div>
            </div>
        </div>
    </div>
    <div class="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${notice}" var="notice">
	                <tr>
	                    <td>${notice.nid}</td>
	                    <th style="text-align: center;">
	                    	<a href="${conPath }/notice/detail.do?nid=${notice.nid}&pageNum=${paging.currentPage}">${notice.ntitle}</a>
	                    </th>  <!-- &schTitle=${param.schTitle} -->
	                    <td><fmt:formatDate value="${notice.nrdate}" type="date"/></td>
	                </tr>
	          	</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>
<div style="text-align: center; margin-top: 20px;">
	<c:if test="${paging.startPage>paging.blockSize}">
		[ <a href="${conPath }/notice/list.do?pageNum=${paging.startPage-1 }&schTitle=${param.schWord}">이전</a> ]
	</c:if>	
	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
		<c:if test="${paging.currentPage==i }"> 
			<b>[ ${i } ]</b> 
		</c:if>
		<c:if test="${paging.currentPage != i }">
			[ <a href="${conPath }/notice/list.do?pageNum=${i }&schTitle=${param.schWord}">${i }</a> ]
		</c:if>
	</c:forEach>
	<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a href="${conPath }/notice/list.do?pageNum=${paging.endPage+1 }&schTitle=${param.schWord}">다음</a> ]
	</c:if>
</div>
</form>
<br>
<br><br><br><br><br><br><br>
</article>
</body>
<jsp:include page="../main/footer.jsp"/>
</html>