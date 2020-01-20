<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 ${ noticemd.noticeno }. ${ noticemd.noticetitle }</title>
<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<c:import url="adminHeader.jsp" />
<style type="text/css">

#um {
	padding: 290px;
	padding-top: 0px;
	padding-bottom: 20px;
	font-family: 'Nanum Gothic'; 
	background: white;
}

table {
	border-collapse: collapse;
	border: none;
	line-height: 30px;
	width: 800px;
	box-shadow: 3px 3px 0px #77777777;
}

th, td {
	border: solid 1px #777;
	opacity: 0.9;
	padding: 8px;
	color: #333;
}

th {
	background: #f0f0f0;
} 

#btn2 {
	background: #ddd;
	color: black;
	font-size: 10pt;
	padding: 12px;
}

/* #btn3 {
	background: #eceadf;
	color: #531;
	font-size: 10pt;
	padding: 12px;
} */

#btn2:hover {
	background: #aaa;
}
#not{
padding: 15px; 
font-size: 13pt; 
font-weight: bold;
}
</style>
<script type="text/javascript">
$(function() {
	$("#btndel").click(function() {
		
		var delcon = confirm("해당 공지사항을 삭제하시겠습니까?");
		if(delcon){
		$("#delform").submit();
		}
	});
	$("#btnmod").click(function() {
		$("#modform").submit();
	});
});
</script>
</head>
<body> 
<div style="background: black; height: 100px; margin-top: -15px; color: white; text-align: center; font-size: 20pt; padding: 30px; font-family: 'Nanum Gothic' ;">
공지사항</div>
<div></div>
	<div id="um" align="center">
	
 		<div style="padding: 50px;" align="center">
			<table id="nod">
				<tbody align="center">
			<!-- 	<tr><th colspan="4" id="not">공지사항</th></tr> -->
					<tr>
						<th width="150" align="center" id="aaa">분류
						<td width="200">${ noticemd.noticetype }</td>
						<th width="150">번호
						<td width="200">${ noticemd.noticeno }</td>
					</tr>
					<tr>
						<th align="center">작성자
						<td>${ noticemd.adminid }</td>
						<th align="center">작성일
						<td>${ noticemd.noticedate }</td>
					</tr>
					<tr>
					<c:url var="down" value="noticefdown.do">
<c:param name="fname" value="${ noticemd.noticerfile }"/>
<c:param name="oname" value="${ noticemd.noticeofile }"/>
</c:url>
						<th align="center">첨부파일
						<td colspan="3" style="text-align: left; padding-left: 20px;">
<c:if test="${ empty noticemd.noticeofile }">첨부파일 없음</c:if>
<c:if test="${ !empty noticemd.noticeofile }"><a href="${ down }">${ noticemd.noticeofile }</a></c:if>&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<th align="center">제목
						<td colspan="3" style="text-align: left; padding-left: 20px;">${ noticemd.noticetitle }</td>
					</tr>
					<tr>
						<th height="300" align="center" id="bbb">내용
						<td colspan="3" valign="top" 
						 	style="padding: 20px; text-align: left;">${ noticemd.noticecontent }</td>
					</tr>
				</tbody>
			</table>

			<c:url var="noticemdp" value="noticemd.do">
				<c:param name="noticeno" value="${ prevnotice.noticeno }" />
			</c:url>
			<c:url var="noticemdn" value="noticemd.do">
				<c:param name="noticeno" value="${ nextnotice.noticeno }" />
			</c:url>
			<br>
			<table>
				<c:if test="${ empty prevnotice }">
					<tr>
						<th width="170">이전 글</th>
						<td>&nbsp;&nbsp;&nbsp;이전 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ !empty prevnotice }">
					<tr>
						<th width="170">이전 글</th>
						<td>&nbsp;&nbsp;&nbsp;<a href="${ noticemdp }">${ prevnotice.noticeno } : ${ prevnotice.noticetitle } </a></td>
					</tr>
				</c:if>
				<c:if test="${ empty nextnotice }">
					<tr>
						<th>다음 글</th>
						<td>&nbsp;&nbsp;&nbsp;다음 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ !empty nextnotice }">
					<tr>
						<th>다음 글</th>
						<td>&nbsp;&nbsp;&nbsp;<a href="${ noticemdn }">${ nextnotice.noticeno} : ${ nextnotice.noticetitle }</a></td> 
					</tr>
				</c:if>
			</table>
			<c:url var="tonoticem" value="noticem.do"/>
			<div align="right" style="margin-top: 20px; margin-right: 5px;">
			<form action="delNoticedAd.do" method="post" id="delform">
				<input type="hidden" name="noticeno" value="${ noticemd.noticeno }">
			</form>
			<form action="noticeModifyPageAd.do" method="get" id="modform">
				<input type="hidden" name="noticeno" value="${ noticemd.noticeno }">
			</form>
				<button class="ui button icons" id="btndel">삭제</button>	&nbsp;
				<button class="ui button icons" id="btnmod">수정</button>
				&nbsp;
				<a href="${ tonoticem }">
				<button class="ui button icon" id="btn3">
					<i class="list icon"></i>
				</button>&nbsp;&nbsp;
				</a>
			</div>
			
		</div></div>
		
		
</body>
<c:import url="../footer.jsp"/>
</html>