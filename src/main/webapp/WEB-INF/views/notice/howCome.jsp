<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>오시는 길</title>
<style>
h2 {font-family:'IBM Plex Sans KR', sans-serif; font-size: 50px; text-align: center; padding-top: 40px;}
.image-box {text-align:center;}
.image-box img {}
.button-box {display: flex; justify-content: center; align-items: center;}
.submit{position:relative; font-size:20px; width:220px; height:56px; color: rgb(111, 35, 249); background:white; 
	font-weight:600; border-radius:28px; border:2px solid #6317ed; text-align:center; font-family:'IBM Plex Sans KR', sans-serif;}
.submit:hover{
background-color:#6317ed; color: white;}	  
.location {display: flex;align-items: center;font-size: 20px;}
.location img {margin-right: 10px;}
</style>
<script>
  function goToNaverMap() {
	 window.open("https://naver.me/5uxi4HBH", "_blank");
  }
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="page-title" style = "text-align: center; font-weight: bold;">
	<div class="container" style = "background-color: #5c10e6; color: white;">
		<h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 50px; text-align:center;">Adventure World 오시는 길</h3>		
	</div>
	<br><br>
	<span>
	주소: 서울 서대문구 신촌로 141 위고인빌딩 2층 <br>
	(지번) 대현동 104-48 <br>
	연락처: 02-393-4321
	</span>	
</div>

<div id="daumRoughmapContainer1700551576844" 
class="root_daum_roughmap root_daum_roughmap_landing"
style = "margin: 0 auto;"></div>

<script charset="UTF-8" 
class="daum_roughmap_loader_script" 
src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1700551576844" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1700551576844",
		"key" : "2gws2",
		"mapWidth" : "1200",
		"mapHeight" : "900"
	}).render();
</script>
<br><br>
  <div class="button-box">
    <input type="button" value="네이버 지도로 확인" class="submit" onClick="goToNaverMap()" style = "cursor:pointer;">
  </div><br><br><br>
        <div class="container">
            <table class="board-table" style="font-size:20px"> 
				<tr>
        			<td>
          				<div class="location">
            				<img src="images/loca.png">            					
            					<h4>이젠아카데미 Adventure World (서울 서대문구 신촌로 141)</h4><br><br>      
          				</div>
        			</td>
      			</tr>	
      		</table>
      	</div>

<br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
