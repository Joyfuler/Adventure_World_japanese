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
    width: 1250px;
    margin: 0 auto;
}

.id_foundd h1 {
    font-size: 50px;
    text-align: center;
    height: 110px;
    margin-top: 40px;
}

.baba {
    position: relative;
    margin: 0 auto;
}

.baba tr {
    position: relative;
    width: 700px;
    height: 100px;
}

.baba th {
    position: relative;
    width: 250px;
    font-size: 30px;
    text-align: center;
}

.baba td {
    position: relative;
    width: 500px;
    margin: 0 auto;
    border: none;
}

.baba td input {
    width: 450px;
    height: 50px;
    font-size: 20px;
    border-radius: 10px;
    border: 1px solid lightgray;
    padding-left: 10px;
    background-color: #f7f7f7;
}

.fileUp {
    position: relative;
    width: 700px;
    height: 80px;
    margin: 0 auto;
    text-align: right;
}

.fileUp input[type=file] {
    width: 190px;
    height: 32px;
    font-size: 13px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding: 3px;
    background-color: rgb(233, 233, 233);
}

.fileUp input[type=button] {
    width: 150px;
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
    width: 100%;
    height: 100px;
    margin: 0 auto;
    text-align: center;
}

.update_buttons input {
    width: 140px;
    height: 56px;
    border-radius: 40px;
    background-color: #6f23f9;
    font-size: 20px;
    color: white;
    margin: 0 3px;
    border: none;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
<article>
    <div class="findfindd">
        <div class="id_foundd">
            <h1>분실물 추가</h1>
            <br><hr><br>  
            <form action="${conPath }/insertItem.do" method="post" enctype="multipart/form-data">
                <table class="baba">
                    <tr>
						<th>분실물 분류</th>
						<td><input type="text" name="litem" size="47"></td>
					</tr>
					<tr>
						<th>분실물 이름</th>
						<td><input type="text" name="lname" size="47"></td>
					</tr>
					 <tr>
			            <th>분실물 이미지</th>
			            <td>
			                <div id="filename"></div>
			                <input type="file" name="tempimg" id="lphoto">
			            </td>
			        </tr>
					<tr>
						<th>분실 장소</th>
						<td><input type="text" name="location" size="47"></td>
					</tr>
					<tr>
						<th>분실일</th>
						<td><input type="text" name="lrdate" size="47"></td>
					</tr>
					<tr>
						<th>처리결과</th>
						<td><input type="text" name="lresult" size="47"></td>
					</tr>
     			</table>
			     <div class="update_buttons">
			         <input type="submit" value="분실물 등록">
			         <input type="button" value="목록으로" onclick="location.href='${conPath }/worker/list.do'">
			     </div>
   			</form>
	    </div>
    </div>
</article>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>