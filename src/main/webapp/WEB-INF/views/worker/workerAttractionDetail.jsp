<%@page import="java.time.LocalDate"%>
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
</head>
<script>
function go_deleteAttraction(aid){
		if(confirm('정말 삭제하시겠습니까?')){
			var url='${conPath }/workerAttraction/delete.do?aid=${attractionDetail.aid }&pageNum=${param.pageNum}';
			location.href=url;
			}
		}
</script>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="workerHeader.jsp"/>
<article>
<div class="att_Detail_title">
   	<div id="att_Detail_text">${attractionDetail.aname}</div>
   	<div id="att_Detail_exp">${attractionDetail.acontent}</div>
   	<div id="att_Detail_tag">
   		<ul>
   			<li>${attractionDetail.tag1}</li>
   			<li>${attractionDetail.tag2}</li>
   		</ul>
   	</div>
</div>
<div id="att_Detail_img_tool">
	<img id="att_Detail_img" src="${conPath }/images/attraction_images/${attractionDetail.aimage}"/>
</div>
<div id="att_Info_back">
	<div id="att_Info_box_tool">
		<div class="att_Info_box">
			<div class="att_Info_icon"><img src="${conPath }/images/icons/rideInfo_card_icon3.png"/></div>
			<div class="att_Info_text">人数制限</div>
			<div id="att_Info_pnum">${attractionDetail.headcount}人</div>
		</div>
		<div class="att_Info_box">
			<div class="att_Info_icon"><img src="${conPath }/images/icons/rideInfo_card_icon4.png"/></div>
			<div class="att_Info_text">利用情報</div>
			<div id="att_Info_limit">
				${attractionDetail.height }<br>
				${attractionDetail.age}
			</div>
		</div>
	</div>
	<p id="att_Info_text2">下記のような方はご利用になれません。</p>
	<div id="att_Info_bottom"><br>
		<div id="att_Info_bottom_tool">	
			<div id="att_Info_icon_tool">
				<div id="att_Info_icon2"><img src="${conPath }/images/icons/rideInfo_rest_icon1.png"></div>
				<div id="att_Info_icon_text2">飲酒後2時間以内の方</div>
			</div>
			<div id="att_Info_icon_tool">
				<div id="att_Info_icon2"><img src="${conPath }/images/icons/rideInfo_rest_icon2.png"></div>
				<div id="att_Info_icon_text2">妊娠中の方</div>
			</div>
			<div id="att_Info_icon_tool">
				<div id="att_Info_icon2"><img src="${conPath }/images/icons/rideInfo_rest_icon3.png"></div>
				<div id="att_Info_icon_text2">心血管疾患の方</div>
			</div>
			<div id="att_Info_icon_tool">
				<div id="att_Info_icon2"><img src="${conPath }/images/icons/rideInfo_rest_icon4.png"></div>
				<div id="att_Info_icon_text2">車椅子の方等</div>
			</div>
		</div>
	</div>
</div><br>
<p id="att_Info_text2">運休日程</p>
<div class="closeInfo">
	<div class="att_holiday_tool">
		<p class="att_holiday_txt">			
			<c:if test = "${attractionDetail.stopday eq 'Y'}">
			<span style = "font-size: 1.5em; color: red;">
				このアトラクションは ${weekSchedule } まで運休しています。
			</span>	  
			</c:if>
			<c:if test = "${attractionDetail.stopday eq 'N'}">
			<span style = "font-size: 1.5em;">
				このアトラクションは ${weekSchedule } まで運営しています。
			</span>	
			</c:if>
		</p>
	</div>
	<p class="txt">
		<span style="color:#550adf;"> ※ 今週の運休情報を表示しています</span>
		<br>
		※ 気象の変化及び遊園地の運営状況により運休の日程は変更する恐れがあります。
	</p>
	<p class="link">
		<a href="${conPath }/attraction/stopdayInfo.do" class="grayBtn">今月の運休カレンダーを見る</a>
	</p>
	<div class="btnArea">
		<a href="${conPath }/workerAttraction/attractionListP.do" class="purpleBtn">リスト</a>
		<a href="${conPath }/workerAttraction/update.do?aid=${attractionDetail.aid }&pageNum=${param.pageNum }" class="purpleBtn">修正</a>
		<a href="${conPath }/workerAttraction/delete.do?aid=${attractionDetail.aid }&pageNum=${param.pageNum }" class="purpleBtn" onclick="go_deleteAttraction('${attractionDetail.aid}')">削除</a>
	</div>
</div>
</article>
</body>
<jsp:include page="../main/footer.jsp"/>
</html>