<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>World</title>
</head>
<body>    
<footer>
<div id="footer">
	<div class="container">
		<div class="top">	
			<div class="links">
				<br>	
				<a href="#">월드 소개</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#">이용약관</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#">개인정보처리방침</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#">이메일무단수집거부</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#">인재채용</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#">사이트맵</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		<div class="bottom">
			<div class="lotteon-banner" style="top:55px">
				<a href=""><img src="${conPath }/images/img_hotel.jpg" /></a>
			</div>
			<div class="left" style="text-align:left" >
				<p class="flogo"><img src="${conPath }/images/adventureLogo.png" width=130px></p>
				<div>
					<p><span>&nbsp;&nbsp;&nbsp;&nbsp;서울특별시 서대문구 신촌로 141 위고인빌딩 202호 강의실 | 대표자 : 이소영 </span></p>
					<p><span>&nbsp;&nbsp;&nbsp;&nbsp;사업자등록번호 : 219-85-00014 | 통신판매업신고번호 : 신촌 제5513호 | 전화 : 1661-2000</span></p>
					<p class="copyright">&nbsp;&nbsp;&nbsp;&nbsp;COPYRIGHT 2023 EZEN AC. ALL RIGHTS RESERVED.</p>
				</div>
			</div>
			<div class="isms">
				<img src="${conPath }/images/footer_footer.png"/>
			</div>
			<div class="sns" style="top:5px">
				<a href="https://facebook.com"><img src="${conPath }/images/facebook.png"/></a>
				<a href="https://www.instagram.com"><img src="${conPath }/images/instar.png"/></a>
				<a href="https://www.youtube.com"><img src="${conPath }/images/youtube.png"/></a>
			</div>
		</div>
		<br><br><br>
	</div>
</div>
</footer>
</body>
</html>

