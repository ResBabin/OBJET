<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 상세조회</title>

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
	padding-right: 300px;
	padding-left: 300px;
}

tr {
	height: 55px;
}


</style>
<script type="text/javascript">
	$(function() {
		$("#aa1").click(function() {
			$(".segment").hide();
			$("#aa2, #aa3, #aa4").attr('class', 'item');
			$("#aa1").attr('class', 'item active');
			$("#d1").show();
			$("#d01").show();
		});
		$("#aa2").click(function() {
			$(".segment").hide();
			$("#d2").show();
			$("#aa1, #aa3, #aa4").attr('class', 'item');
			$("#aa2").attr('class', 'item active');
		});
		$("#aa3").click(function() {
			$(".segment").hide();
			$("#d3").show();
			$("#aa1, #aa2, #aa4").attr('class', 'item');
			$("#aa3").attr('class', 'item active');
		});
		$("#aa4").click(function() {
			$(".segment").hide();
			$("#d4").show();
			$("#aa1, #aa2, #aa3").attr('class', 'item');
			$("#aa4").attr('class', 'item active');
		});

		$('.ui.accordion').accordion();

		$("#menucon").click(function() {
			$('.ui.labeled.icon.sidebar').sidebar('toggle');
		});

		$('#di').dropdown({
		});
	});
</script>
	<c:import url="adminHeader.jsp"/>
</head>

