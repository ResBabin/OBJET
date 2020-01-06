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
공지사항 : ${ faqlist.size() }
</h4>

<table class="ui sortable celled table selectable">
<thead>
<tr>
<th width="100" id="thth">번호</th>
<th id="thth">관리자ID</th>
<th id="thth">분류</th>
<th id="thth">제목</th>
</tr>
</thead>
<tbody>
<c:forEach var="faqm" items="${ faqlist }">
<c:url var="faqmd" value="faqmd.do">
	<c:param name="faqno" value="${ faqm.faqno }"/>
</c:url>
<tr>
<td>${ faqm.faqno }</td>
<td>${ faqm.adminid }</td>
<td>${ faqm.faqtype }</td>
<td><a href="${ faqmd }">${ faqm.faqtitle }</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</body>
</html>