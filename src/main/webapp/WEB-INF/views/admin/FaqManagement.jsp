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
	padding-bottom: 80px;
}
</style>

<c:import url="adminHeader.jsp"/>

</head>
<body>
<div id="um">

<h4 class="ui header">
FAQ : ${ faqlist.size() }
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
<br><br>
<div align="center">
		<div class="ui pagination menu"  id="pagingdiv">
		<c:if test="${ currentPage eq 1 }">
		<a href="/objet/faqm.do?page=1" class="disabled item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne 1 }">
		<a href="/objet/faqm.do?page=1" class="item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ beginPage - 10 < 1 }">
		<c:if test="${ currentPage eq 1 }"><a href="/objet/faqm.do?page=1" class="disabled item"><i class="angle left icon"></i></a></c:if>
		<c:if test="${ currentPage ne 1 }"><a href="/objet/faqm.do?page=1" class="item"><i class="angle left icon"></i></a></c:if>
		</c:if>
		<c:if test="${ beginPage - 10 >= 1 }">
		<a href="/objet/faqm.do?page=${ currentPage }" class="item"><i class="angle left icon"></i></a>
		</c:if>
		<c:forEach begin="${ beginPage }" end="${ endPage }" var="p">
		<c:if test="${ p eq currentPage }">
		<a href="/objet/faqm.do?page=${ p }" class="active item">${ p }</a> 
		</c:if>
		<c:if test="${ p ne currentPage }">
 		<a href="/objet/faqm.do?page=${ p }" class="item">${ p }</a> 
		</c:if>
		</c:forEach>
		<c:if test="${  endPage + 10 > maxPage }">
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/faqm.do?page=${ maxPage }" class="disabled item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/faqm.do?page=${ maxPage }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		</c:if>
		<c:if test="${ endPage + 10 <= maxPage }">
		<a href="/objet/faqm.do?page=${ endPage + 10 }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/faqm.do?page=${ endPage }" class="disabled item"><i class="angle double right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/faqm.do?page=${ endPage }" class="item"><i class="angle double right icon"></i></a>
		</c:if>
	</div>
	</div>
</div>
<c:import url="../footer.jsp"/>
</body>
</html>