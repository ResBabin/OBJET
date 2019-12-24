<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- favicon 위치 -->
<link rel="shortcut icon" href="resources/images/favicon-32x32.png">
<link rel="icon" href="resources/images/favicon-32x32.png">
<meta charset="UTF-8">
<title>Objet</title>
<c:import url="../header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="resources/css/swiper.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.js"></script>
 <!-- fullcalendar -->
<link rel="stylesheet" href="resources/FullCalendar/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet" href='resources/FullCalendar/vendor/css/select2.min.css' />
<link rel="stylesheet" href='resources/FullCalendar/vendor/css/bootstrap-datetimepicker.min.css' />
<script src="resources/FullCalendar/vendor/js/moment.min.js"></script>
<script src="resources/FullCalendar/vendor/js/fullcalendar.min.js"></script>
<script src="resources/FullCalendar/vendor/js/ko.js"></script>
<script src="resources/FullCalendar/vendor/js/select2.min.js"></script>
<script src="resources/FullCalendar/vendor/js/bootstrap-datetimepicker.min.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/js/addEvent.js"></script>
<script src="resources/js/editEvent.js"></script>
<script src="resources/js/etcSetting.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/popper.js" integrity="sha256-Ay8FUC6Dm+HcDdSaEOoggcHDUSyBg/tX2j3pwdzBjC4=" crossorigin="anonymous"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href='resources/css/calendar.css' />
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

.all {
	min-height: 100%;
}

.objet_infomation {
	padding-bottom: 0px;
}

#banner_img {
	z-index: -999;
	width: 100%;
	height: 420px;
	vertical-align: top;
	margin-top: -107px;
	overflow: scroll;
	position: relative;
}

#banner_img_text {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 2;
	font-family: 'Nanum Gothic', sans-serif;
}

.banner_img_btn {
	position: absolute;
	top: 34%;
	left: 27%;
	transform: translate(-50%, -50%);
	height: auto;
	width: 250px;
	text-align: center;
	font-family: 'Nanum Gothic', sans-serif;
}

.banner_date {
	font-weight: bold;
	font-size: 24px;
	color: #fff;
	position: absolute;
	top: 30%;
	left: 27.5%;
	transform: translate(-50%, -50%);
	padding-top: 12px;
	line-height: 36px;
	font-family: 'Nanum Gothic', sans-serif;
	letter-spacing: -.05em;
}

.header_icons {
	float: right;
}

.default_wrap {
	position: absolute;
	transform: translate(0, 0);
	font-size: 14px;
	right: 1px;
	padding-top: 0px;
	margin-top: -100px;
}

#heart {
	position: relative;
}

.like_cnt {
	position: relative;
	color: #fff;
	font-size: 14px;
}

#chat {
	position: relative;
}

#share {
	position: relative;
}

#more {
	position: relative;
}

#objet_info_menu {
	margin-top: 0px;
	border-radius: 0;
	height: 55px;
	font-size: 18px;
	font-weight: bolder;
}

#item {
	font-weight: bold;
	color: #fff;
}

.search-option-cate {
	margin: 170px 150px 25px 0;
	float: right;
}

.search-option .option {
	font-size: 14px;
	font-weight: normal;
	font-family: 'Nanum Gothic';
	color: #959595;
	cursor: pointer;
}

.search-option .on {
	font-size: 14px;
	font-weight: bolder;
	font-family: 'Nanum Gothic';
	color: #666666;
}

.search-option .option::before {
	font-size: 40px !important;
	content: '·';
	color: lightgray;
	left: -10px;
	vertical-align: middle;
	top: 3px;
}

.search-option .on::before {
	font-size: 40px !important;
	content: '·';
	color: #2185d0;
	left: -10px;
	top: 3px;
}

.det_title {
	text-align: center;
	font-size: 32px;
	font-weight: bold;
	align: center;
	margin: 0;
	position: relative;
	top: 70px;
	letter-spacing: -0.3px;
}

.det_title:after {
	content: "";
	display: block;
	width: 60px;
	border-top: 5px solid black;
	margin: -55px auto;
}

#more_btn {
	width: 80%;
	height: 30px;
	margin-top: 220px;
	font-size: 17px;
	font-weight: bold;
	letter-spacing: 1px;
	color: #9e9e9e;
	font-family: 'Nanum Gothic'
}

#more_btn:after {
	content: "";
	display: block;
	border-bottom: 1px solid #e0e0e0;
	margin: 30px auto;
}

#more_btn a {
	color: #9e9e9e;
}

.review_all_list {
	width: 80%;
	height: auto;
	margin: 20px 40px 10px 40px;
	position: relative;
	top: 190px;
	border-bottom: 1px solid #e0e0e0;
	align: center;
}

.review_list {
	width: 100%;
	height: 135px;
	border-top: 1px solid #e0e0e0;
	align: center;
	text-align: left;
	line-height: 28px;
}

#writer_pic {
	width: 85px;
	height: 85px;
	align: left;
	position: relative;
	top: 25px;
	left: 55px;
}

.review_content {
	position: relative;
	top: -59px;
	left: 160px;
}

.rev_writer {
	font-size: 16px;
	font-weight: bolder;
	letter-spacing: -0.5px;
	color: #3d3d3d;
}

.rev_date {
	font-size: 15px;
	font-weight: bolder;
	letter-spacing: -0.5px;
	color: #959595;
	font-family: 'Nanum Myeongjo';
}

.rev_report:before {
	content: "|";
	font-size: 14px;
	font-weight: lighter;
	color: #ccc;
	margin: 0px 5px 0px 5px;
}

