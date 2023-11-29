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
  src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<style>
       table {
           border-collapse: collapse;
           border-spacing: 0;
       }

       .findfindd {
           position: relative;
           width: 100%;
           margin: 0 auto;
       }

       .id_foundd {
           position: relative;
           width: 80%; /* Adjusted width */
           margin: 0 auto;
       }

       .id_foundd h1 {
           font-size: 36px; /* Adjusted font size */
           text-align: center;
           height: 80px; /* Adjusted height */
           margin-top: 20px; /* Adjusted margin top */
       }

       .baba {
           position: relative;
           width: 80%; /* Adjusted width */
           margin: 0 auto;
       }

       .baba tr {
           position: relative;
           width: 100%; /* Adjusted width */
           height: 60px; /* Adjusted height */
       }

       .baba th {
           position: relative;
           width: 30%; /* Adjusted width */
           font-size: 24px; /* Adjusted font size */
           text-align: center;
       }

       .baba td {
           position: relative;
           width: 70%; /* Adjusted width */
           margin: 0 auto;
           border: none;
       }

       .baba td input {
           
           height: 40px; /* Adjusted height */
           font-size: 16px; /* Adjusted font size */
           border-radius: 8px; /* Adjusted border radius */
           border: 1px solid lightgray;
           padding-left: 10px;
           background-color: #f7f7f7;
       }

       .fileUp {
           position: relative;
           width: 80%; /* Adjusted width */
           height: 60px; /* Adjusted height */
           margin: 0 auto;
           text-align: right;
       }

       .fileUp input[type=file] {
           width: 30%; /* Adjusted width */
           height: 32px;
           font-size: 13px;
           border: 0;
           border-radius: 15px;
           outline: none;
           padding: 3px;
           background-color: rgb(233, 233, 233);
       }

       .fileUp input[type=button] {
           width: 30%; /* Adjusted width */
           height: 32px;
           font-size: 12px;
           border: 0;
           border-radius: 15px;
           outline: none;
           padding: 3px;
           background-color: rgb(233, 233, 233);
       }

       .update_buttons {
           position: relative;
           width: 80%; /* Adjusted width */
           height: 100px;
           margin: 0 auto;
           text-align: center;
       }

       .update_buttons input {
           width: 20%; /* Adjusted width */
           height: 44px; /* Adjusted height */
           border-radius: 22px; /* Adjusted border radius */
           background-color: #6f23f9;
           font-size: 18px; /* Adjusted font size */
           color: white;
           margin: 0 3px;
           border: none;
       }
       .pl{
       	width: 300px;
       	border: 1px solid #C4C4C4;
       	border-radius: 10px;
       	padding: 12px 13px;
       	font-family: 'Roboto';
       	font-size: 14px;
       }
   </style>
<script>
	var cntBanner = ${cntBanner+2};
	$(document).ready(function(){
		$('select[name="order_seq"]').change(function(){ //<select name="order_seq" class="pl"> 이게바뀌면
			$('input[name="border"]').val($(this).val());//바뀐값을 input[name="border"] 여따 넣어라
			var selectVal = $('select[name="order_seq"]').val();
			if (cntBanner == selectVal){
				$('input[name="usage"]').val('N');
			}else{
				$('input[name="usage"]').val('Y');
			}
			});
		});
</script>
<body>
<jsp:include page="../main/header.jsp"/>
<article>
    <div class="findfindd">
        <div class="id_foundd">
            <h1>배너 등록</h1>
            <br><hr><br>
            <form action="${conPath }/workerBanner/insert.do" method="post" enctype="multipart/form-data" >
            	<input type="text" name="border">
            	<input type="text" name="usage">
                <table class="baba">
                    <tr>
                        <th>제목</th>
                        <td><input type="text" name="btitle" size="47"></td>
                    </tr>
                    <tr>
                        <th>순위</th> 
                        <td>
                            <select name="order_seq" class="pl">
                            <c:forEach var="cnt" begin="1" end="${cntBanner+1}">
                            	<option value="${cnt}">${cnt}</option>
                            </c:forEach>
                            <option value="${cntBanner +2}">사용안함</option>
                            </select>
                        </td>
                    </tr>
                    <tr style="height:250px">
                        <th>배너 이미지</th>
                        <td>
                            <input type="hidden" name="image" id="image">
                            <div id="filename"></div>
                            <input type="file" name="fileimage" id="mymy">
                        </td>
                    </tr>
                </table>
                <div class="update_buttons">
                    <input type="submit" value="등록">
                    <input type="button" value="목록으로" onclick="location.href='${conPath }/workerBanner/list.do'">
                </div>
            </form>
        </div>
    </div>
</article>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>