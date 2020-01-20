<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
<!-- 시맨틱유아이 cdn -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<c:import url="adminHeader.jsp" />
<style type="text/css">
#bodytag {
	background: #f2f2f2; 
	height: 1100px;
	margin-top: -13px;
}

#requestm {
	background: #ffffffaa;
	padding: 20px;
	width: 670px; 
	//border: 1px solid #cccccc77;
	border-radius: 5px;
	box-shadow: 1px 1px #ccc;
}

#usermanage {
	background: #ffffffaa;
	padding: 20px;
	width: 670px;
	//border: 1px solid #cccccc77;
	border-radius: 5px;
	margin-left: 20px;
	width: 670px;
	box-shadow: 1px 1px #ccc;
}

#reqtable {
	table-layout: fixed;
	text-overflow: ellipsis;
	overflow: hidden;
	width: 200px;
}

#usertable {
	table-layout: fixed;
	text-overflow: ellipsis;
	overflow: hidden;
	width: 200px;
}

#movediv {
	width: 122px;
	height: 100px;
	background: #fff; 
	border: 1px solid #cccccc77;
	border-radius: 5px;
	margin: 7.5px;
	padding: 5px;
	text-align: center;
	padding-top: 10px;
	border-top: 2px solid #444;
	margin-top: 0px; 
}

#movediv:hover {
	background: #eee;
}

#canvasdiv {
	width: 440px;
	margin-left: 20px;
	margin-bottom: -100px;
	background: #fff;
	padding-top: 10px;
	border-radius: 5px;
	//border: 1px solid #cccccc77;
	box-shadow: 1px 1px #ccc;
}
</style>
<script type="text/javascript">



$(function() {
	var now = new Date();
	var hh = now.getHours();
	console.log(now.getHours(), now.getMinutes());
//	if(hh==00){
		
	$.ajax({
		url : "insertlogindate.do",
		type : "post",
		success : function() {
			console.log("성공");
		},
		error : function(request, status, errorData) {
			console.log("error code : " + request.status
					+ "\nMessage : " + request.responseText
					+ "\nError : " + errorData);
		}
	});
//	}
	
	/* $.ajax({
		url : "logincount.do",
		type : "post",
		success : function(result) {
			console.log(result);
		},
		error : function(request, status, errorData) {
			console.log("error code : " + request.status
					+ "\nMessage : " + request.responseText
					+ "\nError : " + errorData);
		}
	}); */
	
$("#progress1").progress();
$("#progress2").progress();
$("#progress3").progress();

var objettag = "${ objettag }";

var count = (objettag.match(/건축/g) || []).length;
var count2 = (objettag.match(/서예/g) || []).length;
var count3 = (objettag.match(/조각/g) || []).length;
var count4 = (objettag.match(/디자인/g) || []).length;
var count5 = (objettag.match(/회화/g) || []).length;
var count6 = (objettag.match(/공예/g) || []).length;
var count7 = (objettag.match(/사진/g) || []).length;
var count8 = (objettag.match(/기타/g) || []).length;


var ctx = document.getElementById('myChart');
var ctx2 = document.getElementById('myChart2');
var ctx3 = document.getElementById('myChart3');
var myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: ['건축', '서예', '조각', '디자인', '회화', '공예', '사진', '기타'],
        datasets: [{	
            data: [count, count2, count3, count4, count5, count6, count7, count8],
            backgroundColor: [
                'rgba(90, 40, 190, 1)',
                'rgba(40, 110, 170, 1)', 
                'rgba(50, 160, 150, 1)',
                'rgba(120, 200, 120, 1)', 
                'rgba(230, 210, 110, 1)',
                'rgba(220, 130, 90, 1)',
                'rgba(210, 60, 110, 1)' ,
                'rgba(140, 50, 150, 1)',
                
            ]
        }]
    },
    options: {}
    
});


var usercount = ${ userlist.size() };
console.log(usercount);
var bkcount = $("#bkcount").text();
console.log(bkcount);
var userbkper = bkcount / usercount * 100;
console.log(userbkper);





var enroll1 = ${ count1 };
var enroll2 = ${ count2 };
var enroll3 = ${ count3 };
var enroll4 = ${ count4 };
var enroll5 = ${ count5 };
var enroll6 = ${ count6 };
var enroll7 = ${ count7 };
var enroll8 = ${ count8 };
var enroll9 = ${ count9 };
var enroll10 = ${ count10 };
var enroll11 = ${ count11 };
var enroll12 = ${ count12 };