.rev_date:before {
	content: "|";
	font-size: 14px;
	font-weight: lighter;
	color: #ccc;
	margin: 0px 5px 0px 5px;
}

.rev_report {
	font-size: 14px;
	font-weight: lighter;
	color: #959595;
	cursor: pointer;
}

.rev_cont {
	font-size: 15px;
	font-weight: normal;
	color: black;
}

.rev_like_btn {
	position: relative;
	top: -36px;
	right: -960px;
}

#rev_like {
	width: 55px;
	height: auto;
	margin: 0;
	padding: 8px;
	border: 0;
}

#rev_hate {
	width: 55px;
	height: auto;
	margin: 0;
	padding: 8px;
}

.rev_cnt {
	font-size: 12px;
	font-weight: normal;
	color: gray;
	position: relative;
	top: -1px;
	text-align: center;
}

.rev_insert {
	width: 80%;
	height: auto;
	margin: 20px 40px 10px 40px;
	position: relative;
	top: 10px;
	align: center;
}

.review_insert {
	width: 100%;
	height: 135px;
	align: center;
	text-align: left;
	line-height: 28px;
}

.review_ins_content {
	position: relative;
	top: -60px;
	left: 160px;
	width: 85%;
	height: auto;
	display: inline-block;
}

.rev_ins_cont {
	font-size: 14px;
	font-weight: bold;
	color: #9e9e9e;
	width: 100%;
	resize: none;
	min-height: 4.5em;
	line-height: 1.6em;
	max-height: 6.5em;
	padding: 10px;
	border-radius: 1px;
	border: 1px solid #e0e0e0;
	display: inline-block;
}

#writer_pic_2 {
	width: 75px;
	height: 75px;
	align: left;
	position: relative;
	top: 15px;
	left: 60px;
}

.rev_ins_cont span {
	position: relative;
	bottom: 5px;
	right: 5px;
}

#counter_ins {
	position: relative;
	right: -955px;
	top: -32px;
	padding: 0 .5em 0 .5em;
	font-size: 0.85em;
	text-align: right;
	color: lightgrey;
}

#rev_rating {
	float: right;
	position: relative;
	top: 30px;
	right: 200px;
}

.submit_btn {
	float: right;
	position: relative;
	top: -70px;
	right: 30px;
	font-size: 14px;
	font-weight: bolder;
}
/* 내 한줄평 스타일 */
#rev_mymore {
	position: relative;
	top: 3px;
	right: -890px;
	background: transparent;
}

.review_mylist {
	width: 100%;
	height: 135px;
	border-top: 1px solid lightgray;
	align: center;
	text-align: left;
	line-height: 28px;
	background-color: rgba(0, 0, 0, 0.02);
}

#writer_mypic {
	width: 85px;
	height: 85px;
	align: left;
	position: relative;
	top: 25px;
	left: 55px;
}

.review_mycontent {
	position: relative;
	top: -70px;
	left: 160px;
}

.rev_mywriter {
	font-size: 16px;
	font-weight: bolder;
	letter-spacing: -0.5px;
	color: #3d3d3d;
}

.rev_mydate {
	font-size: 15px;
	font-weight: bolder;
	letter-spacing: -0.5px;
	color: #959595;
	font-family: 'Nanum Myeongjo';
}

.rev_mydate:before {
	content: "|";
	font-size: 14px;
	font-weight: lighter;
	color: #ccc;
	margin: 0px 5px 0px 5px;
}

.rev_mycont {
	font-size: 15px;
	font-weight: normal;
	color: black;
	top: -3px;
	position: relative;
}

#my_rev_btn {
	width: 55px;
	height: 25px;
	font-size: 12px;
	border-radius: 2px;
	color: #e74c3c;
	padding: 3px;
	position: relative;
	top: -3px;
	left: 2px;
	font-weight: bold;
	margin-right: 3px;
}
/* 내 한줄평 수정 */
.review_mylist_up {
	width: 100%;
	height: 165px;
	border-top: 1px solid lightgray;
	align: center;
	text-align: left;
	line-height: 28px;
	background-color: rgba(0, 0, 0, 0.02);
	display: none;
}

#rev_myrating {
	float: right;
	position: relative;
	top: -65px;
	right: 200px;
}

.update_mybtn {
	float: right;
	position: relative;
	top: -70px;
	right: -55px;
	font-size: 14px;
	font-weight: bolder;
}

.rev_up_cont {
	font-size: 14px;
	font-weight: bold;
	color: #9e9e9e;
	width: 100%;
	resize: none;
	min-height: 4.5em;
	line-height: 1.6em;
	max-height: 6.5em;
	padding: 10px;
	border-radius: 1px;
	border: 1px solid #e0e0e0;
	display: inline-block;
}

#counter_up {
	position: relative;
	right: -955px;
	top: -32px;
	padding: 0 .5em 0 .5em;
	font-size: 0.85em;
	text-align: right;
	color: lightgrey;
}

/* 전시 신고하기 */
.choiceReportReason1 {
	font-size: 20pt;
	align-self: center;
	text-align: left;
	background: #e2e2e2;
	width: 500px;
	height: 360px;
	padding: 20px 40px;
}
/* 한줄평 신고하기 */
.choiceReportReason2 {
	font-size: 20pt;
	align-self: center;
	text-align: left;
	background: #ccc;
	width: 500px;
	height: 250px;
	padding: 25px 40px;
	align: center;
}

