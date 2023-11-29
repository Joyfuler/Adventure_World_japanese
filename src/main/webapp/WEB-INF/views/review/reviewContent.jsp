<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href = "${conPath }/css/world.css" rel = "stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	function noImage(imageElement) {
    	imageElement.src = "${conPath}/images/noimg.jpg";
	}
	
	function deleteConfirm(){
		var deleteOk = confirm ('정말 리뷰를 삭제하시겠습니까?');
		if (deleteOk){
			location.href='${conPath}/review/reviewDelete.do?rid=${param.rid}';
		}
	}
	
</script>
<script>
	$(document).ready(function(){
		$('.replyComment').click(function(){				
		var rcid = $(this).data('id');
		var replySpace = $('.replySpace'+rcid);
		if (replySpace.is(':visible')){
			replySpace.hide();
		} else {
			$.ajax({
					url : '${conPath }/review/commentReplyView.do?rid=${reviewContent.rid }&rcid='+rcid,
					type : 'get',
					data : {'rid' : '${reviewContent.rid}', 'rcid' : rcid},
					dataType : 'text',
					success : function(data, status){						
						replySpace.html(data);
						replySpace.show();
					}
				});
			}
		});
		
		$('.deleteComment').click(function(){
			var rcid = $(this).data('id');
			var confirmDelete = confirm ('정말 삭제하시겠습니까?');
			if (confirmDelete){
				location.href='${conPath}/review/commentDelete.do?rid=${reviewContent.rid}&rcid='+rcid;
			}
		})
		
		$('.reportButton').click(function(){
			$('.reportForm').css('display', 'block');
		});
			
		$('form#replyForm').submit(function(){
			var rccontentValue = $('#rccontent').val().trim();
			if (rccontentValue == ''){
				alert("댓글 내용을 입력해주세요.");
				return false;
			}
		});	
		
		$('.notMemberSubmit').on("click",function(){
			alert('먼저 로그인하셔야 합니다.');
			location.href = "${conPath}/member/loginMember.do?next=review/reviewContent.do?rid=${reviewContent.rid}";
		});	
	
		$('.btnModify').on("click",function(e){
			e.preventDefault();
			var rcid = $(this).data('rcid');
			var pageNum = $(this).data('pageNum');
			var replyPageNum = $(this).data('replyPageNum');		
			$.ajax({
				url: '${conPath}/review/replyModifyView.do',
				data: {'rcid': rcid, 'pageNum' : pageNum, 'replyPageNum' : replyPageNum },
				type : 'get',
				dataType : 'html',
				success: function(data, status){
				$('.reply'+rcid).html(data);
			}
		});
	});
});		
</script>
</head>
<body>
<c:if test="${not empty successMsg }">
	<script>
		alert('${successMsg}');
	</script>
</c:if>
<c:if test = "${not empty failMsg }">
	<script>
		alert('${failMsg}');	
	</script>
</c:if>
<c:if test = "${not empty commentWriteResult }">
	<script>
		alert('${commentWriteResult eq 1? "댓글 작성 완료": "댓글 작성 실패"}');
	</script>
</c:if>
<c:if test = "${not empty param.loginResult }">
	<script>
		alert('${param.loginResult}');
	</script>
</c:if>
<c:if test = "${not empty replyResult }">
	<script>
		alert('${replyResult eq 1 ? "대댓글 작성 완료" : "대댓글 작성 실패"}');
	</script>
</c:if>	
<c:if test = "${not empty deleteResult }">
	<script>
		alert('${deleteResult eq 1 ? "댓글 삭제 완료" : "댓글 삭제 실패"}');		
	</script>
