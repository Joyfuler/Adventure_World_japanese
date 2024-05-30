<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>어트랙션 목록</title>
<style>
.search-container {
	display: none;
	text-align: center; 
	border: 1px solid silver;
}

#att_search{
cursor: pointer;
}

#att_search:after{
	content: "▼";
	margin-left: 5px;
}

#att_search.opened:after {
content: "▲";
}
</style>
<link href = "${conPath }/css/attraction.css" rel = "stylesheet">	
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>	
<body>
<script>
	$(document).ready(function(){
		var scrollPosition = sessionStorage.getItem("scrollPosition") || 0;
	
		$(document).on("click", ".searchApply",function(){
			scrollPosition = $(window).scrollTop();
			sessionStorage.setItem("scrollPosition", scrollPosition);
		});		
			
			$(window).scrollTop(scrollPosition);
		});	
</script>
<jsp:include page="../main/header.jsp"/>
<div style="clear: both;"></div>
<article>
<div class="attractionForm">
	<div class="att_title_img">
    	<h1 id="att_title_text">アトラクション</h1>
    	<h1 id="att_title_exp">いつも楽しく、新しい経験を！アドベンチャーワールドのアトラクションをご紹介いたします。</h1>
	</div>
	<div id="att_search" onclick = "toggleSearch()">検索</div>	
		<br>		
	<!-- 검색 영역 -->
		<div class = "search-container" id = "searchContainer">
			<form action = "${conPath }/attraction/searchAttractionList.do">	
			<label for = "attraction" style = "color: ghostwhite;"> タグで検索</label>
			<br><br>
			タグ１検索 &nbsp;&nbsp;&nbsp;
			<select id = "tag1" name = "tag1">	
				<option value = "">タグ１ </option>
				<c:forEach var = "tag1s" items= "${tag1List }">			
					<option value = "${tag1s.tag1 }" style = "padding-left:20px;"
					<c:if test = "${param.tag1 eq tag1s.tag1}">
						selected = "selected"
					</c:if>
					> ${tag1s.tag1 }
					</option>        
        		</c:forEach>        
			</select>	
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			タグ２検索 &nbsp;&nbsp;&nbsp;
			<select id = "tag2" name = "tag2"> 
				<option value ="">タグ２</option>
				<c:forEach var = "tag2s" items = "${tag2List }">
					<option value = "${tag2s.tag2 }" style = "padding-left: 20px;"
					<c:if test = "${param.tag2 eq tag2s.tag2 }">			
						selected = "selected"
					</c:if>
					>${tag2s.tag2 }
					</option>
					<br>
				</c:forEach>
			</select>
			<br><br>	
			<input type = "submit" class = "searchApply" value = "適用">
			<input type = "button" class = "searchApply" value = "初期化" onclick = "location.href='${conPath}/attraction/attractionList.do'">		
			<br><br>			
		</form>			
	</div>
	<div class="att_back">
		<c:if test = "${empty searchOk }">
			<c:forEach var="attractions" items="${attractionList}">
				<div id="att_list">
					<a href="${conPath }/attraction/attractionDetail.do?aid=${attractions.aid }">
						<img src="${conPath }/images/attraction_images/${attractions.aimage}"/>
						<h3>${attractions.aname}</h3>					
					</a>
				</div>
			</c:forEach>
		</c:if>
		<c:if test = "${not empty searchOk }">
			<c:if test = "${searchAttractionList.size() eq 0 }">
				<h3 style = "text-align: center;">検索結果：０件</h3>
			</c:if>
			<c:forEach var = "searchAttractions" items = "${searchAttractionList }">
				<div id="att_list">				
					<c:if test = "${not empty searchAttractions }">
						<a href="${conPath }/attraction/attractionDetail.do?aid=${searchAttractions.aid }">
						<img src="${conPath }/images/attraction_images/${searchAttractions.aimage}"/>
						<h3>${searchAttractions.aname}</h3>										
						</a>
					</c:if>
				</div>
			</c:forEach>
		</c:if>		
	</div>
</div>
</article>
<jsp:include page="../main/footer.jsp"/>
<script>
	function toggleSearch(){
		var searchContainer = $("#searchContainer");
		var attSearch = $("#att_search");		
		searchContainer.toggle("fast", function(){
			attSearch.toggleClass("opened", searchContainer.is(":visible"));			
		});
	}
</script>
</body>
</html>