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
공지사항 : ${ qnalist.size() }
</h4>

<table class="ui sortable celled table selectable">
<thead>
<tr>
<th width="80">첨부파일</th>
<th width="100">번호</th>
<th>분류</th>
<th>회원ID</th>
<th>제목</th>
<th>문의 작성일</th>
<th>관리자ID</th>
<th>답변 작성일</th>
</tr>
</thead>
<tbody>
<c:forEach var="qnam" items="${ qnalist }">
<c:url var="qnamd" value="qnamd.do">
	<c:param name="qnano" value="${ qnam.qnano }"/>
</c:url>
<tr>
<td>
<c:if test="${ !empty qnam.qnaofile }">
	<i class="paperclip grey icon"></i> 
</c:if>
</td>
<td>${ qnam.qnano }</td>
<td>${ qnam.qnatype }</td>
<td>${ qnam.userid }</td>
<td><a href="${ qnamd }">${ qnam.qnatitle }</a></td>
<td>${ qnam.questiondate }</td>
<td>${ qnam.adminid }</td>
<td>${ qnam.answerdate }</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</body>
</html>