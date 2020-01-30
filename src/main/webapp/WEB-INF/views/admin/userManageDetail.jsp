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
	padding: 20px;
	padding-right: 300px;
	padding-left: 300px;
}

tr {
	height: 55px;
}

#popdiv {
	position: absolute;
	background: #f7f7f7; 
	border: 1px solid #ccc;
	width: 500px;
	height: 480px;
	left: 35%;
	top: 65%; 
	border-radius: 5px;
	padding: 30px;
	box-shadow: 1px 1px 2px #999;
	display: none;
	z-index: 1;
}
#quitdiv {
	position: absolute;
	background: #f7f7f7;
	border: 1px solid #ccc;
	width: 500px;
	height: 415px;
	left: 35%;
	top: 70%; 
	border-radius: 5px;
	padding: 30px;
	box-shadow: 1px 1px 2px #999;
	display: none;
	z-index: 2;
}
#popselect{
	width: 458px;
}
#bllabel{
	font-size: 13pt;
	font-weight: bold;
	margin-left: 70px;
}
#qlabel{
	font-size: 13pt;
	font-weight: bold;
	margin-left: 100px;
}
#blackend{
	width: 375px;
	border: 1px solid #aaa;
	height: 35px;
	border-radius: 5px;
	margin-top: -10px;
	margin-left: 30px;	
	padding-left: 5px;
}
textarea {
	border-radius: 5px;
}

</style>
<script type="text/javascript">
	$(function() {
		$("#aa1").click(function() {
			$(".segment").hide();
			$("#aa2, #aa3, #aa4").attr('class', 'item');
			$("#aa1").attr('class', 'item active');
			$("#d1").fadeIn();
			$("#d01").fadeIn();
		});
		$("#aa2").click(function() {
			$(".segment").hide();
			$("#d2").fadeIn();
			$("#aa1, #aa3, #aa4").attr('class', 'item');
			$("#aa2").attr('class', 'item active');
		});
		$("#aa3").click(function() {
			$(".segment").hide();
			$("#d3").fadeIn();
			$("#aa1, #aa2, #aa4").attr('class', 'item');
			$("#aa3").attr('class', 'item active');
		});
		$("#aa4").click(function() {
			$(".segment").hide();
			$("#d4").fadeIn();
			$("#aa1, #aa2, #aa3").attr('class', 'item');
			$("#aa4").attr('class', 'item active');
		});

		$('.ui.accordion').accordion();

		$("#menucon").click(function() {
			$('.ui.labeled.icon.sidebar').sidebar('toggle');
		});

		$('#di').dropdown({
		});
		$("#blackpop").click(function() {
			$("#popdiv").fadeIn(100);
		});
		$("#blackclose").click(function() {
			$("#popdiv").fadeOut(100);
		});
		$("#quitpop").click(function() {
			$("#quitdiv").fadeIn(100);
		});
		$("#quitclose").click(function() {
			$("#quitdiv").fadeOut(100);
		});
		
		var adminid = $("input[name=adminid]").val();
		var userid = $("input[name=userid]").val();
		$("#blackok").click(function() {
			var confirm_del = confirm("해당 회원을 블랙리스트로 등록하시겠습니까?");
			if (confirm_del) {
				var blackreason = $("input[name=blackreason]:checked").val();
				if(blackreason == 'etc'){
					blackreason = $("#etcreason").val();
				} 
				var data = { userid : userid, blackend : $("#blackend").val(), blackreason : blackreason, adminid : adminid};
				$.ajax({
					url : "insertblack.do",
					data : data,
					type : "post",
					success : function(result) {
						console.log(result);
						  location.href = "usermd.do?userid=" + userid;
					},
					traditional : true,
					error : function(request, status, errorData) {
						console.log("error code : "
								+ request.status + "\nMessage : "
								+ request.responseText
								+ "\nError : " + errorData);
					}

				});
			}
		});
		$("#quitok").click(function() {
			var confirm_del = confirm("해당 회원을 블랙리스트로 등록하시겠습니까?");
			if (confirm_del) {
			var quitreason = $("input[name=quitreason]:checked").val();
			if(quitreason == 'etc'){
				quitreason = $("#quitetcreason").val();
			}
			var data = { userid : userid, quitreason : quitreason};
			$.ajax({
				url : "adminquit.do",
				data : data, 
				type : "post",
				success : function(result) {
					console.log(result);
					  location.href = "usermd.do?userid=" + userid;
				},
				traditional : true,
				error : function(request, status, errorData) {
					console.log("error code : "
							+ request.status + "\nMessage : "
							+ request.responseText
							+ "\nError : " + errorData);
				}
	
			});
		}
		});
		
		
		$("#blackendbtn").click(function() {
				var confirm_del = confirm("해당 사용자를 블랙리스트에서 해제하시겠습니까?");
				if (confirm_del) {
					$.ajax({
						url : "blackend.do",
						data : {userid : userid, adminid : adminid},
						type : "post",
						success : function(result) {
							console.log(result);
							  location.href = "usermd.do?userid="+userid;
						},
						traditional : true,
						error : function(request, status, errorData) {
							console.log("error code : "
									+ request.status + "\nMessage : "
									+ request.responseText
									+ "\nError : " + errorData);
						}
					});
				}
		});
	});
