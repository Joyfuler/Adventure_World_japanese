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
				<c:if test ="${empty member and empty worker}">						
						<li><a href="${conPath }/member/loginMember.do">login</a></li>
						<li><a href="${conPath }/member/joinMember.do">会員登録</a></li>
						<li><a href="${conPath }/worker/workerLoginForm.do">管理者ログイン</a></li>
						<li><a href="${conPath }/main.do">ホーム</a></li>						
				</c:if>
				<c:if test = "${not empty member and empty worker}">						
						<li>
						<div class="dropdown" style="width:100px; font-size:85%;">
							<button class="dropbtn" style=" width:100px;
											padding:0 0 5px 0; 
											float:right;
											background:#f7f7f7;"> 
								<span style="display:block; height:15px; font-family:'IBM Plex Sans KR', sans-serif;
								padding: 0; font-size:80%;  color:gray;">マイページ</span>
							</button>
							<div class="dropdown-content" style="min-width:90px;">
								<a href="${conPath }/cart/list.do?mid=${member.mid}">カート</a>
								<a href="${conPath }/order/orderList.do?mid=${member.mid }">注文履歴</a>
							</div>
						</div>
						</li>
						<li><a href="${conPath }/member/logout.do">ログアウト</a></li>
						<li><a href="${conPath }/member/modify.do">個人情報修正</a></li>
						<li><a href="${conPath }/main.do">HOME</a></li>
						<li>${member.mname}(${member.mid})</li>
						<li>point: ${member.mpoint }</li>
				</c:if>
				<c:if test = "${not empty worker and empty member}">						
						<li>
						<div class="dropdown" style="width:100px; font-size:85%;">
							<button class="dropbtn" style=" width:100px;
											padding:0 0 5px 0; 
											float:right;
											background:#f7f7f7;"> 
								<span style="display:block; height:15px; font-family:'IBM Plex Sans KR', sans-serif;
								padding: 0; font-size:80%;  color:gray;">マイページ</span>
							</button>
							<div class="dropdown-content" style="min-width:90px;">
								<a href="${conPath }/cart/list.do?mid=${member.mid}">カート</a>
								<a href="${conPath }/order/orderList.do?mid=${member.mid}">注文履歴</a>
							</div>
						</div>
						</li>
						<li><a href="${conPath }/worker/logout.do">logout</a></li>
						<li><a href="${conPath }/worker/workerMain.do" style = "color:blue;">管理者モード</a></li>
						<li>${worker.wname}(${worker.wid})</li>
				</c:if>
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
						<span style = "font-weight:bold;">施設紹介</span>
					</button>
					<div class="dropdown-content">
						<a href="${conPath }/attraction/attractionList.do">アトラクション</a>
						<a href="${conPath }/paradeList.do">公演・パレード</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn"> 
						<span style = "font-size: 0.95em; font-weight:bold;">予約ページ</span>
					</button>
					<div class="dropdown-content">
			        	<a href="${conPath }/cart/reserve.do">チケット予約</a>
			        	<a href="${conPath }/event.do">今月のイベント</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn"> 
						<span style = "font-weight:bold;">ご利用の案内</span>
					</button>
					<div class="dropdown-content">
						<a href="${conPath }/attraction/stopdayInfo.do">休日案内</a>
						<a href="${conPath }/howCome.do">アクセスガイド</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn"> 
						<span style = "font-weight:bold;">コミュニティ</span>
				    </button>
				    <div class="dropdown-content">
						<a href="${conPath }/notice/list.do">お知らせ</a>
						<a href="${conPath }/faqList.do">よくあるご質問</a>
						<a href="${conPath }/lostItemList.do">紛失届</a>
				    </div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" onclick = "location.href='${conPath}/review/reviewList.do'"> 
						<span style = "font-size: 0.95em; font-weight:bold;">レビュー</span>
					</button>
					
				</div>
			</div>
		</div>		
	</header>
</div>