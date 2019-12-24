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
html, body { height: 100%; margin: 0; padding: 0; } 
.artist_allList {
	min-height:100%;
}
.objet_title{
	font-family: 'Nanum Myeongjo';
	nth-of-type(1) font-weight: 400; 
    font-size: 32px;
    text-align: center;
    letter-spacing: 1px;
    padding:0;
}
.objet_more_section {
	margin:0 60px 10px 10px;
	height:auto;
}
.objet_subtitle{
	font-family:'Nanum Gothic';
	nth-of-type(1) font-weight: 400; 
    font-size: 14px;
    text-align: center;
    color: gray;
    margin-top:-10px;
}
.search-option-cate {
	align:right;
	margin:5px 0px 25px 0;
	float:right;
}

.search-option .option{
	font-size: 14px;
	font-weight: normal;
	font-family:'Nanum Gothic';
	color: #959595;
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

/* artist pic */
.objet_artist{
	background:#fff;
}
.artist_pic {
  margin: 40px 0 0 0;
  width: 100%; 
  overflow:hidden;
  height:auto;
  
}
.artist_pic_main {
  width: 100%; 
  height: 100%;
  margin-left:5%;
}
.artist_card {
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  text-align: center;
  background-color: #ffffff;
  float:left;
  /* border: 1px solid #ccc; */
  margin-right:40px;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
}
.artist_card * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.25s ease;
  transition: all 0.25s ease;
}
.img_blur {
	-webkit-filter: blur(1px);
  filter: blur(1px);
}
.img_blur:hover {
	-webkit-filter: blur(0px);
  filter: blur(0px);
}
.profile_back {
  max-width: 100%;
  opacity: 0.6;
  -webkit-filter: grayscale(100%);
  filter: gray;
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.4s ease-in-out;
}
.profile_back:hover {
  opacity: 1;
  -webkit-filter: grayscale(0%);
	filter: none;
	transform: scale(1.1);
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  -ms-transform: scale(1.1);
  -o-transform: scale(1.1);
}

.artist_card figcaption {
  width: 100%;
  background-color: #ffffff;
  padding: 25px;
  position: relative;
}

.artist_card .profile_pic {
  border-radius: 50%;
  position: absolute;
  bottom: 90%;
  left: 105px;
  max-width: 100px;
  opacity: 1;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
  align:center;
}
.artist_card a{
	align:center;
}
.artist_card h2 {
  margin: 30px 0 0 0px;
  font-weight: 400;
  color: #333333;
  font-size:20px;
  text-align:center;
  font-weight: bolder;
  letter-spacing: 1px; 
}
.artist_card h2 span {
  margin: 10px 0 0 0px;
  display: block;
  font-size: 12px;
  color: #666666;
  text-align:center;
  font-weight: bolder;
  letter-spacing: 1.5px; 
}
.artist_card p {
   margin: 10px 0 15px 0px;
  font-size: 12px;
  letter-spacing: 1.5px;
  opacity: 0.9;
  color: #959595;
  text-align:center;
  line-height: 20px;
  font-weight: normal; 
}
.artist_card #tag {
	margin: 20px 5px 15px 0px;
}
</style>
<script type="text/javascript">
$(function() {
  	$(".search-option .option").on("click", function(){
  		$(".search-option .option").removeClass("on");
  		$(this).addClass("on");
  		$(".search-option .i .off").removeClass("off");
  		$(".search-option .i").addClass("off");
  	});
});

//더보기 버튼 함수
/* function moreContent(id, cnt){
	var list_length = $("#"+id+" tr").length-1; //tr갯수 구하기 , 1을 빼는 이유는 제목,작성자 tr이 하나 존재하기 때문.
	var aname = id+"_btn";
	var callLength = list_length;
	$('#startCount').val(callLength);
	$('#viewCount').val(cnt);
	    $.ajax({
	        type    :   "post",
	        url     :   "/getMoreContents_ajax.do",
	        data    :   $('#searchTxtForm').serialize(),
	        dataType:   "json",
	        success :   function(result) {
	                       if(result.resultCnt > 0){
	                    	   var list = result.resultList;
	                    		   if(resultVO.title != '') {
	                    			 $('#'+aname).attr('href',"javascript:moreContent('"+id+"', "+cnt+");");
	                    			   getMoreList(list);
	                    		   }else{
	                    			$("#"+id+"_div").remove();
	                    		   }
	                    	   }
	                       }else{
	                       }
	                    },
	        error   :   function(request,status,error){
	                    alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	                    }
	    });
	    
	    function getMoreList(list){
	    	var content = "";
	    	var length = list.length;
	    	for(i=0; i<list.length; i++){
	    		var resultVO = list[i];
	    		if(resultVO.title != ''){
   	    		content += "<tr>";
   	   	    	content += "<td>"+resultVO.title+"</td>";
   	   	    	content += "<td>"+resultVO.reg_date+"</td>";
   	 	    	content += "</tr>";
	    		}
	    	}
	    	 $("#more_list tr:last").after(content); 
         // id가 more_list 인 tr의 마지막에 content 값을 추가함
	    } */
