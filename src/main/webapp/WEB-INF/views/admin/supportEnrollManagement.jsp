<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 등록 현황 관리</title>
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
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


</head>
<body>
<div style="background: black; height: 100px; margin-top: -15px; color: white; text-align: center; font-size: 20pt; padding: 30px;">
등록회원 ： ${ listCount } </div>
<br>
<div id="um">
<div align="right">
			<form action="supportEnrollSearchListm.do" method="get">
				
				<div class="ui right action left icon input">
					<i class="search icon"></i>
					<input type="text" placeholder="아이디 검색" name="artistid" value="${artistid }"> 
					<input type="hidden" name="currentPage" value="1">
				</div>
				<input type="submit" class="ui basic button" value="검색">
			</form>
		</div>

<br>	
<table class="ui sortable celled table selectable">
<thead>
<tr>
<th width="10%">번호</th>
<th width="40%">등록 아이디</th>
<th width="20%">등록일</th>
<th width="20%">수정일</th>
<th width="10%">파일여부</th>
</tr>
</thead>
<tbody>

<c:forEach var="support" items="${ list }" varStatus="status">
<tr>
	<td>${(paging.listCount - status.index)-((paging.currentPage-1)*paging.limit)}</td>
	<td><a href="supportenrollListdetailm.do?artistid=${support.artistid }">${ support.artistid }</a></td>
	<td>${ support.sptapplydate }</td>
	<td>${ support.sptmodifydate }</td>
	<td style="text-align: center;"><c:if test="${ !empty support.artistrfile }"><i class="paperclip grey icon"></i></c:if></td>
</tr>
</c:forEach>
</tbody>
</table>

<br>
<!-- 검색결과 리스트 끝! -->
	<br><br>
					<!--  페이징 -->
				<div align="center">
					<div id="paging">
					<c:if test="${!empty list }">
						 <c:if test="${ kind eq 'all' }"> 
							 <c:if test="${ paging.startPage != 1 }">
							 	<a href="supportEnrollListm.do?currentPage=${paging.startPage - 1}">이전</a>
							 </c:if>
							 
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="supportEnrollListm.do?currentPage=${num}">&emsp;
								<c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
								<c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
								</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="supportEnrollListm.do?currentPage=${paging.endPage + 1}">다음</a>
							</c:if>
						 </c:if> 

												
						<c:if test="${ kind eq 'search' }">
							<c:if test="${ paging.startPage != 1 }">
						 		<a href="supportEnrollSearchListm.do?artistid=${artistid}&currentPage=${paging.startPage - 1}">이전</a>
							</c:if>
						
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="supportEnrollSearchListm.do?artistid=${artistid}&currentPage=${num}">&emsp;
								<c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
								<c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
								</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="supportEnrollSearchListm.do?artistid=${artistid}&currentPage=${paging.endPage + 1}">다음</a>
							</c:if>
						</c:if>
					</c:if>
					</div>
				</div>
			<!-- 페이징처리 끝 -->
		</div>
	

<br><br><br><br><br><br><br>
<c:import url="../footer.jsp"/>
</body>
</html>