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
		var rcid = $(this).attr('id');					
			$.ajax({
					url : '${conPath }/review/commentReplyView.do?bno=${reviewContent.rid }&rcid='+rcid,
					type : 'get',
					data : {'bno' : '${reviewContent.rid}', 'rcid' : rcid},
					dataType : 'text',
					success : function(data, status){						
						$('.replySpace'+rcid).html(data);
					}
				});
			});
			
			$('.reportButton').click(function(){
				$('.reportForm').css('display', 'block');
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
            	<div class="write">
            		<c:forEach var = "comments" items="${reviewComments }">
            		<b>${comments.mname }</b> &nbsp; &nbsp; <span> 작성일: ${comments.rcrdate }</span>&nbsp; &nbsp;
            	 	<br><br>           	 
					<div class="comment_area _comment_area">			
						<span>${comments.rccontent }</span><br>
						<a href = "${conPath }/review/replyComment.do?rcid=${comments.rcid}" style = "color: blue;">[답글]</a>
						<hr>		
						<table>
							<tr>
								<td class = "replySpace${comments.rcid }" colspan="3">            	        	
            					</td>
        					</tr> 
						</table>						
					</div>
					</c:forEach>
					<br>
					<form action = "${conPath }/review/commentWrite.do">
					<input type = "hidden" name = "rid" value = "${reviewContent.rid }">
					<input type = "hidden" name = "mid" value = "${member.mid }">					
					<table>
						<tr>
							<td> <b>댓글 작성</b> </td>
    	        	</tr>
            		<tr>	
            			<td>
            				<textarea id = "rccontent" name = "rccontent" cols= "70" rows = "4" maxlength= "300"></textarea>
            			</td>
            			<td>
            				<c:if test = "${empty member }">
            					&nbsp;<input type = "button" value = "댓글작성" onclick = "location.href='${conPath}/loginView.do?next=review/reviewList.do'">
            				</c:if>
            				<c:if test = "${not empty member and member.mlevel eq -2 }">
            					&nbsp;<input type = "button" value = "(차단유저)">
            				</c:if>
            				<c:if test = "${not empty member and member.mlevel != -2}">
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