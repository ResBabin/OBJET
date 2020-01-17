<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineN", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 후원 내역</title>
<c:import url="../header.jsp" />
<c:import url="../headerSearch.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript">

 </script>
</head>

<body>

<div class="wrapSupportList">

<p style="font-size: 20pt; color:#373737; text-align:center;">보낸 후원 내역</p>

	<!-- 검색창시작 -->
		<div align="center">
			<div class="objetSearchBox" style="height: 80px;">
				<div align="center">
				<form action="moveSendSupportSearch.do" method="post">
				<input type="hidden" name="sptid" value="${loginUser.userid }">
				<input type="hidden" name="currentPage" value="1">
					<select class="ui search dropdown" name="searchtype" id="searchtype" required>
							  <option value="m.sptno">후원고유번호</option>
							  <option value="u.nickname">후원작가</option>
							  <option value="m.sptamount">후원금액</option>
							</select>&ensp;
						<div class="ui input"><input type="text" name="keyword" style="width:300px; height:35px;"></div>&emsp;&emsp;
						<input type="button" class="mainBtn" value="검색">
				</form>
				</div>
			</div>
		</div>
		<!-- 검색창 끝 -->
		
		<!-- 검색 결과 리스트 시작! -->
	<div class="objetListSection2">
		<div align="left" style="font-size: 10pt; color:black">총 <span style="font-weight: 700;">${fn:length(sendlist)}</span>건</div><br>
		<table class="supportListTable">
			<tr>
				<th style="width:4%">No.</th>
				<th style="width:12%">후원고유번호</th>
				<th style="width:12%">후원작가</th>
				<th style="width:10%">후원금액</th>
				<th style="width:50%; text-align: left;">응원메시지</th>
				<th style="width:7%">후원일</th>
			</tr>
			<c:if test="${!empty sendlist }">
			<c:forEach var="list" items="${sendlist}" varStatus="status">
			<tr>
				<td>${(paging.listCount - status.index)-((paging.currentPage-1)*paging.limit)}</td>
				<td>${list.sptno}</td>
				<td>${list.artistnickname }</td>
				<td>￦${list.sptamount }</td>
				<td style="text-align: left;">${list.sptcomment}</td>
				<td>${list.sptdate }</td>
			</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty sendlist }">
			<tr>
				<td colspan="6">후원 내역이 없습니다.</td>
			</tr>
			</c:if>
		</table>
	</div>
	<!-- 검색결과 리스트 끝! -->
	
					<!--  페이징 -->
				<div align="center">
					<div id="paging">
					<c:if test="${!empty sendlist }">
						 <c:if test="${ kind eq 'all' }"> 
							 <c:if test="${ paging.startPage != 1 }">
							 	<a href="moveSendSupport.do?sptid=${loginUser.userid}&currentPage=${paging.startPage - 1}">이전</a>
							 </c:if>
							 
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="moveSendSupport.do?sptid=${loginUser.userid}&currentPage=${num}">&emsp;
								<c:if test="${ paging.currentPage == num }"><span class="ui teal circle label">${num}</span></c:if>
								<c:if test="${ paging.currentPage != num }"><span class="ui grey circle label">${num}</span></c:if>
								</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="moveSendSupport.do?sptid=${loginUser.userid}&currentPage=${paging.endPage + 1}">다음</a>
							</c:if>
						 </c:if> 

												
						<c:if test="${ kind eq 'search' }">
							<c:if test="${ paging.startPage != 1 }">
						 		<a href="moveSendSupportSearch.do?sptid=${loginUser.userid}&currentPage=${paging.startPage - 1}&searchtype=${searchtype}&keyword=${keyword}">이전</a>
							</c:if>
						
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="moveSendSupportSearch.do?sptid=${loginUser.userid}&currentPage=${num}&searchtype=${searchtype}&keyword=${keyword}">&emsp;
								<c:if test="${ paging.currentPage == num }"><span class="ui teal circle label">${num}</span></c:if>
								<c:if test="${ paging.currentPage != num }"><span class="ui grey circle label">${num}</span></c:if>
								</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="moveSendSupportSearch.do?sptid=${loginUser.userid}&currentPage=${paging.endPage + 1}&searchtype=${searchtype}&keyword=${keyword}">다음</a>
							</c:if>
						</c:if>
					</c:if>
					</div>
				</div>
			<!-- 페이징처리 끝 -->
		
		
</div> <!-- supportWrap 끝 -->
<c:import url="../footer.jsp" />
</body>
</html>