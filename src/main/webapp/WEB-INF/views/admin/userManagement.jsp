<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	padding-top: 50px;
}

#popdiv {
	position: absolute;
	background: #f7f7f7; 
	border: 1px solid #ccc;
	width: 500px;
	height: 480px;
	left: 35%;
	top: 30%; 
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
	top: 40%; 
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
var thclicked = "normal";
	$(function() {
		
		
		$("#checkall").click(function() {
			var check = $("#checkall").prop("checked");
			if (check) {
				$("input[name=useridchk]").prop("checked", true);
			} else {
				$("input[name=useridchk]").prop("checked", false);
			}
		});
		$("input[name=useridchk]").click(function() {
			$("#checkall").prop("checked", false);
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
		
		$("#blackok").click(function() {
					if ($("input[name=useridchk]:checked").length > 0) {
						if($("input[name=blackreason]:checked").length > 0){
						var confirm_del = confirm("해당 사용자를 블랙리스트로 등록 하시겠습니까?");
						
						if (confirm_del) {
							var checkArr = [];
							$("input[name=useridchk]:checked").each(function() {
								checkArr.push($(this).val());
							});
							console.log(checkArr);
							console.log($("input[name=useridchk]:checked").val());
							var blackreason = $("input[name=blackreason]:checked").val();
							if(blackreason == 'etc'){
								blackreason = $("#etcreason").val();
							}
							console.log(blackreason);
							var data = { userid : checkArr, blackend : $("#blackend").val(), blackreason : blackreason};
							console.log(data);
							$.ajax({
								url : "insertblack.do",
								data : data,
								type : "post",
								success : function(result) {
									console.log(result);
									  location.href = "userm.do";
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
						}else {
							alert("블랙리스트 등록 사유를 작성해주세요.");
						}
					}else {
						alert("사용자를 선택해주세요.");
					}
				});
		$("#quitok").click(function() { 
			if ($("input[name=useridchk]:checked").length > 0) { 
				if($("input[name=quitreason]:checked").length > 0){ 
				var confirm_del = confirm("해당 회원을 탈퇴시키겠습니까?");
		
				if (confirm_del) {
					var checkArr = [];
					$("input[name=useridchk]:checked").each(function() {
						checkArr.push($(this).val()); 
					});
					console.log($("input[name=useridchk]:checked").val());
					var quitreason = $("input[name=quitreason]:checked").val();
					if(quitreason == 'etc'){
						quitreason = $("#quitetcreason").val();
					}
					var data = { userid : checkArr, quitreason : quitreason};
					console.log(data);
					$.ajax({
						url : "adminquit.do",
						data : data, 
						type : "post",
						success : function(result) {
							console.log(result);
							  location.href = "userm.do";
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
				}else {
					alert("강제탈퇴 사유를 작성해주세요.");
				}
			}else {
				alert("사용자를 선택해주세요.");
			}
		});
	
		
		console.log(location.href.substring((location.href.indexOf('order'))));
		
		
			$("#userid").click(function() {
				if(!location.href.includes('order=')){
					location.href = location.href+'&order=ida';
					
				}else {
					if(location.href.includes('order=idd')){
						location.href = location.href.replace(location.href.substring((location.href.indexOf('order'))), 'order=ida');
					}else{
						location.href = location.href.replace(location.href.substring((location.href.indexOf('order'))), 'order=idd');
					}
						
					}
			});
			$("#nick").click(function() {
				if(!location.href.includes('order=')){
					location.href = location.href+'&order=nicka';
					
				}else {
					if(location.href.includes('order=nickd')){
					location.href = location.href.replace(location.href.substring((location.href.indexOf('order'))), 'order=nicka');
					}else{
					location.href = location.href.replace(location.href.substring((location.href.indexOf('order'))), 'order=nickd');
					}
				}
			});
			$("#name").click(function() {
				if(!location.href.includes('order=')){
					location.href = location.href+'&order=namea';
				}else {
					if(location.href.includes('order=named')){
					location.href = location.href.replace(location.href.substring((location.href.indexOf('order'))), 'order=namea');
					}else{
					location.href = location.href.replace(location.href.substring((location.href.indexOf('order'))), 'order=named');
					}
				}
			});
			$("#enroll").click(function() {
				if(!location.href.includes('order=')){
					location.href = location.href+'&order=enrolld';
					
				}else {
					if(location.href.includes('order=enrolld')){
					location.href = location.href.replace(location.href.substring((location.href.indexOf('order'))), 'order=enrolla');
					}else {
						location.href = location.href.replace(location.href.substring((location.href.indexOf('order'))), 'order=enrolld');
					}
				}
			});
			$("#report").click(function() {
				if(!location.href.includes('order=')){
					location.href = location.href+'&order=reportd';
					
				}else {
					if(location.href.includes('order=reportd')){
					location.href = location.href.replace(location.href.substring((location.href.indexOf('order'))), 'order=reporta');
					}else{
						location.href = location.href.replace(location.href.substring((location.href.indexOf('order'))), 'order=reportd');
					}
				}
			});
		$('.dropdown').dropdown({});
		$("input[name=userid]").hide();
		
		$("#searchuserid").click(function() { 
		$("input[name=searchnick]").hide();
		$("input[name=searchnick]").val("");
		$("input[name=userid]").show();
		});
		$("#searchnick").click(function() {
		$("input[name=userid]").hide();
		$("input[name=userid]").val(""); 
		$("input[name=searchnick]").show();
		});

	});
</script>
<c:import url="adminHeader.jsp"/>
</head>
<body>
	<div id="um">
	<c:url value="userm.do" var="usermuri">
	<c:if test="${ !empty usertype and !fn:contains(usermuri, 'usertype') }"><c:param value="${ usertype }" name="usertype" /></c:if>
	<c:if test="${ !empty blackyn and !fn:contains(usermuri, 'blackyn') }"><c:param value="${ blackyn }" name="blackyn" /></c:if>
	<c:if test="${ !empty quityn and !fn:contains(usermuri, 'quityn')  }"><c:param value="${ quityn }" name="quityn" /></c:if>
	<c:if test="${ !empty order and !fn:contains(usermuri, 'order')  }"><c:param value="${ order }" name="order" /></c:if>
	<c:if test="${ !empty nickname and !fn:contains(usermuri, 'nickname')  }"><c:param value="${ nickname }" name="nickname" /></c:if>
	<c:if test="${ !empty userid and !fn:contains(usermuri, 'userid')  }"><c:param value="${ userid }" name="userid" /></c:if>
	</c:url>
	<div id="popdiv">
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
		<br>
	<div align="right">
			<form action="userm.do" method="get">
				<input type="submit" class="ui basic button" value="검색">
				<div class="ui right action left icon input">
					<i class="search icon"></i>
					<input type="search" placeholder="닉네임 검색" name="nickname"> 
					<input type="search" placeholder="아이디 검색" name="userid"> 
					<input type="hidden" value="1" name="page">
					<!-- <input type="hidden" value="" name="usertype">
					<input type="hidden" value="" name="blackyn">
					<input type="hidden" value="" name="quityn"> -->
					<div class="ui basic floating dropdown button">
						<div class="text">닉네임</div>
						<i class="dropdown icon"></i>
						<div class="menu">
							<div class="item" id="searchnick">닉네임</div>
							<div class="item" id="searchuserid">아이디</div> 
						</div>
					</div>
				</div>
			</form>
			<div></div>
		</div>
		<br>
		<div>
			<div class="ui small basic buttons">
				<a href="userm.do?usertype=&order=idd&page=1"><div class="ui button order" id="allbtn">전체회원</div></a>
				<c:if test="${ !fn:contains(usermuri, 'usertype') }">
				<a href="${ usermuri }&usertype=ADMIN&page=1"><div class="ui button  order" id="adminbtn">관리자</div></a>
				</c:if>
				<c:if test="${ fn:contains(usermuri, 'usertype=ADMIN') }">
				<a href=""><div class="ui button  active order" id="adminbtn">관리자</div></a>
				<a href="${ fn:replace(usermuri , 'ADMIN', 'USER') }"><div class="ui button order" id="userbtn">일반회원</div></a>
				</c:if> 
				<c:if test="${ fn:contains(usermuri, 'usertype=USER') }">
				<a href="${ fn:replace(usermuri , 'USER', 'ADMIN') }"><div class="ui button  order" id="adminbtn">관리자</div></a>
				<a href=""><div class="ui button active order" id="userbtn">일반회원</div></a>
				</c:if>
				<c:if test="${ !fn:contains(usermuri, 'usertype') }">
				<a href="${ usermuri }&usertype=USER&page=1"><div class="ui button order" id="userbtn">일반회원</div></a>
				</c:if>
				</div>&nbsp;&nbsp;&nbsp;
				<div class="ui small basic buttons">
				<c:if test="${ fn:contains(usermuri, 'blackyn') }">
				<a href="${ fn:replace(usermuri , 'blackyn=Y', '') }&page=1"><div class="ui button active order" id="blackbtn">블랙리스트</div></a>
				</c:if>
				<c:if test="${ !fn:contains(usermuri, 'blackyn') }">
				<a href="${ usermuri }&blackyn=Y&page=1"><div class="ui button order" id="blackbtn">블랙리스트</div></a>
				</c:if>
				<c:if test="${ fn:contains(usermuri, 'quityn') }">
				<a href="${ fn:replace(usermuri , 'quityn=Y', '') }&page=1"><div class="ui button active order" id="quitbtn">탈퇴회원</div></a>
				</c:if>
				<c:if test="${ !fn:contains(usermuri, 'quityn') }">
				<a href="${ usermuri }&quityn=Y&page=1"><div class="ui button order" id="quitbtn">탈퇴회원</div></a>
				</c:if>
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
					<c:if test="${ usermuri.contains('order=idd') }"><th class="sorted descending" id="userid" width="300">회원ID<input type="hidden"  value="0" name="userid"></th></c:if>
					<c:if test="${ usermuri.contains('order=ida') }"><th class="sorted ascending" id="userid" width="300">회원ID<input type="hidden"  value="0" name="userid"></th></c:if>
					<c:if test="${ !usermuri.contains('order=ida') and !usermuri.contains('order=idd') }">	<th class="" id="userid" width="300">회원ID<input type="hidden"  value="0" name="userid"></th></c:if>
					<c:if test="${ usermuri.contains('order=nicka') }"><th class="sorted ascending" id="nick" width="300">닉네임</th></c:if>
					<c:if test="${ usermuri.contains('order=nickd') }"><th class="sorted descending" id="nick" width="300">닉네임</th></c:if>
					<c:if test="${ !usermuri.contains('order=nickd') and !usermuri.contains('order=nicka') }"><th class="" id="nick" width="300">닉네임</th></c:if>
					<c:if test="${ usermuri.contains('order=namea') }"><th class="sorted ascending" id="name" width="300">이름</th></c:if>
					<c:if test="${ usermuri.contains('order=named') }"><th class="sorted descending" id="name" width="300">이름</th></c:if>
					<c:if test="${ !usermuri.contains('order=namea') and !usermuri.contains('order=named') }"><th class="" id="name" width="300">이름</th></c:if>
					<c:if test="${ usermuri.contains('order=enrolla') }"><th class="sorted ascending" id="enroll" width="150">가입일</th> </c:if>
					<c:if test="${ usermuri.contains('order=enrolld') }"><th class="sorted descending" id="enroll" width="150">가입일</th> </c:if>
					<c:if test="${ !usermuri.contains('order=enrolld') and !usermuri.contains('order=enrolla') }"><th class="" id="enroll" width="150">가입일</th> </c:if>
					<th class="" width="100" id="quit">탈퇴여부</th>
					<c:if test="${ usermuri.contains('order=reporta') }"><th class="sorted ascending" id="report" width="100">신고횟수</th></c:if>
					<c:if test="${ usermuri.contains('order=reportd') }"><th class="sorted descending" id="report" width="100">신고횟수</th></c:if>
					<c:if test="${ !usermuri.contains('order=reportd') and !usermuri.contains('order=reporta') }"><th class="" id="report" width="100">신고횟수</th></c:if>
					
				</tr>
			</thead>
			<tbody id="usertable">
				<c:forEach items="${ ulist }" var="userm">
				<c:url var="usermd" value="usermd.do">
					<c:param name="userid" value="${ userm.userid }" />
				</c:url>
					<tr>
						<td>
							<div class="ui fitted checkbox">
								<input type="checkbox" name="useridchk" value="${ userm.userid }"> <label></label>
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
							<td align="center">&nbsp;&nbsp;&nbsp;<i class="check icon"  style="margin-left: 20px;"></i></td>
						</c:if>
						<c:if test="${ userm.reportcount eq 0}">
							<td>${ userm.reportcount }</td>
						</c:if>
						<c:if test="${ userm.reportcount >= 3 }">
							<td class="negative">${ userm.reportcount }</td>
						</c:if>
						<c:if test="${ userm.reportcount < 3 and userm.reportcount ne 0 }">
							<td class="warning">${ userm.reportcount }</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="right">
			<button class="ui black button" id="blackpop">
				<i class="red dont icon"></i>블랙리스트 등록
			</button>
			<button class="ui grey button" id="quitpop">
				<i class="x icon"></i>강제탈퇴
			</button>
		</div><br>
		<div align="center">
		<div class="ui pagination menu">
		<c:if test="${ currentPage eq 1 }">
		<a href="${usermuri }&page=1" class="disabled item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne 1 }">
		<a href="${ usermuri }&page=1" class="item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ beginPage - 10 < 1 }">
		<c:if test="${ currentPage eq 1 }"><a href="${ usermuri }&page=1" class="disabled item"><i class="angle left icon"></i></a></c:if>
		<c:if test="${ currentPage ne 1 }"><a href="${ usermuri }&page=1" class="item"><i class="angle left icon"></i></a></c:if>
		</c:if>
		<c:if test="${ beginPage - 10 >= 1 }">
		<a href="${ usermuri }&page=${ currentPage }" class="item"><i class="angle left icon"></i></a>
		</c:if>
		<c:forEach begin="${ beginPage }" end="${ endPage }" var="p">
		<c:if test="${ p eq currentPage }">
		<a href="${ usermuri }&page=${ p }" class="active item">${ p }</a>
		</c:if>
		<c:if test="${ p ne currentPage }">
		<a href="${ usermuri }&page=${ p }" class="item">${ p }</a>
		</c:if>
		</c:forEach>
		<c:if test="${  endPage + 10 > maxPage }">
		<c:if test="${ currentPage eq endPage }">
		<a href="${ usermuri }&page=${ maxPage }" class="disabled item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="${ usermuri }&page=${ maxPage }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		</c:if>
		<c:if test="${ endPage + 10 <= maxPage }">
		<a href="${ usermuri }&page=${ endPage + 10 }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage eq endPage }">
		<a href="${ usermuri }&page=${ endPage }" class="disabled item"><i class="angle double right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="${ usermuri }&page=${ endPage }" class="item"><i class="angle double right icon"></i></a>
		</c:if>
	</div>
	</div>
	</div>
	
	<c:import url="../footer.jsp"/>
</body>

</html>