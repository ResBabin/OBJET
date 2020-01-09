<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#um {
	padding: 150px;
	padding-top: 80px;
}
</style>

<c:import url="adminHeader.jsp"/>

</head>
<body>
<div id="um">

<h4 class="ui header">
공지사항 : ${ noticelist.size() }
</h4>

<table class="ui sortable celled table selectable">
<thead>
<tr>
<th width="80">첨부파일</th>
<th width="100">번호</th>
<th>관리자ID</th>
<th>분류</th>
<th>제목</th>
<th>작성일</th>
</tr>
</thead>
<tbody>
<c:forEach var="noticem" items="${ noticelist }">
<c:url var="noticemd" value="noticemd.do">
	<c:param name="noticeno" value="${ noticem.noticeno }"/>
</c:url>
<tr>
<td>
<c:if test="${ !empty noticem.noticeofile1 and !empty noticem.noticeofile2 and !empty noticem.noticeofile3 }">
	<i class="paperclip grey icon"></i> 
</c:if>
</td>
<td>${ noticem.noticeno }</td>
<td>${ noticem.adminid }</td>
<td>${ noticem.noticetype }</td>
<td><a href="${ noticemd }">${ noticem.noticetitle }</a></td>
<td>${ noticem.noticedate }</td>
</tr>
</c:forEach>
</tbody>
</table>
<div align="center">
		<div class="ui pagination menu">
			<a class="item"> <i class="angle double left icon"></i></a>
			<a class="item"> <i class="angle left icon"></i> </a>
			<a class="item"> 1 </a>
			<div class="disabled item">...</div>
			<a class="item active"> 10 </a> <a class="item"> 11 </a> <a
				class="item"> 12 </a>
			<a class="item"> <i class="angle right icon"></i></a>
			<a class="item"> <i class="angle double right icon"></i></a>
		</div>
		</div>
</div>
</body>
</html>