/* 전시 소개 스타일  */
#exhibition_img {
	width: 60%;
	height: auto;
	margin-top: 12%;
	align: center;
}

.exhibition_info_txt {
	font-size: 23px;
	font-weight: bolder;
	color: #959595;
	font-family: 'Nanum Myeongjo';
	line-height: 30px;
	align-content: center;
	margin-top: 50px;
}

.exhibition_intro {
	margin-top: 40px;
}

.exhibition_vp {
	margin-top: 60px;
	background: rgba(41, 128, 185, 0.38);
	width: 100%;
	height: 800px;
	align: left;
}

.intro_mp3 {
	width: 60%;
	height: auto;
	margin-top: 12%;
	align: center;
}

.intro_txt {
	margin-top: 40px;
	font-weight: bolder;
	font-family: 'Nanum Gothic';
	line-height: 30px;
	text-align: center;
	text-align-last: auto;
	text-justify: inter-word;
	align: center;
	font-size: 15px;
}

.intro_txt h1 {
	font-weight: bold;
	font-family: 'Nanum Gothic';
	line-height: 50px;
	font-size: 32px;
}

.swiper-container {
	margin-top: 190px;
	width: 60%;
	height: 50%;
	overflow: hidden;
	position: absolute;
	right: 95%;
	left: 5%;
}

.swiper-slide {
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	max-width: 100%;
	max-height: 100%;
	height: auto;
	align: center;
}

.swiper-pagination {
	position: absolute;
	right: 100%;
	left: 0%;
}

.swiper-pagination-bullet {
	width: 12px;
	height: 12px;
	opacity: 0.8;
	background: #fff;
}

.swiper-pagination-bullet-active {
	background: #707070;
}

.vp_txt h1 {
	font-weight: 700;
	font-family: 'Nanum Gothic';
	line-height: 56px;
	font-size: 36px;
	text-align: left;
	color: #fff;
}

.vp_txt {
	float: right;
	margin: 240px 180px 10px 0px;
}

#vp_last_txt {
	text-align: center;
	color: #fff;
	font-weight: 700;
	font-family: 'Nanum Gothic';
	line-height: 68px;
	font-size: 48px;
	position: absolute;
	margin-top: 650px;
	margin-left: -180px;
	margin-bottom: 20px;
}

.vp_top {
	float: right;
	position: absolute;
	margin-top: 760px;
	margin-left: 90%;
}
/* 작가소개 스타일 */
.artist_cont {
	width: 80%;
	height: 650px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	position: relative;
	top: 60px;
	align: center;
	left: 10%;
}

.artist_cont1 {
	margin: 0 150px 0 0;
}

#artist_tit {
	font-family: 'Nanum Gothic';
	font-weight: 700;
	font-size: 36px;
	position: relative;
	bottom: 30px;
	text-align: left;
}

#artist_info_cont {
	font-family: 'Nanum Gothic';
	font-weight: bolder;
	font-size: 14px;
	text-align: left;
}

#artist_pic {
	width: 100%;
	height: auto;
	margin: 0 -200px 0 0;
}

/* 전시일정 스타일  */

