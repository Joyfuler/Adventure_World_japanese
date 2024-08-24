<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者モード：会員管理ページ</title>
<link href="${conPath }/css/admincss.css" rel="stylesheet">
<style>
.notice{height: auto;}
#buttons{text-align:center;}
.submit{position:relative; font-size: 20px;padding-bottom:10px; width:200px; height:55px;color: #fff; background:rgb(111, 35, 249);;font-weight:bold;border-radius: 28px;border:1px solid #6317ed;}
.cancel{position:relative; font-size: 20px;padding-bottom:10px; width:200px; height:55px;color:#6317ed; background:white;font-weight:bold;border-radius: 28px;border:1px solid #6317ed;}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	$(document).ready(function() {
		$('#schmid').on('click', function() {
			var schWord = $('input[name="schWord"]').val();
			location.href = '${conPath}/memberList.do?schWord='+schWord;
		});
		$('.restoreLevel').on('click',function(){
			var checkedMids = [];
			$('input[name="mid"]:checked').each(function(){
				checkedMids.push($(this).val());
			if (checkedMids.length == 0){
				alert('選択された会員がありません');	
			}else {
				var url = '${conPath}/workerRestoreLevel.do?mid='+checkedMids.join('&mid=');
				location.href = url;
				}
			});
		});		
	});	
</script>
<script>
	// submit시에 체크된 요소가 단 하나도 없다면 alert 출력 후 submit 이벤트 false로 리턴.
	function submitChk(){
		var checkboxes = document.getElementsByName('mid');
		var cnt = 0;
		
		for (let i = 0; i < checkboxes.length; i++){
			if (checkboxes[i].checked){
				cnt++;
			}
		}
		if (cnt == 0){
			alert('最小一件以上選択してください');
			return false;
		} else {		
			return true;
		}
	}
</script>
</head>
<body>
<c:if test = "${not empty deleteResult }">
	<script>
		alert('${deleteResult eq 1? "会員レベル調整完了": "会員レベル調整失敗"}');
	</script>
</c:if>
<c:if test = "${not empty adjustResult }">
	<script>
		alert('${adjustResult}件の会員のレベル調整完了');
	</script>
</c:if>
<form action="${conPath }/workermodify.do" method="get">
<section class="notice">
<jsp:include page="../main/header.jsp"/>
<jsp:include page="workerHeader.jsp"/>
  <div class="page-titlee" style="margin-top:-100 " >
        <div class="containerr">
            <h3 style=" margin-right:70px; font-size: 60px;color: #333333;font-weight: 400;text-align: center;"> 会員リスト </h3>
        </div>
    </div>
    <div class="board-searchh">
        <div class="containerr">
            <div class="search-window">
                <div class="search-wrap" >
                    <label for="search" class="blind"> 名前で検索 </label>
                    <input id="search" type="search" name="schWord" placeholder="IDで検索" value="${param.schWord}">
                    <input type="button" id="schmid" class="btn btn-dark" value="検索"   >
                    <input type="button" class="btn btn-dark" value="一覧へ" onclick="location.href='${conPath}/memberList.do'">
                </div>
            </div>
        </div>
    </div>
    <div class="board-listt">
        <div class="containerr">
            <table class="board-tablee">
                <thead>
                <tr>
                    <th scope="col" class="th-num">ID(退会可否)<br></th>           
                    <th scope="col" class="th-title">名前</th>
                    <th scope="col" class="th-date">メール</th>
                    <th scope="col" class="th-answer">郵便番号</th>
                    <th scope="col" class="th-address">住所</th>
                    <th scope="col" class="th-address">住所詳細</th>
                    <th scope="col" class="th-phone">電話番号</th>
                    <th scope="col" class="th-mpoint">保有ポイント</th>
                    <th scope="col" class="th-day">登録日時</th>
                </tr>                
                </thead>
     		<c:forEach items="${memberList}" var="member">
				<tr>
					<td>					
			        	<input type="checkbox" name="mid" value="${member.mid }" style="width: 10px; height: 10px;">		        	
						<br>${member.mid}
						<br><span style = "font-size: 0.8em;">(${member.mlevel eq 0? "脱会" : "一般会員" })</span>			      	
	    			</td>
		    		<td>
		    			<a style="color:blue;">		    	
		    			${member.mname}</a>
		    		</td>
		    		<td>
		    			${member.memail}
		    		</td>
			    	<td>
				    	${member.maddress1}
				    </td>
				    <td>
				    	${member.maddress2}
				    </td>
				    <td>
				    	${member.maddress3}
				    </td>
		    		<td>
		    			${member.mphone}
		    		</td>
		    		<td>
		    			${member.mpoint}
		    		</td>
			    	<td>
				    	<fmt:formatDate value="${member.mrdate}"/>
				    </td>
				</tr>
	  	</c:forEach>
            </table>
            <div>
            	<input type="submit" value="レベル下げ" class="btn btn-dark" onclick = "return submitChk()">
            	<input type = "button" value = "レベル復元" class = "btn btn-dark restoreLevel" >
            </div>
        </div>
        <br>
<br><br><br><br><br>
</div>
	<div id ="paging">
		<c:if test="${paging.startPage>paging.blockSize}">
			[ <a href="${conPath }/memberList.do?pageNum=${paging.startPage-1 }&schWord=${param.schWord}">前へ</a> ]
		</c:if>	
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }"> 
				<b>[ ${i } ]</b> 
			</c:if>
			<c:if test="${paging.currentPage != i }">
				[ <a href="${conPath }/memberList.do?pageNum=${i }&schWord=${param.schWord}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			[ <a href="${conPath }/memberList.do?pageNum=${paging.endPage+1 }&schWord=${param.schWord}">次へ</a> ]
		</c:if>
	</div>
</section>
</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>