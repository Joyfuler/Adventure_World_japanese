<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アトラクションリスト</title>
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
<c:if test = "${not empty deleteResult }">
	<script>
        var confirmDelete = confirm('정말 삭제하시겠습니까?');
        if (confirmDelete) {
            alert('${deleteResult}');
        }
    </script>
</c:if>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="workerHeader.jsp"/>
<article>
<form action="${conPath }/workerAttraction/attractionListP.do" method="get">
<section class="notice">
<div class="page-title">
	<div class="container">
		<h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 50px; text-align:center;">アトラクション管理</h3>
	</div>
</div>
    <div class="board-searchh">
        <div class="container">
            <div class="search-window">
                <div class="search-wrap">
                   <label for="search" class="blind">アトラクションリスト</label>
                   <input id="search" type="text" name="schTitle" placeholder="アトラクション名を入力してください" value="${param.schTitle}">
                   <input type="submit" class="btn btn-dark" value="検索" onClick="return go_search()">
            		<input type="button" class="btn btn-darkkk" value="全体一覧" onClick="location.href='${conPath }/workerAttraction/attractionListP.do'">
            		<input type="button" class="btn btn-dark" value="追加" onClick="location.href='${conPath }/workerAttraction/insert.do'">   
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
                    <th scope="col" class="th-title">アトラクション名</th>
                    <th scope="col" class="th-date">運休日</th>
                    <th scope="col" class="th-att">修正メニュー</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${workerAttraction}" var="workerAttraction">
	                <tr>
	                    <td>${workerAttraction.aid}</td>
	                    <th  style="text-align: center;"><a href="${conPath }/workerAttraction/attractionDetail.do?aid=${workerAttraction.aid}&pageNum=${paging.currentPage}">${workerAttraction.aname} </a></th>  <!-- &schTitle=${param.schTitle} -->
	                    <td>${workerAttraction.stopday }</td>
	                    <td><a href="${conPath }/workerAttraction/update.do?aid=${workerAttraction.aid}&pageNum=${paging.currentPage}" style = "background-color: lightgray;">修正</a></td>
	                </tr>
	          	</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>
<div style="text-align: center; margin-top: 20px;">
	<c:if test="${paging.startPage>paging.blockSize}">
		[ <a href="${conPath }/workerAttraction/attractionListP.do?pageNum=${paging.startPage-1 }&schTitle=${param.schTitle}">前へ</a> ]
	</c:if>	
	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
		<c:if test="${paging.currentPage==i }"> 
			<b>[ ${i } ]</b> 
		</c:if>
		<c:if test="${paging.currentPage != i }">
			[ <a href="${conPath }/workerAttraction/attractionListP.do?pageNum=${i }&schTitle=${param.schTitle}">${i }</a> ]
		</c:if>
	</c:forEach>
	<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a href="${conPath }/workerAttraction/attractionListP.do?pageNum=${paging.endPage+1 }&schTitle=${param.schTitle}">次へ</a> ]
	</c:if>
</div>
</form>
<br>
<br><br><br><br><br><br><br>
</article>
</body>
<jsp:include page="../main/footer.jsp"/>
</html>