</style>
<script type="text/javascript">
	$(function() {
		//tab menu
		$("#objet_info_menu #item").on("click", function() {
			var tab = $(this).attr("data-tab");
			$("#objet_info_menu #item").removeClass("active");
			$(this).addClass("active");
			$(".tab").removeClass("active");
			$("#" + tab).addClass("active");
		});

		$(".search-option .option").on("click", function() {
			$(".search-option .option").removeClass("on");
			$(this).addClass("on");
			$(".search-option .i .off").removeClass("off");
			$(".search-option .i").addClass("off");
		});

		$("#rev_like .icon").on("click", function() {
			$(this).removeClass("outline");
			$(this).addClass("blue");
		});
		$("#rev_hate .icon").on("click", function() {
			$(this).removeClass("outline");
			$(this).addClass("gray");
		});

		//평점 레이팅(리스트)
		$('.rating').rating('disable', {
			initialRating : 1,
			maxRating : 5,
			clearable : false,
		});

		//평점 레이팅(등록)
		$('.insert').rating('enable', {
			initialRating : 1,
			maxRating : 5,
			clearable : false,
		});

		//한줄평 등록 글자수 카운팅
		$('.rev_ins_cont')
				.keyup(
						function(e) {
							var content = $(this).val();
							$("#counter_ins").html(
									"( <span style='color:#4ecdc4;'>"
											+ content.length
											+ "</span> / 최대 100자 )"); // 글자수 실시간 카운팅
							if (content.length > 100) {
								alert("최대 100자까지만 입력 가능합니다.");
								$(this).val(content.substring(0, 100));
								$("#counter_ins")
										.html(
												"( <span style='color:red;'>100 </span>/ 최대 100자)");
							}
						});
		$('rev_ins_cont').keyup();

		//한줄평 수정 글자수 카운팅
		$(".rev_up_cont")
				.keyup(
						function(e) {
							var content = $(this).val();
							$("#counter_up").html(
									"( <span style='color:#4ecdc4;font-size:9pt;'>"
											+ content.length
											+ "</span> / 최대 100자 )"); // 글자수 실시간 카운팅
							if (content.length > 100) {
								alert("최대 100자까지만 입력 가능합니다.");
								$(this).val(content.substring(0, 100));
								$("#counter_up")
										.html(
												"( <span style='color:red;font-size:9pt;'>100 </span>/ 최대 100자)");
							}
						});
		$('rev_up_cont').keyup();

		//내 한줄평 수정/삭제 버튼
		$("#rev_mymore").dropdown();

		$(".up_btn").on("click", function() {
			$(".review_mylist_up").css("display", "block");
			$(".review_mylist").css("display", "none");
		});

		$(".del_btn").on("click", function() {
			$("#rev_del_modal").modal('show');
		});

		//한줄평 신고 모달
		$(".rev_report").on("click", function() {
			$("#rev_rep_modal").modal('show');
		});

		//한줄평 신고 기타사유
		// 기타 선택 시에만 textarea 활성화
		$("input:radio[name=reportreason]")
				.click(
						function() {
							if ($("input[name=reportreason]:checked").val() == "기타") {
								$("textarea[name=etc]").attr("disabled", false);
								$("textarea[name=etc]").focus();
								$("textarea[name=etc]").attr("placeholder",
										"기타 사유를 입력해주세요.(최대 100자)")
								$("#count").css("display", "block");
								// radio 버튼의 value 값이 '기타'면 textarea활성화 & 자동포커스 & placeholder & 글자수세기 나오기
							} else {// 아니라면 text 비활성화&placeholder없음&글자수세기 없음
								$("textarea[name=etc]").attr("disabled", true);
								$("textarea[name=etc]").removeAttr(
										"placeholder",
										"기타 사유를 입력해주세요.(최대 100자)")
								$("#count").css("display", "none");
								// 이전 기타 textarea작성 값 초기화
								$("textarea[name=etc]").val("");
								$("#count")
										.html(
												"( <span style='color:#4ecdc4;font-size:9pt;'>0</span> / 최대 100자 )");
							}
						});

		// 기타사유 글자수 세기
		$("textarea[name=etc]")
				.keyup(
						function(e) {
							var content = $(this).val();
							$("#count").html(
									"( <span style='color:#4ecdc4;font-size:9pt;'>"
											+ content.length
											+ "</span> / 최대 100자 )"); // 글자수 실시간 카운팅
							if (content.length > 100) {
								alert("최대 100자까지만 입력 가능합니다.");
								$(this).val(content.substring(0, 100));
								$("#count")
										.html(
												"( <span style='color:red;font-size:9pt;'>100 </span>/ 최대 100자)");
							}
						});

		//캘린더
		/* $('#calendar').fullCalendar({
		    defaultView: 'month',
		    defaultDate: '2019-11-12',

		    eventRender: function (eventObj, $el) {
		        $el.popover({
		            title: eventObj.title,
		            content: eventObj.description,
		            trigger: 'hover',
		            placement: 'top',
		            container: 'body'
		        });
		    },

		    events: [{
		            title: 'All Day Event',
		            description: 'description for All Day Event',
		            start: '2019-11-01'
		        },
		        {
		            title: 'Long Event',
		            description: 'description for Long Event',
		            start: '2018-10-07',
		            end: '2019-11-10'
		        },
		        {
		            id: 999,
		            title: 'Repeating Event',
		            description: 'description for Repeating Event',
		            start: '2019-11-09T16:00:00'
		        },
		        {
		            id: 999,
		            title: 'Repeating Event',
		            description: 'description for Repeating Event',
		            start: '2019-11-16T16:00:00'
		        },
		        {
		            title: 'Conference',
		            description: 'description for Conference',
		            start: '2018-11-11',
		            end: '2019-11-13'
		        },
		        {
		            title: 'Meeting',
		            description: 'description for Meeting',
		            start: '2019-11-12T10:30:00',
		            end: '2019-11-12T12:30:00'
		        },
		        {
		            title: 'Lunch',
		            description: 'description for Lunch',
		            start: '2019-11-12T12:00:00'
		        },
		        {
		            title: 'Meeting',
		            description: 'description for Meeting',
		            start: '2019-11-12T14:30:00'
		        },
		        {
		            title: 'Birthday Party',
		            description: 'description for Birthday Party',
		            start: '2019-11-13T07:00:00'
		        },
		        {
		            title: 'Click for Google',
		            description: 'description for Click for Google',
		            url: 'http://google.com/',
		            start: '2019-11-28'
		        }
		    ]
		}); */
	});
</script>
</head>
<body>
<section class="all">
<section class="objet_infomation">
<!-- <div class="header_icons">
<i class="material-icons" style="color:#fff;font-size:24px;" id="heart">&#xe87e;</i>
<span class="like_cnt">153</span>
<i class="right floated chat outline icon" style="color:#fff;font-size:24px;" id="chat"></i>
<i class="material-icons" style="color:#fff;font-size:24px;" id="share">&#xe80d;</i>
<i class="material-icons" style="color:#fff;font-size:24px;" id="more">&#xe5d4;</i>
</div> -->
 <div class="header_icons">
<div class="wrap_action">
<button id="btnToggleArticleMoreAction" type="button" class="f_r img_ico text_hide ico_action #more">실행</button>
<div class="more_action header_icons ">
<button class="reportArticle f_l more_action text_hide img_ico img_ico_single ico_report #report">신고</button>
</div>

<div class="default_wrap header_icons">
<a href="#likeit" class="default_action headerLikeBtn img_ico_wrap #likeit" onclick="return B.ArticleLike.like(this)">
<i class="material-icons" style="color:#fff;font-size:24px;" id="heart">&#xe87e;</i>
<span class="like_cnt">6</span>
</a>
<a href="#comments" class="default_action img_ico_wrap comment #comment">
<i class="right floated chat outline icon" style="color:#fff;font-size:24px;" id="chat"></i>
</a>
<i class="material-icons" style="color:#fff;font-size:24px;" id="share">&#xe80d;</i>
<span class="wrap_share_gnb wrap_share_common">
<strong class="tit_sharegnb">오브제 전시를 SNS에 공유해보세요</strong>
<button type="button" class="ico_share_common btn_share_facebook #facebook" data-servicename="facebook">
    <span class="screen_out">페이스북공유</span>