</script>
	<c:import url="adminHeader.jsp"/>
</head>

<body>
	<div id="um">
	<div id="popdiv">
	<input name="adminid" value="${ sessionScope.loginUser.userid }" type="hidden">
		<label id="bllabel">블랙리스트 기간 및 사유를 선택해 주세요.</label>
		<br><br><hr><br>
		<i class="ui icon grey calendar"></i>&nbsp;&nbsp;&nbsp;&nbsp;기간 
		<br><br>
		<select id="blackend" name="blackend">
		<option value="oneweek"> 1 주일</option>
		<option value="twoweek"> 2 주일</option>
		<option value="threeweek"> 3 주일</option>
		<option value="onemonth"> 1 개월</option>
		<option value="twomonth"> 2 개월</option>
		<option value="threemonth"> 3 개월</option>
		</select>
		<br><br> 
			<div class="ui form">
				<div class="grouped fields">
					사유
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="blackreason" value="욕설 및 비방"> <label>욕설 및 비방</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="blackreason" value="부적절한 컨텐츠"> <label>부적절한 컨텐츠</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="blackreason" value="광고 및 스팸"> <label>광고 및 스팸</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="blackreason" value="etc"> <label>기타</label>
						</div>
					</div>
				</div>
			</div>
			<textarea id="etcreason" rows="4" cols="53" placeholder="기타 사유를 작성해주세요." style="margin-top: 0px; margin-left: 30px; padding: 10px; margin-bottom: 13px; resize: none;"></textarea>
		<br>
		<div align="center">
		<button class="ui grey button" id="blackok">등록</button> &nbsp;&nbsp;&nbsp;
		<button class="ui button" id="blackclose">취소</button>
		</div>
	</div>
	<div id="quitdiv">
		<label id="qlabel">강제 탈퇴 사유를 선택해 주세요.</label>
		<br><br><hr><br>
		<input type="radio" value="욕설 및 비방" name="quitreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 욕설 및 비방<br><br>
		<input type="radio" value="부적절한 컨텐츠" name="quitreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 부적절한 컨텐츠<br><br>
		<input type="radio" value="광고 및 스팸" name="quitreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 광고 및 스팸<br><br>
		<input type="radio" value="etc" name="quitreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 기타<br>
		<textarea id="quitetcreason" rows="4" cols="53" placeholder="기타 사유를 작성해주세요." style="margin-top: 15px; margin-left: 30px; padding: 10px; margin-bottom: 13px; resize: none;"></textarea>
		<br>
		<div align="center">
		<button class="ui grey button" id="quitok">등록</button> &nbsp;&nbsp;&nbsp;
		<button class="ui button" id="quitclose">취소</button>
		</div>
		
	</div>
	<input type="hidden" value="${ usermd.userid }" name="userid">
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
					<img	src="${ pageContext.request.contextPath }/resources/users_upfiles/${ usermd.userrpic }" style="width: 250px; height: 250px; border-radius: 150px; object-fit: cover;">
					<br>
				</c:if>
				<c:if test="${ usermd.blackyn eq 'Y' and empty usermd.userrpic }">
					<i class="massive user circle icon" style="position: static;"></i>
					<br><br>
				</c:if>
				<c:if test="${ usermd.blackyn eq 'Y' and !empty usermd.userrpic }">
					<img
						src="${ pageContext.request.contextPath }/resources/users_upfiles/${ usermd.userrpic }"
						 style="width: 250px; height: 250px; border-radius: 150px; object-fit: cover;">
					<br>	</c:if>
					<c:if test="${ usermd.blackyn eq 'Y' }">
					<div class="ui big left ribbon black label"
						style="margin-right: 1000px; opacity: 0.9; line-height: 22pt; position: absolute; top: 14%; left: -2.5%;">BLACK LIST<br>
						${ usermd.blackstart } &nbsp; ~ &nbsp; ${ usermd.blackend }
					</div>
					</c:if>
					<c:if test="${ usermd.quityn eq 'Y' }">
					<div class="ui big left ribbon label"
						style="margin-right: 1000px; opacity: 0.9; line-height: 22pt; position: absolute; top: 27%; left: -2.5%;">탈퇴한 회원입니다.<br>
					</div>
					</c:if>
					<br>
			
				<div id="d01" class="ui segment" align="center"
					style="width: 450px; background-color: #f6f6f6;">
					<a href="artistHomeMain.do?userid=${ usermd.userid }&loginUser=${ usermd.userid }" target="_blank"><button class="ui small labeled teal icon button"
						data-tooltip="작가 마이페이지" style="margin-right: 20px;">
						<i class="home icon"></i> 작가 홈</button></a>
						<c:if test="${ !empty usermd.facebook }">
					<a href="${ usermd.facebook }" target="_blank"><button class="ui circular facebook icon button"
						data-tooltip="페이스북">
						<i class="facebook icon"></i>
					</button></a>
						</c:if>
						<c:if test="${ empty usermd.facebook }">
					<button class="ui circular facebook icon button"
						data-tooltip="페이스북 주소 없음"> <i class="facebook icon"></i> </button>
						</c:if>
						<c:if test="${ !empty usermd.instagram }">
					<a href="${ usermd.instagram }" target="_blank"><button class="ui circular linkedin icon button"
						data-tooltip="인스타그램">
						<i class="linkedin icon"></i></button></a></c:if>
						<c:if test="${ empty usermd.instagram }">
					<button class="ui circular linkedin icon button"
						data-tooltip="인스타그램 주소 없음">
						<i class="linkedin icon"></i></button></c:if>
							<c:if test="${ !empty usermd.etcurl }">
					<a href="${ usermd.etcurl }" target="_blank"><button class="ui circular grey icon button" data-tooltip="기타 URL">
						<i class="plus icon"></i>
					</button></a></c:if>
							<c:if test="${ empty usermd.etcurl }">
							<button class="ui circular grey icon button" data-tooltip="기타 URL 없음">
						<i class="plus icon"></i>
					</button></c:if>
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
							<td>${ usermd.email }
								<!-- <div class="ui icon circular basic button" data-tooltip="메일 보내기">
									<i class="mail icon"></i>
								</div> -->
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
								<a class="header" href="objetmd.do?objetno=${ userob.objetno }">${ userob.objettitle }</a>
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
			<c:if test="${ usermd.blackyn eq 'N' and usermd.usertype ne 'ADMIN' }">
				<button class="ui black button" id="blackpop">
					<i class="red dont icon"></i>블랙리스트 등록
				</button>
			</c:if>
			<c:if test="${ usermd.blackyn eq 'Y' and usermd.usertype ne 'ADMIN' }">
				<button class="ui button" id="blackendbtn">
					<i class="undo icon"></i>블랙리스트 해제
				</button>
			</c:if>
			<c:if test="${ usermd.quityn eq 'N' and usermd.usertype ne 'ADMIN' }">
			<button class="ui button" id="quitpop">
				<i class="x icon"></i>강제탈퇴
			</button>
			</c:if>
			<a href="userm.do?userm.do?usertype=&order=idd&page=1"><button class="ui icon button">
				<i class="list icon"></i></button></a>
		</div>
	</div>
	<c:import url="../footer.jsp"/>
</body>

</html>