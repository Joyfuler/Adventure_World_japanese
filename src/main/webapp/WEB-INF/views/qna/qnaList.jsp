<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<link href="${conPath }/css/worldcss.css" rel="stylesheet">
<style>
   
#buttons{text-align:center;}


.submit{position:relative; font-size: 20px;padding-bottom:10px; width:200px; height:55px;color: #fff; background:rgb(111, 35, 249);;font-weight:bold;border-radius: 28px;border:1px solid #6317ed;}
.cancel{position:relative; font-size: 20px;padding-bottom:10px; width:200px; height:55px;color:#6317ed; background:white;font-weight:bold;border-radius: 28px;border:1px solid #6317ed;}
</style>
<jsp:include page="../main/header.jsp"/>
<form action="${conPath }/qna/qnaList.do" name="frm" method="post">
<section class="notice">
  <div class="page-title">
        <div class="container">
            <h3 style="font-family:'IBM Plex Sans KR', sans-serif; font-size: 50px; text-align:center;">QnA</h3>
        </div>
    </div>

    <div class="board-searchh">
        <div class="container">
            <div class="search-window">
             
                    <div class="search-wrap">
                        <label for="search" class="blind">QnA 내용 검색</label>
                        <input id="search" type="search" name="schWord" placeholder="검색어를 입력해주세요." value="${param.schWord}">
                        <input type="submit" class="btn btn-dark" value="검색"></button>
                     <button class="btn btn-darkkk" value="전체보기" onclick="history.back(-1)">전체보기</button> 
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
               
<!-- <a href="qnaView?lqseq=${qnaVO.lqseq}">${qnaVO.title}</a> -->
		<c:forEach items="${qnaList}"  var="qna">
			<tr ><td> ${qna.qno}</td>    
	    		<td>
	    			<c:choose>
						<c:when test="${qna.isreply=='Y'}">
							<a href="#" onClick="location.href='${conPath }/qna/checkPass.do?qno=${qna.qpw}&pageNum=${paging.currentPage}&schWord=${param.schWord}'" >${qna.qtitle}</a>
								&nbsp;<img src="/images/key.png" style="width:20px;vertical-align: middle">
						</c:when>
						<c:otherwise>
							<a href="${conPath }/qna/qnaView.do?qno=${qna.qno}${qna.qpw}&pageNum=${paging.currentPage}&schWord=${param.schWord}">${qna.qtitle}</a>
						</c:otherwise>
					</c:choose>
	    		</td>      
	       		<td><fmt:formatDate value="${qna.qrdate}" type="date"/></td>
	       		<td><c:choose>
					<c:when test="${qna.isreply=='N'}"> no </c:when>
					<c:when test="${qna.isreply=='Y'}"> yes </c:when>
				</c:choose></td>    
	   		</tr>
	  	</c:forEach>

            </table>
        </div>
    </div>

</section>
</form>
	<div>
			<c:if test="${paging.startPage>paging.blockSize}">
				[ <a href="${conPath }/qna/qnaList.do?pageNum=${paging.startPage-1 }&schItem=${param.schItem}&schWord=${param.schWord}">이전</a> ]
			</c:if>	
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }"> 
					<b>[ ${i } ]</b> 
				</c:if>
				<c:if test="${paging.currentPage != i }">
					[ <a href="${conPath }/qna/qnaList.do?pageNum=${i }&schItem=${param.schItem}&schWord=${param.schWord}">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a href="${conPath }/qna/qnaList.do?pageNum=${paging.endPage+1 }&schItem=${param.schItem}&schWord=${param.schWord}">다음</a> ]
			</c:if>
		</div>

<div  class="clear"></div><br>


<div id="buttons">
   <input type="button"  value="등록하기"  class="submit" 
      onClick="location.href='qnaWriteForm'"> 
   <input type="button"   value="취소"  class="cancel"    
      onclick="location.href='qnaList'">  
</div>
<div  class="clear"></div><br>

