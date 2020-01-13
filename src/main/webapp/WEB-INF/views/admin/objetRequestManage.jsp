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
			<button class="ui black button" data-tooltip="비공개 처리">
				<i class="eye slash outline icon"></i>블라인드
			</button>
			<button class="ui grey button" data-tooltip="전시 종료">
				<i class="x icon"></i>강제 종료
			</button>
		</div>
	</div>
</body>
</html>