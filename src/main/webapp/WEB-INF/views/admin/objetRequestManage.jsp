<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 전시 신청작 관리 페이지</title>
<!-- 시맨틱유아이 cdn -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<style type="text/css">
#um {
	padding: 150px;
	padding-top: 70px;
	padding-bottom: 70px;
}
</style>
<c:import url="adminHeader.jsp" />
<script type="text/javascript">

</script>
</head>
<body>
<div id="um">
		<br>
		<div align="right">
			<div class="ui basic button">검색</div>
			<!-- 		<div class="ui small basic buttons">
				<div class="ui button">전체</div>
				<div class="ui button">회원ID</div>
				<div class="ui button">닉네임</div>
				<div class="ui button active">이름</div>
			</div> -->
			<div class="ui small icon input">
				<input type="search" placeholder="회원 검색"> <i
					class="search icon"></i>
			</div>
			<br>
			<div></div>
		</div>
		<br>
		<table class="ui sortable celled table selectable"
			style="font-size: 10pt;">
			<thead>
				<tr>
					<th width="10">
						<div class="ui fitted checkbox">
							<input type="checkbox" id="checkall"> <label></label>
						</div>
					</th>
					<th class="" width="80">번호</th>
					<th class="">제목</th>
					<th class="" width="100">작가 ID</th>
					<th class="" width="190">전시 기간</th>
					<th class="" width="210">태그</th>
					<th class="" width="95">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ objetreqlist }" var="objetreq">
				<c:url value="objetmd.do" var="objetmd">
					<c:param name="objetno" value="${ objetreq.objetno }"/>
				</c:url>
					<tr>
						<td>
							<div class="ui fitted checkbox">
								<input type="checkbox" name="userselect"> <label></label>
							</div>
						</td>
						<td style="text-align: right;">${ objetreq.objetno }</td>
						<td><a href="${ objetmd }">${ objetreq.objettitle }</a></td>
						<td>${ objetreq.userid }</td>
						<td>${ objetreq.objetstartdate } &nbsp;&nbsp;~&nbsp;&nbsp; ${ objetreq.objetenddate }</td>
						<td>
							<div style="display: flex;">
								<c:forTokens items="${ objetreq.objettag }" delims="," var="objettag">
									<div class="ui tiny label" style="width: 50px; text-align: center;">${ objettag }</div>&nbsp; &nbsp;
					</c:forTokens>
							</div>
						</td>
						<td>${ objetreq.objetregidate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="right">
			<button class="ui basic grey button" id="returnbtn">
			반려
			</button>
			<button class="ui basic grey button" id="approvebtn">
			승인
			</button>
		</div>
		<br>
		<div align="center">
		<div class="ui pagination menu"  id="pagingdiv">
		<c:if test="${ currentPage eq 1 }">
		<a href="/objet/objetm.do?page=1" class="disabled item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne 1 }">
		<a href="/objet/objetm.do?page=1" class="item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ beginPage - 10 < 1 }">
		<c:if test="${ currentPage eq 1 }"><a href="/objet/objetm.do?page=1" class="disabled item"><i class="angle left icon"></i></a></c:if>
		<c:if test="${ currentPage ne 1 }"><a href="/objet/objetm.do?page=1" class="item"><i class="angle left icon"></i></a></c:if>
		</c:if>
		<c:if test="${ beginPage - 10 >= 1 }">
		<a href="/objet/objetm.do?page=${ currentPage }" class="item"><i class="angle left icon"></i></a>
		</c:if>
		<c:forEach begin="${ beginPage }" end="${ endPage }" var="p">
		<c:if test="${ p eq currentPage }">
<%-- 		<a href="/objet/objetm.do?page=${ p }" class="active item">${ p }</a> --%>
		<a class="active item pages" id="pages">${ p }</a>
		</c:if>
		<c:if test="${ p ne currentPage }">
<%-- 		<a href="/objet/objetm.do?page=${ p }" class="item">${ p }</a> --%>
		<a class="item pages" id="pages">${ p }</a>
		</c:if>
		</c:forEach>
		<c:if test="${  endPage + 10 > maxPage }">
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/objetm.do?page=${ maxPage }" class="disabled item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/objetm.do?page=${ maxPage }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		</c:if>
		<c:if test="${ endPage + 10 <= maxPage }">
		<a href="/objet/objetm.do?page=${ endPage + 10 }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/objetm.do?page=${ endPage }" class="disabled item"><i class="angle double right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/objetm.do?page=${ endPage }" class="item"><i class="angle double right icon"></i></a>
		</c:if>
	</div>
	</div>
	</div>
</body>
</html>