<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 등록 현황 관리</title>
<c:import url="adminHeader.jsp"/>
<style type="text/css">
#um {
	padding: 150px;
	padding-top: 40px;
	padding-bottom: 40px;
}
</style>
<script type="text/javascript">
</script>
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">


</head>
<body>
<div style="background: black; height: 100px; margin-top: -15px; color: white; text-align: center; font-size: 20pt; padding: 30px;">
총 후원수 ： ${ listCount } </div>
<div id="um">
<div align="right">

			<form action="supportSearchListm.do" method="get">
				<input type="submit" class="ui basic button" value="검색">
				<input type="hidden" name="currentPage" value="1">
				<div class="ui right action left icon input">
					<i class="search icon"></i>
					<input type="text" placeholder="검색어 입력" name="keyword" value="${keyword }"> 
					<select class="ui search dropdown" name="searchtype" id="searchtype" required>
						  <option value="sptno" <c:if test="${searchtype == 'sptno'}">selected</c:if>>후원고유번호</option>
						  <option value="sptid" <c:if test="${searchtype == 'sptid'}">selected</c:if>>후원자ID</option>
						  <option value="artistid" <c:if test="${searchtype == 'artistid'}">selected</c:if>>작가ID</option>
						  <option value="sptcomment" <c:if test="${searchtype == 'sptcomment'}">selected</c:if>>응원메시지</option>
						</select>&emsp;
				</div>
			</form>
			<div></div>
		</div>
		
<table class="ui sortable celled table selectable">
<thead>
<tr>
<th width="3%">번호</th>
<th width="10%">후원고유번호</th>
<th width="8%">후원자ID</th>
<th width="8%">작가ID</th>
<th width="5%">후원금액</th>
<th width="50%">응원메시지</th>
<th width="10%">후원일</th>
</tr>
</thead>
<tbody>

<c:forEach var="support" items="${ list }" varStatus="status">
<tr>
	<td>${(paging.listCount - status.index)-((paging.currentPage-1)*paging.limit)}</td>
	<td>${support.sptno}</td>
	<td>${support.sptid }</td>
	<td>${support.artistid }</td>
	<td>￦${support.sptamount }</td>
	<td>${support.sptcomment }</td>
	<td>${support.sptdate }</td>
</tr>
</c:forEach>
</tbody>
</table>

	<!-- 검색결과 리스트 끝! -->
	<br><br>
					<!--  페이징 -->
				<div align="center">
					<div id="paging">
					<c:if test="${!empty list }">
						 <c:if test="${ kind eq 'all' }"> 
							 <c:if test="${ paging.startPage != 1 }">
							 	<a href="supportListm.do?currentPage=${paging.startPage - 1}">이전</a>
							 </c:if>
							 
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="supportListm.do?currentPage=${num}">&emsp;
								<c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
								<c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
								</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="supportListm.do?currentPage=${paging.endPage + 1}">다음</a>
							</c:if>
						 </c:if> 

												
						<c:if test="${ kind eq 'search' }">
							<c:if test="${ paging.startPage != 1 }">
						 		<a href="supportSearchListm.do?&currentPage=${paging.startPage - 1}&searchtype=${searchtype}&keyword=${keyword}">이전</a>
							</c:if>
						
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="supportSearchListm.do?sptid=${loginUser.userid}&currentPage=${num}&searchtype=${searchtype}&keyword=${keyword}">&emsp;
								<c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
								<c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
								</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="supportSearchListm.do?sptid=${loginUser.userid}&currentPage=${paging.endPage + 1}&searchtype=${searchtype}&keyword=${keyword}">다음</a>
							</c:if>
						</c:if>
					</c:if>
					</div>
				</div>
			<!-- 페이징처리 끝 -->


</div>
<br><br><br>
<c:import url="../footer.jsp"/>
</body>
</html>