</button>
<button type="button" class="ico_share_common btn_share_kakaotalk #kakaotalk" data-servicename="kakaotalk">
    <span class="screen_out">카카오톡공유</span>
</button>
<button type="button" class="ico_share_common btn_share_twitter #twitter" data-servicename="twitter">
    <span class="screen_out">트위터공유</span>
</button>
</span>
</div>
</div>
</div>
<img src="resources/images/objet/objetmainposter.jpg" id="banner_img">
<div class="banner_img_text"><!-- <span class="banner_date">2019. 08. 02 - 2019. 12. 12 </span> -->
<div class="ui inverted black icon button banner_img_btn" style="font-size: 18px;" onclick="location.href='objetView.do'">전시 감상하러 가기
&nbsp;<i class="ui arrow right icon" style="font-size:18px;"></i>
</div></div>
<div class="ui fluid four item inverted menu" id="objet_info_menu">
  <a class="active item" id="item" data-tab="objet_info">
    전시소개
  </a>
  <a class="item" id="item" data-tab="artist_info">
    작가소개
  </a>
  <a class="item" id="item" data-tab="objet_calendar">
    전시일정
  </a>
  <a class="item" id="item" data-tab="objet_review">
    한줄평
  </a>
</div>
<center>
<div class="objet_cont">
<div class="ui bottom attached tab active" id="objet_info">
<span class="det_title">EXHIBITION</span><br>
<div class="objet_section">
<div class="exhibition_main">
<p><img src="resources/images/objet/text_tomorrow.PNG" alt="IS IT TOMORROW YET?" id="exhibition_img"></p><br>
</div>
<div class="exhibition_info_txt">
<i style="font-family:'Nanum Myeongjo';"><img src="resources/images/objet/quotation.PNG" style="width:25px;height: auto;"> 
&nbsp;&nbsp;&nbsp;&nbsp;I am &amp; I will be &amp; I am being now &amp; today &amp; forever &amp; at the moment for the present &amp; the future<br>
&amp; I was as well in the past when I decided I would always be the bluest blue jumping &amp; running to &amp; falling into
&amp; diving<br> deep deep down into a deeper blue &amp; swimming to find the one, the most absolute &amp; purest of blues.<br><br>
나는 &amp; 앞으로 &amp; 바로 지금 &amp; 항상 &amp; 현재 이 순간 & 미래에 &amp; 나의 과거에도 푸르디 푸른 모습으로 도약하고<br> 
&amp; 짙은 파랑 속으로 깊게 깊게 내려가 &amp; 가장 완벽하고 순수한 파랑을 찾을 때까지 헤엄칠 수 있기를.&nbsp;&nbsp;&nbsp;&nbsp;
<img src="resources/images/objet/quotation.PNG" style="transform: rotate(180deg); width:25px;height: auto;"></i>
</div>
<div class="exhibition_intro">
<span class="det_title">INTRODUCTORY FILM</span><br>
<video class="intro_mp3" src="${pageContext.servletContext.contextPath }/resources/media/objet.avi" 
controls poster="${pageContext.servletContext.contextPath }/resources/images/objet/22.JPG"></video>
<br>
<div class="intro_txt">		
<h1>나는 코코 카피탄,<br> 
오늘을 살아가는 너에게</h1>		
<p>코코 카피탄은 밀레니얼 세대의 성장 과정에서 한 번쯤은 겪었거나 현재 겪고 있는 여러 감정을 솔직하게 담은 글귀, <br>
그리고 정형화되지 않은 색감과 구도의 사진 작업으로 순수 예술 영역뿐만 아니라 패션과 같은 상업 영역에 신선한 반향을 일으키고 있습니다. <br>
특히 구찌(Gucci)의 ‘2017 가을/겨울 컬렉션 콜라보레이션’ 및 아트월 프로젝트는 각종 온/오프라인 매체를 통해 국내외 대중들에게 <br>
뜨거운 관심과 화제를 불러일으키며 브랜드와 아티스트 간의 이상적인 협업을 이끌어 낸 대표적인 사례로 손꼽히고 있습니다.</p>
<p>이번 전시에서는 팝 아트를 현대적으로 재해석한 설치 작품부터, 작가의 상상을 표현한 페인팅 및 이중적인 감정들을 위트 있게 담아낸 핸드라이팅 작업까지 <br>
코코 카피탄의 작품세계를 다채롭게 선보입니다. 오늘에 대한 고민과 오지 않은 미래에 대한 불안 등의 다양한 감정을 담고 있는 작가의 작품은, <br>
질풍노도의 사춘기 시절만큼이나 폭풍 같은 오춘기를 겪고 있는 우리에게 위로와 공감을 선사할 것입니다.</p>		
</div>
</div>
<div class="exhibition_vp">
<span class="det_title">VIEW POINT</span><br>
  <div class="swiper-container">
  <div class="swiper-pagination" ></div>
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="resources/images/objet/coco_ex.jpg"></div>
      <div class="swiper-slide"><img src="resources/images/objet/Boy in Socks.jpg"></div>
      <div class="swiper-slide"><img src="resources/images/objet/Girl in Yellow.jpg"></div>
      <div class="swiper-slide"><img src="resources/images/objet/Hasta La Vista.jpg"></div>
    </div>
  </div>
