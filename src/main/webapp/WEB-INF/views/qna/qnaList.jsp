<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 리스트</title>
<link href="${conPath }/css/world.css" rel="stylesheet">
<script>
function qpwChk(qno){
	var url = '${conPath}/qna/passCheck.do?qno=' + qno +'&pageNum=${paging.currentPage}&schWord=${param.schWord}&wid=${worker.wid}';
	var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=250, scrollbars=no";
    window.open(url,"qpwchk", opt);
}
</script>

<style>
#paging{padding-top: 50px;}
.container h3{padding-top: 100px; color: white;text-shadow: -1px 0px black, 0px 2px black, 2px 0px black, 0px -1px black;}
 .page-title{background-image: url("../images/themepark/theme5.png"); height: 300px; }
#buttons{text-align:center;}
.submit{position:relative; font-size: 20px; width:200px; margin-top:30px; height:55px;color: #fff; background:rgb(111, 35, 249);;font-weight:bold;border-radius: 28px;border:1px solid #6317ed;}
.cancel{position:relative; font-size: 20px;padding-bottom:10px; width:200px; height:55px;color:#6317ed; background:white;font-weight:bold;border-radius: 28px;border:1px solid #6317ed;}
</style>
</head>
<body>
<c:if test="${not empty wirteResult}">
	<script>
		alert('글작성 성공');
	</script>
</c:if>
<c:if test="${not empty replyResult}">
	<script>
		alert('답변작성 성공');
	</script>
</c:if>
<jsp:include page="../main/header.jsp"/>
<form action="${conPath }/qna/qnaList.do" name="frm" method="post">
<input type="hidden" name = "wid" value="${param.wid }">
<input type="hidden" name = "pageNum" value="${param.pageNum }">
<section class="notice">
  <div class="page-title" >
        <div class="container">
            <h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 50px; text-align:center;">QnA</h3>
        </div>
    </div>
    <div class="board-searchh">
        <div class="container">
            <div class="search-window">
                <div class="search-wrap">
                    <label for="search" class="blind">QnA 내용 검색</label>
                    <input id="search" type="search" name="schWord" placeholder="검색어를 입력해주세요." value="${param.schWord}" >
                    <input type="submit" class="btn btn-dark" value="검색"  >
                 	<input type="button" class="btn btn-darkkk" value="전체보기" onclick="location.href='${conPath}/qna/qnaList.do'" >
                </div>
            </div>
        </div>
    </div>
   	<div class="board-list">
       	<div class="container">
            <table class="board-table">
                <thead>
	                <tr>
	                    <th scope="col" class="th-num">번호</th>
	                    <th scope="col" class="th-title">제목</th>
	                    <th scope="col" class="th-date">등록일</th>
	                    <th scope="col" class="th-answer">답변여부</th>
	                </tr>
                </thead>
      			<c:forEach items="${qnaList}"  var="qna">
		     	<c:if test="${qna.isreply=='N' }"> 
					<tr ><td> ${qna.qno}</td>    
			    		<td>
			    		<c:if test="${ empty worker }">
			    			<c:choose>
								<c:when test="${qna.qpwchk=='Y'}" >
									 <span onClick="qpwChk(${qna.qno})">${qna.qtitle}</span> 
										&nbsp;<img src="${conPath }/images/key.png" style="width:20px;vertical-align: middle">									
								</c:when>
								<c:otherwise>
									<a href="${conPath }/qna/qnaView.do?qno=${qna.qno}&pageNum=${paging.currentPage}&schWord=${param.schWord}">${qna.qtitle}</a>
								</c:otherwise>
							</c:choose>
						</c:if>
		    			<c:if test="${not empty worker }">
		    				<c:choose>
							<c:when test="${qna.qpwchk=='Y'}">
								<a href="${conPath }/worker/workerQnaDetail.do?qno=${qna.qno}&pageNum=${paging.currentPage}&schWord=${param.schWord}">${qna.qtitle}</a>
									&nbsp;<img src="${conPath }/images/key.png" style="width:20px;vertical-align: middle">
							</c:when>
							<c:otherwise>
								<a href="${conPath }/worker/workerQnaDetail.do?qno=${qna.qno}&pageNum=${paging.currentPage}&schWord=${param.schWord}">${qna.qtitle}</a>
							</c:otherwise>
						</c:choose>
		    			</c:if>
	    				</td>
			       		<td><fmt:formatDate value="${qna.qrdate}" type="date"/></td>
			       		<td>
			       		<c:choose>
							<c:when test="${qna.isreply=='Y'}"> yes 
							<img src="${conPath }/images/replyicon.png" style="width:20px;vertical-align: middle">	
							</c:when>
						</c:choose>
						</td>    
			   		</tr>
		      </c:if>
      			<!-- 답변글 -->
		      <c:if test="${qna.isreply=='Y'}">
					<tr ><td> ${qna.qno}</td>    
			    		<td>
			    		<c:if test="${ empty worker }">
			    			<c:choose>
								<c:when test="${qna.qpwchk=='Y'}">
									 <span onClick="qpwChk(${qna.qno})">
											<%-- <img src="${conPath }/images/ic1.png" style="width:20px;vertical-align: middle"> --%>
											${qna.qtitle}
											</span> 
										&nbsp;<img src="${conPath }/images/key.png" style="width:20px;vertical-align: middle">
								</c:when>
								<c:otherwise>
									<a href="${conPath }/qna/qnaView.do?qno=${qna.qno}&pageNum=${paging.currentPage}&schWord=${param.schWord}">
										<%-- <img src="${conPath }/images/ic1.png" style="width:20px;vertical-align: middle"> --%>
										${qna.qtitle} 
										</a>
								</c:otherwise>
							</c:choose>
							</c:if>
			    			<c:if test="${not empty worker }">
			    				<c:choose>
								<c:when test="${qna.qpwchk=='Y'}">
									<a href="${conPath }/worker/workerQnaDetail.do?qno=${qna.qno}&pageNum=${paging.currentPage}&schWord=${param.schWord}mid=${qna.mid }">
										<%-- <img src="${conPath }/images/ic1.png" style="width:20px;vertical-align: middle"> --%>
										${qna.qtitle}
										</a>
										&nbsp;<img src="${conPath }/images/key.png" style="width:20px;vertical-align: middle">
								</c:when>
								<c:otherwise>
									<a href="${conPath }/worker/workerQnaDetail.do?qno=${qna.qno}&pageNum=${paging.currentPage}&schWord=${param.schWord}">
									<%-- <img src="${conPath }/images/ic1.png" style="width:20px;vertical-align: middle"> --%>
									 ${qna.qtitle}
									 </a>
								</c:otherwise>
							</c:choose>
			    			</c:if>
			    			</td>
			       			<td><fmt:formatDate value="${qna.qrdate}" pattern="yy-MM-dd hh:mm:ss"/></td>
			       			<td>
			       			<c:choose>
							<c:when test="${qna.isreply=='Y' }"> yes 
								<img src="${conPath }/images/replyicon.png" style="width:20px;vertical-align: middle">	
							</c:when>
							</c:choose>
							</td>    
		   				</tr>
					</c:if>
  				</c:forEach>
            </table>
        </div>
    </div>
</section>
</form>
	<div  class="clear"></div><br>
	<div id ="paging" style="margin-top: -50px;">
			<c:if test="${paging.startPage > paging.blockSize}">
				[ <a href="${conPath }/qna/qnaList.do?pageNum=${paging.startPage-1 }&schWord=${param.schWord}">이전</a> ]
			</c:if>	
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
				<c:if test="${paging.currentPage eq i }"> 
					[<b style = "color:lightgray;">${i }</b>] 
				</c:if>
				<c:if test="${paging.currentPage != i }">
					[ <a href="${conPath }/qna/qnaList.do?pageNum=${i }&schWord=${param.schWord}">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a href="${conPath }/qna/qnaList.do?pageNum=${paging.endPage+1 }&schWord=${param.schWord}">다음</a> ]
			</c:if>
		</div>
	<div id="buttons" style="margin-bottom: 30px;">
		   <input type="button"  value="등록하기"  class="submit" 
		      onClick="location.href='${conPath}/qna/qnaWriteForm.do?mid=admin'"> 
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>