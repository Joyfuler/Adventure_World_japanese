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
<c:if test = "${not empty deleteResult }">
	<script>
		alert('${deleteResult}');
	</script>
</c:if>
<script>
	function change_border(bno){
		var selectTag = document.getElementById("banner"+bno);  //bno의 값을 변수에 저장
		var totCntPlus1 = ${cntBanner}+1;  //bno의 값을 변수에 저장
		var selectVal = selectTag.options[ selectTag.selectedIndex ].value;
		// 식별한 SELECT 태그의 선택된 인덱스값으로 선택된 값을 추출합니다
		
		if (selectVal == totCntPlus1){
			location.href='${conPath }/workerBanner/update.do?bno=' + bno + '&usage=N&border=' + selectVal;
		}else{
			location.href='${conPath }/workerBanner/update.do?bno=' + bno + '&usage=Y&border=' + selectVal;

		}
		// bno 와 바꾸려는 값을 갖고 이동합니다
 }
	function go_deleteBanner(bno){
		if(confirm('정말 삭제하시겠습니까?')){
			var url="${conPath }/workerBanner/delete.do?from=admin&bno=" + bno; 
			location.href=url;
			}
		}
</script>

</head>
<body>
<jsp:include page="../main/header.jsp"/>
<form action="${conPath }/workerBanner/insert.do">
    <div class="page-titlee">
        <div class="containerr">
            <h3 style=" margin-right:70px; font-size: 60px;color: #333333;font-weight: 400;text-align: center;"> 배너 리스트 </h3>
        </div>
    </div>
    <div class="board-searchh">
        <div class="containerr">
            <div class="search-wrap" style="width:80%;">
                <input type="button" class="btn btn-dark" value="등록" style="float:right; margin:0 0 20px;" onClick="location.href='${conPath }/workerBanner/insert.do'"></input>
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
                        <th scope="col" class="th-num">삭제</th>
                    </tr>
                </thead>

                <c:if test="${cntBanner == 0}">
                    <tr>
                        <td width="100%" colspan="6" align="center" height="23">등록된 배너가 없습니다.</td>
                    </tr>
                </c:if>

                <c:if test="${cntBanner > 0}">
                    <c:forEach items="${bannerList}" var="banner">
                        <tr>
                            <td height="23" align="center">${banner.bno}</td>
                            <td style="text-align:center; width:300px;">${banner.btitle}</td>
                            <td>
                                <select name="order_seq" id="banner${banner.bno}" onchange="change_border('${banner.bno}');">
                                    <c:forEach var="cnt" begin="1" end="${cntBanner}">
                                        <c:if test="${cnt==banner.border and banner.border != cntBanner+1}">
										    <option value="${cnt}" selected="selected">${cnt}</option>
										</c:if>
										<c:if test="${cnt!=banner.border}">
										    <option value="${cnt}">${cnt}</option>
										</c:if>
										
                                    </c:forEach>
									<c:if test="${banner.border eq cntBanner+1}">
									    <option value="${cntBanner +1}" selected="selected">사용안함</option>
									</c:if>
									<c:if test="${banner.border != cntBanner+1}">
									    <option value="${cntBanner +1}">사용안함</option>
									</c:if>
                                </select>
                            </td>
                            <td>${banner.usage}</td>
                            <td>
                                <input type="button" style="width: 60px; height: 32px; font-size: 10px; text-align: center; border: 0; border-radius: 15px; outline: none; padding : 0; background-color: rgb(233, 233, 233);" value="삭제" onclick="go_deleteBanner('${banner.bno}')">
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