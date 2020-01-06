<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 전시 관리 페이지</title>
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
}
.taglabel{
	width: 50px;
	text-align: center; 
}
</style>
<script type="text/javascript">
	$(function() {
		$("#checkall").click(function() {
			var check = $("#checkall").prop("checked");
			if (check) {
				$("input[name=userselect]").prop("checked", true);
			} else {
				$("input[name=userselect]").prop("checked", false);
			}
		});
		$("input[name=userselect]").click(function() {
			$("#checkall").prop("checked", false);
		});
		$('.dropdown').dropdown({});
	});

</script>
<c:import url="adminHeader.jsp"/>
</head>
<body>
	<div id="um">
		<br>
		<div align="right">
			<div class="ui basic grey button">상세 검색</div>
			<!-- 		<div class="ui small basic buttons">
				<div class="ui button">전체</div>
				<div class="ui button">회원ID</div>
				<div class="ui button">닉네임</div>
				<div class="ui button active">이름</div>
			</div> -->
			<div class="ui right action left icon input">
				<i class="search icon"></i> <input type="text" placeholder="검색" style="border: 1px solid #777;">
				<div class="ui basic grey floating dropdown button">
					<div class="text">선택</div>
					<i class="dropdown icon"></i>
					<div class="menu">
						<div class="item">회원 아이디</div>
						<div class="item">전시명</div>
					</div>
				</div>
			</div>
			<br>
			<div></div>
		</div>
		<br>



		<div style="width: 240px;">
		<div class="ui item two menu">
				<div class="ui pointing dropdown link item">
				<span class="text">전시상태</span> <i class="dropdown icon"></i>
				<div class="menu">
					<div class="item">전시</div>
					<div class="item">종료</div>
					<div class="item">대기</div>
				</div>
			</div>
				<div class="ui pointing dropdown link item">
				<span class="text">승인여부</span> <i class="dropdown icon"></i>
				<div class="menu">
					<div class="item">대기</div>
					<div class="item">승인</div>
					<div class="item">반려</div>
				</div>
			</div>
		</div>
		</div>
<br>



		<table class="ui sortable celled table selectable" style="font-size: 10pt;">
			<thead>
				<tr>
					<th width="10">
						<div class="ui fitted checkbox">
							<input type="checkbox" id="checkall"> <label></label>
						</div>
					</th>
					<th class="" width="80" style="text-align: center;">번호</th>
					<th class="" style="text-align: center;">제목</th>
					<th class="" width="100" style="text-align: center;">작가 ID</th>
					<th class="" width="190" style="text-align: center;">전시 기간</th>
					<th class="" width="210" style="text-align: center;">태그</th>
					<th class="" width="75" style="text-align: center;">승인여부</th>
					<th class="" width="95" style="text-align: center;">등록일</th>
					<th class="" width="50" style="text-align: center;">상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ objetmlist }" var="objetm">
				<c:url value="objetmd.do" var="objetmd">
					<c:param name="objetno" value="${ objetm.objetno }"/>
				</c:url>
					<tr>
						<td>
							<div class="ui fitted checkbox">
								<input type="checkbox" name="userselect"> <label></label>
							</div>
						</td>
						<td style="text-align: right;">${ objetm.objetno }</td> 
						<td><a href="${ objetmd }">${ objetm.objettitle }</a></td>
						<td style="text-align: right;">${ objetm.userid }</td>
						<td>${ objetm.objetstartdate } &nbsp;&nbsp;~&nbsp;&nbsp; ${ objetm.objetenddate }</td>
						<td>
							<div style="display: flex;">
								<c:forTokens items="${ objetm.objettag }" delims=","
									var="objettag">
									<div class="ui tiny label taglabel"> ${ objettag } </div>&nbsp;	&nbsp;
					</c:forTokens>
							</div>
						</td>
						<td><c:if test="${ objetm.publicyn eq 'Y' }">
					승인
					</c:if> <c:if test="${ objetm.publicyn eq 'N' }">
					반려
					</c:if></td>
						<td>${ objetm.objetregidate }</td>
						<td><c:if test="${ objetm.objetstatus eq 'OPEN' }"> 전시	
					</c:if> <c:if test="${ objetm.objetstatus eq 'CLOSE' }">종료
					</c:if> <c:if test="${ objetm.objetstatus eq 'WAIT' }">예정
					</c:if> <c:if test="${ objetm.objetstatus eq 'RJCT' }">반려
					</c:if></td>
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