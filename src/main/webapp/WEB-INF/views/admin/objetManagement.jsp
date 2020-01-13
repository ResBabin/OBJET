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
	padding-top: 50px;
	padding-bottom: 50px;
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
				$("input[name=objetno]").prop("checked", true);
			} else {
				$("input[name=objetno]").prop("checked", false);
			}
		});
		$("input[name=objetno]").click(function() {
			$("#checkall").prop("checked", false);
		});
		$('.dropdown').dropdown({});
		
		
		var publicyn = "", status = "", tag = "";
		var objettitle = "${ param.objettitle }";
		var userid = "${ param.userid }";
		
		$("#publicall").click(function() {
			publicyn = "";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#publicy").click(function() {
			publicyn = "Y";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#publicn").click(function() {
			publicyn = "N";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#publicw").click(function() {
			publicyn = "W";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#statusall").click(function() {
			status = "";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#statuswait").click(function() {
			status = "WAIT";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#statusopen").click(function() {
			status = "OPEN";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#statusclose").click(function() {
			status = "CLOSE";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#tagarc").click(function() {
			tag = "건축";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#tagseo").click(function() {
			tag = "서예";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#tagst").click(function() {
			tag = "조각";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#tagpic").click(function() {
			tag = "사진";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#tagde").click(function() {
			tag = "디자인";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#tagho").click(function() {
			tag = "회화";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#tagetc").click(function() {
			tag = "기타";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#taggong").click(function() {
			tag = "공예";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		$("#tagall").click(function() {
			tag = "";
			thorder(publicyn, status, tag, "objetd", objettitle, userid);
		});
		
		
		
		var clickid = 0, clickno = 0, clicktitle = 0, clickdate = 0, clickregi = 0;
		
		$("#userid").click(function() {
			if(clickid%2 == 0){
				$(".sorted").attr("class", "");
				$("#userid").attr("class", "sorted descending");
				thorder(publicyn, status, tag, "idd", objettitle, userid);
				clickid += 1;
				clickno = 0, clicktitle = 0, clickdate = 0, clickregi = 0;
			} else if(clickid%2 != 0){
				$(".sorted").attr("class", "");
				$("#userid").attr("class", "sorted ascending");
				thorder(publicyn, status, tag, "ida", objettitle, userid);
				clickid += 1;
				clickno = 0, clicktitle = 0, clickdate = 0, clickregi = 0;
			}
		});
		$("#title").click(function() {
			if(clicktitle%2 == 0){
				$(".sorted").attr("class", "");
				$("#title").attr("class", "sorted descending");
				thorder(publicyn, status, tag, "titled", objettitle, userid);
				clicktitle += 1;
				clickno = 0, clickid = 0, clickdate = 0, clickregi = 0;
			} else if(clicktitle%2 != 0){
				$(".sorted").attr("class", "");
				$("#title").attr("class", "sorted ascending");
				thorder(publicyn, status, tag, "titlea", objettitle, userid);
				clicktitle += 1;
				clickno = 0, clickid = 0, clickdate = 0, clickregi = 0;
			}
		});
		$("#objetno").click(function() {
			if(clickno%2 == 0){
				$(".sorted").attr("class", "");
				$("#objetno").attr("class", "sorted descending");
				thorder(publicyn, status, tag, "nod", objettitle, userid);
				clickno += 1;
				clickid = 0, clicktitle = 0, clickdate = 0, clickregi = 0;
			} else if(clickno%2 != 0){
				$(".sorted").attr("class", "");
				$("#objetno").attr("class", "sorted ascending");
				thorder(publicyn, status, tag, "noa", objettitle, userid);
				clickno += 1;
				clickid = 0, clicktitle = 0, clickdate = 0, clickregi = 0;
			}
		});
		$("#date").click(function() {
			if(clickdate%2 == 0){
				$(".sorted").attr("class", "");
				$("#date").attr("class", "sorted descending");
				thorder(publicyn, status, tag, "startd", objettitle, userid);
				clickdate += 1;
				clickno = 0, clicktitle = 0, clickid = 0, clickregi = 0;
			} else if(clickdate%2 != 0){
				$(".sorted").attr("class", "");
				$("#date").attr("class", "sorted ascending");
				thorder(publicyn, status, tag, "starta", objettitle, userid);
				clickdate += 1;
				clickno = 0, clicktitle = 0, clickid = 0, clickregi = 0;
			}
		});
		$("#regi").click(function() {
			if(clickregi%2 == 0){
				$(".sorted").attr("class", "");
				$("#regi").attr("class", "sorted descending");
				thorder(publicyn, status, tag, "regia", objettitle, userid);
				clickregi += 1;
				clickno = 0, clicktitle = 0, clickdate = 0, clickid = 0;
			} else if(clickregi%2 != 0){
				$(".sorted").attr("class", "");
				$("#regi").attr("class", "sorted ascending");
				thorder(publicyn, status, tag, "regid", objettitle, userid);
				clickregi += 1;
				clickno = 0, clicktitle = 0, clickdate = 0, clickid = 0;
			}
		});
	
		function thorder(publicyn, objetstatus, objettag, order, objettitle, userid) {
			$.ajax({
						url : "objetStatusOrder.do",
						data : {
							publicyn : publicyn,
							objetstatus : objetstatus,
							objettag : objettag,
							order : order,
							objettitle : objettitle,
							userid : userid
						},
						type : "post",
						dataType : "json",
						success : function(result) {
							var objStr = JSON.stringify(result);
							var jsonObj = JSON.parse(objStr);
							//출력용 문자열 준비 
							//출력할 문자열 만들기
							var bk ="";
							var tagged ="";
							var labeled ="";
							var labeled2 ="";
							var labeled3 ="";
							for ( var i in jsonObj.list) {
								tagged = '<div class="ui tiny label taglabel">' +decodeURIComponent(jsonObj.list[i].objettag.replace(/\+/gi, " ")).split(",").join('</div>&nbsp;&nbsp; <div class="ui tiny label taglabel">')+'</div>';
								console.log(tagged);
								
								bk += '<tr><td><div class="ui fitted checkbox"><input type="checkbox" name="objetno" value="'+jsonObj.list[i].objetno+'"> <label></label></div></td><td style="text-align: right;" id="objetno">'
										+ jsonObj.list[i].objetno
										+ "</a></td><td id='nick'><a href='objetmd.do?objetno="+ jsonObj.list[i].objetno +"'>"
										+ decodeURIComponent(jsonObj.list[i].objettitle.replace(/\+/gi, " "))
										+ "</a></td><td id='name'><a href='usermd.do?userid="+ jsonObj.list[i].userid +"'>"
										+ jsonObj.list[i].userid +"</a></td><td>"
										+ jsonObj.list[i].startdate + " ~ " + jsonObj.list[i].enddate + "</td><td>"
										+ tagged
										+ "</td><td id='enroll'>"
										+ jsonObj.list[i].publicyn + "</td><td>"
										+ jsonObj.list[i].regidate + "</td><td>"
										+ jsonObj.list[i].status
										+ "</td></tr>";
							}
							$("#objettable").html(bk);
						},
						error : function(request, status, errorData) {
							console.log("error code : " + request.status
									+ "\nMessage : " + request.responseText
									+ "\nError : " + errorData);
						}
					});
		}
		
		
		
		$("input[name=userid]").hide();
		
		$("#searchall").click(function() {
		$("input[name=objettitle]").hide();
		$("input[name=userid]").show();
		
		});
		$("#searchid").click(function() {
		$("input[name=objettitle]").hide();
		$("input[name=userid]").show();
		});
		$("#searchtitle").click(function() {
		$("input[name=userid]").hide();
		$("input[name=objettitle]").show();
		});
	});

