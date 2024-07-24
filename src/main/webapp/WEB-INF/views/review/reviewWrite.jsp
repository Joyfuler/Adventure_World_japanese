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
<c:if test = "${not empty param.loginResult }">
 <script>
 	alert('${param.loginResult}');
 </script>
</c:if>
<body>
<jsp:include page="../main/header.jsp"/>
<form action = "${conPath }/review/reviewWrite.do" method="post" id = "writeForm" enctype = "multipart/form-data">
	<section class="notice">
  	<div class="page-title">
        <div class="write_title">
            <h2 style = "text-align: center;">
            	<b>&nbsp; アドベンチャーワールドのレビュー投稿</b>
            </h2>         
        </div>
  </div>  
  <div id="contents" style = "background-color: #DCEBFC; color: #212529; width: 1200px; margin-left: 15px; margin: 0 auto;">
		<div class="article">						
			<div class="gray_frame">
				<input type = "hidden" name = "mid" value = "${member.mid }">							
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
								&nbsp;&nbsp;&nbsp;評価 : <img src = "${conPath }/images/point_star_on.png" starScore = "1" class = "starCheck"><img src = "${conPath }/images/point_star_on.png" starScore = "2" class = "starCheck"><img src = "${conPath }/images/point_star_on.png" starScore = "3" class = "starCheck"><img src = "${conPath }/images/point_star_on.png" starScore="4" class = "starCheck"><img src = "${conPath }/images/point_star_on.png" starScore="5" class = "starCheck">  / (<span class = "reviewScore">5</span>/5)点<br><br>
								<input type = "hidden" name ="rscore" class = "rscore" value = "5">				
							</td>						
						</tr>
						<tr></tr>
						<tr style = "text-align: left !important; padding-left: 20px;">
							<td colspan = "2">
								&nbsp;&nbsp;&nbsp;チケットの選択&nbsp;&nbsp;&nbsp;&nbsp;
								<select name = "odid" id = "odidSelect" style = "margin-left: 20px;">				
									<c:if test = "${availableList.size() eq 0 }">
										<option value = "1"> 購買したチケットがありません
									</c:if>
									<c:if test = "${avaliableList.size() ne 0 }">							
										<c:forEach var = "lists" items="${availableList }">											
											<c:choose>
												<c:when test = "${lists.review eq 'N' }">
													<option value = "${lists.odid }" data-review = "${lists.review }" style = "color: blue;"> ${lists.otype eq 0? 'フリ‐パス' : 'ファストパス' } ( 来場日付 : ${lists.ovisitdate } / レビューの作成履歴: なし
												</c:when>
												<c:otherwise>
													<option value = "${lists.odid }" data-review = "${lists.review }" style = "color: red;"> ${lists.otype eq 0? 'フリ‐パス' : 'ファストパス' } ( 来場日付 : ${lists.ovisitdate } / レビューの作成履歴: あり
												</c:otherwise>
											</c:choose>					
											<c:if test = "${lists.otype eq 1 }">
												/ アトラクション - ${lists.oatname1 } / ${lists.oatname2 } / ${lists.oatname3 }
											</c:if>
											)																																
										</c:forEach>
									</c:if>																			
								</select>
								<br>
								&nbsp; &nbsp; <span style = "color:red; text-align: center; font-size: 12px;">※チケットを選択していないか、該当のチケットのレビューの作成履歴が既に存在している場合、ポイントは獲得されません。</span>
								<input type = "hidden" id = "pointObtained" name = "pointObtained" value = "Y">
								<br><br>
								</td>		
							</tr>
							<tr>
								<td style = "text-align: center; width: 100px;">																																																			
									<span style = "font-size: 15px;">&nbsp;&nbsp;タイトル&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</td>
								<td>
									<input id="rtitle" name="rtitle" class = "writeInput" maxlength="100" tabindex="2" style = "width: 700px; height: 20px; margin-bottom: 10px;" 
									type="text">																			
								</td>
							</tr>								
							<tr>
								<td>
									&nbsp; &nbsp; 内容 
								</td>
								<td style = "padding-left: 25px; background-color: white; border-right: 1px solid gray;">
									<textarea cols="30" rows="15" maxlength="4000" name = "rcontent" id = "rcontent"></textarea>																					
								</td>
							</tr>								
							<tr>
								<td style = "text-align: center;">
									写真の<br>追加<br><br>
								</td>									
								<td>
									<input type="text" class="rimg" style="display: block; float: left; width:50%;"> &nbsp;
									<input type = "file" name = "tempRphoto" id = "rimg" onchange = "checkFileType(this)">
									<input type = "file" name = "temprimg" style = "display: none;">																			
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
	<input type = "submit" value = "レビュー投稿" style = "margin-left: 50px;"> 
	<input type = "button" value = "初期化" onclick = "location.reload(true);" style = "margin-left: 10px;"> 
	<input type = "button" value = "リストへ" onclick = "location.href='${conPath }/review/reviewList.do'" style = "margin-left: 10px;">
</div>
<br><br><br>
</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>