<body>
	<div id="um">
		<h2 class="ui center aligned icon header">회원 상세정보</h2>
		<br>
		<div class="ui secondary pointing menu">
			<a class="item active" id="aa1" style="line-height: 20px;"> 개인 정보
			</a> <a class="item" id="aa2" style="line-height: 20px;">작가 소개</a> <a
				class="item" id="aa3" style="line-height: 20px;"> 작품 정보
				<div class="ui black label">${ userob.size() }</div>
			</a> <a class="item" id="aa4" style="line-height: 20px;"> 신고 내역
				<div class="ui black label">${ userrp.size() }</div>
			</a>
		</div>
		<div class="ui segment" id="d1">
			<br>
			<div id="userinfo" align="center">
				<c:if test="${ usermd.blackyn eq 'N' and empty usermd.userrpic }">
					<i class="massive user circle icon"></i>
				</c:if>
				<c:if test="${ usermd.blackyn eq 'N' and !empty usermd.userrpic }">
					<img
						src="${ pageContext.request.contextPath }/resources/images/${ usermd.userrpic }"
						width="200" height="200">
					<br>
				</c:if>
				<c:if test="${ usermd.blackyn eq 'Y' and empty usermd.userrpic }">
					<i class="massive user circle icon" style="position: static;"></i>
					<br>
					<div class="ui big left ribbon black label"
						style="margin-right: 1000px; opacity: 0.9;">BLACK LIST</div>
					<br>
				</c:if>
				<c:if test="${ usermd.blackyn eq 'Y' and !empty usermd.userrpic }">
					<img
						src="${ pageContext.request.contextPath }/resources/images/${ usermd.userrpic }"
						width="200" height="200">
					<br>
					<div class="ui big left ribbon black label"
						style="margin-right: 1000px; opacity: 0.9;">BLACK LIST</div>
					<br>
				</c:if>
				<br>
				<div id="d01" class="ui segment" align="center"
					style="width: 450px; background-color: #f6f6f6;">
					<div class="ui small labeled teal icon button"
						data-tooltip="작가 마이페이지 연결" style="margin-right: 20px;">
						<i class="home icon"></i> 작가 홈
					</div>
					<div class="ui circular facebook icon button"
						data-tooltip="페이스북 연결">
						<i class="facebook icon"></i>
					</div>
					<div class="ui circular linkedin icon button"
						data-tooltip="인스타그램 연결">
						<i class="linkedin icon"></i>
					</div>
					<div class="ui circular grey icon button" data-tooltip="기타 URL 연결">
						<i class="plus icon"></i>
					</div>
				</div>
				<table class="ui definition very single line collapsing celled table" style="font-size: 11pt;">
					<thead>
					</thead>
					<tbody align="center">
						<tr>
							<td width="150">ID</td>
							<td width="300">${ usermd.userid }</td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td>${ usermd.nickname }</td>
						</tr>
						<tr>
							<td>이 름</td>
							<td>${ usermd.username }</td>
						</tr>
						<tr>
							<td>성 별</td>
							<td><c:if test="${ usermd.gender eq 'F' }">
							여성
							</c:if> <c:if test="${ usermd.gender eq 'M' }">
							남성
							</c:if></td>
						</tr>
						<tr>
							<td>E-MAIL</td>
							<td>${ usermd.email }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="ui icon circular basic button" data-tooltip="메일 보내기">
									<i class="mail icon"></i>
								</div>
							</td>
						</tr>
						<tr>
							<td>PHONE</td>
							<td>${ usermd.phone }</td>
						</tr>
						<tr>
							<td>가입일</td>
							<td>${ usermd.enrolldate }</td>
						</tr>
					</tbody>

				</table>
				<br>
			</div>
		</div>
		<div class="ui segment" id="d2" style="display: none; padding: 50px;">
			<h3 class="ui dividing header">한단어 소개</h3>
			${ usermd.userintros }<br> <br>
			<h3 class="ui dividing header">작가 소개</h3>
			${ usermd.userintrol }<br> <br>
			<h3 class="ui dividing header">관련 태그</h3>
			<c:forTokens items="${ usermd.usertag }" delims="," var="usertag">
				<div class="ui small label">${ usertag }</div>&nbsp;
			</c:forTokens>
			<br> <br>
			<h3 class="ui dividing header">포트폴리오</h3>
			${ usermd.portfolio }<br> <br>
		</div>
		<div class="ui segment" id="d3" style="display: none;" align="center">
			<c:if test="${ !empty userob }">
				<c:set var="userobcount" value="${ userob.size() }" />
				<h5 style="margin-top: 20px; width: 600px;">전체 전시내역 &nbsp; :
					&nbsp; ${ userobcount }</h5>
				<div class="ui relaxed divided list" align="left">
					<c:forEach items="${ userob }" var="userob">
						<div class="item" style="padding: 15px;">
							<i class="grey quote left top aligned icon"></i>
							<div class="content"
								style="line-height: 20pt; padding-left: 20px;">
								<a class="header">${ userob.objettitle }</a>
								<div class="description">${ userob.objetstartdate }~${ userob.objetenddate }</div>
								<div class="description">
									<c:forTokens items="${ userob.objettag }" var="objettag"
										delims=",">
										<div class="ui tiny red label">${ objettag }</div>&nbsp;
								</c:forTokens>
								</div>
							</div>
							<i class="grey quote right bottom aligned icon"></i>
						</div>
					</c:forEach>
				</div>
			</c:if>
			<c:if test="${ empty userob }">
				<div align="center">해당 회원에 대한 작품 정보가 존재하지 않습니다.</div>
			</c:if>
		</div>
		<div class="ui segment" id="d4" style="display: none;" align="center">
			<c:if test="${ !empty userrp }">
				<c:set var="userrpcount" value="${ userrp.size() }" />
				<h5 style="margin-top: 20px; width: 600px;">전체 신고내역 &nbsp; :
					&nbsp; ${ userrpcount } 건</h5>
				<br>
				<div class="ui styled accordion" align="left">
					<c:forEach items="${ userrpt }" var="userrpt" varStatus="dd">
						<div class="title" style="display: flex;">
							<i class="dropdown icon"></i> ${ userrpt.reportureason }
							<div style=" margin-left: 20px; color: #777;">${ userrpt.reportucount } 건 </div>
						</div>
						<div class="content">
							<c:forEach items="${ userrp }" var="userrp">
								<c:if test="${ userrpt.reportureason eq userrp.reportureason }">
									<div class="ui labels">
										<div class="ui label">
											${ userrp.reporteru }
											<div class="detail">${ userrp.reportudate }</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
				<br>
			</c:if>
			<c:if test="${ empty userrp }">
				<div>해당 회원에 대한 신고 내역이 존재하지 않습니다.</div>
			</c:if>
		</div>
		<div align="right">
			<c:if test="${ usermd.blackyn eq 'N' }">
				<button class="ui black button">
					<i class="red dont icon"></i>블랙리스트 등록
				</button>
			</c:if>
			<c:if test="${ usermd.blackyn eq 'Y' }">
				<button class="ui button">
					<i class="undo icon"></i>블랙리스트 해제
				</button>
			</c:if>
			<button class="ui grey button">
				<i class="x icon"></i>강제탈퇴
			</button>
		</div>
	</div>
	<c:import url="../footer.jsp" />
</body>

</html>