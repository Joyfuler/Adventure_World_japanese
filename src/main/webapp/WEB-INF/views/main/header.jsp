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
						<li><a href="${conPath }/member/loginMember.do">login</a></li>
						<li><a href="${conPath }/member/joinMember.do">회원가입</a></li>
						<li><a href="${conPath }/worker/workerLoginForm.do">관리자</a></li>
						<li><a href="${conPath }/main.do">HOME</a></li>						
					</c:when>
					<c:otherwise>						
						<li>
						<div class="dropdown" style="width:100px; font-size:85%;">
							<button class="dropbtn" style=" width:100px;
											padding:0 0 5px 0; 
											float:right;
											background:#f7f7f7;"> 
								<span style="display:block; height:15px; font-family:'IBM Plex Sans KR', sans-serif;
								padding: 0; font-size:80%;  color:gray;">마이페이지</span>
							</button>
							<div class="dropdown-content" style="min-width:90px;">
								<a href="cart/list.do">장바구니</a>
								<a href="orderList?first=y">주문내역</a>
							</div>
						</div>
						</li> 
						<li><a href="${conPath }/member/logout.do">logout</a></li>
						<li><a href="${conPath }/member/modify.do">정보수정</a></li>
						<li><a href="${conPath }/main.do">HOME</a></li>
						<li>${member.mname}(${member.mid})</li>
						
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div id="sub_menu">
			<div class="logo">
				<a href="${conPath }/main.do">
					<img src="${conPath }/images/adventureLogo.png" width="240px">
				</a>
			</div>
			<div class="category">
				<div class="dropdown">
					<button class="dropbtn"> 
						<span>즐길거리</span>
					</button>
					<div class="dropdown-content">
						<a href="${conPath }/attraction/attractionList.do">어트랙션</a>
						<a href="${conPath }/paradeList.do">퍼레이드</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn"> 
						<span style = "font-size: 0.95em;">예매 / 이벤트</span>
					</button>
					<div class="dropdown-content">
			        	<a href="${conPath }/cart/reserve.do">예매</a>
			        	<a href="${conPath }/event.do">이달의 혜택</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn"> 
						<span>이용가이드</span>
					</button>
					<div class="dropdown-content">
						<a href="${conPath }/attraction/stopdayInfo.do">운영/운휴</a>
						<a href="${conPath }/howCome.do">오시는 길</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn"> 
						<span>커뮤니티</span>
				    </button>
				    <div class="dropdown-content">
						<a href="notice?first=y">공지사항</a>
						<a href="qna?first=y">Q&amp;A</a>
				    </div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" onclick = "location.href='${conPath}/review/reviewList.do'"> 
						<span style = "font-size: 0.95em;">리뷰</span>
					</button>
					
				</div>
			</div>
		</div>		
	</header>
</div>