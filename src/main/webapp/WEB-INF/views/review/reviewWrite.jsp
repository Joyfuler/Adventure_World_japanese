<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 페이지</title>
<link href = "${conPath }/css/world.css" rel = "stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>    
	function noImage(imageElement) {
	 	imageElement.src = "${conPath }/img/noimg.jpg";
	}
   </script>
   	<script src="${conPath }/ckeditor/ckeditor.js"></script>
   	<script type="text/javascript">
		$(function() {
			CKEDITOR.replace('rcontent', {
				filebrowserUploadUrl : '${conPath }/fileupload.do'
			});
		});
	</script>      
    <script>
    $(document).ready(function(){
    	 var inputFile = $("input[name='rimg']");
         var image = $("#uploadedImg"); 
         inputFile.change(function(){
       	 var file = inputFile[0].files[0];
       	 if (file){
       		 var reader = new FileReader();
       		 reader.onload = function(e){
       			image.attr('src', e.target.result);
       		 };
       		 reader.readAsDataURL(file);
       	 }
         });
         
         $('#rimg').change(function(){
				if(window.FileReader){
					var filename = $(this)[0].files[0].name;
				}else{
					var filename = $(this).val().split('/').pop().split('\\').pop();
				}
				$(this).siblings('.rimg').val(filename);
			});
         
         
         
    });    
    </script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<form action = "${conPath }/review/reviewWrite.do" method="post" id = "writeForm" enctype = "multipart/form-data">
<section class="notice">
  <div class="page-title">
        <div class="write_title">
            <h4 style = "text-align: center;">
            	<b>&nbsp; Adventure 리뷰 게시글 작성</b>
            </h4>         
        </div>
  </div>  
  <div id="contents" style = "background-color: #5c10e6; color: white; width: 900px; margin-left: 15px; text-align: center; margin: 0 auto;">
		<div class="article">						
			<div class="gray_frame">
					<input type = "hidden" name = "mid" value = "${member.mid }">							
					<div class = "writeForm">
						<table class="board-table">							
							<tbody>
								<tr>
									<td rowspan="2" style = "text-align: center;">																																																			
										<b>&nbsp;&nbsp;글제목 &nbsp;</b>
									</td>
									<td rowspan="2">
										<input id="rtitle" name="rtitle" class = "writeInput" maxlength="100" tabindex="2" style = "width: 700px;"
										type="text">										
									</td>
								</tr>
								<tr>
								</tr>
								<tr>
									<th>글내용 </th>
									<td style = "padding-left: 25px; background-color: white; border-right: 1px solid gray;">
										<textarea cols="30" rows="15" maxlength="4000" name = "rcontent" id = "rcontent"></textarea>																					
									</td>
								</tr>								
								<tr>
									<th>사진<br>추가</th>
									<td>
										<input type="text" class="rimg" style="display: block; float: left; width:90%;"> &nbsp;
										<input type = "file" name = "rimg" id = "rimg" onchange = "checkFileType(this)">
										<input type = "file" name = "temprimg" style = "display: none;">																			
										<img id = "uploadedImg" height = "44px">
									</td>
								</tr>
							</tbody>
						</table>						
					</div>
			</div>
		</div>
	</div>								
</section>
<div class = "button-area" style = "text-align: center;">
<input type = "button" id = "submitButton" value = "글작성" style = "margin-left: 50px;" onclick = "submitForm()"> 
<input type = "button" value = "초기화" onclick = "location.reload(true);" style = "margin-left: 10px;"> 
<input type = "button" value = "글목록" onclick = "location.href='${conPath }/boardList.do?gid=${param.gid }'" style = "margin-left: 10px;">
</div>
<br><br><br>
</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>