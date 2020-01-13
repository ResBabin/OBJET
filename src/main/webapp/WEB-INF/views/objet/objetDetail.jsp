<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
 <!-- FaceBook Share API -->
  <meta property="fb:app_id" 		content="479513076315861" />
  <meta property="og:url"           content="https://money2015.tistory.com/761?category=631663" />
  <meta property="og:type"          content="website" />
  <meta property="og:title"         content="${fn:substring(objet.objettitle,0,11)}..." />
<%--   <meta property="og:description"   content="${fn:substring(objet.objetintro,0,20)}..." /> --%>
  <meta property="og:image"         content="${pageContext.servletContext.contextPath }/resources/images/objet/${objet.renamemainposter }" />
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
<!-- <script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/popper.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href='resources/css/calendar.css' /> -->
<!-- 페이스북 공유 -->
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId            : '479513076315861',
      autoLogAppEvents : true,
      xfbml            : true,
      version          : 'v5.0'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>

<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

 a {cursor:pointer;}

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
	margin-top: -109px;
	overflow: scroll;
	position: relative;
}

#banner_img_text {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-family: 'Nanum Gothic', sans-serif;
} 

.banner_img_btn {
	position: absolute;
	top: 32%;
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

/* 배너 아이콘 스타일 */
.wrap_all {
	margin-top:-55px;
}
.f_r{
	float:right;
}
.wrap_action_article {
    margin-top: -5px;
    margin-right: -8px;
}
.wrap_action_article .ico_action {
    display: inline-block;
    width: 20px;
    height: 20px;
    margin-left: 22px;
    margin-top: 5px;
    background-position: -180px 0;
    -webkit-transition: transform 200ms;
    -moz-transition: transform 200ms;
    -ms-transition: transform 200ms;
    -o-transition: transform 200ms;
    transition: transform 200ms;
    color:#fff;
    position: absolute;
    right:20px;
}

.img_ico {
    background: url(//t1.daumcdn.net/brunch/static/img/help/pc/ico_view_cover.v4.png) no-repeat;
}
.text_hide {
    overflow: hidden;
    width: 0;
    height: 0;
    line-height: 0;
    text-indent: -9999px;
}
button {
    border: 0 none;
    background-color: transparent;
    cursor: pointer;
    outline: none;
    border-radius: 0px;
    vertical-align: middle;
} 

.wrap_action_article .more_action_wrap {
    position: absolute;
    right: 67px;
    transition: transform 300ms;
    transform: translate(0, -50px);
    opacity: 0;
}

.wrap_action_article .ico_report {
    background-position: -150px -90px;
    margin-top: 5px;
}
.more_action_wrap .img_ico.more_action {
    margin-left: 30px;
}
.wrap_action_article .more_action {
    display: inline-block;
}
.img_ico.img_ico_single {
    width: 20px;
    height: 20px;
    margin-right: 5px;
}
.f_l {
    float: left;
}
.img_ico_wrap {
    margin-left: 18px;
    float: left;
    padding: 5px 0 5px 5px;
    height: 20px;
    box-sizing: content-box;
}
.wrapButtonSocialShare {
    position: relative;
    display: inline;
}
.show {
    display: block;
}
a {
    text-decoration: none;
}
a:-webkit-any-link {
    cursor: pointer;
}
.wrap_action_article .img_ico.ico_likeit_like {
    background-position: -60px -90px;
    width: 21px;
}

.wrap_action_article .ico_likeit_unlike.img_ico_with_text {
    background-position: -90px -89px;
    width: 21px;
}

.wrap_action_article .text_with_img_ico {
    margin-left: 3px;
    margin-top: -1px;
}
.wrap_action_article .text_with_img_ico {
    padding-top: 1px;
    min-width: 6px;
    min-height: 1px;
}
.wrap_action_article .ico_comment {
    background-position: -30px -120px;
}

.img_ico.img_ico_with_text {
    width: 20px;
    height: 20px;
}

.wrap_action_article .text_with_img_ico {
    margin-left: 3px;
    margin-top: -1px;
}
.wrap_action_article .text_with_img_ico {
    padding-top: 1px;
    margin-left: 4px;
    min-width: 6px;
    min-height: 1px;
}

.wrapButtonSocialShare {
    position: relative;
    display: inline;
}
#facebook, #instagram, #twitter {
	width:28px;
	height: 28px;
}
.wrap_action_article .ico_share {
    background-position: -90px -121px;
    margin-right: 0;
}
.wrapButtonSocialShare .wrap_share_gnb {
    display: none;
}
.wrapButtonSocialShare.show .wrap_share_gnb {
    position: absolute;
    display: block;
    width: 240px;
    padding-top: 18px;
    top: 45px;
    right: -34px;
    text-align: center;
    box-shadow: 1px 1px 0 rgba(255,255,255,.06);
    background-color: #FFF;
}
.wrapButtonSocialShare.show .wrap_share_gnb:before {
    position: absolute;
    top: 0;
    left: 0;
    /* z-index: 1; */
    width: 100%;
    height: 100%;
    border: 1px solid #000;
    opacity: 0.1;
    filter: alpha(opacity=10);
    content: '';
    box-sizing: border-box;
}
.tit_sharegnb {
    display: block;
    font-weight: normal;
    font-size: 12px;
    color: #959595 !important;
    letter-spacing: -0.025em;
    text-align: center;
    font-family: 'Nanum Gothic', sans-serif !important;
}

.wrap_share_gnb .ico_share_common {
    position: relative;
    /* z-index: 5; */
    margin: 12px 0 18px;
}

.wrap_share_common .btn_share_facebook {
    background-position: -2px -2px;
}
.wrap_share_common button {
    width: 35px;
    height: 35px;
    font-family: 'Nanum Gothic', sans-serif !important;
    font-size: 14px;
    line-height: 1.5;
}
.wrap_share_common .btn_share_facebook {
    background-position: -2px -2px;
}
.wrap_share_common .btn_share_kakaotalk {
    background-position: -37px -2px;
}
.wrap_share_common .btn_share_kakaostory {
    background-position: -72px -2px;
}
.wrap_share_common .btn_share_twitter {
    background-position: -107px -2px;
}

/* .ico_share_common {
    background: url(//t1.daumcdn.net/brunch/static/img/help/pc/ico_share_rtn_20180103.png) no-repeat;
    background-size: 300px 210px;
} */

.screen_out {
    overflow: hidden;
    position: absolute;
    width: 0;
    height: 0;
    line-height: 0;
    text-indent: -9999px;
}

.wrap_action_article * {
    color: #fff;
}
.wrap_action_article.show_more_action .more_action_wrap {
    transform: translate(0, 0);
    display: block;
    opacity: 1;
}
.wrap_action_article .default_action_wrap {
    position: absolute;
    transform: translate(0, 0);
    font-size: 14px;
    right: 63px;
    padding-top: 0px;
    font-family: 'Nanum Gothic', sans-serif !important;
}
.wrap_action_article.show_more_action .ico_action {
    margin-top: 6px;
    margin-left: 25px;
    transform: rotate(-90deg);
}
/* .header_icons {
	float: right;
	position: absolute;
	right: 63px; 
    padding-top: 0px;
    transform: translate(0, 0);
    
}
.left .wrap .icons {
	float:right;
}
#heart {
	position: absolute;
	width: 10%;
	height: auto;
	background-image: url("resources/images/objet/heart.png");
}

.like_cnt {
	position: absolute;
	color: #fff;
	font-size: 14px;
}

#chat {
	position: absolute;
	width: 10%;
	height: auto;
	background-image: url("resources/images/objet/chat.png");
}

#share {
	position: absolute;
	width: 10%;
	height: auto;
	background-image: url("resources/images/objet/share.png");
}

#more {
	position: absolute;
}

.report {
	position: absolute;
	width: 10%;
	height: auto;
	background-image: url("resources/images/objet/report.png");
}
#more_after {
	position: absolute;
} *//* // 배너 아이콘 스타일 */

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
	/* margin: 0; */
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
	font-family: 'Nanum Gothic';
	cursor: pointer;
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
	display:none;
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

.rev_like {
	width: 55px;
	height: auto;
	margin: 0;
	padding: 8px;
	border: none !important;
	outline: none !important;
}

.rev_hate {
	width: 55px;
	height: auto;
	margin: 0;
	padding: 8px;
	border: none !important;
	outline: none !important;
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

.rev_insert_no {
	width: 80%;
	height: 50px;
	margin: 50px 40px 10px 40px;
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
	width:35%;
	height: auto;
	margin-top: 12%;
	align: center;
}

.exhibition_info_txt {
	font-size: 22px;
	font-weight: bolder;
	color: #959595;
	font-family: 'Nanum Myeongjo';
	line-height: 40px;
	align-content: center;
	margin-top: 43px;
	width:80%;
}

.exhibition_intro {
	margin-top: 40px;
}

.exhibition_vp {
	margin-top: 80px;
	/* background: #93c5e6; */
	width: 100%;
	height: 860px;
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
	line-height: 34px;
	text-align: center;
	text-align-last: auto;
	text-justify: inter-word;
	align: center;
	font-size: 15px;
	width:80%;
}

.intro_txt h1 {
	font-weight: bold;
	font-family: 'Nanum Gothic';
	line-height: 52px;
	font-size: 32px;
}

.swiper-container {
	margin-top: 190px;
	width: 60%;
	height: 60%;
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
	max-width: 90%;
	max-height: 90%;
	
	height: auto;
	align: center;
	margin-right:100px;
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
	margin: 250px 200px 10px 20px;
}

#vp_last_txt {
	text-align: center;
	color: #fff;
	font-weight: 700;
	font-family: 'Nanum Gothic';
	line-height: 68px;
	font-size: 48px;
	position: absolute;
	margin-top: 720px;
	margin-left: -210px;
	margin-bottom: 20px;
}

.vp_top {
	float: right;
	position: absolute;
	margin-top: 790px;
	margin-left: 90%;
}
/* 작가소개 스타일 */
.artist_cont {
	width: 75%;
	height: 750px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	position: relative;
	top: 60px;
	align: center;
	left: 12%;
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


/* 한줄평  */
#objet_review {
	width: 100%;
	height: 990px;
}
</style>
<script type="text/javascript">
	$(function() {
		//헤더 아이콘
		var check = false;
			$("#btnToggleArticleMoreAction").on("click", function(){
				if(check === false){
				$(".wrap_action_article").addClass("show_more_action");
				$("#default").css("visibility", "hidden");
				$(".more_action_wrap").css("display", "block");
				check = true;
			}else{
				$(".wrap_action_article").removeClass("show_more_action");
				$("#default").css("visibility", "visible");
				$(".more_action_wrap").css("display", "none");
				check = false;				
			}
			});
			$(".wrapButtonSocialShare").on("click", function(){
				if(check === false){
					$(".wrapButtonSocialShare").addClass("show");
					check = true;
				}else{
					$(".wrapButtonSocialShare").removeClass("show");
					check = false;
				}
			});
		
		//헤더 아이콘 공유
		//페이스북 공유
		var objetno = ${objet.objetno}
		$("#facebook").on("click", function(){
		    FB.ui({
		        method: 'share',
		        https:'//www.facebook.com/sharer/sharer.share?u=https://money2015.tistory.com/761?category=631663&display=popup&app_id=479513076315861',
		        /* https: '//www.facebook.com/dialog/share?app_id=479513076315861&display=popup&href=http://localhost:12345/objet/objetOne.do?objetno=objetno&redirect_uri=http://localhost:12345/objet/objetOne.do?objetno=objetno', */
		    }, function(response){
		    	// callback
	    	    if (response && !response.error_message) {
	    	      alert('페이스북에 오브제가 공유되었습니다.');
	    	    } else {
	    	      alert('공유 실패!');
	    	    }
		    });
		}); 
	
			
		//헤더아이콘 한줄평 이동
		$(".comment").on("click", function(){
			var scrollTop = 390;
			$(".review").click();
			$("html, body").animate({ scrollTop: scrollTop }, 1000);
		});
		
			
		//전시 신고 모달
		<c:if test="${!empty loginUser }">
			$(".ico_report").on("click", function() {
				$("#rep_modal").modal("show");
			});	
		</c:if>
		<c:if test="${empty loginUser }">
			$(".ico_report").on("click", function() {
				alert("로그인 하셔야 신고하실 수 있습니다.");
			});	
		</c:if>
		
		//전시 신고 기타사유
		// 기타 선택 시에만 textarea 활성화
		$("input:radio[name='reportbreason']").click(function() {
			if ($("input:radio[id='reportreason1']:checked").val() == "기타") {
				$("#etc1").attr("disabled", false);
				$("#etc1").focus();
				$("#etc1").attr("placeholder", "기타 사유를 입력해주세요.(최대 100자)")
				$("#obj_rep_cnt").css("display", "block");
				// radio 버튼의 value 값이 '기타'면 textarea활성화 & 자동포커스 & placeholder & 글자수세기 나오기
			} else {// 아니라면 text 비활성화&placeholder없음&글자수세기 없음
				$("#etc1").attr("disabled", true);
				$("#etc1").removeAttr("placeholder", "기타 사유를 입력해주세요.(최대 100자)")
				$("#obj_rep_cnt").css("display", "none");
				// 이전 기타 textarea작성 값 초기화
				$("#etc1").val("");
				$("#obj_rep_cnt").html("( <span style='color:#4ecdc4;font-size:9pt;'>0</span> / 최대 100자 )");
			}
		});

		// 전시 신고  기타사유 글자수 세기
 		$("#etc1").keyup(function(e) {
			var content = $(this).val();
			$("#obj_rep_cnt").html("( <span style='color:#4ecdc4;font-size:9pt;'>" + content.length + "</span> / 최대 100자 )"); // 글자수 실시간 카운팅
			if (content.length > 100) {
				alert("최대 100자까지만 입력 가능합니다.");
				$(this).val(content.substring(0, 100));
				$("#obj_rep_cnt").html("( <span style='color:red;font-size:9pt;'>100 </span>/ 최대 100자)");
			}
		});
			
		//tab menu
		$("#objet_info_menu #item").on("click", function() {
			var tab = $(this).attr("data-tab");
			$("#objet_info_menu #item").removeClass("active");
			$(this).addClass("active");
			$(".tab").removeClass("active");
			$("#" + tab).addClass("active");
		});

		//한줄평 최신순 평점순
		$(".search-option .option").on("click", function() {
			$(".search-option .option").removeClass("on");
			$(this).addClass("on");
			$(".search-option .i .off").removeClass("off");
			$(".search-option .i").addClass("off");
		});
		
		//한줄평 더보기 버튼
		$(".review_list").slice(0, 4).fadeIn(); // 최초 4개 선택
		$("#more_btn").click(function(e) { // Load More를 위한 클릭 이벤트e
		    e.preventDefault();
			var height = $('#objet_review').height();
		    $(".review_list:hidden").slice(0, 4).fadeIn(); // 숨김 설정된 다음 4개를 선택하여 표시
		    $('#objet_review').css("height", $(document).height());
		    if ($(".review_list:hidden").length == 0) { // 숨겨진 DIV가 있는지 체크
		        $('#more_btn').fadeOut();// 더 이상 로드할 항목이 없는 경우
		        $('.rev_insert').css("margin-top", "180px");
		        $('.rev_insert_no').css("margin-top", "120px");
		    }
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
		$('.rev_ins_cont').keyup(function(e) {
			var content = $(this).val();
			$("#counter_ins").html("( <span style='color:#4ecdc4;'>" + content.length + "</span> / 최대 100자 )"); // 글자수 실시간 카운팅
			if (content.length > 100) {
				alert("최대 100자까지만 입력 가능합니다.");
				$(this).val(content.substring(0, 100));
				$("#counter_ins").html("( <span style='color:red;'>100 </span>/ 최대 100자)");
			}
		});
		$('rev_ins_cont').keyup();

		//한줄평 수정 글자수 카운팅
		$(".rev_up_cont").keyup(function(e) {
			var content = $(this).val();
			$("#counter_up").html("( <span style='color:#4ecdc4;font-size:9pt;'>" + content.length + "</span> / 최대 100자 )"); // 글자수 실시간 카운팅
			if (content.length > 100) {
				alert("최대 100자까지만 입력 가능합니다.");
				$(this).val(content.substring(0, 100));
				$("#counter_up").html("( <span style='color:red;font-size:9pt;'>100 </span>/ 최대 100자)");
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
		
		$("#update_can").on("click", function(){
			$(".review_mylist_up").css("display", "none");
			$(".review_mylist").css("display", "block");
			$(".up_btn").removeClass("active");
		});

		/* //한줄평 신고 모달
		<c:if test="${!empty loginUser }">
			$(".rev_report").on("click", function() {
				$("#rev_rep_modal").modal('show');
			});
		</c:if>
		<c:if test="${empty loginUser }">
			$(".rev_report").on("click", function() {
				alert("로그인 하셔야 신고하실 수 있습니다.");
			});	
		</c:if> */
		
		
		//한줄평 신고 기타사유
		// 기타 선택 시에만 textarea 활성화
		$("input:radio[id='reportreason2']").click(function() {
			if ($("input:radio[id='reportreason2']:checked").val() == "기타") {
				$("#etc2").attr("disabled", false);
				$("#etc2").focus();
				$("#etc2").attr("placeholder", "기타 사유를 입력해주세요.(최대 100자)")
				$("#rev_rep_cnt").css("display", "block");
				// radio 버튼의 value 값이 '기타'면 textarea활성화 & 자동포커스 & placeholder & 글자수세기 나오기
			} else {// 아니라면 text 비활성화&placeholder없음&글자수세기 없음
				$("#etc2").attr("disabled", true);
				$("#etc2").removeAttr("placeholder", "기타 사유를 입력해주세요.(최대 100자)")
				$("#rev_rep_cnt").css("display", "none");
				// 이전 기타 textarea작성 값 초기화
				$("#etc2").val("");
				$("#rev_rep_cnt").html("( <span style='color:#4ecdc4;font-size:9pt;'>0</span> / 최대 100자 )");
			}
		});

		// 한줄평 기타사유 글자수 세기
 		$("#etc2").keyup(function(e) {
			var content = $(this).val();
			$("#rev_rep_cnt").html("( <span style='color:#4ecdc4;font-size:9pt;'>" + content.length + "</span> / 최대 100자 )"); // 글자수 실시간 카운팅
			if (content.length > 100) {
				alert("최대 100자까지만 입력 가능합니다.");
				$(this).val(content.substring(0, 100));
				$("#rev_rep_cnt").html("( <span style='color:red;font-size:9pt;'>100 </span>/ 최대 100자)");
			}
		});

		//캘린더
		
		
	});
	
	//전시 신고
	var objetreport = false;
	function submit1() {
		if(objetreport){
			alert("이미 오브제를 신고하셨습니다.");
			return;
		}
		objetreport = true;
		document.getElementById("btnsub_rep").onclick = function() {
			document.getElementById('rep_form').submit();
			alert("해당 오브제가 신고되었습니다.");
				location.href = "objetOne.do?objetno="+${objet.objetno }+"&userid="+${loginUser.userid};
			return false; 
		};
	};
	
	
	
	window.onload = function(){
		//바탕색 랜덤
		var color = '#'; 
		var letters = ['e4eef5', '93c5e6', '46a3e0', '8eccf5', '6475A0', 'acc7bf', '5e5f67', 'c37070', 'eae160', 'bf7aa3', 'd7d967', 'bc8fcf', 'edd48e', 'e68b4e', 'cc6039']; 
		color += letters[Math.floor(Math.random() * letters.length)]; // 컬러는 상기 변수들을 조립하는데 랜덤으로 조립한다. 
		document.getElementById('exhibition_vp').style.background = color; // 조립한 컬러를 프론트엔드에서 지정한 ID에 적용한다.
	}
	
	//review order ajax
	function reviewOrder(no, order){
		var userid = '${loginUser.userid}';
	  	$.ajax({
			url : 'reviewOrder.do',
			type : 'post',
			data : { no : no, order : order, userid : userid },
			dataType : 'json',
			success : function(data){
			    var objStr = JSON.stringify(data); 
				var jsonObj = JSON.parse(objStr);
				var values = "";
				for (var i in jsonObj.list) {
					var month_names =["Jan","Feb","Mar",
	                      "Apr","May","Jun",
	                      "Jul","Aug","Sep",
	                      "Oct","Nov","Dec"];
					var day = jsonObj.list[i].revdate.substring(8, 10);
					if(jsonObj.list[i].revdate.substring(5) != 0){
						var month = jsonObj.list[i].revdate.substring(5, 7) - 1;
					}else {
						var month = jsonObj.list[i].revdate.substring(6, 7) - 1;
					}
				    var year = jsonObj.list[i].revdate.substring(0, 4);
				    var nickname = "${loginUser.nickname}";
				    var userid = '${loginUser.userid}';
				    var revgood = '${revgood}';
				    var revhate = '${revhate}'
				    var reviewStatus = '${reviewStauts}';
				    var revuserid = jsonObj.list[i].revuserid;
				    var revstatusid = '${reviewStatusList[i].revuserid}';
				    var nicknames = decodeURIComponent(jsonObj.list[i].nickname.replace(/\+/gi, " "));
				    if(nicknames != nickname){
					values += '<div class="review_list">' +
					'<img class="ui circular image" src="resources/users_upfiles/' + jsonObj.list[i].userrpic + '" id="writer_pic">' +
					'<div class="review_content">' +
					'<span class="rev_writer">' + decodeURIComponent(jsonObj.list[i].nickname.replace(/\+/gi, " ")) +
					'</span><span class="rev_date">' + month_names[month] + '.&nbsp;' + day + 
					'.&nbsp;' + year + '</span><span class="rev_report" onclick="revReport(' + "'" + jsonObj.list[i].revuserid + "'" + ')">신고</span><br>' +
					'<span class="rev_cont">' + decodeURIComponent(jsonObj.list[i].revcontent.replace(/\+/gi, " ")) + '</span><br>';
					values += '<div class="extra">' +
					'<div class="ui star rating" data-rating="' + jsonObj.list[i].revstars + '" data-max-rating="5" ></div>' +
					'<div class="rev_like_btn">';
					if(revgood == 'revgood'){
						values += '<div class="ui basic circular gray icon button rev_like" onclick="reviewGood(' + "'" + jsonObj.list[i].revuserid + "', " + ${objet.objetno} + ')"><i class="thumbs up green outline icon" id="rev_like_' + jsonObj.list[i].revuserid + '" style="font-size:14px;"></i><span id="revgood_cnt_' + jsonObj.list[i].revuserid + '" class="rev_cnt"> '
						+ jsonObj.list[i].revgood + '</span></div>&nbsp;' + 
						'<div class="ui basic circular gray icon button rev_hate" onclick="reviewHate(' + "'" + jsonObj.list[i].revuserid + "', " + ${objet.objetno} + ')"><i class="thumbs down outline icon" id="rev_hate_' + jsonObj.list[i].revuserid + '" style="font-size:14px;"></i><span id="revhate_cnt_' + jsonObj.list[i].revuserid + '" class="rev_cnt"> '
						+ jsonObj.list[i].revhate + '</span></div>';
					}if(reviewStatus == 'norevgood'){
						values += '<div class="ui basic circular gray icon button rev_like" onclick="reviewGood(' + "'" + jsonObj.list[i].revuserid + "', " + ${objet.objetno} + ')"><i class="thumbs up outline icon" id="rev_like_' + jsonObj.list[i].revuserid + '" style="font-size:14px;"></i><span id="revgood_cnt_' + jsonObj.list[i].revuserid + '" class="rev_cnt"> '
						+ jsonObj.list[i].revgood + '</span></div>&nbsp;';
					}if(revhate == 'revhate'){
						values += '<div class="ui basic circular gray icon button rev_like" onclick="reviewGood(' + "'" + jsonObj.list[i].revuserid + "', " + ${objet.objetno} + ')"><i class="thumbs up outline icon" id="rev_like_' + jsonObj.list[i].revuserid + '" style="font-size:14px;"></i><span id="revgood_cnt_' + jsonObj.list[i].revuserid + '" class="rev_cnt"> '
						+ jsonObj.list[i].revgood + '</span></div>&nbsp;' + 
						'<div class="ui basic circular gray icon button rev_hate" onclick="reviewHate(' + "'" + jsonObj.list[i].revuserid + "', " + ${objet.objetno} + ')"><i class="thumbs down black outline icon" id="rev_hate_' + jsonObj.list[i].revuserid + '" style="font-size:14px;"></i><span id="revhate_cnt_' + jsonObj.list[i].revuserid + '" class="rev_cnt"> '
						+ jsonObj.list[i].revhate + '</span></div>';
					}if(reviewStatus == 'norevhate'){
						values += '<div class="ui basic circular gray icon button rev_hate" onclick="reviewHate(' + "'" + jsonObj.list[i].revuserid + "', " + ${objet.objetno} + ')"><i class="thumbs down outline icon" id="rev_hate_' + jsonObj.list[i].revuserid + '" style="font-size:14px;"></i><span id="revhate_cnt_' + jsonObj.list[i].revuserid + '" class="rev_cnt"> '
						+ jsonObj.list[i].revhate + '</span></div>';
					}if(reviewStatus == 'norevgoodrevhate'){
						values += '<div class="ui basic circular gray icon button rev_like" onclick="reviewGood(' + "'" + jsonObj.list[i].revuserid + "', " + ${objet.objetno} + ')"><i class="thumbs up outline icon" id="rev_like_' + jsonObj.list[i].revuserid + '" style="font-size:14px;"></i><span id="revgood_cnt_' + jsonObj.list[i].revuserid + '" class="rev_cnt"> '
						+ jsonObj.list[i].revgood + '</span></div>&nbsp;' +
						'<div class="ui basic circular gray icon button rev_hate" onclick="reviewHate(' + "'" + jsonObj.list[i].revuserid + "', " + ${objet.objetno} + ')"><i class="thumbs down outline icon" id="rev_hate_' + jsonObj.list[i].revuserid + '" style="font-size:14px;"></i><span id="revhate_cnt_' + jsonObj.list[i].revuserid + '" class="rev_cnt"> '
						+ jsonObj.list[i].revhate + '</span></div>';
					}
					values += '</div></div>' +
					'</div>' +
					'</div>';
				    }
				}
				
				$(function(){
					//한줄평 리스트 평점
					$('.rating').rating('disable', {
						initialRating : 1,
						maxRating : 5,
						clearable : false,
					});
					
					//한줄평 신고 모달
					<c:if test="${!empty loginUser }">
						$(".rev_report").on("click", function() {
							$("#rev_rep_modal").modal('show');
						});	
					</c:if>
					<c:if test="${empty loginUser }">
						$(".rev_report").on("click", function() {
							alert("로그인 하셔야 신고하실 수 있습니다.");
						});	
					</c:if>
					
					//한줄평 신고 기타사유
					// 기타 선택 시에만 textarea 활성화
					$("input:radio[id='reportreason2']").click(function() {
						if ($("input:radio[id='reportreason2']:checked").val() == "기타") {
							$("#etc2").attr("disabled", false);
							$("#etc2").focus();
							$("#etc2").attr("placeholder", "기타 사유를 입력해주세요.(최대 100자)")
							$("#rev_rep_cnt").css("display", "block");
							// radio 버튼의 value 값이 '기타'면 textarea활성화 & 자동포커스 & placeholder & 글자수세기 나오기
						} else {// 아니라면 text 비활성화&placeholder없음&글자수세기 없음
							$("#etc2").attr("disabled", true);
							$("#etc2").removeAttr("placeholder", "기타 사유를 입력해주세요.(최대 100자)")
							$("#rev_rep_cnt").css("display", "none");
							// 이전 기타 textarea작성 값 초기화
							$("#etc2").val("");
							$("#rev_rep_cnt").html("( <span style='color:#4ecdc4;font-size:9pt;'>0</span> / 최대 100자 )");
						}
					});

					// 한줄평 기타사유 글자수 세기
			 		$("#etc2").keyup(function(e) {
						var content = $(this).val();
						$("#rev_rep_cnt").html("( <span style='color:#4ecdc4;font-size:9pt;'>" + content.length + "</span> / 최대 100자 )"); // 글자수 실시간 카운팅
						if (content.length > 100) {
							alert("최대 100자까지만 입력 가능합니다.");
							$(this).val(content.substring(0, 100));
							$("#rev_rep_cnt").html("( <span style='color:red;font-size:9pt;'>100 </span>/ 최대 100자)");
						}
					});
					
				});
				
				
				$(".review_list_main").html(values);
				//한줄평 더보기 버튼
				$(".review_list").slice(0, 4).fadeIn(); // 최초 4개 선택
				$("#more_btn").show();
				$("#more_btn").click(function(e) { // Load More를 위한 클릭 이벤트e
				    e.preventDefault();
					var height = $('#objet_review').height();
				    $(".review_list:hidden").slice(0, 4).fadeIn(); // 숨김 설정된 다음 4개를 선택하여 표시
				    $('#objet_review').css("height", $(document).height());
				    if ($(".review_list:hidden").length == 0) { // 숨겨진 DIV가 있는지 체크
				        $('#more_btn').fadeOut();// 더 이상 로드할 항목이 없는 경우
				        $('.rev_insert').css("margin-top", "180px");
				        $('.rev_insert_no').css("margin-top", "120px");
				    }
				});
				console.log("ok : " + data);
			},
			error : function(request, error, XMLHttpRequest, textStatus, jqXHR, errorThrown) {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				/* console.log("XMLHttpRequest : " + XMLHttpRequest + "\n" + "error : " + jqXHR + ", " + textStatus + ", " + errorThrown); */
			}
		});// review order ajax
	}
	
	//한줄평 좋아요/좋아요 취소
	var revgood = false;
	function reviewGood(revuserid, objetno){
		/*  if(revgood){
			alert("이미 좋아요를 누르셨습니다.");
			return;
		} */
		revgood = true; 
		var userid = '${loginUser.userid}';
		$.ajax({
	         url:"insertRevGood.do",
	         type:"get",
	         data:{revuserid : revuserid, objetno : objetno, userid : userid},
	         success: function(result){
	             if(result == "revgood"){
	               console.log("한줄평 좋아요 성공!");
	       			$("#rev_like_"+revuserid).addClass("green");
	       			$("#rev_like_"+revuserid).css("font-size", "16px");
	       			var revcnt = parseInt($("#revgood_cnt_"+revuserid).html()) + 1;
	       			$("#revgood_cnt_"+revuserid).html(" "+revcnt);
	             }else if(result =="revgoodcancel"){
	            	 console.log("한줄평 좋아요 취소!");
	            	 $("#rev_like_"+revuserid).removeClass("green");
		       		var revcnt = parseInt($("#revgood_cnt_"+revuserid).html()) - 1;
	       			$("#revgood_cnt_"+revuserid).html(" "+revcnt);
	             }else if(result == "fail"){
	            	 alert("한줄평 좋아요 취소 실패!");
	             }else if(result == "fail2"){
	            	 alert("한줄평 좋아요 실패!");
	             }else if(result == "revgoodhatecancel"){
	            	 alert("중복 데이타 삭제!");
	             }else if(result == "sameuserid"){
	            	 alert("내 한줄평엔 좋아요를 하실 수 없습니다.");
	             }else if(result == "revgoodrevhatecancel"){
	            	 alert("이미 공감을 누르셨습니다.");
	             }else if(result == "fail4"){
	            	 alert("한줄평 좋아요 성공 싫어요 삭제 실패");
	             }
	         },
	          error: function(request, status, errorData){
					console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
	     });
	}//reviewGood
	
	//한줄평 싫어요/싫어요 취소
	var revhate = false;
	function reviewHate(revuserid, objetno){
		 /* if(revhate){
			alert("이미 싫어요를 누르셨습니다.");
			return;
		}
		revhate = true;  */
		var userid = '${loginUser.userid}';
		$.ajax({
	         url:"insertRevHate.do",
	         type:"get",
	         data:{revuserid : revuserid, objetno : objetno, userid : userid},
	         success: function(result){
	             if(result == "revhate"){
	               console.log("한줄평 싫어요 성공!");
	       			$("#rev_hate_"+revuserid).addClass("black");
	       			$("#rev_hate_"+revuserid).css("font-size", "16px");
	       			var revcnt = parseInt($("#revhate_cnt_"+revuserid).html()) + 1;
	       			$("#revhate_cnt_"+revuserid).html(" "+revcnt);
	             }else if(result =="revhatecancel"){
	            	 console.log("한줄평 싫어요 취소!");
	            	 $("#rev_hate_"+revuserid).removeClass("black");
		       		var revcnt = parseInt($("#revhate_cnt_"+revuserid).html()) - 1;
	       			$("#revhate_cnt_"+revuserid).html(" "+revcnt);
	             }else if(result == "fail"){
	            	 alert("한줄평 싫어요 취소 실패!");
	             }else if(result == "fail2"){
	            	 alert("한줄평 싫어요 실패!");
	             }else if(result == "revgoodhatecancel"){
	            	 alert("중복 데이타 삭제!");
	             }else if(result == "sameuserid"){
	            	 alert("내 한줄평엔 싫어요를 하실 수 없습니다.");
	             }else if(result == "revgoodrevhatecancel"){
	            	 alert("이미 공감을 누르셨습니다.");
	             }else if(result == "fail4"){
	            	 alert("한줄평 좋아요 성공 싫어요 삭제 실패");
	             }
	         },
	          error: function(request, status, errorData){
					console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
	     });
	}//reviewGood
	
	//한줄평 등록
	function rev_insert(objetno, userid){
		var revcontent = $(".rev_ins_cont").val();
		var revstars = $("#rev_ins_star").rating("get rating");
		$.ajax({
			type : "post",
	        url : "insertReview.do",
	        data : {"objetno" : objetno, "userid" : userid, "revcontent" : revcontent, "revstars" : revstars},
	        success : function(message){
				alert("한줄평이 등록되었습니다.");
				window.location.reload();
				$(".review").click();
				var scrollTop = 390;
				$("html, body").animate({ scrollTop: scrollTop }, 1000);
	        },
	        error : function(request, error, XMLHttpRequest, textStatus, jqXHR, errorThrown) {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
	}//rev_insert
	
	//한줄평 수정
		function rev_update(userid){
			var revcontent = $("#revcontent").val();
			var revstars = $("#rev_up_star").rating("get rating");
			$.ajax({
				type : "post",
		        url : "updateReview.do",
		        data : {"userid" : userid, "revcontent" : revcontent, "revstars" : revstars},
		        success : function(message){
					alert("한줄평이 수정되었습니다.");
				    /* window.location.reload(); */
					$(".review").click();
					var scrollTop = 390;
					$("html, body").animate({ scrollTop: scrollTop }, 1000);
					$(".review_mylist_up").css("display", "none");
					$(".review_mylist").css("display", "block");
		        },
		        error : function(request, error, XMLHttpRequest, textStatus, jqXHR, errorThrown) {
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
			});
		}//rev_update
	
	//한줄평 삭제
	function rev_delete(userid, objetno){
		$.ajax({
			type : "get",
	        url : "deleteReview.do",
	        data : {"userid" : userid, "objetno" : objetno},
	        success : function(message){
				alert("한줄평이 삭제되었습니다.");
				$(".review").click();
				var scrollTop = 390;
				$("html, body").animate({ scrollTop: scrollTop }, 1000);
	        },
	        error : function(request, error, XMLHttpRequest, textStatus, jqXHR, errorThrown) {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});	
	}//rev_delete
	
	<c:if test="${!empty loginUser.userid}">
	//헤더 아이콘 관심 오브제 추가
	function likeobjet(){
		var objetno = ${objet.objetno};
		var userid = '${loginUser.userid}';
		$.ajax({
			url : "likeobjet.do",
			data : {objetno : objetno, userid : userid},
			type : "post",
			success: function(result){
				if(result == "ok"){
					console.log("관심 오브제 삭제 성공!");
	               $("#likeobjet").removeClass("ico_likeit_unlike");
	               $("#likeobjet").addClass("ico_likeit_like");
	               var num = ${fn:length(likeobjetList) } - 1;
	               $(".likeobjetcnt").html(num);
	             }
	             if(result == "ok2"){
	               console.log("관심 오브제 추가 성공!");
	               $("#likeobjet").removeClass("ico_likeit_like");
	               $("#likeobjet").addClass("ico_likeit_unlike");
	               var num = ${fn:length(likeobjetList) };
	               $(".likeobjetcnt").html(num);
	             }
	             if(result == "fail"){
	            	 alert("관심 오브제 삭제 실패!");
	             }
	             if(result == "fail2"){
	            	 alert("관심 오브제 추가 실패!");
	             } 
	            
	          },
	          error: function(request, status, errorData){
					console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
		});
	}
	</c:if>
	
	<c:if test="${empty loginUser}">
	$(".ico_likeit_like").on("click", function(){
		alert("로그인 하셔야합니다.");
	});
	$(".ico_likeit_unlike").on("click", function(){
		alert("로그인 하셔야합니다.");
	});	
	$(".rev_like").on("click", function(){
		alert("로그인 하셔야합니다.");
	});	
	$(".rev_hate").on("click", function(){
		alert("로그인 하셔야합니다.");
	});
	</c:if>
	
	//한줄평 신고
	function revReport(reportedb){
		//한줄평 신고 모달
		$("#rev_rep_modal").modal('show');
		
		document.getElementById("btnsub_rev_rep").onclick = function() {
			var originno = $('.originno').val();
			var reporterb = $('.reporterb').val();
			var reportbtype = $('.reportbtype').val();
			var reportbreason = $('.reportbreason').val();
		    $.ajax({
		        url: 'reviewReport.do',
		        type: 'POST',
		        data: {originno : originno, reportedb : reportedb, reporterb : reporterb, reportbtype : reportbtype, reportbreason : reportbreason} ,
		        success: function (result) {
		            if(result == "ok"){
		                alert("한줄평이 신고되었습니다.");
		            }if(result == "fail"){
		                alert("이미 이 한줄평을 신고하셨습니다.");
		            }
		        }
		    });
		};
	
	}
	
</script>
</head>
<body>
<section class="all">
<section class="objet_infomation">
<!-- 배너 상단 아이콘들  -->
<div class="wrap_all">
<div class="f_r">
<div class="wrap_action_article">
<button id="btnToggleArticleMoreAction" type="button" class="f_r img_ico text_hide ico_action #more">실행</button>
<div class="more_action_wrap f_r ">
<button class="reportArticle f_l more_action text_hide img_ico img_ico_single ico_report #report">신고</button>
</div>
<div id="default" class="default_action_wrap f_r" style="visibility: visible;">
<a href="javascript:void(0);" class="default_action headerLikeBtn img_ico_wrap">
<c:if test="${resultValue eq 'ok' }">
<span class="f_l text_hide img_ico img_ico_with_text ico_likeit_unlike" id="likeobjet" onclick="likeobjet();">관심오브제</span>
</c:if>
<c:if test="${resultValue eq 'fail' }">
<span class="f_l text_hide img_ico img_ico_with_text ico_likeit_like" id="likeobjet" onclick="likeobjet();">관심오브제</span>
</c:if>
<c:if test="${fn:length(likeobjetList) } == 0">
<span class="f_l text_hide img_ico img_ico_with_text ico_likeit_unlike" id="likeobjet" onclick="likeobjet();">관심오브제</span>
</c:if>
<span class="f_l text_like_count text_default text_with_img_ico ico_likeit_like likeobjetcnt">${fn:length(likeobjetList) }</span> </a>
<a href="javascript:void(0);" class="default_action img_ico_wrap comment">
<span class="f_l text_hide img_ico img_ico_with_text ico_comment">한줄평</span></a>
<span class="wrapButtonSocialShare f_l default_action img_ico_wrap">
<span class="f_l text_hide img_ico img_ico_with_text ico_share" style="cursor: pointer;">공유</span>
<span class="wrap_share_gnb wrap_share_common"><strong class="tit_sharegnb">오브제 전시를 SNS에 공유해보세요</strong>
<button type="button" id="facebook" class="ico_share_common btn_share_facebook ui mini circular facebook icon button" data-servicename="facebook">
     <i class="big facebook icon"></i><span class="screen_out">페이스북공유</span>
</button>
<button type="button" id="instagram" class="ico_share_common btn_share_instagram ui mini circular instagram icon button" data-servicename="instagram">
    <i class="big instagram icon"></i><span class="screen_out">인스타그램 공유</span>
</button>
<button type="button" id="twitter" class="ico_share_common btn_share_twitter ui circular mini twitter icon button" data-servicename="twitter">
    <i class="big twitter icon"></i><span class="screen_out">트위터공유</span>
</button>	
</span>
</span>							
</div>
</div>
</div>
</div>
<!--// 배너 상단 아이콘들  -->
<!-- 전시신고 모달 시작 -->
<div class="ui modal" id="rep_modal">
<p style="font-size: 20pt; padding-top:40px; color:#373737; text-align:center;font-weight: bold;">전시 신고하기</p>
<p class="quitHeader" style="font-weight: 600;text-align: center;font-weight: bolder;">어떤 문제가 있나요?</p>
<center>
<form action="objetReport.do" method="post" id="rep_form">
<div align="center" style="padding-top: 15px;">
	<div class="choiceReportReason1">
		<div class="ui form">
		<input type="hidden" name="originno" value="${objet.objetno }">
		<input type="hidden" name="reportedb" value="${objet.userid }">
		<input type="hidden" name="reporterb" value="${loginUser.userid }">
		<input type="hidden" name="reportbtype" value="OBJET">
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportbreason" value="명예훼손/사생활 침해 및 저작권 침해" checked="checked">
			        <label>명예훼손/사생활 침해 및 저작권 침해</label>
			      </div>
			    </div>
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportbreason" value="음란성 또는 청소년에게 부적합한 내용">
			        <label>음란성 또는 청소년에게 부적합한 내용</label>
			      </div>
			    </div>
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportbreason" value="명의 도용">
			        <label>명의 도용</label>
			      </div>
			    </div>
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportbreason" value="부적절한 콘텐츠">
			        <label>부적절한 콘텐츠</label>
			      </div>
			    </div>
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportbreason" value="개인정보노출">
			        <label>개인정보노출</label>
			      </div>
			    </div>
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportbreason" id="reportreason1" value="기타">
			        <label>기타</label>
			      </div>
			    </div>
			    <textarea rows="3" cols="10" name="reportbreason" id="etc1" style="resize: none;" disabled required></textarea>
				<span style="color:#aaa; display: none; text-align:right; font-size:9pt;margin-top:2px;" id="obj_rep_cnt">( <span style="color:#4ecdc4;font-size:9pt;">0</span> / 최대 100자 )</span>
		</div>
	</div>
</div>
<br><br>
<div class="actions">
    <div class="ui red cancel inverted button" style="cursor: pointer;">
      <i class="remove icon"></i>
      	취소
    </div>
    <div id="btnsub_rep" class="ui blue ok inverted button" onClick="submit1();" style="cursor: pointer;">
      <i class="bell outline icon"></i>
             신고하기
    </div>
  </div><br><br>
</form>
</center>
</div>
<!-- 전시 신고 모달 끝 -->
<!-- 미로그인시 신고 버튼 클릭시에 -->

<!-- 미로그인시 신고 버튼 클릭시에 -->
<img src="resources/images/objet/${objet.renamemainposter }" id="banner_img">
<div class="banner_img_text"><!-- <span class="banner_date">2019. 08. 02 - 2019. 12. 12 </span> -->
<div class="ui black icon button banner_img_btn" 
style="font-size: 18px;" onclick="location.href='objetView.do?objetno=${objet.objetno}&userid=${objet.userid }'">전시 감상하러 가기
&nbsp;<i class="ui large white arrow right icon" style="font-size:18px;"></i>
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
  <a class="item review" id="item" data-tab="objet_review">
    한줄평
  </a>
</div>
<center>
<div class="objet_cont">
<!-- EXHIBITION  -->
<div class="ui bottom attached tab active" id="objet_info">
<span class="det_title">EXHIBITION</span><br>
<div class="objet_section">
<div class="exhibition_main">
<p><img src="resources/images/objet/${objet.objetrfile1 }" alt="${objet.objettitle1 }" id="exhibition_img"></p><br>
</div>
<div class="exhibition_info_txt">
<i style="font-family:'Nanum Myeongjo';"><img src="resources/images/objet/quotation.PNG" style="width:25px;height: auto;"> 
&nbsp;${objet.objetintro }&nbsp;
<img src="resources/images/objet/quotation.PNG" style="transform: rotate(180deg); width:25px;height: auto;"></i>
</div>
<div class="exhibition_intro">
<span class="det_title">INTRODUCTORY FILM</span><br>
<video class="intro_mp3" src="${pageContext.servletContext.contextPath }/resources/media/objet.avi" 
controls poster="${pageContext.servletContext.contextPath }/resources/images/objet/22.JPG"></video>
<br>
<%-- <div class="intro_txt">		
<h1>${objet.objettitle}</h1>
<c:set var="length" value="${fn:length(objet.userintrol)}"/>
<c:if test="${ length < 80 }">		
<p>${fn:substring(objet.userintrol,0,80)}</p>
</c:if><c:if test="${ length > 80 }">
<p>${fn:substring(objet.userintrol,80,200)}...</p>
</c:if>
</div> --%>
</div>
<div class="exhibition_vp" id="exhibition_vp"><br>
<span class="det_title">VIEW POINT</span><br>
  <div class="swiper-container">
  <div class="swiper-pagination" ></div>
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="resources/images/objet/${objet.objetrfile2 }"></div>
      <div class="swiper-slide"><img src="resources/images/objet/${objet.objetrfile3 }"></div>
      <div class="swiper-slide"><img src="resources/images/objet/${objet.objetrfile4 }"></div>
      <div class="swiper-slide"><img src="resources/images/objet/${objet.objetrfile5 }"></div>
    </div>
  </div>
<div class="vp_txt">
<c:set var="title" value="${fn:length(objet.objettitle)}"/>
<c:if test="${ title < 20 }">		
<b><h1>${fn:substring(objet.objettitle,0,10)}</h1></b>
</c:if>
<c:if test="${ title > 20 }">		
<b><h1>${fn:substring(objet.objettitle,0,10)}<br>
${fn:substring(objet.objettitle,10,30)}</h1></b>
</c:if>
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
<!-- ARTIST  -->
<div class="ui bottom attached tab" id="artist_info">
<center><span class="det_title">ARTIST</span></center><br>
<div class="artist_cont">
<div class="artist_cont1">
<span id="artist_tit">${objet.nickname }</span><br>
<span id="artist_info_cont">${objet.userintrol }</span></div>
<div class="artist_cont2"><img src="resources/users_upfiles/${objet.userrpic }" id="artist_pic"></div>
</div>
</div>
<center>
<!-- CALENDAR  -->
<div class="ui bottom attached tab" id="objet_calendar">
<span class="det_title">CALENDAR</span><br>

</div>
<!-- REVIEW  -->
<div class="ui bottom attached tab " id="objet_review">
   <span class="det_title">REVIEW</span><br>
   <div class="search-option-cate">
  <span class="search-option">
      <a href="javascript:void(0);" onclick="reviewOrder(${objet.objetno}, 'reviewdatedesc');" class="option on" >&nbsp;최신순</a>&nbsp;&nbsp;
      <a href="javascript:void(0);" onclick="reviewOrder(${objet.objetno}, 'reviewstardesc');" class="option" >&nbsp;평점순</a>&nbsp;&nbsp;
</span>
</div><br>
<div class="review_all_list">
<!-- 내 한줄평 있을시 보이는 공간 -->
<c:if test="${!empty loginUser && loginUser.userid eq myReview.revuserid}">
<div class="review_mylist">
<img class="ui circular image" src="resources/users_upfiles/${loginUser.userrpic }" id="writer_mypic">
<div class="review_mycontent">
<span class="rev_mywriter">${myReview.nickname }</span>
<span class="rev_date">
<fmt:formatDate value="${myReview.revdate }" pattern="MMM" />.&nbsp;
<fmt:formatDate value="${myReview.revdate }" pattern="dd" />.&nbsp;
<fmt:formatDate value="${myReview.revdate }" pattern="yyyy" /></span>
<div class="ui icon top left pointing floating dropdown button" id="rev_mymore">
<i class="material-icons" style="color:#959595;font-size:22px;">&#xe5d4;</i>
<div class="menu">
<div class="item"><a style="color:#959595;" class="up_btn">수정</a></div>
<div class="item"><a style="color:#959595;" class="del_btn">삭제</a></div>
</div>
</div><br>
<button class="ui red horizontal label" id="my_rev_btn">내리뷰</button>&nbsp;
 <span class="rev_mycont">${myReview.revcontent }</span><br>
<div class="extra">
<div class="ui star rating my" data-rating="${myReview.revstars }" data-max-rating="5" >${myReview.revstars }</div>
<div class="rev_like_btn">
<div class="ui basic circular gray icon button rev_like" onclick="reviewGood('${myReview.revuserid }', ${objet.objetno})">
<i class="thumbs up outline icon" id="rev_like_${myReview.revuserid }" style="font-size:15px;"></i><span id="revgood_cnt_${myReview.revuserid }" class="rev_cnt"> ${myReview.revgood }</span></div>&nbsp;
<div class="ui basic circular gray icon button rev_hate"  onclick="reviewHate('${myReview.revuserid }', ${objet.objetno})">
<i class="thumbs down outline icon" id="rev_hate_${myReview.revuserid }"style="font-size:15px;"></i><span id="revhate_cnt_${myReview.revuserid }" class="rev_cnt"> ${myReview.revhate }</span></div>
<c:if test="${empty loginUser }">
<div class="ui basic circular gray icon button rev_like" onclick="reviewGood('${myReview.revuserid }', ${objet.objetno})">
<i class="thumbs up outline icon" id="rev_like_${myReview.revuserid }" style="font-size:15px;"></i><span id="revgood_cnt_${myReview.revuserid }" class="rev_cnt"> ${myReview.revgood }</span></div>&nbsp;
<div class="ui basic circular gray icon button rev_hate"  onclick="reviewHate('${myReview.revuserid }', ${objet.objetno})">
<i class="thumbs down outline icon" id="rev_hate_${myReview.revuserid }"style="font-size:15px;"></i><span id="revhate_cnt_${myReview.revuserid }" class="rev_cnt"> ${myReview.revhate }</span></div>
</c:if>
</div></div>
</div>
</div>
</c:if>
<!-- //내 한줄평 있을시 보이는 공간 끝 -->
<!-- 내 한줄평 있을시 수정 공간-->
<c:if test="${!empty loginUser && loginUser.userid eq myReview.revuserid }">
<div class="review_mylist_up">
<img class="ui circular image" src="resources/users_upfiles/${loginUser.userrpic }" id="writer_mypic">
<div class="review_ins_content">
<textarea class="ui fluid input rev_up_cont" id="revcontent" maxlength="200">
${myReview.revcontent }</textarea>
<span id="counter_up">( <span style="color:#4ecdc4;font-size:0.85em;">현재</span> / 최대 100자 )</span>
</div>
<div class="extra" id="rev_myrating">
<div class="ui star rating insert" data-rating="${myReview.revstars }" data-max-rating="5" id="rev_up_star"></div>
</div>
<div class="update_mybtn">
<button class="ui circular basic gray button" id="update_can" type="reset" >취소</button>&nbsp;
<button class="ui circular basic gray button" onclick="rev_update('${loginUser.userid}');" >수정</button>
</div>
</div>
</c:if>
<!-- //내 한줄평 있을시 수정 공간 끝 -->
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
    <div id="btnsub_rev_del" class="ui blue ok inverted button" onClick="rev_delete('${loginUser.userid}', ${objet.objetno })" style="cursor: pointer;">
      <i class="checkmark icon"></i>
      	삭제
    </div>
  </div>
</div>
<!-- //한줄평 삭제 버튼 클릭시 모달 끝 -->
<!-- 한줄평 신고 -->
<div class="ui modal" id="rev_rep_modal">
<p style="font-size: 20pt; padding-top:40px; color:#373737; text-align:center;font-weight: bold;">한줄평 신고하기</p>
<p class="quitHeader" style="font-weight: 600;text-align: center;font-weight: bolder;">어떤 문제가 있나요?</p>
<!-- <span class="" style="font-weight: 300;text-align: left;margin:0 0 0 40px;">작성자 : user**</span><br>
<span class="" style="font-weight: 300;text-align: left;margin:20px 0 0 40px;">내   용 : 너무 좋아요.... 생각보다 더 좋았어요 또 보고 싶어요~~  좋아요 정말~~~짜루짜루진짜루~~</span> -->
<center>
<form id="rev_rep_form">
<div align="center" style="padding-top: 15px;">
	<div class="choiceReportReason2">
		<div class="ui form">
		<input type="hidden" class="originno" name="originno" value="${objet.objetno }">
		<input type="hidden" class="reporterb" name="reporterb" value="${loginUser.userid }">
		<input type="hidden" class="reportbtype" name="reportbtype" value="REVIEW">
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportbreason" class="reportbreason" value="영리목적/홍보성/불법정보" checked="checked">
			        <label>영리목적/홍보성/불법정보</label>
			      </div>
			    </div>
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportbreason" class="reportbreason" value="음란/선정성">
			        <label>음란/선정성</label>
			      </div>
			    </div>
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportbreason" class="reportbreason" value="욕설/인신공격/같은내용도배">
			        <label>욕설/인신공격/같은내용도배</label>
			      </div>
			    </div>
			    <div class="field">
			      <div class="ui radio checkbox">
			        <input type="radio" name="reportbreason" class="reportbreason" id="reportreason2" value="기타">
			        <label>기타</label>
			      </div>
			    </div>
			    <textarea class="ui input textarea reportbreason" rows="3" cols="10" name="reportbreason" id="etc2" style="resize: none;" disabled required></textarea>
				<span style="color:#aaa; display: none; text-align:right; font-size:9pt;margin-top:2px;" id="rev_rep_cnt">( <span style="color:#4ecdc4;font-size:9pt;">0</span> / 최대 100자 )</span>
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
    <div class="ui red cancel inverted button" style="cursor: pointer;">
      <i class="remove icon"></i>
      	취소
    </div>
    <div id="btnsub_rev_rep" class="ui blue ok inverted button" style="cursor: pointer;">
      <i class="bell outline icon"></i>
                   신고하기
    </div>
  </div><br><br>
</form>
</center>
</div>
<!-- //한줄평 신고  끝 -->
<!-- 한줄평 리스트 -->
<div class="review_list_main">
<c:forEach var="Review" items="${reviewList }" varStatus="status">
<c:if test="${Review.nickname ne loginUser.nickname }">
<div class="review_list">
<img class="ui circular image" src="resources/users_upfiles/${Review.userrpic }" onerror="this.src='resources/images/basicprofilepic.png'" id="writer_pic">
<div class="review_content">
<span class="rev_writer">${Review.nickname }</span>
<span class="rev_date">
<fmt:formatDate value="${Review.revdate }" pattern="MMM" />.&nbsp;
<fmt:formatDate value="${Review.revdate }" pattern="dd" />.&nbsp;
<fmt:formatDate value="${Review.revdate }" pattern="yyyy" /></span>
<span class="rev_report" onclick="revReport('${Review.revuserid }')">신고</span><br>
<span class="rev_cont">${Review.revcontent }</span><br>
<div class="extra">
<div class="ui star rating" data-rating="${Review.revstars }" data-max-rating="5" >${Review.revstars }</div>
<div class="rev_like_btn">
<!-- && reviewStatusList[status.index].revuserid eq Review.revuserid  -->
<!-- 컨트롤러 값이 'revgood'이고, 한줄평평가리스트의 revgood가 1인지 -->
<c:if test="${revgood eq 'revgood'}">
<div class="ui basic circular gray icon button rev_like" onclick="reviewGood('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs up green outline icon" id="rev_like_${Review.revuserid }" style="font-size:15px;"></i><span id="revgood_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revgood }</span></div>&nbsp;
</c:if><!-- 좋아요 갯수 0이고, 한줄평평가리스트의 userid와 로그인한 userid 다른지, 한줄평평가리스트의 좋아요 갯수가 0인지 -->
<c:if test="${Review.revgood == 0 || reviewStatusList[status.index].userid ne loginUser.userid || reviewStatusList[status.index].revgood == 0}">
<div class="ui basic circular gray icon button rev_like" onclick="reviewGood('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs up outline icon" id="rev_like_${Review.revuserid }" style="font-size:15px;"></i><span id="revgood_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revgood }</span></div>&nbsp;
</c:if><!-- 컨트롤러 값이 'revhate'이고, 한줄평평가리스트의 revhate가 1인지 -->
<c:if test="${revhate eq 'revhate'}">
<div class="ui basic circular gray icon button rev_hate" onclick="reviewHate('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs down black outline icon" id="rev_hate_${Review.revuserid }" style="font-size:15px;"></i><span id="revhate_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revhate }</span></div>
</c:if>
<!-- 싫어요 갯수 0이고, 한줄평평가리스트의 userid와 로그인한 userid 다른지, 한줄평평가리스트의 싫어요 갯수가 0인지 -->
<c:if test="${Review.revhate == 0 || reviewStatusList[status.index].userid ne loginUser.userid || reviewStatusList[status.index].revhate == 0}">
<div class="ui basic circular gray icon button rev_hate" onclick="reviewHate('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs down outline icon" id="rev_hate_${Review.revuserid }" style="font-size:15px;"></i><span id="revhate_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revhate }</span></div>
</c:if>
<c:if test="${Review.revgood == 0 && Review.revhate == 0}"> <!-- 좋아요 싫어요 둘 다 갯수 0일 때 -->
<div class="ui basic circular gray icon button rev_like" onclick="reviewGood('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs up outline icon" id="rev_like_${Review.revuserid }" style="font-size:15px;"></i><span id="revgood_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revgood }</span></div>&nbsp;
<div class="ui basic circular gray icon button rev_hate" onclick="reviewHate('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs down outline icon" id="rev_hate_${Review.revuserid }" style="font-size:15px;"></i><span id="revhate_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revhate }</span></div>
</c:if>
<%-- <c:if test="${revgood eq 'revgood'}">
<div class="ui basic circular gray icon button rev_like" onclick="reviewGood('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs up green outline icon" id="rev_like_${Review.revuserid }" style="font-size:15px;"></i><span id="revgood_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revgood }</span></div>&nbsp;
<div class="ui basic circular gray icon button rev_hate" onclick="reviewHate('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs down outline icon" id="rev_hate_${Review.revuserid }" style="font-size:15px;"></i><span id="revhate_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revhate }</span></div>
</c:if>
<c:if test="${reviewStatus eq 'norevgood'}">
<div class="ui basic circular gray icon button rev_like" onclick="reviewGood('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs up outline icon" id="rev_like_${Review.revuserid }" style="font-size:15px;"></i><span id="revgood_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revgood }</span></div>&nbsp;
</c:if>
<c:if test="${revhate eq 'revhate'}">
<div class="ui basic circular gray icon button rev_like" onclick="reviewGood('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs up green outline icon" id="rev_like_${Review.revuserid }" style="font-size:15px;"></i><span id="revgood_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revgood }</span></div>&nbsp;
<div class="ui basic circular gray icon button rev_hate" onclick="reviewHate('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs down black outline icon" id="rev_hate_${Review.revuserid }" style="font-size:15px;"></i><span id="revhate_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revhate }</span></div>
</c:if>
<c:if test="${reviewStatus eq 'norevhate'}">
<div class="ui basic circular gray icon button rev_hate" onclick="reviewHate('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs down outline icon" id="rev_hate_${Review.revuserid }" style="font-size:15px;"></i><span id="revhate_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revhate }</span></div>
</c:if>
<c:if test="${reviewStatus eq 'norevgoodrevhate' && Review.revgood == 0 && Review.revhate == 0}"> 
<div class="ui basic circular gray icon button rev_like" onclick="reviewGood('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs up outline icon" id="rev_like_${Review.revuserid }" style="font-size:15px;"></i><span id="revgood_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revgood }</span></div>&nbsp;
<div class="ui basic circular gray icon button rev_hate" onclick="reviewHate('${Review.revuserid }', ${objet.objetno})">
<i class="thumbs down outline icon" id="rev_hate_${Review.revuserid }" style="font-size:15px;"></i><span id="revhate_cnt_${Review.revuserid }" class="rev_cnt"> ${Review.revhate }</span></div>
</c:if> --%>
</div></div>
</div>
</div>
</c:if>
</c:forEach>
</div>
<!-- //한줄평 리스트 끝  -->
</div> <!-- //한줄평 끝 -->
<div id="more_btn">
<span>다음 리뷰 보기</span>
</div>
<br><br>
<!-- 한줄평 등록  -->
<c:if test="${myReview == null && myReview.revuserid ne loginUser.userid && objet.userid ne loginUser.userid}">
<div class="rev_insert">
<div class="review_insert">
<img class="ui circular image" src="resources/users_upfiles/${loginUser.userrpic }" id="writer_pic_2">
<div class="review_ins_content">
<textarea class="ui fluid input rev_ins_cont" maxlength="200"
placeholder="이 전시의 감상평(한줄평)을 남겨주세요. 전시와 상관없는 내용은 제재를 받을 수 있습니다."></textarea>
<span id="counter_ins">( <span style="color:#4ecdc4;font-size:0.85em;">0</span> / 최대 100자 )</span>
</div>
<div class="extra" id="rev_rating">
<div class="ui star rating insert" data-rating="0" data-max-rating="5" id="rev_ins_star">0</div>
</div>
<div class="submit_btn">
<button class="ui circular basic gray button" type="reset" >취소</button>&nbsp;
<button class="ui circular basic gray button" onclick="rev_insert(${objet.objetno }, '${loginUser.userid}');" >등록</button>
</div>
</div>
<br><br>
</div>
</c:if>
<c:if test="${myReview != null && myReview.revuserid eq loginUser.userid }">
<div class="rev_insert_no">
<br>
</div>
</c:if>
<!-- 한줄평 등록  끝 -->
</div>
</center>
</section>
</section>
<c:import url="../footer.jsp" />
</body>
</html>