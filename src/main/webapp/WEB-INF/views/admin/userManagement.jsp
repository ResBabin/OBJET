<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오브제 관리자 - 회원관리</title>
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
	});
</script>
<c:import url="adminHeader.jsp"/>
</head>
<body>
	<div id="um">
		<br>
		<div align="right">
			<div class="ui small button">상세 검색</div>
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
		<div>
			<div class="ui small basic buttons">
				<div class="ui button">블랙리스트</div>
				<div class="ui button">일반회원</div>
				<div class="ui button">관리자</div>
			</div>
		</div>
		<table class="ui sortable celled table selectable">
			<thead>
				<tr>
					<th width="10">
						<div class="ui fitted checkbox">
							<input type="checkbox" id="checkall"> <label></label>
						</div>
					</th>
					<th class="sorted ascending">회원ID</th>
					<th class="">닉네임</th>
					<th class="">이름</th>
					<th class="">가입일</th>
					<th class="" width="50">탈퇴여부</th>
					<th class="">신고횟수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ ulist }" var="userm">
				<c:url var="usermd" value="usermd.do">
					<c:param name="userid" value="${ userm.userid }" />
				</c:url>
					<tr>
						<td>
							<div class="ui fitted checkbox">
								<input type="checkbox" name="userselect"> <label></label>
							</div>
						</td>
						<c:if test="${ userm.blackyn eq 'Y' }">
							<td><i class="small icons" style="bottom: 3px;"> <i
									class="big red dont icon" style="margin-right: 0px;"></i> <i
									class="black user icon"></i></i> &nbsp; <a href="${ usermd }">${ userm.userid }</a></td>
						</c:if>
						<c:if test="${ userm.blackyn eq 'N' }">
							<td><i class="small icons" style="bottom: 3px;"> <i
									class="big circle outline icon" style="margin-right: 0px;"></i>
									<i class="user icon"></i></i> &nbsp; <a href="${ usermd }">${ userm.userid }</a></td>
						</c:if>
						<td><a href="${ usermd }">${ userm.nickname }</a></td>
						<td><a href="${ usermd }">${ userm.username }</a></td>
						<td>${ userm.enrolldate }</td>
						<c:if test="${ userm.quityn eq 'N' }">
							<td></td>
						</c:if>
						<c:if test="${ userm.quityn eq 'Y' }">
							<td><i class="check icon"  style="margin-left: 20px;"></i></td>
						</c:if>
						<c:if test="${ userm.reportcount eq 0}">
							<td>${ userm.reportcount }</td>
						</c:if>
						<c:if test="${ userm.reportcount > 10 }">
							<td class="negative">${ userm.reportcount }</td>
						</c:if>
						<c:if test="${ userm.reportcount >= 1 }">
							<td class="warning">${ userm.reportcount }</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="right">
			<button class="ui black button">
				<i class="red dont icon"></i>블랙리스트 등록
			</button>
			<button class="ui grey button">
				<i class="x icon"></i>강제탈퇴
			</button>
		</div>
	</div>
</body>

</html>