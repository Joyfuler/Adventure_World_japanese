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
		alert("検索ワードを入力してください");
	 	return false;
	} 
}
</script>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="workerHeader.jsp"/>
<article>
<form action="${conPath }/worker/list.do" method="post">
<section class="notice">
<div class="page-title">
	<div class="container">
		<h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 50px; text-align:center;">お知らせ一覧</h3>
	</div>
</div>
    <div class="board-searchh">
        <div class="container">
            <div class="search-window">
                <div class="search-wrap">
                    <label for="search" class="blind"> お知らせを検索</label>
                    <input id="search" type="text" name="schTitle" placeholder="検索ワードを入力" value="${param.schTitle}">
                    <input type="submit" class="btn btn-dark" value="検索" onClick="return go_search()">
             		<input type="button" class="btn btn-darkkk" value="一覧" onClick="location.href='${conPath }/worker/list.do'">
             		<input type="button" class="btn btn-dark" value="追加" onClick="location.href='${conPath }/worker/insert.do'">   
                </div>
            </div>
        </div>
    </div>
    <div class="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">番号</th>
                    <th scope="col" class="th-title">タイトル</th>
                    <th scope="col" class="th-date">登録日付</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${notice}" var="notice">
	                <tr>
	                    <td>${notice.nid}</td>
	                    <th style="text-align: center;"><a href="${conPath }/worker/detail.do?nid=${notice.nid}&pageNum=${paging.currentPage}">${notice.ntitle}</a></th>  <!-- &schTitle=${param.schTitle} -->
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
		[ <a href="${conPath }/worker/list.do?pageNum=${paging.startPage-1 }&schTitle=${param.schWord}">前へ</a> ]
	</c:if>	
	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
		<c:if test="${paging.currentPage==i }"> 
			<b>[ ${i } ]</b> 
		</c:if>
		<c:if test="${paging.currentPage != i }">
			[ <a href="${conPath }/worker/list.do?pageNum=${i }&schTitle=${param.schWord}">${i }</a> ]
		</c:if>
	</c:forEach>
	<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a href="${conPath }/worker/list.do?pageNum=${paging.endPage+1 }&schTitle=${param.schWord}">次へ</a> ]
	</c:if>
</div>
</form>
<br>
<br><br><br><br><br><br><br>
</article>
</body>
<jsp:include page="../main/footer.jsp"/>
</html>