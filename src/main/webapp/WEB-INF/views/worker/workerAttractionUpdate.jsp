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
<script>
	$(document).ready(function() {
		$('#attractionImage').change(function() {
			// 첨부한 파일명을 input에 넣어줌
			if (window.FileReader) {
				var filename = $(this)[0].files[0].name; 
			} else {
				var filename = $(this).val().split('/').pop()
						.split('\\').pop();
			}
			 $('.sbimage').children(':eq(1)').val(filename);
		});
	});
</script>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="workerHeader.jsp"/>
<article>
    <div class="findfindd">
        <div class="id_foundd">
            <h1>어트랙션 수정</h1>
            <br><hr><br>  
            <form action="${conPath }/workerAttraction/update.do" method="post"enctype="multipart/form-data">
            	<input type = "hidden" name = "aid" value = "${attraction.aid }">
                <table class="baba">
			        <tr>
						<th>어트랙션 이름</th>
						<td><input type="text" name="aname" size="47" value="${attraction.aname }"></td>
					</tr>
					<tr>
						<th>어트랙션 설명</th>
						<td><input type="text" name="acontent" size="47" value="${attraction.acontent}"></td>
					</tr>
					<tr>
						<th>태그1</th>
						<td><input type="text" name="tag1" size="47" value="${attraction.tag1 }"></td>
					</tr>
					<tr>
						<th>태그2</th>
						<td><input type="text" name="tag2" size="47" value="${attraction.tag2 }"></td>
					</tr>
					<tr>
						<th>탑승인원(숫자)</th>
						<td><input type="text" name="headcount" size="47" value="${attraction.headcount }"></td>
					</tr>
					<tr>
						<th>제한사항1(키)</th>
						<td><input type="text" name="height" size="47" value="${attraction.height }"></td>
					</tr>
					<tr>
						<th>제한사항2(나이)</th> 
						<td><input type="text" name="age" size="47" value="${attraction.age }"></td>
					</tr>
					<tr>
						<th>베스트 어트랙션<br>(Y/N)</th>
						<td>
							<input type="radio" style="width:17px;height:17px;border:1px;" name="best" value="Y"
							<c:if test = "${attraction.best eq 'Y' }">
								checked = "checked"
							</c:if>
							>사용
							<input type="radio" style="width:17px;height:17px;border:1px;" name="best" value="N"
							<c:if test = "${attraction.best eq 'N' }">
								checked = "checked"
							</c:if>
							>미사용	
						</td>
					</tr>
					<tr>
						<th>운휴정보<br>(Y/N)</th> 
						<td>
							<input type="radio" style="width:17px;height:17px;border:1px;" name="stopday" value="Y"
							<c:if test = "${attraction.stopday eq 'Y' }">
								checked = "checked"
							</c:if>	
							>사용
							<input type="radio" style="width:17px;height:17px;border:1px;" name="stopday" value="N"
							<c:if test = "${attraction.stopday eq 'N' }">
								checked = "checked"
							</c:if>	
							>미사용
						</td>	
					</tr>
                    <tr>
                        <th>어트랙션 이미지</th>
                        <td>
						    <div class="sbimage" style="width: 90%; overflow: hidden;">
						        <label for="attractionImage" style="float: left; margin-right: 10px;">
						            <img src="${conPath}/images/fileup.png" style="width: 50px; display: block;">
						        </label>
						        <input type="text" name="image" id="image" value="${attraction.aimage}" style="width: calc(100% - 80px); float: left;">
						    </div>
						    <div id="filename"></div>
						    <input type="file" name="attractionImage" id="attractionImage" style="display: none;">
						</td>
                    </tr>
                </table>
                <div class="update_buttons">
                    <input type="submit" value="기구수정">
                    <input type="button" value="목록으로" onclick="location.href='${conPath }/workerAttraction/attractionListP.do'">
                    <input type="reset" value="재설정">
                </div>
            </form>
        </div>
    </div>
</article>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>