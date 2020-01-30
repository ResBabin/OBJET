<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' 
	href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet"
	href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<c:import url="adminHeader.jsp" />

<style type="text/css">
#um {
	padding: 250px;
	padding-top: 0px;
	padding-bottom: 0px;
	font-family: 'Nanum Gothic'; 
}

table {
width: 100%;

}

th {
background: #f4f4f4;
}

td {
padding: 10px;
padding-left: 20px;
letter-spacing: 0.5pt;
}

#not{
padding: 15px; 
font-size: 13pt; 
font-weight: bold;
}
fieldset {
	border: 1px solid #aaa;
	border-radius: 5px;
	padding: 40px;
	padding-top: 20px;
	line-height: 30pt;
}
legend {
	font-weight: bold;
	font-size: 12.5pt;
	color: #777;
	letter-spacing: 1pt;
}

</style>
<script type="text/javascript">
$(function() {
	$("#btn2").click(function() {
		var con = confirm("답변을 작성하시겠습니까?");
		if(con){
			$("#answerform").submit();
		}
	});
});
</script>

</head>
<body>
<div style="background: black; height: 100px; margin-top: -15px; color: white; text-align: center; font-size: 20pt; padding: 30px;">1:1 문의</div>
	<div id="um" align="center">
		<div style="padding: 50px;" align="left">
			<fieldset><legend> &nbsp; 문의내역 &nbsp; </legend>
			<table>
			<tr><th width="80">분 &nbsp; 류</th><td width="300">${ question.qnatype }</td><th width="80">작성일</th><td width="300">${ question.questiondate }</td></tr>
			<tr><th>작성자</th><td colspan="3">${ question.userid }</td></tr>
			<tr><th >제 &nbsp; 목</th><td colspan="3">${ question.qnatitle }</td></tr>
			<tr><th>내 &nbsp; 용</th><td colspan="5">${ question.qnacontent }</td></tr>
			</table>
			</fieldset><br>
			<form action="qnaanswer.do" method="post" id="answerform">
			<fieldset><legend>&nbsp; 답변작성 &nbsp; </legend>
				<textarea rows="" cols="" id="editor2" name="qnaanswer"></textarea>
				<input type="hidden" name="adminid" value="${ sessionScope.loginUser.userid }">
				<input type="hidden" name="qnano" value="${ question.qnano }">
			</fieldset>
			</form>
			
			<c:url var="toqnam" value="qnam.do"/>
			<div align="right" style="margin-top: 20px; margin-right: 5px;">
				<button class="ui button icons" id="btn2">완료</button>
				&nbsp;
				<a href="${ toqnam }">
				<button class="ui button icon" id="btn3"><i class="list icon"></i></button>
				</a>
			</div>
		</div>
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/editor/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
 CKEDITOR.replace('editor2',{height: 400,  skin:'moono-lisa', filebrowserImageUploadUrl :'${pageContext.request.contextPath }/noticeFile.do'});
 </script>
 <c:import url="../footer.jsp"/>
</html>