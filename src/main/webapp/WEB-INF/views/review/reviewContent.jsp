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
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div class="bg-light rounded border d-flex justify-content-center container">						
				<h2>${reviewContent.mname } 님의 리뷰</h2>				
	</div>	
	<div class="bg-light border container">		
			<div class="clearfix">
				<div class="avatar text-center">
					<img src="${conPath }/memberUpload/${reviewContent.rphoto}" style="width: 70px !important;" onerror="noImage(this)"><br>				
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
			<div class="section text-left" id="comment_area">
            <div class="comment-block">
               <div class="btn-gruop-wrap clearfix">
                  <div class="btn-gruop btn-group-comment">
                     <img src = "${conPath }/images/comment_icon.png" style = "width: 25px;">
                      댓글 <span id="comment_count" style = "font-weight: bold;">1</span> 건  &nbsp; &nbsp; <a href = "">[댓글작성]</a>
                  </div>         
               </div>
            </div>            
            <div class="comment_list border" id="comment_container">               
            	<div class="write"><b>관리자A</b> &nbsp; &nbsp; <span> 작성일: 2023-11-20 16:33</span>&nbsp; &nbsp;
            	 	<br><br>           	 
					<div class="comment_area _comment_area">			
								<span>안녕하세요.<br />
소중한 구매 후기 진심으로 감사 드립니다.<br />
고객님께서 만족하셨다니 저희도 기쁜 마음이예요^^<br />
앞으로도 저희 슬로우플레이 많은 사랑 부탁 드려요!<br />
텍스트 후기 적립금 1000원 지급 되었습니다^^<br />
감사합니다.						</span>												
							</div><br>
<a href = "">답글</a></div>							
						</div>
					</div>
				</div>		
					<div id = "buttons" style = "margin: 10px 0 10px 20px; text-align: center;">
					<br>						
						<button class = "bg-light" onclick = "location.href='${conPath}/review/reviewList.do?pageNum=${param.pageNum eq null? '1': param.pageNum}'">리뷰목록</button>						
						<button class = "bg-light"> 리뷰삭제</button>
						<button class = "bg-light"> 리뷰 수정 </button>
					</div>	
<jsp:include page="../main/footer.jsp"/>								
</body>
</html>