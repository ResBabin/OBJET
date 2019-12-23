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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<style type="text/css">
.objet_infomation{
	width:100%;
	height:100%;
}
#banner_img {
	z-index:0;
	width:100%;
	height:420px;
	vertical-align: top;
	margin-top:-30px;
	overflow: scroll;
}
#banner_img_text {
	position: absolute;
    top:50%;
    left:50%;
    transform: translate(-50%, -50%);                                                                   
    z-index: 2;
    font-family: 'Nanum Gothic', sans-serif;
}
.banner_img_btn {
	position: absolute;
	top: 32%;
	left: 27%;
	transform: translate( -50%, -50% );
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
	transform: translate( -50%, -50% );
    padding-top: 12px;
    line-height: 36px;
    font-family: 'Nanum Gothic', sans-serif;
    letter-spacing: -.05em;
}
.header_icons {
	float:right;
}

.default_wrap {
	position: absolute;
	transform: translate(0, 0);
    font-size: 14px;
    right: 63px;
    padding-top: 0px;
}
#heart {
	position:relative;
    top:5%;
}
.like_cnt {
	position:relative;
    top:10%;
    color:#fff;
    font-size:14px;
}
#chat {
	position:relative;
    top:15%;
}
#share {
	position:relative;
    top:15%;
}
#more {
	position:relative;
    top:15%;
}
#objet_info_menu {
	margin-top:1px;
	border-radius: 0;
	height:60px;
	font-size: 18px;
	font-weight: bolder;
}
#item {
	font-weight: bold;
	color:#fff;
}
.search-option-cate {
	margin:170px 150px 25px 0;
	float:right;
}
.search-option .option{
	font-size: 14px;
	font-weight: normal;
	font-family:'Nanum Gothic';
	color: #959595;
	cursor: pointer;
}
.search-option .on{
	font-size: 14px;
	font-weight: bolder;
	font-family:'Nanum Gothic';
	color: #666666;
}
.search-option .option::before{
 	font-size:40px!important;
    content:'·';
    color:lightgray;
    left:-10px;
    vertical-align:middle;
    top:3px;
}
.search-option .on::before {
	font-size:40px!important;
    content:'·';
    color: #2185d0;
    left:-10px;
    top:3px;
}
.det_title {
	text-align:center;
	font-size: 32px;
	font-weight: bold;
	align:center;
	margin: 0;
	position: relative;
	top: 70px;
	letter-spacing: -0.2px; 
}
.det_title:after{
	content: "";
    display: block;
    width: 60px;
    border-top: 5px solid black;
    margin: -55px auto;
}
#more_btn {
	width:80%;
	height: 30px;
	margin-top: 220px;
	clear:both;
	text-align:center;
	font-size: 17px;
	font-weight: bold;
	letter-spacing: 1px;
	color: #9e9e9e;
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
	width:80%;
	height: auto;
	margin:20px 40px 10px 40px;
	position: relative;
	top:190px;
	border-bottom: 1px solid #e0e0e0;
	align: center;
}
.review_list {
	width:100%;
	height: 135px;
	border-top: 1px solid #e0e0e0;
	align: center;
	text-align: left;
	line-height: 28px;
}
#writer_pic{
	width:85px;
	height: 85px;
	align: left;
	position: relative;
	top:25px;
	left:55px;
}
.review_content {
	position: relative;
	top:-59px;
	left:160px;
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
	color:#959595;
	font-family: 'Nanum Myeongjo';
}
.rev_report:before {
	content: "|";
	font-size: 14px;
	font-weight: lighter;
	color:#ccc;
	margin:0px 5px 0px 5px;
}
.rev_date:before {
	content: "|";
	font-size: 14px;
	font-weight: lighter;
	color:#ccc;
	margin:0px 5px 0px 5px;
}

.rev_report {
	font-size: 14px;
	font-weight: lighter;
	color:#959595;
	cursor: pointer;
}
.rev_cont {
	font-size: 15px;
	font-weight: normal;
	color:black;
}
.rev_like_btn {
	position: relative;
	top:-36px;
	right:-960px;
}
#rev_like {
	width:55px;
	height:auto;
	margin:0;
	padding:8px;
	border: 0;
}
#rev_hate {
	width:55px;
	height:auto;
	margin:0;
	padding:8px;
}
.rev_cnt {
	font-size:12px;
	font-weight:normal;
	color:gray;
	position: relative;
	top:-1px;
	text-align: center;
}
.rev_insert {
	width:80%;
	height: auto;
	margin:20px 40px 10px 40px;
	position: relative;
	top:10px;
	align: center;
}
.review_insert {
	width:100%;
	height: 135px;
	align: center;
	text-align: left;
	line-height: 28px;
}
.review_ins_content {
	position: relative;
	top:-60px;
	left:160px;
	width:85%;
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
    line-height:1.6em;
    max-height: 6.5em;
    padding : 10px;
    border-radius: 1px;
    border:1px solid #e0e0e0;
    display: inline-block;
}
#writer_pic_2 {
	width:75px;
	height: 75px;
	align: left;
	position: relative;
	top:15px;
	left:60px;
}
.rev_ins_cont span {
    position: relative;
    bottom: 5px;
    right: 5px;
}
#counter_ins {
	position: relative;
    right: -955px;
    top:-32px;
  	padding: 0 .5em 0 .5em;
  	font-size: 0.85em;
  	text-align:right;
  	color:lightgrey;
}

