<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 시맨틱유아이 cdn -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">  

<c:import url="adminHeader.jsp"/>

<style type="text/css">

#um{
padding: 300px;
padding-top: 50px;
padding-bottom: 50px;
}
#faqwriter{
border: none;
background: none;
width: 70px;
}
#faqtitle{
width: 715px;
}
</style>
<script type="text/javascript">
$(function() {
	$(".dropdown").dropdown({});
	
	$("#cancel").click(function() {
		var con = confirm("작성중인 게시글을 취소하시겠습니까?");
		if(con){
			location.href="faqm.do";
		}
	});
	
	$("#ok").click(function() {
		if($("#faqtype option:selected").val() == ""){
			alert("FAQ 분류를 선택하세요.");
			$("#faqtype").focus();
			return;
		}
		if($("input[name=faqtitle]").val() == "" || $("input[name=faqtitle]").val() == null){
			alert("FAQ 제목을 작성하세요.");
			$("input[name=faqtitle]").focus();
			return;
		}
		$("#faqform").submit();
	});
});
</script>
<meta charset="UTF-8">
<title>FAQ 작성</title>
</head>
<body>
<div style="background: black; height: 100px; margin-top: -15px; color: white; text-align: center; font-size: 20pt; padding: 30px;"> FAQ  </div>
<form action="faqinsert.do" method="post" enctype="multipart/form-data" id="faqform">
<div id="um" align="center">
<div align="left">
<div align="right">
<font style="font-weight: bolder;">작성자</font> &nbsp;&nbsp;&nbsp;<input type="text" value="${ loginUser.userid }" id="faqwriter" name="adminid" readonly="readonly">
<font style="font-weight: bolder;">작성일</font>&nbsp;&nbsp;&nbsp;<fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy / MM / dd"/>&nbsp;&nbsp; 
</div>
<hr color="#ccc" size="1"><br>
<select id="faqtype" class="ui dropdown" name="faqtype">
<option value="">분류 선택</option>
<option value="전시">전 시</option>
<option value="일반">일 반</option>
<option value="회원">회 원</option>
</select>&nbsp;&nbsp;
<div class="ui input">
<input type="text" placeholder="제목을 입력하세요." id="faqtitle" name="faqtitle">
</div><br><br>
</div>
<textarea rows="20" cols="100" placeholder="내용을 입력하세요."  id="editor2" name="faqcontent"></textarea>
<br>
<div align="right">
<button class="ui basic button" type="button" id="ok">완료</button> &nbsp;&nbsp;
<button class="ui basic button" type="button" id="cancel">취소</button>
</div>
</div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/editor/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
 CKEDITOR.replace('editor2',{height: 400,  skin:'moono-lisa', filebrowserImageUploadUrl :'${pageContext.request.contextPath }/noticeFile.do'});
 </script>
 <c:import url="../footer.jsp"/>
</body>
</html>