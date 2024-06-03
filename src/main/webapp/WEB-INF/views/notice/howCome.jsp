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
		<h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 50px; text-align:center;">Adventure World アクセスガイド</h3>		
	</div>
	<br><br>
	<span>
	住所： 〒649-2201 和歌山県西牟婁郡白浜町堅田2399番地 <br>
	連絡先： 0570-06-4481（代表）
	</span><br><br>	
	<iframe src="https://www.google.com/maps/embed?pb=!1m13!1m8!1m3!1d3320.5804628712604!2d135.376294!3d33.668031!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMzPCsDQwJzA0LjIiTiAxMzXCsDIyJzMzLjYiRQ!5e0!3m2!1sko!2sus!4v1717388692311!5m2!1sko!2sus" width="900" height="600" style="border:0; text-align:center; margin: 0 auto;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
	</iframe>
</div>
<br><br>
  <div class="button-box">
    <input type="button" value="NaverMapで確認" class="submit" onClick="goToNaverMap()" style = "cursor:pointer;">
  </div><br><br><br>
        <div class="container">
            <table class="board-table" style="font-size:20px"> 
				<tr>
        			<td>
          				<div class="location">
            				<img src="images/loca.png">            					
            					<h4>Adventure World（和歌山県西牟婁郡白浜町堅田2399番地）</h4><br><br>      
          				</div>
        			</td>
      			</tr>	
      		</table>
      	</div>

<br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
