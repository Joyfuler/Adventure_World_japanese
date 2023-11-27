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
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js">
</script>
<script>
  function change_order( bseq ){
	var selectTag = document.getElementById(bseq);  
	// 각 SELECT 태그의 ID를 BSEQ 값으로 설정해 놓았습니다. 따라서 방금 값이 바뀐 SELECT  태그는 매개변수로 전달된
	// BSEQ 값으로 식별하여 selectTag 변수에 저장할 수 있습니다
	 
	var selectVal = selectTag.options[ selectTag.selectedIndex ].value;
	// 식별한 SELECT 태그의 선택된 인덱스값으로 선택된 값을 추출합니다
	
	location.href='change_order?bseq=' + bseq + '&changeval=' + selectVal;
	// BSEQ 와 바꾸려는 값을 갖고 change_order 리퀘스트로 이동합니다
}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<form action="${conPath }/banner/bannerList.do" method="post">
    <div class="page-titlee">
        <div class="containerr">
            <h3 style=" margin-right:70px; font-size: 60px;color: #333333;font-weight: 400;text-align: center;"> 배너 리스트 </h3>
        </div>
    </div>
    <div class="board-searchh">
        <div class="containerr">
            <div class="search-wrap">
                <input type="submit" class="btn btn-dark" value="등록" style="float:right; margin:0 0 20px;" >새배너등록</input>
                <br>
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
                        <th scope="col" class="th-num">순위</th>
                        <th scope="col" class="th-num">사용유무</th>
                        <th scope="col" class="th-date">등록일</th>
                        <th scope="col" class="th-num">삭제</th>
                    </tr>
                </thead>

                <c:if test="${bannerListSize == 0}">
                    <tr>
                        <td width="100%" colspan="6" align="center" height="23">등록된 상품이 없습니다.</td>
                    </tr>
                </c:if>

                <c:if test="${bannerListSize > 0}">
                    <c:forEach items="${bannerList}" var="bannerVO">
                        <tr>
                            <td height="23" align="center">${bannerVO.bseq}</td>
                            <td style="text-align:center; width:300px;">${bannerVO.subject}</td>
                            <td>
                                <select name="order_seq" id="${bannerVO.bseq}" onChange="change_order('${bannerVO.bseq}');">
                                    <c:forEach var="cnt" begin="1" end="8" varStatus="status">
                                        <c:if test="${cnt==bannerVO.order_seq}">
										    <option value="${cnt}" selected>${cnt}</option>
										</c:if>
										<c:if test="${cnt!=bannerVO.order_seq}">
										    <option value="${cnt}">${cnt}</option>
										</c:if>
                                    </c:forEach>
                                    <c:if test="${bannerVO.order_seq==9}">
									    <option value="9" selected>사용안함</option>
									</c:if>
									<c:if test="${bannerVO.order_seq!=9}">
									    <option value="9">사용안함</option>
									</c:if>
                                </select>
                            </td>
                            <td>${bannerVO.useyn}</td>
                            <td width="150"><fmt:formatDate value="${bannerVO.indate}" /></td>
                            <td>
                                <input type="button" style="width: 60px; height: 32px; font-size: 10px; text-align: center; border: 0; border-radius: 15px; outline: none; padding : 0; background-color: rgb(233, 233, 233);" value="삭제" onClick="go_deleteBanner('${bannerVO.bseq}')">
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </div>
    </div>
    <div style="height:150px"></div>
</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>