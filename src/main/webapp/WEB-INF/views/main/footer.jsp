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
				<a href="#">ワールド紹介</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#">利用約款</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#">個人情報方針</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#">メール</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#">リクルート</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#">サイトマップ</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		<div class="bottom">
			<div class="lotteon-banner" style="top:55px">
				<a href=""><img src="${conPath }/images/img_hotel.jpg" /></a>
			</div>
			<div class="left" style="text-align:left" >
				<p class="flogo"><img src="${conPath }/images/adventureLogo.png" width=130px></p>
				<div>
					<p><span>&nbsp;&nbsp;&nbsp;&nbsp;ソウル特別市西大門区新村路141ウィゴインビル202号講義室 / 代表者:イ·ソヨン</span></p>
					<p><span>&nbsp;&nbsp;&nbsp;&nbsp;登録番号 : 219-85-00014 | 通信販売番号 : 新村 第5513号 | 電話番号 : 1661-2000</span></p>
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

