<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNAを作成</title>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
$(document).ready(function(){
   $('form').submit(function(){
      var qtitle = $('input[name="qtitle"]');
      var qcontent = $('textarea[name="qcontent"]');
      let chkCnt = 0;// chkCnt 초기값 0 설정
      var chkBox = $('input[name="check"]');
      var qpw = $('input[name="qpw"]');
      if(!qtitle.val()){
         alert('タイトルを入力してください');
         qtitle.focus();
         return false;
      }else if(!qcontent.val()){
         alert('内容は必須項目です');
         qcontent.focus();
         return false;
      }else if(chkBox.prop("checked")){
         if(!qpw.val()){
            alert("パスワードを入力してください");
            qpw.focus();
            return false;
         }
      }
   });
});
</script>
<script>
function enabled1() {
   if(document.qna.check.checked==true) {
      document.qna.qpw.disabled = false;
   } else {
      document.qna.qpw.disabled = true;
      document.qna.qpw.value="";
   }
}

</script>
</head>
<body>
 <jsp:include page="../main/header.jsp"/>
<article>
<c:if test="${empty member }"> 
	<script>
	   alert('ログイン後、QNAを投稿できます');
	   location.href = '${conPath}/member/loginMember.do?next=qna/qnaWriteForm.do';
	</script>
</c:if>
	<div class="qna">
	      <div class="qnaimg" style="background-image:url('${conPath}/images/qnaaa.png');"></div>
	  	  <div class="qnaBox">
		      <h2> お問い合わせ </h2>
		      <h3>お客様のお問い合わせに何でもお答えします</h3>
		      <form action="${conPath }/qna/qnaWrite.do" class="fix02" name="qna"  method="post">
		         <input type="hidden" name="command" value="qnaWrite">
		         <input type="hidden" name="mid" value="${member.mid }">
		         <c:if test="${not empty worker }">
		         	<!--  <input type="hidden" name="mid" value="one"> -->
		         </c:if>
		          <table class="fix03">
		             <tr>
		                <th>Secret mode</th>
		                <td>   
		                   <input type="checkbox" name="check" value="secret" onchange="enabled1()">
		                      &nbsp;パスワードを設定&nbsp;&nbsp;
		                   <input type="password" name="qpw" id="pass" size="15" 
		                    style= "background: lightgray;" disabled="disabled">
		               </td>
		             </tr>
		            <tr>
		               <th>タイトル</th>
		               <td width="500" style="text-align:left;">
		                  <input type="text" name="qtitle" size="50" autofocus="autofocus">
		               </td>
		            </tr>
		            <tr>
		               <th>内容</th>
		               <td align="left" style="text-align:left;font-size:115%;">
		               
		               <textarea id="summernote" name="qcontent"></textarea>
		               </td>
		            </tr>
		          </table>
				<br>
			      <div class="buttons">
			         <input type="submit" value="投稿" class="purpleBtn" style="border:none;" > 
			         <input type="reset" value="キャンセル" class="purpleBtn" style="border:none;"  
			            onclick="location.href='${conPath}/qna/qnaList.do'">
			      </div>
		      	<br>
		      </form>
	   </div>
	</div>
</article>
 <jsp:include page="../main/footer.jsp"/>
 </body>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
	 $(document).ready(function() {
		 $('#summernote').summernote({
		        height: 150,
		        minHeight: null,
		        maxHeight: null,
		        lang : 'ko-KR',
		        onImageUpload: function(files, editor, welEditable) {
		                sendFile(files[0], editor, welEditable);
		            }

		    });
	 });
</script>
</html>