<div class="vp_txt">
<b><h1>나는 아티스트 코코 카피탄. <br>
조금은 남달라도 괜찮아.</h1></b>
</div>
<strong id="vp_last_txt">VR EXHIBITION으로 <br>좋아하는 작가의 전시를 더 생생하게 느껴보세요!</strong>

 <script type="text/javascript" src="resources/js/swiper.min.js"></script>
  <script type="text/javascript">
	var swiper = new Swiper('.swiper-container', {
		direction : 'vertical',
		loop: true,
		pagination : {
			el : '.swiper-pagination',
			clickable : true,
		},
		
	});
</script>
<div class="vp_top">
<a href="#"><img src="resources/images/objet/top.png" style="width:60%; height:auto;"></a></div>
</div>
</div>
</div>
</center>
<div class="ui bottom attached tab" id="artist_info">
<center><span class="det_title">ARTIST</span></center><br>
<div class="artist_cont">
<div class="artist_cont1">
<span id="artist_tit">코코 카피탄</span><br>
<span id="artist_info_cont">코코 카피탄(Coco Capitán, 1992년 스페인 출생)은 런던을 기반으로 활동하는 <br>포토그래퍼이자 아티스트로,
런던패션대학(London College of Fashion)에서 패션 사진을 전공하고, 영국 왕립예술학교 (Royal College of Art)에서 사진학 석사를 졸업하였다.<br>
작가는 특유의 꾸밈없는 솔직함과 자유로움으로 사진, 페인팅, 벽화, 핸드라이팅, 영상, 설치 등을 선보이며 <보그(Vogue)>, <데이즈드(Dazed)>, ‘멀버리(Mulberry)’,<br>
‘메종 마르틴 마르지엘라(Maison Martin Margiela)’, ‘컨버스(Converse)’ 등 세계 유명 패션 브랜드 및 매거진과의 화보촬영을 진행하였고,<br>
지난 해 구찌(Gucci)의 ‘Young Art Star’로 지목되어 <br>아티스트로서의 가능성을 성공적으로 입증하였다.
연이어 그녀의 작품은 뉴욕과 밀라노, 피렌체, 마이애미의 구찌 건물과 외벽을 장식하였으며, 아트 바젤 마이애미(Art Basel Miami 2017)에 초대되어<br>
단편 영화 ‘Learning to Transcend the Physical Barriers that Owning a Body Implies’를 개봉한 바 있다.<br> 또한 2015년 영국 런던 포토그래퍼스 갤러리에서
FF+WE Prize를 수상하였으며, <br>2016년 프랑스 예르 패션 & 포토그래피 페스티벌(Hyères Fashion & Photography Festival)의 심사위원으로 위촉되는 등
재능과 실력을 겸비한 아티스트로서 연일 새로운 행보를 보여주고 있다.</span></div>
<div class="artist_cont2"><img src="resources/images/objet/coco.jpg" id="artist_pic"></div>
</div>
</div>
<center>
<div class="ui bottom attached tab" id="objet_calendar">
<span class="det_title">CALENDAR</span><br>
<div class="container">
        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">카테고리1</a></li>
                <li><a tabindex="-1" href="#">카테고리2</a></li>
                <li><a tabindex="-1" href="#">카테고리3</a></li>
                <li><a tabindex="-1" href="#">카테고리4</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>
        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="카테고리1">카테고리1</option>
                                    <option value="카테고리2">카테고리2</option>
                                    <option value="카테고리3">카테고리3</option>
                                    <option value="카테고리4">카테고리4</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </div>
    <!-- /.container -->
</div>
<div class="ui bottom attached tab " id="objet_review">
   <span class="det_title">REVIEW</span><br>
   <div class="search-option-cate">
  <span class="search-option">
      <a class="option on" data-type="accu">&nbsp;최신순</a>&nbsp;&nbsp;
      <a class="option" data-type="recency">&nbsp;평점순</a>&nbsp;&nbsp;
</span>
</div><br>
<div class="review_all_list">
<!-- 내 한줄평 있을시 보이는 공간 -->
<div class="review_mylist">
<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게1.jpg" id="writer_mypic">
<div class="review_mycontent">
<span class="rev_mywriter">최강예은</span><span class="rev_mydate">Dec.&nbsp;21.&nbsp;2019</span>
<div class="ui icon top left pointing floating dropdown button" id="rev_mymore">
<i class="material-icons" style="color:#959595;font-size:22px;">&#xe5d4;</i>
<div class="menu">
<div class="item"><a style="color:#959595;" class="up_btn">수정</a></div>
<div class="item"><a style="color:#959595;" class="del_btn">삭제</a></div>
</div>
</div><br>
<button class="ui red horizontal label" id="my_rev_btn">내리뷰</button>&nbsp;
 <span class="rev_mycont">완벽했습니다..! 그치만 평점은 4점 드릴게요</span><br>