var thisyear = new Date();
thisyear.getYear();
console.log(thisyear.getFullYear());

var myChart2 = new Chart(ctx2, {
    type: 'bar',
    data: {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        datasets: [{	
        	label: thisyear.getFullYear() + '년 월별 회원가입',
            data: [enroll1, enroll2, enroll3, enroll4, enroll5, enroll6, enroll7, enroll8, enroll9, enroll10, enroll11, enroll12],
            backgroundColor: [
            	 'rgba(100, 100, 100, 1)',
            	 'rgba(100, 100, 100, 1)',
            	 'rgba(100, 100, 100, 1)',
            	 'rgba(100, 100, 100, 1)',
            	 'rgba(100, 100, 100, 1)',
            	 'rgba(100, 100, 100, 1)',
            	 'rgba(100, 100, 100, 1)',
            	 'rgba(100, 100, 100, 1)',
            	 'rgba(100, 100, 100, 1)',
            	 'rgba(100, 100, 100, 1)',
            	 'rgba(100, 100, 100, 1)',
            	 'rgba(100, 100, 100, 1)'
            ],
            borderWidth: 0
        }]
    },
    options: {}
    
});

var login1 = "${ todaycount.login01 }";
var login2 = "${ todaycount.login02 }";
var login3 = "${ todaycount.login03 }";
var login4 = "${ todaycount.login04 }";
var login5 = "${ todaycount.login05 }";
var login6 = "${ todaycount.login06 }";
var login7 = "${ todaycount.login07 }";
var login8 = "${ todaycount.login08 }";
var login9 = "${ todaycount.login09 }";
var login10 = "${ todaycount.login10 }";
var login11 = "${ todaycount.login11 }";
var login12 = "${ todaycount.login12 }";
var login13 = "${ todaycount.login13 }";
var login14 = "${ todaycount.login14 }";
var login15 = "${ todaycount.login15 }";
var login16 = "${ todaycount.login16 }";
var login17 = "${ todaycount.login17 }";
var login18 = "${ todaycount.login18 }";
var login19 = "${ todaycount.login19 }";
var login20 = "${ todaycount.login20 }";
var login21 = "${ todaycount.login21 }";
var login22 = "${ todaycount.login22 }";
var login23 = "${ todaycount.login23 }";
var login0 = "${ todaycount.login00 }";
var logindate = "${ todaycount.logindate }";

console.log(login1);

var myChart3 = new Chart(ctx3, {
    type: 'line',
    data: {
    	labels: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'],
        datasets: [{
        	label: logindate + ' 시간 별 로그인',
        	data: [login0, login1, login2, login3, login4, login5, login6, login7, login8, login9, login10, login11, login12, login13, login14, 
        		login15, login16, login17, login18, login19, login20, login21, login22, login23],
            backgroundColor: [
                'rgba(200, 200, 200, 0.5)',
            ],
            borderColor: [
            	'rgba(0, 0, 0, 0.5)',
            ],
            borderWidth: 0
        }]
    },
    options: { scales: {
        yAxes: [{
            stacked: true
        }]
    }, responsive : true }
    
});
});
function chatbotpop() {
	var width = '600';
	var height = '700';
	var left = Math.ceil((window.screen.width - width) / 1.3);
	var top = Math.ceil((window.screen.width - height) / 2);
	window.open('chatbot.do' , '챗봇', 'width=' + width + ', height=' + height + ', left=' + left + ', top' + top);
} 
</script>
</head>
<body style="background: #ccc;">
	<div id="bodytag">
		<div style="padding: 140px; padding-top: 20px; padding-right: 20px; display: flex;">
			<a href="userm.do">
			<c:set value="${ 0 }" var="enrollcount"/>
			<c:set value="<%= new java.util.Date() %>" var="today"/>
			<fmt:formatDate value="${ today }" pattern="yyyy-MM-dd" var="today"/>
			<c:forEach items="${ userlist }" var="userl" >
 			<c:if test="${ userl.enrolldate eq today }">
 			<c:set value="${ enrollcount + 1 }" var="enrollcount"/>
 			</c:if>
			</c:forEach>
				<div id="movediv" style="margin-left: 0px;">
						<label class="ui small label" style="margin-top: -150px; margin-left: -65px;">${ userlist.size() }</label>
						<c:if test="${ enrollcount > 0}">
							<h5 style="margin-top: -22px; color: #6435c9;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;New ${ enrollcount }</h5>
						</c:if>
					<h5 class="ui header" style="margin-top: 10px;">
						<i class="icons"> <i class="user icon"></i>
						</i>회원조회
					</h5>
				</div>
			</a> <a href="userbk.do">
				<div id="movediv">
					<label class="ui small label" style="margin-top: -150px; margin-left: -70px;" id="bkcount">${ bkcount  }</label>
					<h5 class="ui header" style="margin-top: 10px;">
						<i class="icons"> <i class="large red dont icon"
							style="margin-left: 3px; margin-top: -5px;"></i> <i
							class="small user icon" style="margin-top: -3px;"></i>
						</i>블랙리스트
					</h5>
				</div>
			</a> <a href="objetm.do">
				<div id="movediv">
					<label class="ui small label" style="margin-top: -150px; margin-left: -70px;">${ objetmlist }</label>  
					<h5 class="ui header" style="margin-top: 10px;">
						<i class="icons"> <i class="image icon"></i>
						</i>전시조회
					</h5>
				</div>
			</a> <a href="noticem.do">
				<div id="movediv">