</c:if>
<jsp:include page="../main/header.jsp"/>
	<div class="bg-light rounded border d-flex justify-content-center container">						
				<h2>${reviewContent.mname } 님의 리뷰</h2>				
	</div>	
	<div class="bg-light border container">		
			<div class="clearfix">
				<div class="avatar text-center">
					<c:if test = "${empty reviewContent.rphoto }">
						<img src="${conPath }/images/ticketavatar.png" style="height: 100px !important;">
					</c:if>
					<c:if test = "${not empty reviewContent.rphoto }">
						<img src= "${conPath }/memberImg/${reviewContent.rphoto}" style = "height:100px !important;" onerror = "noImage(this)">
					</c:if>				
					<br>				
				    <a href="${conPath }/cart/reserve.do" target="_blank"><b>${reviewContent.otype eq 0? '자유이용권' : '패스트패스' }</b></a>
						/ [옵션] 성인 : ${reviewContent.op1 } 매  / 청소년 : ${reviewContent.op2 } 매 <br>
						<c:if test = "${reviewContent.otype eq 1 }">
						어트랙션: ${reviewContent.oatname1 } / ${reviewContent.oatname2 } / ${reviewContent.oatname3 } <br>
						</c:if> 
						작성일: ${reviewContent.rrdate } <br>
						
						평점 : 
						<c:forEach var="i" begin="1" end="5">
    						<img src="${conPath}/images/point_star_${i <= reviewContent.rscore ? 'on' : 'out'}.png" style="width: 15px; padding-top: 5px;">
						</c:forEach>&nbsp; ${reviewContent.rscore } 점<br>
				</div>
				<div class="text-center">
						<br>
						<b>${reviewContent.rtitle }</b> <br>
					<div class = "border text-center justify-content-center" style="padding-bottom: 10px;">
						<br>											
						${reviewContent.rcontent }					
					</div>
				</div>
				<div class="file_area">
				</div>
				<br><br>
			</div>
			<div class="section text-left" id="comment_area" style = "text-align:left !important;">
            <div class="comment-block">
               <div class="btn-gruop-wrap clearfix">
                  <div class="btn-gruop btn-group-comment">
                     <img src = "${conPath }/images/comment_icon.png" style = "width: 25px;">
                      댓글 <span id="comment_count" style = "font-weight: bold;">${reviewContent.commentcnt }</span> 건  &nbsp; &nbsp; <a href = "#rccontent" style = "color:blue;">[댓글작성]</a>
                  </div>         
               </div>
            </div>            
            <div class="comment_list border" id="comment_container">               
            	<div class="write" style = "margin-left:10px;">
            		<c:forEach var = "comments" items="${reviewComments }">
            			<div class = "reply${comments.rcid }">            			
            			<c:forEach var="i" begin="1" end="${comments.rcindent }">
									<c:if test="${i eq comments.rcindent }">
										<b>└─</b>
									</c:if>
									<c:if test="${i!= comments.rcindent }"> 
									&nbsp; &nbsp; &nbsp; 
									</c:if>
								</c:forEach>    
            		<b>${comments.mname }</b> &nbsp; &nbsp; <span> 작성일: ${comments.rcrdate }</span>&nbsp; &nbsp;
            	 	<br><br>           	 
					<div class="comment_area _comment_area">
						<c:forEach var="i" begin="1" end="${comments.rcindent }">									 
									&nbsp; &nbsp; &nbsp; &nbsp;									
						</c:forEach>
						<span>${comments.rccontent }</span><br>
						<c:if test = "${comments.rcindent <4 }">
							<a style = "color: blue; cursor:pointer;" class = "replyComment" data-id = "${comments.rcid }">[답글]</a>					
						</c:if>
						<c:if test = "${comments.mid eq member.mid }">
						<a style = "color: blue; cursor:pointer;" class = "deleteComment" data-id = "${comments.rcid }">[삭제]</a>
						<a style = "color: blue; cursor:pointer;" class = "btnModify" data-rcid="${comments.rcid}" data-pageNum= "${param.pageNum}" data-replyPageNum="${paging.currentPage}">[수정]</a>
						</c:if>
						<hr>		
						<table>
							<tr>
								<td class = "replySpace${comments.rcid }" colspan="3">            	        	
            					</td>
        					</tr> 
						</table>						
					</div>
				</div>	
				</c:forEach>	
				<br>
				<div class = "paging" style = "text-align: center; font-weight: bold;">
					<c:if test="${paging.startPage > paging.blockSize}">
						<a href="${conPath }/review/reviewContent.do?rid=${reviewContent.rid }&replyPageNum=${paging.startPage-1 }&pageNum=${empty param.pageNum? '1': param.pageNum }">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
						<c:if test="${paging.currentPage eq i }"> 
							[<b style = "color: red;"> ${i } </b>] 
						</c:if>
						<c:if test="${paging.currentPage != i }">
							<a href="${conPath }/review/reviewContent.do?rid=${reviewContent.rid }&replyPageNum=${i }&pageNum=${empty param.pageNum? '1': param.pageNum}">[${i }]</a>
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage < paging.pageCnt }">
						<a href="${conPath }/review/reviewContent.do?rid=${reviewContent.rid }&replyPageNum=${paging.endPage+1 }&pageNum=${empty param.pageNum? '1': param.pageNum}">[다음]</a>
					</c:if>
				</div>
					<form action = "${conPath }/review/commentWrite.do" id = "replyForm">
					<input type = "hidden" name = "rid" value = "${reviewContent.rid }">
					<input type = "hidden" name = "mid" value = "${member.mid }">					
					<table style = "margin-left: 10px;">
						<tr>
							<td> <b>댓글 작성</b> </td>
    	        	</tr>
            		<tr>	
            			<td>
            				<textarea id = "rccontent" name = "rccontent" cols= "70" rows = "4" maxlength= "300"></textarea>
            			</td>
            			<td>
            				<c:if test = "${empty member }">
            					&nbsp;<input type = "button" value = "댓글작성" class = "notMemberSubmit">
            				</c:if>            				
            				<c:if test = "${not empty member }">
            					&nbsp;<input type = "submit" value = "댓글작성">
            				</c:if>
            			</td>
            		</tr>		
            	</table>
            	</form>
				</div>							
			</div>
		</div>
	</div>		
	<div id = "buttons" style = "margin: 10px 0 10px 20px; text-align: center;">
	<br>
		<button class = "bg-light" onclick = "location.href='${conPath}/review/reviewList.do?pageNum=${param.pageNum eq null? '1': param.pageNum}'">리뷰목록</button>						
		<c:if test = "${reviewContent.mid eq member.mid}">
			<button class = "bg-light" onclick = "deleteConfirm()"> 리뷰삭제</button>
			<button class = "bg-light" onclick = "location.href='${conPath}/review/reviewModify.do?pageNum=${param.pageNum eq null? '1': param.pageNum }&rid=${param.rid }'"> 리뷰 수정 </button>
		</c:if>
	</div>	
<jsp:include page="../main/footer.jsp"/>								
</body>
</html>