<div class="extra">
<div class="ui star rating my" data-rating="4" data-max-rating="5" >5</div>
<div class="rev_like_btn">
<div class="ui basic circular gray icon button" id="rev_like"><i class="thumbs up outline icon" style="font-size:14px;"></i><span class="rev_cnt"> 34</span></div>&nbsp;
<div class="ui basic circular gray icon button" id="rev_hate"><i class="thumbs down outline icon" style="font-size:14px;"></i><span class="rev_cnt"> 2</span></div>
</div></div>
</div>
</div>
<!-- //내 한줄평 있을시 보이는 공간 끝 -->
<!-- 내 한줄평 있을시 수정 공간-->
<div class="review_mylist_up">
<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게1.jpg" id="writer_mypic">
<div class="review_ins_content">
<textarea class="ui fluid input rev_up_cont" maxlength="200">
완벽했습니다..! 그치만 평점은 4점 드릴게요</textarea>
<span id="counter_up">( <span style="color:#4ecdc4;font-size:0.85em;">현재</span> / 최대 100자 )</span>
</div>
<div class="extra" id="rev_myrating">
<div class="ui star rating insert" data-rating="4" data-max-rating="5" id="rev_ins_star">4</div>
</div>
<div class="update_mybtn">
<input class="ui circular basic gray button" type="reset" value="취소" />&nbsp;
<input class="ui circular basic gray button" type="submit" value="수정"/>
</div>
</div> 
<!-- //내 한줄평 있을시 수정 공간 끝 -->
<!-- 한줄평 수정 버튼 클릭시 모달-->
<!-- <div class="ui mini modal actions" id="modal">
  <div class="content">
    <p>정말 한줄평을 수정하시겠습니까?</p>
  </div>
  <div class="actions">
    <div class="ui red cancel inverted button">
      <i class="remove icon"></i>
      	취소
    </div>
    <div class="ui blue ok inverted button" onClick="location.href ='updateReview.do'" style="cursor: pointer;">
      <i class="checkmark icon"></i>
      	수정
    </div>
  </div>
</div> -->
<!-- //한줄평 수정 버튼 클릭시 모달 끝 -->
<!-- 한줄평 삭제 버튼 클릭시 모달 -->
<div class="ui mini modal actions" id="rev_del_modal">
  <div class="content">
    <p>정말 한줄평을 삭제하시겠습니까?</p>
  </div>
  <div class="actions">
    <div class="ui red cancel inverted button">
      <i class="remove icon"></i>
      	취소
    </div>
    <div class="ui blue ok inverted button" onClick="location.href ='deleteReview.do'" style="cursor: pointer;">
      <i class="checkmark icon"></i>
      	삭제
    </div>
  </div>
</div>
<!-- //한줄평 삭제 버튼 클릭시 모달 끝 -->
<div class="review_list">
<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게2.jpg" id="writer_pic">
<div class="review_content">
<span class="rev_writer">안경민경</span><span class="rev_date">Dec.&nbsp;21.&nbsp;2019</span>
<span class="rev_report">신고</span><br>
<span class="rev_cont">너무 좋아요.... 생각보다 더 좋았어요 또 보고 싶어요~~  좋아요 정말~~~짜루짜루진짜루~~</span><br>
<div class="extra">
<div class="ui star rating" data-rating="5" data-max-rating="5" >5</div>
<div class="rev_like_btn">
<div class="ui basic circular gray icon button" id="rev_like"><i class="thumbs up outline icon" style="font-size:14px;"></i><span class="rev_cnt"> 34</span></div>&nbsp;
<div class="ui basic circular gray icon button" id="rev_hate"><i class="thumbs down outline icon" style="font-size:14px;"></i><span class="rev_cnt"> 2</span></div>
</div></div>
</div>
</div>
<!-- 한줄평 신고 -->
<div class="ui modal" id="rev_rep_modal">
<p style="font-size: 20pt; padding-top:40px; color:#373737; text-align:center;">한줄평 신고하기</p>
<p class="quitHeader" style="font-weight: 600;text-align: center;">어떤 문제가 있나요?</p>
<!-- <span class="" style="font-weight: 300;text-align: left;margin:0 0 0 40px;">작성자 : user**</span><br>
<span class="" style="font-weight: 300;text-align: left;margin:20px 0 0 40px;">내   용 : 너무 좋아요.... 생각보다 더 좋았어요 또 보고 싶어요~~  좋아요 정말~~~짜루짜루진짜루~~</span> -->
<center>
<form action="" method="post">
<div align="center" style="padding-top: 15px;">
	<div class="choiceReportReason2">
		<div class="ui form">
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportreason" value="영리목적/홍보성/불법정보" checked="checked">
			        <label>영리목적/홍보성/불법정보</label>
			      </div>
			    </div>
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportreason" value="음란/선정성">
			        <label>음란/선정성</label>
			      </div>
			    </div>
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportreason" value="욕설/인신공격/같은내용도배">
			        <label>욕설/인신공격/같은내용도배</label>
			      </div>
			    </div>
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportreason" value="기타">
			        <label>기타</label>
			      </div>
			    </div>
			    <textarea class="ui input textarea" rows="3" cols="10" name="etc" id="etc2" style="resize: none;" disabled required></textarea>
				<span style="color:#aaa; display: none; text-align:right; font-size:9pt;" id="count">( <span style="color:#4ecdc4;font-size:9pt;">0</span> / 최대 100자 )</span>
		</div>
	</div>
</div>
	<br><br>
<div style="width:515px;">
<p class="quitHeader" style="font-size: 8pt; color: #aaa; line-height: 12pt;">
	오브제 팀에서는 신고된 작가의 커뮤니티 가이드 위반 여부를 판단하기 위해<br>연중무휴 24시간 검토 작업을 하고 있습니다.
	커뮤니티 가이드를 위반한 계정은 제재를 받게 되며<br>심각하거나 반복적인 위반 행위에 대해서는 계정 해지 조취가 취해질 수 있습니다.
