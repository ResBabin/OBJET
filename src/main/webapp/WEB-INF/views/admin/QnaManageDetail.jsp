<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 ${ qnamd.qnano }. ${ qnamd.qnatitle }</title>
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
	border: 1px solid #777;
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
</head>
<body>
	<div style="background: black; height: 100px; margin-top: -15px; color: white; text-align: center; font-size: 20pt; padding: 30px;">1:1 문의</div>
	<div id="um" align="center">
		<div style="padding: 50px;" align="left">
			<fieldset><legend> &nbsp; 문의내역 &nbsp; </legend>
			<table>
			<tr><th width="80">분 &nbsp; 류</th><td width="300">${ qnamd.qnatype }</td><th width="80">작성일</th><td width="300">${ qnamd.questiondate }</td></tr>
			<tr><th>작성자</th><td colspan="3">${ qnamd.userid }</td></tr>
			<tr><th >제 &nbsp; 목</th><td colspan="3">${ qnamd.qnatitle }</td></tr>
			<tr><th>내 &nbsp; 용</th><td colspan="5">${ qnamd.qnacontent }</td></tr>
			</table>
			</fieldset><br>
			<fieldset><legend>&nbsp; 답변내역 &nbsp; </legend>
			<table>
			<tr><th width="80">관리자</th><td width="300">${ qnamd.adminid }</td><th width="80">답변일</th><td width="300">${ qnamd.answerdate }</td></tr>
			<tr><th>내 &nbsp; 용</th><td colspan="3">${ qnamd.qnaanswer }</td></tr>
			</table>
			</fieldset>
			
			<c:url var="toqnam" value="qnam.do"/>
			<div align="right" style="margin-top: 20px; margin-right: 5px;">
				<a href="${ toqnam }">
				<button class="ui button icon" id="btn3">
					<i class="list icon"></i>
				</button>
				</a>
			</div>
		</div>
	</div>
	<c:import url="../footer.jsp"/>
</body>
</html>