<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 관리</title>

<style type="text/css">
#um {
	padding: 150px;
	padding-top: 80px;
	padding-bottom: 80px;
}
</style>

<c:import url="adminHeader.jsp"/>

<script type="text/javascript">
$(function() {
	$('.dropdown').dropdown({});
	$("input[name=userid]").hide();
	
	$("#searchuserid").click(function() { 
	$("input[name=qnatitle]").hide();
	$("input[name=qnatitle]").val("");
	$("input[name=userid]").show();
	});
	$("#searchtitle").click(function() {
	$("input[name=userid]").hide();
	$("input[name=userid]").val("");
	$("input[name=qnatitle]").show();
	});
});

</script>
</head>
<body>
<div id="um">

<h4 class="ui header">
1:1문의 : ${ qnalist.size() }
</h4>
<div align="right">
	<c:url value="qnam.do" var="qnauri">
	<c:if test="${ !empty qnaanswertype }"><c:param value="${ qnaanswertype }" name="qnaanswertype" /></c:if>
	<c:if test="${ !empty qnatitle }"><c:param value="${ qnatitle }" name="qnatitle" /></c:if>
	<c:if test="${ !empty userid }"><c:param value="${ userid }" name="userid" /></c:if>
	<c:if test="${ !empty qnatype and qnatype.length() eq 1 }"><c:param value="${ qnatype }" name="qnatype" /></c:if>
	<c:param name="page" value="1"/>
	</c:url>
			<form action="qnam.do" method="get">
				<input type="submit" class="ui basic button" value="검색">
				<div class="ui right action left icon input">
					<i class="search icon"></i>
					<input type="search" placeholder="제목 검색" name="qnatitle"> 
					<input type="search" placeholder="회원 검색" name="userid"> 
					<input type="hidden" value="1" name="page">
					<input type="hidden" value="" name="noticetype">
					<div class="ui basic floating dropdown button">
						<div class="text">제 목</div>
						<i class="dropdown icon"></i>
						<div class="menu">
							<div class="item" id="searchtitle">제 목</div>
							<div class="item" id="searchuserid">회 원</div>
						</div>
					</div>
				</div>
			</form>
			<div></div>
		</div>
		<div class="ui small basic buttons">
				<a href="${ qnauri }"><div class="ui button order" id="allbtn">전체</div></a>
				<a href="${ qnauri }&qnatype=전시"><div class="ui button order" id="exbtn">전시</div></a>
				<a href="${ qnauri }&qnatype=일반"><div class="ui button order" id="norbtn">일반</div></a>
				<a href="${ qnauri }&qnatype=회원"><div class="ui button order" id="userbtn">회원</div></a>
			</div>&nbsp;&nbsp;
		<div class="ui small basic buttons">
				<a href="qnam.do?qnaanswertype=미답변&page=1"><div class="ui button order" id="allbtn">답변미완</div></a>
				<a href="qnam.do?qnaanswertype=답변완료&page=1"><div class="ui button order" id="userbtn">답변완료</div></a>
			</div>
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
<th>답변여부</th>
</tr>
</thead>
<tbody>
<c:forEach var="qnam" items="${ qnalist }">
<c:url var="qnamd" value="qnamd.do">
	<c:param name="qnano" value="${ qnam.qnano }"/>
</c:url>
<c:url var="qnaanswer" value="moveanswer.do">
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
<c:if test="${ !empty qnam.answerdate }">
<td><a href="${ qnamd }">${ qnam.qnatitle }</a></td>
</c:if>
<c:if test="${ empty qnam.answerdate }">
<td><a href="${ qnaanswer }">${ qnam.qnatitle }</a></td>
</c:if>
<td>${ qnam.questiondate }</td>
<td>${ qnam.adminid }</td>
<td>${ qnam.answerdate }</td>
<td>${ qnam.qnaanswertype }</td>
</tr>
</c:forEach>
</tbody>
</table>
<br>
<div align="center">

		<div class="ui pagination menu"  id="pagingdiv">
		<c:if test="${ currentPage eq 1 }">
		<a href="/objet/qnam.do?page=1" class="disabled item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne 1 }">
		<a href="/objet/qnam.do?page=1" class="item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ beginPage - 10 < 1 }">
		<c:if test="${ currentPage eq 1 }"><a href="/objet/qnam.do?page=1" class="disabled item"><i class="angle left icon"></i></a></c:if>
		<c:if test="${ currentPage ne 1 }"><a href="/objet/qnam.do?page=1" class="item"><i class="angle left icon"></i></a></c:if>
		</c:if>
		<c:if test="${ beginPage - 10 >= 1 }">
		<a href="/objet/qnam.do?page=${ currentPage }" class="item"><i class="angle left icon"></i></a>
		</c:if>
		<c:forEach begin="${ beginPage }" end="${ endPage }" var="p">
		<c:if test="${ p eq currentPage }">
		<a href="/objet/qnam.do?page=${ p }" class="active item">${ p }</a> 
		</c:if>
		<c:if test="${ p ne currentPage }">
 		<a href="/objet/qnam.do?page=${ p }" class="item">${ p }</a> 
		</c:if>
		</c:forEach>
		<c:if test="${  endPage + 10 > maxPage }">
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/qnam.do?page=${ maxPage }" class="disabled item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/qnam.do?page=${ maxPage }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		</c:if>
		<c:if test="${ endPage + 10 <= maxPage }">
		<a href="/objet/qnam.do?page=${ endPage + 10 }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/qnam.do?page=${ endPage }" class="disabled item"><i class="angle double right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/qnam.do?page=${ endPage }" class="item"><i class="angle double right icon"></i></a>
		</c:if>
	</div>
	</div>
</div>
<c:import url="../footer.jsp"/>
</body>
</html>