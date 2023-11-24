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
<body>
<jsp:include page="../main/header.jsp"/>
<article>
    <div class="findfindd">
        <div class="id_foundd">
            <h1>어트랙션 추가</h1>
            <br><hr><br>  
            <form action="insertAttraction" method="post">
                <table class="baba">
                    <tr>
			<th>어트랙션 이름</th>
			<td><input type="text" name="atname" size="47"></td>
		</tr>
		<tr>
			<th>어트랙션 설명</th>
			<td><input type="text" name="acontent" size="47"></td>
		</tr>
		<tr>
			<th>태그1</th>
			<td><input type="text" name="act1" size="47"></td>
		</tr>
		<tr>
			<th>태그2</th>
			<td><input type="text" name="act2" size="47"></td>
		</tr>
		<tr>
			<th>탑승인원(숫자)</th>
			<td><input type="text" name="pnum" size="47"></td>
		</tr>
		<tr>
			<th>제한사항1(키)</th>
			<td><input type="text" name="limitkey" size="47"></td>
		</tr>
		<tr>
			<th>제한사항2(나이)</th> 
			<td><input type="text" name="limitage" size="47"></td>
		</tr>
		<tr>
			<th>베스트 어트랙션<br>(Y/N)</th>
			<td>
				<input type="radio" style="width:17px;height:17px;border:1px;" name="bestat" value="Y">사용
				<input type="radio" style="width:17px;height:17px;border:1px;" name="bestat" value="N"checked>미사용	
			</td>
		</tr>
		<tr>
			<th>운휴정보<br>(Y/N)</th> 
			<td>
				<input type="radio" style="width:17px;height:17px;border:1px;" name="aresult" value="Y">사용
				<input type="radio" style="width:17px;height:17px;border:1px;" name="aresult" value="N"checked>미사용
			</td>	
		</tr>
                    <tr>
                        <th>어트랙션 이미지</th>
                        <td>
                            <input type="hidden" name="image" id="image">
                            <div id="filename"></div>
                            <input type="file" name="attractionImage" id="attractionImage">
                        </td>
                    </tr>
                </table>
                <div class="update_buttons">
                    <input type="button" value="기구등록" onclick="go_insertat()">
                    <input type="button" value="목록으로" onclick="go_mov('adminAttraction')">
                </div>
            </form>
        </div>
    </div>
</article>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>