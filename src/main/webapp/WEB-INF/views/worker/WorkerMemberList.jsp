<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/admincss.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<style>
   #buttons{text-align:center;}
.submit{position:relative; font-size: 20px;padding-bottom:10px; width:200px; height:55px;color: #fff; background:rgb(111, 35, 249);;font-weight:bold;border-radius: 28px;border:1px solid #6317ed;}
.cancel{position:relative; font-size: 20px;padding-bottom:10px; width:200px; height:55px;color:#6317ed; background:white;font-weight:bold;border-radius: 28px;border:1px solid #6317ed;}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	$(document).ready(function() {
		var schWord = $('input[name="schWord"]').val(); 
		$('#schmid').on('click', function() {
			location.href = '${conPath}/memberList.do?schWord='+schWord;
		});	
	});
	
</script>
<!-- <script>
 function go_schmid() {
	 var schWord = $('input[name="schWord"]').val();
	 loction.href = '${conPath}/memberList.do?schWord='+schWord;
}
</script> -->
<jsp:include page="../main/header.jsp"/>
<form action="${conPath }/workermodify.do" method="get">
<section class="notice">
  <div class="page-titlee">
        <div class="containerr">
            <h3 style=" margin-right:70px; font-size: 60px;color: #333333;font-weight: 400;text-align: center;"> 회원 리스트 </h3>
        </div>
    </div>

    <div class="board-searchh">
        <div class="containerr">
            <div class="search-window">
                
                    <div class="search-wrap">
                        <label for="search" class="blind"> 회원 이름 검색 </label>
                        <input id="search" type="search" name="schWord" placeholder="회원 이름을 입력해주세요." value="${param.schWord}">
                        <input type="button" id="schmid" class="btn btn-dark" value="검색"   >
                        <input type="button" class="btn btn-dark" value="전체보기" onclick="location.href='${conPath}/memberList.do'">
                          
                    </div>
               
            </div>
        </div>
    </div>
   
    <div class="board-listt">
        <div class="containerr">
            <table class="board-tablee">
                <thead>
                <tr>
                    <th scope="col" class="th-num">아이디<br>(탈퇴여부)</th>           
                    <th scope="col" class="th-title">이름</th>
                    <th scope="col" class="th-date">이메일</th>
                    <th scope="col" class="th-answer">우편번호</th>
                    <th scope="col" class="th-address">주소</th>
                    <th scope="col" class="th-address">상세주소</th>
                    <th scope="col" class="th-phone">전화</th>
                    <th scope="col" class="th-mpoint">포인트</th>
                    <th scope="col" class="th-day">가입일</th>
                </tr>
                
                </thead>
     		<c:forEach items="${memberList}" var="member">
			<tr><td>${member.mid}
			      		<c:if test="${member.mlevel == 0}">
			        		<input type="checkbox" name="mid" value="${member.mid }" style="width: 10px; height: 10px;" checked="checked">
				        </c:if>
				        <c:if test="${member.mlevel == 1 }">
				        	<input type="checkbox" name="mid" value="${member.mid }"  style="width: 10px; height: 10px;">
				        </c:if>
	    		</td>
		    	<td><a style="color:blue;">
		    	
		    	${member.mname}</a></td>
		    	<td>${member.memail}</td>
		    	<td>${member.maddress1}</td><td>${member.maddress2}</td><td>${member.maddress3}</td>
		    	<td>${member.mphone}</td>
		    	<td>${member.mpoint}</td>
		    	<td><fmt:formatDate value="${member.mrdate}"/></td></tr>
	  </c:forEach>

            </table>
            <div>
            	<input type="submit" value="저장">
            </div>
        </div>
        <br>
<br><br><br><br><br>
</div>
</section>
</form>
<jsp:include page="../main/footer.jsp"/>