#rev_rating {
	float:right;
	position: relative;
	top:30px;
	right:200px;
}
.submit_btn {
	float:right;
	position: relative;
	top:-70px;
	right:30px;
	font-size:14px;
	font-weight: bolder;
}
/* 내 한줄평 스타일 */
#rev_mymore {
	position: relative;
	top:3px;
	right:-890px;
	background: transparent;
}
.review_mylist {
	width:100%;
	height: 135px;
	border-top: 1px solid lightgray;
	align: center;
	text-align: left;
	line-height: 28px;
	background-color: rgba(0, 0, 0, 0.02); 
}
#writer_mypic {
	width:85px;
	height: 85px;
	align: left;
	position: relative;
	top:25px;
	left:55px;
}
.review_mycontent {
	position: relative;
	top:-70px;
	left:160px;	
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
	color:#959595;
	font-family: 'Nanum Myeongjo';
}
.rev_mydate:before {
	content: "|";
	font-size: 14px;
	font-weight: lighter;
	color:#ccc;
	margin:0px 5px 0px 5px;
}
.rev_mycont{
	font-size: 15px;
	font-weight: normal;
	color:black;
	top:-3px;
	position: relative;
}
#my_rev_btn{
	width:55px;
	height: 25px;
	font-size:12px;
	border-radius: 2px;
	color:#e74c3c;
	padding:3px;
	position: relative;
	top:-3px;
	left:2px;
	font-weight: bold;
	margin-right:3px;
}
/* 내 한줄평 수정 */
.review_mylist_up {
	width:100%;
	height: 165px;
	border-top: 1px solid lightgray;
	align: center;
	text-align: left;
	line-height: 28px;
	background-color: rgba(0, 0, 0, 0.02); 
	display:none;
}
#rev_myrating{
	float:right;
	position: relative;
	top:-65px;
	right:200px;
}
.update_mybtn{
	float:right;
	position: relative;
	top:-70px;
	right:-55px;
	font-size:14px;
	font-weight: bolder;
}
.rev_up_cont {
	font-size: 14px;
	font-weight: bold;
	color: #9e9e9e;
	width: 100%;
    resize: none;
    min-height: 4.5em;
    line-height:1.6em;
    max-height: 6.5em;
    padding : 10px;
    border-radius: 1px;
    border:1px solid #e0e0e0;
    display: inline-block;
}
#counter_up {
	position: relative;
    right: -955px;
    top:-32px;
  	padding: 0 .5em 0 .5em;
  	font-size: 0.85em;
  	text-align:right;
  	color:lightgrey;
}
/* 내 한줄평 삭제 */

/* 전시 신고하기 */
.choiceReportReason1{
	font-size: 20pt;
	align-self:center;
	text-align:left;
	background: #e2e2e2;
	width: 500px;
	height: 360px;
	padding: 20px 40px;
}