</p>
</div><br>
<br>
<div class="actions">
    <div class="ui red cancel inverted button" onClick="location.href ='objetOne.do'" style="cursor: pointer;">
      <i class="remove icon"></i>
      	취소
    </div>
    <div id="btnsub_rev_rep" class="ui blue ok inverted button" onClick="location.href ='reviewReport.do'" style="cursor: pointer;">
      <i class="bell outline icon"></i>
        	신고하기
    </div>
  </div><br><br>
</form>
</center>
</div>
<!-- //한줄평 신고  끝 -->
<div class="review_list">
<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게2.jpg" id="writer_pic">
<div class="review_content">
<span class="rev_writer">안경민경</span><span class="rev_date">Dec.&nbsp;21.&nbsp;2019</span><span class="rev_report">신고</span><br>
<span class="rev_cont">너무 좋아요.... 생각보다 더 좋았어요 또 보고 싶어요~~  좋아요 정말~~~짜루짜루진짜루~~</span><br>
<div class="extra">
<div class="ui star rating" data-rating="5" data-max-rating="5" >5</div>
<div class="rev_like_btn">
<div class="ui basic circular gray icon button" id="rev_like"><i class="thumbs up outline icon" style="font-size:14px;"></i><span class="rev_cnt"> 34</span></div>&nbsp;
<div class="ui basic circular gray icon button" id="rev_hate"><i class="thumbs down outline icon" style="font-size:14px;"></i><span class="rev_cnt"> 2</span></div>
</div></div>
</div>
</div>
<div class="review_list">
<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게2.jpg" id="writer_pic">
<div class="review_content">
<span class="rev_writer">안경민경</span><span class="rev_date">Dec.&nbsp;21.&nbsp;2019</span><span class="rev_report">신고</span><br>
<span class="rev_cont">너무 좋아요.... 생각보다 더 좋았어요 또 보고 싶어요~~  좋아요 정말~~~짜루짜루진짜루~~</span><br>
<div class="extra">
<div class="ui star rating" data-rating="4" data-max-rating="5"     >4</div>
<div class="rev_like_btn">
<div class="ui basic circular gray icon button" id="rev_like"><i class="thumbs up outline icon" style="font-size:14px;"></i><span class="rev_cnt"> 34</span></div>&nbsp;
<div class="ui basic circular gray icon button" id="rev_hate"><i class="thumbs down outline icon" style="font-size:14px;"></i><span class="rev_cnt"> 2</span></div>
</div></div>
</div>
</div>
<div class="review_list">
<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게3.jpg" id="writer_pic">
<div class="review_content">
<span class="rev_writer">안경민경</span><span class="rev_date">Dec.&nbsp;21.&nbsp;2019</span><span class="rev_report">신고</span><br>
<span class="rev_cont">너무 좋아요.... 생각보다 더 좋았어요 또 보고 싶어요~~  좋아요 정말~~~짜루짜루진짜루~~</span><br>
<div class="extra">
<div class="ui star rating" data-rating="3" data-max-rating="5" >3</div>
<div class="rev_like_btn">
<div class="ui basic circular gray icon button" id="rev_like"><i class="thumbs up outline icon" style="font-size:14px;"></i><span class="rev_cnt"> 34</span></div>&nbsp;
<div class="ui basic circular gray icon button" id="rev_hate"><i class="thumbs down outline icon" style="font-size:14px;"></i><span class="rev_cnt"> 2</span></div>
</div></div>
</div>
</div>
<div class="review_list">
<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게5.jpg" id="writer_pic">
<div class="review_content">
<span class="rev_writer">안경민경</span><span class="rev_date">Dec.&nbsp;21.&nbsp;2019</span><span class="rev_report">신고</span><br>
<span class="rev_cont">너무 좋아요.... 생각보다 더 좋았어요 또 보고 싶어요~~  좋아요 정말~~~짜루짜루진짜루~~</span><br>
<div class="extra">
<div class="ui star rating" data-rating="5" data-max-rating="5">5</div>
<div class="rev_like_btn">
<div class="ui basic circular gray icon button" id="rev_like"><i class="thumbs up outline icon" style="font-size:14px;"></i><span class="rev_cnt"> 34</span></div>&nbsp;
<div class="ui basic circular gray icon button" id="rev_hate"><i class="thumbs down outline icon" style="font-size:14px;"></i><span class="rev_cnt"> 2</span></div>
</div></div>
</div>
</div>
</div>
<div id="more_btn">
<a href="" onclick="javascript:moreContent('more_list', 10);"><span>다음 리뷰 보기</span></a>
</div>
<br><br>
<div class="rev_insert">
<div class="review_insert">
<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게3.jpg" id="writer_pic_2">
<div class="review_ins_content">
<textarea class="ui fluid input rev_ins_cont" maxlength="200" 
placeholder="이 전시의 감상평(한줄평)을 남겨주세요. 전시와 상관없는 내용은 제재를 받을 수 있습니다."></textarea>
<span id="counter_ins">( <span style="color:#4ecdc4;font-size:0.85em;">0</span> / 최대 100자 )</span>
</div>
<div class="extra" id="rev_rating">
<div class="ui star rating insert" data-rating="0" data-max-rating="5" id="rev_ins_star">0</div>
</div>
<div class="submit_btn">
<input class="ui circular basic gray button" type="reset" value="취소" />&nbsp;
<input class="ui circular basic gray button" type="submit" value="등록" />
</div>
</div>
<br><br><br>
</div>
</div>
</center>
</section>
</section>
<c:import url="../footer.jsp" />
</body>
</html>