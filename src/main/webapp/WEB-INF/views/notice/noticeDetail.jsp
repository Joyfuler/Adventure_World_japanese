<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value = "${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
        .replyContainer {
            margin: 20px auto;
            height: 500px;
            padding: 20px;
            border-radius: 8px;
            background-color: #fff;
        }

        h2 {
            color: #333;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #6f23f9;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #6f23f9;
        }

        .comment {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }

        .commentContent {
            font-size: 1.2em;
            color: #333;
        }

        .commentInfo {
            color: #888;
            font-size: 0.9em;
        }

        .btn {
            cursor: pointer;
            color: #007bff;
            margin-left: 10px;
            font-size: 0.9em;
        }

        .paging {
            margin-top: 20px;
        }

        .paging a {
            text-decoration: none;
            margin-right: 5px;
            color: #6f23f9;
            padding: 5px 8px;
            border-radius: 4px;
        }

        .paging a:hover {
            background-color: #007bff;
            color: #fff;
        }
    </style>
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
  	$(document).ready(function(){
  		var openOk = false;
  		$('.replyView').click(function(){
  			if(openOk){
  				openOk = false;
  				location.reload();
  			}else{
  				openOk = true;
  				var cnum = $(this).attr('id');
  	  			$.ajax({
  	  				url : '${conPath}/noticeComment/replyView.do',
  						data : {'cnum':cnum, 'pageNum':'${param.pageNum}', 'commentPageNum':'${param.commentPageNum}'},
  						type : 'get',
  						dateType : 'html',
  						success : function(data, status){
  							$('.replySpace'+cnum).html(data);
  						}
  	  		});
  			}
  		});
  	});
</script>
</head>
<body>
<c:if test="${not empty commentResult }">
	<script>alert('${commentResult}');</script>
</c:if>
<jsp:include page="../main/header.jsp"/>
<div class="event01">
	<div class="event02">공지사항</div>
    <div class="event03">
		<div class="event04">공지</div>
		<div class="event05">${notice.ntitle}</div>
		<div class="event06"><fmt:formatDate value="${notice.nrdate}" type="date"/></div>
	</div>
	<div class="event08">
		<img src="images/notice_images/${notice.ncontent}" width="1150px"/>
	</div>
	<div class="replyContainer">
	<h2>댓글</h2>
	<form action="${conPath }/noticeComment/write.do">
		<input type="hidden" name="nid" value="${param.nid }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="cname" value="${member.mname }" style="width:100px; height:50px; float:left; margin: 5px;" placeholder="글쓴이">
		<textarea rows="2" cols="5" name="cmemo" style="width:50%; height:50px; float:left; margin: 5px;"></textarea>
		<input type="submit" value="댓글저장" class="btn" style="height:50px; float:left; margin: 5px;">
	</form>
	<p style="clear:both;"></p>
	<c:if test="${empty commentList }">등록된 댓글이 없습니다</c:if>
	<c:forEach items="${commentList }" var="comment">
		<div class="reply${comment.cnum }">
			<div>
				<c:forEach var="i" begin="1" end="${comment.cindent }">
					<c:if test="${i==comment.cindent }">
			  			&nbsp; &nbsp; &nbsp; └
			  		</c:if>
					<c:if test="${i!=comment.cindent }">
			  			&nbsp; &nbsp; &nbsp; 
			  		</c:if>
				</c:forEach>
				${comment.cnum }.
				<span class="commentContent"">${comment.cmemo }</span> 
				<i class="commentInfo">from ${comment.cname} - at ${comment.cdate }</i>
			<c:if test="${comment.cname eq member.mname}">
                <span onclick="location='${conPath}/noticeComment/delete.do?cnum=${comment.cnum }&nid=${param.nid }&pageNum=${param.pageNum }&comPageNum=${comPaging.currentPage }'" class="btn">[ 삭제 ]</span>
            </c:if>
				<span id="${comment.cnum }" class="replyView" class="btn" class="replyBtn" style="cursor: pointer;">[ 답변 ]</span>
			</div>
			<div class="replySpace${comment.cnum }"></div>
		</div>
		<br>
	</c:forEach>
	<div class="paging">
		<c:if test="${comPaging.startPage > comPaging.blockSize }">
			[ <a href="${conPath }/notice/detail.do?nid=${param.nid}&pageNum=${param.pageNum }&commentPageNum=${comPaging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${comPaging.startPage }" end="${comPaging.endPage }">
			<c:if test="${i eq comPaging.currentPage }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != comPaging.currentPage }">
				[ <a href="${conPath }/notice/detail.do?nid=${param.nid}&pageNum=${param.pageNum }&commentPageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/notice/detail.do?nid=${param.nid}&pageNum=${param.pageNum }&commentPageNum=${comPaging.endPage+1}">다음</a> ]
		</c:if>
	</div>
	
	
	<div class="event09">
		<div class="event10">
	   		<input type="button" value="목 록" class="btn" onclick="location.href='${conPath }/notice/list.do'">
		</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>