/* 한줄평 신고하기 */
.choiceReportReason2{
	font-size: 20pt;
	align-self:center;
	text-align:left;
	background: #ccc;
	width: 500px;
	height: 250px;
	padding: 25px 40px;
	align:center;
}
</style>
<script type="text/javascript">
$(function(){
	//tab menu
	$("#objet_info_menu #item").on("click", function(){
		  var tab = $(this).attr("data-tab");
		  $("#objet_info_menu #item").removeClass("active");
		  $(this).addClass("active");
		  $(".tab").removeClass("active");
		  $("#" + tab).addClass("active");
	});
	
	$(".search-option .option").on("click", function(){
  		$(".search-option .option").removeClass("on");
  		$(this).addClass("on");
  		$(".search-option .i .off").removeClass("off");
  		$(".search-option .i").addClass("off");
  	});
	
	$("#rev_like .icon").on("click", function(){
		$(this).removeClass("outline");
		$(this).addClass("blue");
	});
	$("#rev_hate .icon").on("click", function(){
		$(this).removeClass("outline");
		$(this).addClass("gray");
	});
	
	//평점 레이팅(리스트)
	$('.rating')
	  .rating('disable', {
	    initialRating: 1,
	    maxRating: 5,
	    clearable: false,
	  });
	
	//평점 레이팅(등록)
	$('.insert')
	  .rating('enable', {
	    initialRating: 1,
	    maxRating: 5,
	    clearable: false,
	  });
	
	//한줄평 등록 글자수 카운팅
      $('.rev_ins_cont').keyup(function (e){
          var content = $(this).val();
          $("#counter_ins").html("( <span style='color:#4ecdc4;'>"+content.length+"</span> / 최대 100자 )");	// 글자수 실시간 카운팅
          if(content.length > 100){
        	  alert("최대 100자까지만 입력 가능합니다.");
        	  $(this).val(content.substring(0,100));
			  $("#counter_ins").html("( <span style='color:red;'>100 </span>/ 최대 100자)");
          }
      });
      $('rev_ins_cont').keyup();
      
      //한줄평 수정 글자수 카운팅
		 $(".rev_up_cont").keyup(function(e){
			 var content = $(this).val();
			 $("#counter_up").html("( <span style='color:#4ecdc4;font-size:9pt;'>"+content.length+"</span> / 최대 100자 )");	// 글자수 실시간 카운팅
			 if(content.length > 100){
				 alert("최대 100자까지만 입력 가능합니다.");
				 $(this).val(content.substring(0,100));
				 $("#counter_up").html("( <span style='color:red;font-size:9pt;'>100 </span>/ 최대 100자)");
			 } 
		 });
		 $('rev_up_cont').keyup();
      
      //내 한줄평 수정/삭제 버튼
   		$("#rev_mymore").dropdown(); 
      
      	$(".up_btn").on("click", function(){
      		$(".review_mylist_up").css("display", "block");
      		$(".review_mylist").css("display", "none");
      	});
      
   		$(".del_btn").on("click", function(){
			$("#rev_del_modal").modal('show');
		}); 
   		
   		//한줄평 신고 모달
   		$(".rev_report").on("click", function(){
   			$("#rev_rep_modal").modal('show');
   		});
   		
   	//한줄평 신고 기타사유
   	// 기타 선택 시에만 textarea 활성화
		$("input:radio[name=reportreason]").click(function(){
	        if($("input[name=reportreason]:checked").val() == "기타"){
	            $("textarea[name=etc]").attr("disabled",false);
	            $("textarea[name=etc]").focus();
	            $("textarea[name=etc]").attr("placeholder","기타 사유를 입력해주세요.(최대 100자)")
	            $("#count").css("display","block");
	            // radio 버튼의 value 값이 '기타'면 textarea활성화 & 자동포커스 & placeholder & 글자수세기 나오기
	        }else {// 아니라면 text 비활성화&placeholder없음&글자수세기 없음
	              $("textarea[name=etc]").attr("disabled",true);
	              $("textarea[name=etc]").removeAttr("placeholder","기타 사유를 입력해주세요.(최대 100자)")
	              $("#count").css("display","none");
	           // 이전 기타 textarea작성 값 초기화
		        $("textarea[name=etc]").val("");
		        $("#count").html("( <span style='color:#4ecdc4;font-size:9pt;'>0</span> / 최대 100자 )");
	        }
    	});
		
		// 기타사유 글자수 세기
		 $("textarea[name=etc]").keyup(function(e){
			 var content = $(this).val();
			 $("#count").html("( <span style='color:#4ecdc4;font-size:9pt;'>"+content.length+"</span> / 최대 100자 )");	// 글자수 실시간 카운팅
			 if(content.length > 100){
				 alert("최대 100자까지만 입력 가능합니다.");
				 $(this).val(content.substring(0,100));
				 $("#count").html("( <span style='color:red;font-size:9pt;'>100 </span>/ 최대 100자)");
			 } 
		 });
		
}); 
</script>
</head>
<body>
<div class="objet_infomation">
<div class="banner_exhibition">
<!-- <div class="header_icons">
<i class="material-icons" style="color:#fff;font-size:24px;" id="heart">&#xe87e;</i>
<span class="like_cnt">153</span>
<i class="right floated chat outline icon" style="color:#fff;font-size:24px;" id="chat"></i>
<i class="material-icons" style="color:#fff;font-size:24px;" id="share">&#xe80d;</i>
<i class="material-icons" style="color:#fff;font-size:24px;" id="more">&#xe5d4;</i>
</div> -->
<!-- <div class="header_icons">
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
</span>
</div>
</div>
</div> -->
<img src="resources/images/objet/objetmainposter.jpg" id="banner_img">
<div class="banner_img_text"><!-- <span class="banner_date">2019. 08. 02 - 2019. 12. 12 </span> -->
<div class="ui inverted black icon button banner_img_btn" style="font-size: 18px;" onclick="location.href=''">전시 감상하러 가기
&nbsp;<i class="ui arrow right icon" style="font-size:18px;"></i>
</div></div>
<div class="ui fluid four item inverted menu" id="objet_info_menu">
  <a class="item" id="item" data-tab="objet_info">
    전시소개
  </a>
  <a class="item" id="item" data-tab="artist_info">
    작가소개
  </a>
  <a class="item" id="item" data-tab="objet_calendar">
    전시일정
  </a>
  <a class="active item" id="item" data-tab="objet_review">
    한줄평
  </a>
</div>
<center>
<div class="objet_review_cont">
<div class="ui bottom attached tab">
전시소개

</div>
<div class="ui bottom attached tab">
작가소개

</div>
<div class="ui bottom attached tab">
전시일정

</div>
<div class="ui bottom attached tab active" id="objet_review">
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
</center>
</form>
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
<br><br>
</div>
</div>
</center>
</div>
</div>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br>
<c:import url="../footer.jsp" />
</body>
</html>