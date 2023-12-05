<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정 페이지</title>
<link href = "${conPath }/css/world.css" rel = "stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>    
	function noImage(imageElement) {
	 	imageElement.src = "${conPath }/img/noimg.jpg";
	}
   </script>
   <script>    
     function checkFileType(inputElement) {        
     	 var file = inputElement.files[0];       
       	 var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i; // 이미지 확장자 목록
         if (!allowedExtensions.exec(file.name)) {
           alert("이미지 파일만 업로드 가능합니다.");
           inputElement.value = ''; // 입력 필드 비우기
       }
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
    	 var inputFile = $("input[name='tempRphoto']");
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
         
         $('#rphoto').change(function() {
				// 첨부한 파일명을 input에 넣어줌
				if (window.FileReader) {
					var filename = $(this)[0].files[0].name; 
				} else {
					var filename = $(this).val().split('/').pop()
							.split('\\').pop();
				}
				$(this).siblings('.rphoto').val(filename);
		 });
    });    
    </script>
</head>
<c:if test = "${not empty param.loginResult }">
 <script>
 	alert('${param.loginResult}');
 </script>
</c:if>
<body>
<jsp:include page="../main/header.jsp"/>
<form action = "${conPath }/review/reviewModify.do" method="post" id = "writeForm" enctype = "multipart/form-data">
	<section class="notice">
  		<div class="page-title">
        	<div class="write_title">
            	<h2 style = "text-align: center;">
            		<b>&nbsp; Adventure World 리뷰 게시글 수정</b>
            	</h2>         
        	</div>
  		</div>  
  		<div id="contents" style = "background-color: #DCEBFC; color: #212529; width: 1200px; margin-left: 15px; margin: 0 auto;">
			<div class="article">						
				<div class="gray_frame">
					<input type = "hidden" name = "rid" value = "${originalInfo.rid}">							
					<div class = "writeForm">
						<script>
							$(document).ready(function(){
								$(".starCheck").click(function() {
									var starScore = $(this).attr("starScore"); 
									$(".starCheck").attr("src","${conPath}/images/point_star_out.png");	
									for (idx = 1; idx <= starScore; idx++) {
										$("img[starScore=" + idx + "]").attr("src", "${conPath}/images/point_star_on.png");
									}
								<%-- form과 hidden input창의 value값을 클릭한 값으로 변경. --%>
									$("input[name=rscore]").attr("value", starScore);				
									$(".reviewScore").html(starScore);
								});							
								
								$('#odidSelect').change(function(){
									var selectedOption = $('select[name="odid"] option:selected');
									var reviewValue = selectedOption.data('review');
									$('#pointObtained').val(reviewValue);
								});
							});						
						</script>					
						<table style = "width: 1000px;">
							<tr style = "padding: 10px;">									
								<td colspan= "2" style = "cursor: pointer;">
									<br><br> 
									&nbsp;&nbsp;&nbsp;별점 : <img src = "${conPath }/images/point_star_on.png" starScore = "1" class = "starCheck"><img src = "${conPath }/images/point_star_on.png" starScore = "2" class = "starCheck"><img src = "${conPath }/images/point_star_on.png" starScore = "3" class = "starCheck"><img src = "${conPath }/images/point_star_on.png" starScore="4" class = "starCheck"><img src = "${conPath }/images/point_star_on.png" starScore="5" class = "starCheck">  / (<span class = "reviewScore">5</span>/5)점
									<br><br>
									<input type = "hidden" name ="rscore" class = "rscore" value = "5">				
								</td>						
							</tr>
							<tr></tr>
							<tr style = "text-align: left !important; padding-left: 20px;">
								<td colspan = "2">
									&nbsp;&nbsp;&nbsp;선택된 티켓 : ${originalTicket.otype eq 0? "자유이용권": "패스트패스" } / 성인: ${originalTicket.op1} 매, 청소년 : ${originalTicket.op2} 매									
									<c:if test = "${originalTicket.otype eq 1 }">
										/ 어트랙션 - ${originalTicket.oatname1 } / ${originalTicket.oatname2 } / ${originalTicket.oatname3 }
									</c:if>
									<br><br><br>
								</td>		
							</tr>
							<tr>
								<td style = "text-align: center; width: 100px;">																																																			
									<span>&nbsp;&nbsp;제목&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</td>
								<td>
									<input id="rtitle" name="rtitle" class = "writeInput" maxlength="30" tabindex="2" style = "width: 700px; height: 20px; margin-bottom: 10px;" 
									type="text" value = "${originalInfo.rtitle }">																			
								</td>
							</tr>								
							<tr>
								<td>
									&nbsp; &nbsp; 내용 
								</td>
								<td style = "padding-left: 25px; background-color: white; border-right: 1px solid gray;"><textarea cols="30" rows="15" maxlength="4000" name = "rcontent" id = "rcontent" >${originalInfo.rcontent }</textarea>																					
								</td>
							</tr>								
							<tr>
								<td style = "text-align: center;">
									사진<br>추가/변경<br><br>
								</td>									
								<td>
									<input type="text" class="rphoto" name = "rphoto" value = "${originalInfo.rphoto }" style="display: block; float: left; width:50%;"> &nbsp;
									<label for = "rphoto"><img src = "${conPath }/images/upload-1118929_640.png" style = "width: 25px;"></label> 										
									<input type = "file" name = "tempRphoto" id = "rphoto" onchange = "checkFileType(this)" style = "display: none;">																													
									<img id = "uploadedImg" height = "44px">
								</td>
							</tr>							
						</table>						
					</div>
				</div>
			</div>
		</div>								
	</section>
	<div class = "button-area" style = "text-align: center;">
		<input type = "submit" value = "글수정" style = "margin-left: 50px;"> 
		<input type = "button" value = "초기화" onclick = "location.reload(true);" style = "margin-left: 10px;"> 
		<input type = "button" value = "글목록" onclick = "location.href='${conPath }/review/reviewList.do'" style = "margin-left: 10px;">
	</div>
	<br><br><br>
</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>