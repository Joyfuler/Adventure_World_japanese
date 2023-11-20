<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>World</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="${conPath }/script/script.js"></script>
<script src="${conPath }/script/event02.js"></script>  
<script src="${conPath }/script/member.js"></script>
<link href="${conPath }/css/world.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div id="wrap">
	<header>
		<div id ="top_menu">
			<ul>
				<c:choose>
					<c:when test ="${empty member}">						
						<li><a href="${conPath }/loginMember.do">login</a></li>
						<li><a href="${conPath }/joinMember.do">회원가입</a></li>
						<li><a href="/admin">관리자</a></li>
						<li><a href="${conPath }/main.do">HOME</a></li>
						
					</c:when>
					<c:otherwise>						
						<li>
						<div class="dropdown" style="width:100px; font-size:85%;">
							<button class="dropbtn" 
									style=" width:100px;
											padding:0 0 5px 0; 
											float:right;
											background:#f7f7f7;
											"> 
								<span style="display:block; height:15px;  
								font-family:'IBM Plex Sans KR', sans-serif;
								padding: 0 ;
								font-size:80%;  color:gray; ">마이페이지</span>
							</button>
							<div class="dropdown-content" style="min-width:90px;">
								<a href="cartList?first=y">장바구니</a>
								<a href="orderList?first=y">주문내역</a>
							</div>
						</div>
						</li> 
						<li><a href="${conpath }/logout.do">logout</a></li>
						<li><a href="editForm">정보수정</a></li>
						<li><a href="${conPath }/main.do">HOME</a></li>
						<li>${member.mname}(${member.mid})</li>
						
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div id="sub_menu">
			<div class="logo">
				<a href="${conPath }/main.do">
					<img src="${conPath }/images/adventureLogo.png" width="250px">
				</a>
			</div>
			<div class="category">
				<div class="dropdown">
					<button class="dropbtn"> 
						<span>즐길거리</span>
					</button>
					<div class="dropdown-content">
						<a href="/attractionForm">어트랙션</a>
						<a href="/parade">퍼레이드</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn"> 
						<span>예매하기</span>
					</button>
					<div class="dropdown-content">
			        	<a href="reserve">예매</a>
			        	<a href="${conPath }/event.do">이달의 혜택</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn"> 
						<span>이용가이드</span>
					</button>
					<div class="dropdown-content">
						<a href="guide">운영/운휴</a>
						<a href="howCome">오시는 길</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn"> 
						<span>소통서비스</span>
				    </button>
				    <div class="dropdown-content">
						<a href="notice?first=y">공지사항</a>
						<a href="qna?first=y">Q&amp;A</a>
				    </div>
				</div>
			</div>
		</div>		
	</header>
</div>