</script>
</head>
<body>
<c:import url="../headerSearch.jsp" />
<section class="artist_allList">
<h3 class="objet_title">OBJET ALL ARTIST</h3>
<section class="objet_more_section">
<div class="search-option-cate">
<span class="search-option">
    <a href="#" class="option on" data-type="accu">&nbsp;전시중인순</a>&nbsp;&nbsp;
    <a href="#" class="option" data-type="recency">&nbsp;가나다순</a>&nbsp;&nbsp;
</span>&nbsp;&nbsp;
</div>
<div class="artist_pic">
<div class="artist_pic_main">
<figure class="artist_card hover">
<div class="img_blur">
<img src="resources/images/objet/나의오랜연인에게커버.jpg" class="profile_back"></div>
  <figcaption>
    <img src="resources/images/objet/나의 오랜 연인에게2.jpg" class="profile_pic">
    <h2>이지은<span>창작가</span></h2>
    <p>본업은 가수. <br>장래희망은 창작가. <br>예술가입니다.</p>
    <center>
    <a href="" id="tag" class="ui basic small gray circular button">디자인</a>
    <a href="" id="tag" class="ui basic small gray circular button">사진</a>
    <a href="" id="tag" class="ui basic small gray circular button">기타</a>
    <center>
  </figcaption>
</figure>
<figure class="artist_card hover">
<div class="img_blur">
<img src="resources/images/objet/나의오랜연인에게커버.jpg" class="profile_back"></div>
  <figcaption>
    <img src="resources/images/objet/나의 오랜 연인에게2.jpg" class="profile_pic">
    <h2>이지은<span>창작가</span></h2>
    <p>본업은 가수. <br>장래희망은 창작가. <br>예술가입니다.</p>
    <center>
    <a href="" id="tag" class="ui basic small gray circular button">디자인</a>
    <a href="" id="tag" class="ui basic small gray circular button">사진</a>
    <a href="" id="tag" class="ui basic small gray circular button">기타</a>
    <center>
  </figcaption>
</figure>
<figure class="artist_card hover">
<div class="img_blur">
<img src="resources/images/objet/나의오랜연인에게커버.jpg" class="profile_back"></div>
  <figcaption>
    <img src="resources/images/objet/나의 오랜 연인에게2.jpg" class="profile_pic">
    <h2>이지은<span>창작가</span></h2>
    <p>본업은 가수. <br>장래희망은 창작가. <br>예술가입니다.</p>
    <center>
    <a href="" id="tag" class="ui basic small gray circular button">디자인</a>
    <a href="" id="tag" class="ui basic small gray circular button">사진</a>
    <a href="" id="tag" class="ui basic small gray circular button">기타</a>
    <center>
  </figcaption>
</figure>
<figure class="artist_card hover">
<div class="img_blur">
<img src="resources/images/objet/나의오랜연인에게커버.jpg" class="profile_back"></div>
  <figcaption>
    <img src="resources/images/objet/나의 오랜 연인에게2.jpg" class="profile_pic">
    <h2>이지은<span>창작가</span></h2>
    <p>본업은 가수. <br>장래희망은 창작가. <br>예술가입니다.</p>
    <center>
    <a href="" id="tag" class="ui basic small gray circular button">디자인</a>
    <a href="" id="tag" class="ui basic small gray circular button">사진</a>
    <a href="" id="tag" class="ui basic small gray circular button">기타</a>
    <center>
  </figcaption>
</figure>
	<script type="text/javascript">
	//Follow Button Effect
	$(document).ready(function iniciar(){
		$('#like').on("click", function(){
			$('#like').css('background-color','red');
		});	
		$(".hover").mouseleave(function () {
			$(this).removeClass("hover");
		});
	});
	</script>
</div>
</div>
<br><br>
</section>
<center>
<div class="ui basic large gray animated button" style="vertical-align:middle;" align="center" tabindex="0"  
onclick="javascript:moreContent('more_list', 10);">
 <div class="visible content">더보기</div>
 <div class="hidden content">
   <i class="ui chevron down icon" style="font-size:16px;vertical-align:middle;text-align:center"></i>
  </div>
</div>
</center>
</section>
<c:import url="../footer.jsp" />
</body>
</html>