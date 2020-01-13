<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
</head>
<body>
<div class="main">

<!-- 타이틀 -->
<h2 class="listfont">공지사항 작성</h2>
<!-- //타이틀 -->

<div class="notice_box">
<form action="insertNoticeWrite.do" enctype="multipart/form-data"  method="post"> 
<table>

<tr>
<td><p class="ptitle">제목</p></td>
<td><input type="text" name="noticetitle" required></td>
</tr>
<tr>
<td><p class="padmin"></p></td>
<td><input type="hidden" name="adminid"></td>
</tr> 

<tr>
<td><p class="padmin"></p></td>
<td><input type="hidden" name="noticetype"></td>
</tr> 



<!-- <tr>
<td><p class="psimg">첨부파일</p></td>
<td><input  type="file" multiple="multiple" name="noticeofile" required></td>
</tr>  -->

<tr>
<td><p class="ptext">내용</p></td>
<td>
<div class="text_editor">
<textarea id="editor2" name="noticecontent" required></textarea>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/editor/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
 CKEDITOR.replace('editor2'
                , {height: 500,
                	 filebrowserImageUploadUrl :'${pageContext.request.contextPath }/noticeFile.do'
                		
                	
 });


</script> 
<script type="text/javascript">
/* if(CKEDITOR.instances.editor2.getData().length < 1){
	alert("내용을 입력해 주세요.");
	return;
} */
</script>
</div>
</td>
</tr>

<tr>
<td></td>
<td><input type="submit" value="확인"></td>
</tr>



</table>


</form>
</div>

</div><!-- //main -->


</body>
</html>