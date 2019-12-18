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
	padding: 350px;
	padding-top: 150px;
	padding-bottom: 150px;
	font-family: 'Nanum Gothic';
}

table {
	border-collapse: collapse;
	border: none;
	line-height: 30px;
	width: 700px;
}

th, td {
	border: solid 1px #ba9;
	opacity: 0.9;
	padding: 8px;
	color: #420;
}

th {
	background: #f5f4ef;
}

#btn2 {
	background: #ddd;
	color: black;
	font-size: 10pt;
	padding: 12px;
}

#btn3 {
	background: #eceadf;
	color: #531;
	font-size: 10pt;
	padding: 12px;
}

#btn2:hover {
	background: #aaa;
}

#btn3:hover {
	background: #e8e4d1;
}
</style>
</head>
<body>
	<div id="um">
		<div style="padding: 50px;" align="center">
			<table id="nod">
				<tbody align="center">
					<tr>
						<th width="150" align="center" id="aaa">분류
						</td>
						<td width="200">${ noticemd.noticetype }</td>
						<th width="150">번호
						</td>
						<td width="200">${ noticemd.noticeno }</td>
					</tr>
					<tr>
						<th align="center">작성자
						</td>
						<td>${ noticemd.adminid }</td>
						<th align="center">작성일
						</td>
						<td>${ noticemd.noticedate }</td>
					</tr>
					<tr>
						<th align="center">제목
						</td>
						<td colspan="3" style="text-align: left; padding-left: 20px;">${ noticemd.noticetitle }</td>
					</tr>
					<tr>
						<th height="500" align="center" id="bbb">내용
						</td>
						<td colspan="3" valign="top"
							style="padding: 20px; text-align: left;">${ noticemd.noticecontent }</td>
					</tr>
				</tbody>
			</table>
			<div align="right" style="margin-top: 20px; margin-right: 5px;">
				<button class="ui button icons" id="btn2">삭제</button>
				&nbsp;
				<button class="ui button icons" id="btn2">수정</button>
				&nbsp;
				<button class="ui button icon" id="btn3">
					<i class="list icon"></i>
				</button>
			</div>
			<c:url var="noticemdp" value="noticemd.do">
				<c:param name="noticeno" value="${ noticemd.noticeno -1 }" />
			</c:url>
			<c:url var="noticemdn" value="noticemd.do">
				<c:param name="noticeno" value="${ noticemd.noticeno +1 }" />
			</c:url>
			<br>
			<table>
			<c:if test="${ noticemd.noticeno eq 1 }">
			<tr><th width="150">이전 글</th><td>이전 글이 없습니다.</td></tr>
			</c:if>
			<c:if test="${ noticemd.noticeno ne 1 }">
			<tr><th width="150">이전 글</th><td> <a href="${ noticemdp }">${ noticelist.get(noticemd.noticeno -1).noticetitle }</a></td></tr>
			</c:if>
			<c:if test="${ noticemd.noticeno eq noticelist.size() }">
			<tr><th width="150">다음 글</th><td>다음 글이 없습니다.</td></tr>
			</c:if>
			<c:if test="${ noticemd.noticeno ne noticelist.size() }">
			<tr><th width="150">다음 글</th><td> <a href="${ noticemdn }">${ noticelist.get(noticemd.noticeno +1).noticetitle }</a></td></tr>
			</c:if>
 			</table>
 
		</div>
	</div>
</body>
</html>