</script>
<c:import url="adminHeader.jsp"/>
</head>
<body>
	<div id="um">
		<br>
		<div align="right">
		<form action="objetAllSearch.do" method="get">
			<input type="submit" class="ui basic button" value="검색">
			<div class="ui right action left icon input">
				<i class="search icon"></i> 
				<input type="search" placeholder="제목 검색" name="objettitle">
				<input type="h" placeholder="아이디 검색" name="userid">
				<input type="hidden" value="1" name="page">
				<div class="ui basic floating dropdown button">
					<div class="text">제 목</div>
					<i class="dropdown icon"></i>
					<div class="menu">
						<div class="item" id="searchtitle">제 목</div>
						<div class="item" id="searchid">아이디</div>
					</div>
				</div>
			</div>
		</form>
			<br>
			<div></div>
		</div>
		<div style="width: 480px;">
		<div class="ui item four menu">
				<div class="ui pointing dropdown link item">
				<span class="text">전시상태</span> <i class="dropdown icon"></i>
				<div class="menu">
					<div class="item" id="statusall">전체</div>
					<div class="item" id="statusopen">전시</div>
					<div class="item" id="statusclose">종료</div>
					<div class="item" id="statuswait">예정</div>
				</div>
			</div>
				<div class="ui pointing dropdown link item">
				<span class="text">승인여부</span> <i class="dropdown icon"></i>
				<div class="menu">
					<div class="item" id="publicall">전체</div>
					<div class="item" id="publicy">승인</div>
					<div class="item" id="publicn">반려</div>
					<div class="item" id="publicw">대기</div>
				</div>
			</div>
				<div class="ui pointing dropdown link item">
				<span class="text">태그</span> <i class="dropdown icon"></i>
				<div class="menu">
					<div class="item" id="tagall">전체</div>
					<div class="item" id="tagarc">건축</div>
					<div class="item" id="tagseo">서예</div>
					<div class="item" id="tagst">조각</div>
					<div class="item" id="tagpic">사진</div>
					<div class="item" id="tagde">디자인</div>
					<div class="item" id="tagho">회화</div>
					<div class="item" id="taggong">공예</div>
					<div class="item" id="tagetc">기타</div>
				</div>
			</div>
		<div class="ui pointing dropdown link item" onclick="history.go(0)">
				<span class="text">리셋</span></div>
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
					<th class="" width="74" style="text-align: center;" id="objetno">번호</th>
					<th class="" style="text-align: center;" id="title">제목</th>
					<th class="" width="100" style="text-align: center;" id="userid">작가 ID</th>
					<th class="" width="190" style="text-align: center;" id="date">전시 기간</th>
					<th class="" width="210" style="text-align: center;">태그</th>
					<th class="" width="75" style="text-align: center;">승인여부</th>
					<th class="" width="95" style="text-align: center;" id="regi">등록일</th>
					<th class="" width="50" style="text-align: center;">상태</th>
				</tr>
			</thead>
			<tbody id="objettable">
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
					</c:if>
					<c:if test="${ objetm.publicyn eq 'W' }">
					대기
					</c:if>
					</td>
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
		<div align="center">
		<div class="ui pagination menu">
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
		<a href="/objet/objetm.do?page=${ p }" class="active item">${ p }</a>
		</c:if>
		<c:if test="${ p ne currentPage }">
		<a href="/objet/objetm.do?page=${ p }" class="item">${ p }</a>
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