<%-- 					<label class="ui small red label" style="margin-top: -150px; margin-right: -110px;">${ userlist.size() }</label>  --%>
					<h5 class="ui header" style="margin-top: 31px;">
						<i class="icons"> <i class="bullhorn icon"></i>
						</i>공지사항
					</h5>
				</div>
			</a> <a href="faqm.do">
				<div id="movediv" style="margin-right: 0px;">
<%-- 					<label class="ui small red label" style="margin-top: -150px; margin-right: -110px;">${ userlist.size() }</label>  --%>
					<h5 class="ui header" style="margin-top: 31px;">
						<i class="icons"> <i class="file alternate icon"></i>
						</i>FAQ
					</h5>
				</div>
			</a>
			<div style="width: 680px; margin-top: 0px; margin-left: 20px;">
			<div style="margin-top: 0px;">
			<%-- <c:set var="reqcount" value="${ objetreqlist.size() /objetmlist.size() * 100}" /> --%>
			<fmt:formatNumber type="number" pattern="0.0" value="${ beforestart /objetreqlist.size()* 100}" var="reqcount"/>
			 <label class="label"> <font style="font-weight: bold;">마감 임박 신청작 : ${ reqcount }% </font></label>
			<div class="ui black progress" style="margin-top: 0px;margin-bottom: 0px;" id="progress1" data-percent="${ reqcount }">
				<div class="bar" align="center"></div>
			</div>
			 </div>
			<div style="margin-top: 7px;">
			<fmt:formatNumber type="number" pattern="0.0" value="${ qnaanswercount/qnacount * 100 }" var="qnaper"/>
			<label class="label"><font style="font-weight: bold;">1대1문의 답변률 :  ${ qnaper }%</font></label>
			<div class="ui violet progress" style="margin-top: 0px; margin-bottom: 15px;" id="progress2" data-percent="${ qnaper }"> 
				<div class="bar" align="center"></div>
			</div> 
			</div>
			</div>
		</div>
		<div style="display: flex; margin-top: -130px; ">
		<div style="margin-left: 140px;" id="canvasdiv">
		<canvas id="myChart" width="150" height="70"></canvas><br>
		</div>
		<div id="canvasdiv">
		<canvas id="myChart2" width="150" height="70"></canvas><br>
		</div>
		<div id="canvasdiv">
		<canvas id="myChart3" width="150" height="70"></canvas><br>
		</div>
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br> 
		<div
			style="padding: 140px; padding-top: 20px; padding-right: 20px; display: flex; margin-top: -150px;">
			<div id="requestm">
				<div align="right" style="margin: -5px;">
					<a href="objetreq.do" style="margin-left: 570px;">
						<button class="ui tiny button icon" style="background: #eee;">
							<i class="icon plus"></i>
						</button>
					</a>
				</div>
				<h3 style="margin-top: -25px;">신청작<label class="ui small red label" style="margin-left: 20px;" id="reqlabel">New ${ objetreqlist.size() }</label> </h3>	
				<hr noshade="noshade">
				<table class="ui celled table selectable" style="font-size: 9pt;"
					id="reqtable">
					<thead align="center">
						<tr>
							<th class="" width="80">번호</th>
							<th class="" width="190">제목</th>
							<th class="" width="100">작가 ID</th>
							<th class="" width="170">전시 기간</th>
							<th class="" width="90">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ objetreqlist }" var="objetreq" end="4">
							<c:url value="objetmd.do" var="objetmd">
								<c:param name="objetno" value="${ objetreq.objetno }" />
							</c:url>
							<tr>
								<td style="text-align: right;">${ objetreq.objetno }</td>
								<td><nobr>
										<a href="${ objetmd }">${ objetreq.objettitle }</a>
									</nobr></td>
								<td style="text-align: right;"><nobr>${ objetreq.userid }</nobr></td>
								<td>${ objetreq.objetstartdate }&nbsp;&nbsp;~&nbsp;&nbsp;
									${ objetreq.objetenddate }</td>
								<td>${ objetreq.objetregidate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="usermanage">
				<div align="right" style="margin: -5px;">
					<a href="qnam.do" style="margin-left: 570px;">
						<button class="ui tiny button icon" style="background: #eee;">
							<i class="icon plus"></i>
						</button>
					</a>
				</div>
				<h3 style="margin-top: -25px;">문의관리<label class="ui small red label" style="margin-left: 20px;" id="reqlabel">New ${ qnacount - qnaanswercount }</label> </h3>
				<hr noshade="noshade">
				<table class="ui celled table selectable" style="font-size: 9pt;"
					id="reqtable">
					<thead align="center">
						<tr>
							<th class="" width="80">번호</th>
							<th class="" width="90">문의 분류</th>
							<th class="" width="190">제목</th>
							<th class="" width="100">회원 ID</th>
							<th class="" width="170">문의 작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ qnalist }" var="qna" end="4">
							<c:url value="qnamd.do" var="qnamd">
								<c:param name="qnano" value="${ qna.qnano }" />
							</c:url>
							<tr>
								<td style="text-align: right;">${ qna.qnano }</td>
								<td style="text-align: center;">${ qna.qnatype }</td>
								<td><nobr>
										<a href="${ qnamd }">${ qna.qnatitle }</a>
									</nobr></td>
								<td style="text-align: right;"><nobr>${ qna.userid }</nobr></td>
								<td style="text-align: center;">${ qna.questiondate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
		<div
			style="padding: 140px; padding-top: 20px; padding-right: 20px; display: flex; margin-top: -140px;">
			<div id="requestm">
				<div align="right" style="margin: -5px;">
					<a href="reportbm.do" style="margin-left: 570px;"><button
							style="background: #eee;" class="ui tiny button icon">
							<i class="icon plus"></i>
						</button></a>
				</div>
				<h3 style="margin-top: -25px;">신고 게시글 관리<label class="ui small red label" style="margin-left: 20px;" id="reqlabel">New ${ reportblist.size() }</label> </h3>
				<hr noshade="noshade">
				<table class="ui celled table selectable" style="font-size: 9pt;"
					id="usertable">
					<thead align="center">
						<tr>
							<th class="" width="160">신고횟수</th>
							<th class="" width="150">원글번호</th>
							<th class="" width="160">신고된 작성자</th>
							<th class="" width="160">원글 유형</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ reportblist }" var="reportb">
							<tr>
								<td style="text-align: right;">${ reportb.reportcount }</td>
								<td style="text-align: right;">${ reportb.originno }</td>
								<td style="text-align: right;">${ reportb.reportedb }</td>
								<td style="text-align: right;"><c:if
										test="${ reportb.reportbtype eq 'OBJET' }">
								전시
								</c:if> <c:if test="${ reportb.reportbtype eq 'REVIEW' }">
								한줄평
								</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="usermanage">
				<div align="right" style="margin: -5px;">
					<a href="userm.do" style="margin-left: 570px;"><button
							style="background: #eee;" class="ui tiny button icon">
							<i class="icon plus"></i>
						</button></a>
				</div>
				<h3 style="margin-top: -25px;">회원 신고 관리<label class="ui small red label" style="margin-left: 20px;" id="reqlabel">${ reportulist.size() }</label> </h3>
				<hr noshade="noshade">
				<table class="ui celled table selectable" style="font-size: 9pt;"
					id="usertable">
					<thead align="center">
						<tr>
							<th class="" width="160">신고횟수</th>
							<th class="" width="150">회원 ID</th>
							<th class="" width="160">회원 닉네임</th>
							<th class="" width="160">회원 이름</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ reportulist }" var="reportu" end="4">
							<tr>
								<td style="text-align: right;">${ reportu.reportcount }</td>
								<td style="text-align: right;">${ reportu.reportedu }</td>
								<td style="text-align: right;">${ reportu.nickname }</td>
								<td style="text-align: right;">${ reportu.username }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<c:import url="../footer.jsp"/>
</body>
</html>