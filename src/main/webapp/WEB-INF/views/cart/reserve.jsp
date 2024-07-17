<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매</title>
<link href="${conPath }/css/order.css" rel="stylesheet">
<script src="${conPath }/js/order.js"></script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<article>
<div class="reserve">
	<div class="order_box">
		<div class="order_box_select">
			<div class="order_box_title">チケット予約</div>
			<div class="order_box_text">
				<img src="${conPath }/images/ticket_images/reserve_imgs_free.png"/>
				<div class="order_box_text_content">★フリーパス★<br>
					<p style="line-height:23px; font-size:16px;">						
						大人 5,500円<br>
						小人 4,500円<br><br>				
					</p>
					<!-- mid 수정해야함 -->
					<input type="button" value="予約する" class="order_box_text_button" 
						onclick="location.href='${conPath}/cart/passTicket.do?type=0&mid=${member.mid }'">
				</div>
			</div>
			<div class="order_box_text">
				<img src="${conPath }/images/ticket_images/reserve_imgs_pass.png"/>
				<div class="order_box_text_content">★ファストパス★<br>
					<p style="line-height:23px; font-size:16px;">
						大人 12,000円<br>
						小人 9,000円<br><br>					
					</p>
					<!-- mid 수정해야함 -->
					<input type="button" value="予約する" class="order_box_text_button" 
						onclick="location.href='${conPath}/cart/fastTicket.do?type=1&mid=${member.mid }' ">
				</div>
			</div>
		</div>
		<div class="order_box_content">
			<ul class="barList">
				<li>- アドベンチャー／マジック・アイランドの入場、及びアトラクション一の利用が可能です<br>
				(ゲーム施設などの有料施設を除く）</li>
				<li>- 博物館を無料で観覧できます（午後7時まで入場が必要）</li>
				<li>- ファストパスをご利用の場合は、予約時間の10分前までに入場をお願い致します。</li>
			</ul>
		</div>
	</div>
	<div class="reserveBack">&nbsp;</div>
	<div class="bigBox1">
		<div class="bigBox5">
			<ul style="text-size:130%;">
				<h2>注意事項</h2>
				<li>
					<span style="font-weight:bold;">※ 年齢による料金の適用のお知らせ</span><br>
					&nbsp;&nbsp;&nbsp;1) 0~12ヶ月未満の子供 : パーク入場無料、及び幼児用の施設(キッズトリア等) 無料利用可能<br>
					&nbsp;&nbsp;&nbsp;2) 12ヶ月以上・ 36ヶ月 未満の子供 : パーク入場無料(但し, 団体客の場合を除く)、 幼児用の施設は有料で利用可能<br>
					&nbsp;&nbsp;&nbsp;⊙ 36ヶ月以上 ~ 12歳未満の子供 : 子供料金を適用<br>
					&nbsp;&nbsp;&nbsp;⊙ 13歳以上 ~ 18歳未満 : 青少年料金を適用(学校・学年関係なし)<br>
					&nbsp;&nbsp;&nbsp;⊙ 65歳以上 : 子供料金適用(その他の割引は適用不可)<br>
				</li>
				<li>
					<span style="font-weight:bold;">※ 幼児用の施設一覧</span><br>
		        	&nbsp;&nbsp;&nbsp;⊙ アドベンチャー : マジックブンブンカー、 お日様お月様、 バンパーカー、アドベンチャートレイン、 ユーレカ、キッズトリア、ドリームボート<br>
					&nbsp;&nbsp;&nbsp;⊙ マジックアイランド : メリーゴーランド、プチぶうぶう
				</li>
			</ul>
		</div>
		<div class="bigBox6">
			<ul style="text-size:130%;">
				<h2>優待情報</h2>
				<li>
					<span style="font-weight:bold;">※ 障害者優待</span><br>
					&nbsp;&nbsp;&nbsp;⊙ 対象 : 障害者証など証明書をお持ちのお客様 + 同伴一人<br>
					&nbsp;&nbsp;&nbsp;⊙ 内容 : 利用チケットの価格の50%優待<br>
				</li>
				<li>
					<span style="font-weight:bold;">※ 国家有功者優待</span><br>
					&nbsp;&nbsp;&nbsp;⊙ 対象 : 国家有功者証をお持ちのお客様 + 同伴一人<br>
					&nbsp;&nbsp;&nbsp;⊙ 内容 : 利用チケットの価格の50%優待<br>
				</li>
				<li>
					<span style="font-weight:bold;">※ 妊婦の優待</span><br>
					&nbsp;&nbsp;&nbsp;⊙ 対象 : 母子手帳など証明できる物をお持ちの妊婦本人<br>
					&nbsp;&nbsp;&nbsp;⊙ 内容 : 利用チケットの価格の50%優待<br>
				</li>				
			</ul>
		</div>
	</div>
</div>
</article>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>