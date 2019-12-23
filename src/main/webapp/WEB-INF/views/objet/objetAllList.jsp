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
.objet_allList {
	margin-top:40px;
} 
.objet_title{
	font-family: 'Nanum Myeongjo';
	nth-of-type(1) font-weight: 400; 
    font-size: 32px;
    text-align: center;
    letter-spacing: 1px;
    /* margin-right:-20px; */
    padding:0;
}
.objet_more_section {
	margin:0 120px 10px 120px;
	height:auto;
}
.search-option-cate {
	align:right;
	margin:5px 0px 25px 0;
	float:right;
}
#dateoption {
	width:120px;
	font-size: 14px;
	font-weight: bolder;
	font-family:'Nanum Gothic';
  	color:black;
  	border-radius:5px;
}
#dateoption .text {
	font-size: 14px;
	font-weight: normal;
	font-family:'Nanum Gothic';
  	color:black;
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
.objet_all_list {
	clear:both;
	width:100%;
	height: 100%;
	border-bottom: 1px solid #151515;
	border-top: 3px solid #151515;
}
.objet_list {
	width:100%;
	height:320px;
	overflow: hidden;
}
.objet_list ul {
	 position: relative; 
	 list-style: none;
	 display: block; 
}
.objet_list .objet_li {
	list-style: none;
	border-top: 1px solid #e9e9e9;
}
.objet_list .info {
	float: left;
    padding: 75px 0px 0 75px;
}
.objet_list .info a {
	color: #222;
    font-size: 16px;
    line-height: 24px;
    font-family: 'Nanum Gothic';
}
.objet_list .info em {
	font-style: normal;
	display: block;
    word-wrap: break-word;
}
.objet_list .info .tit01 {
	font-size: 32px;
    line-height: 32px;
    font-weight: bolder;
}
.objet_list .info .tit02 {
	margin-top: 12px;
	font-weight: bolder;
}
.objet_list .info .date {
	display: block;
    margin-top: 20px;
    color: #909090;
    font-size: 14px;
}
.objet_list img {
	width: 70%;
	height:320px;
	float:right;
    vertical-align: top;
}

</style>
<script type="text/javascript">
$(function() {
  	//dropdown
   $('#dateoption').dropdown(); 
  
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
<section class="objet_allList">
<h3 class="objet_title">OBJET ALL EXHIBITION</h3>
<section class="objet_more_section">
<div class="search-option-cate">
<span class="search-option">
    <a href="#" class="option on" data-type="accu">&nbsp;정확도</a>&nbsp;&nbsp;
    <a href="#" class="option" data-type="recency">&nbsp;최신순</a>&nbsp;&nbsp;
</span>&nbsp;&nbsp;
<div class="ui compact selection dropdown" id="dateoption">
  <div class="text">전체 기간</div>
  <i class="dropdown icon"></i>
  <div class="menu">
    <div class="item" data-value="2019">2019</div>
    <div class="item" data-value="2018" >2018</div>
	<div class="item" data-value="2017" >2017</div>
	<div class="item" data-value="2016" >2016</div>
	<div class="item" data-value="2015" >2015</div>
	<div class="item" data-value="2014" >2014</div>
	<div class="item" data-value="2013" >2013</div>
  </div>
</div>
</div>
<div class="objet_all_list">
<div class="objet_list">
<ul class="objet_ul">
<li class="objet_li">
	<div class="info">
		<a href="">
			<em class="tit01">Coco Capitan: <br>Is It Tomorrow Yet?</em>
			<em class="tit02">나는 코코 카피탄, <br>오늘을 살아가는 너에게</em>
			<span class="date">2018.08.02&nbsp;-&nbsp;2019.01.27</span>
		</a>
	</div>
	<span class="thumbnail">
		<a href="">
			<img src="resources/images/objet/objetmainposter.jpg" alt="나는 코코 카피탄, 오늘을 살아가는 너에게">
		</a>
	</span>
</li>
</ul>
</div>
<div class="objet_list">
<ul class="objet_ul">
<li class="objet_li">
	<div class="info">
		<a href="">
			<em class="tit01">Coco Capitan: <br>Is It Tomorrow Yet?</em>
			<em class="tit02">나는 코코 카피탄, <br>오늘을 살아가는 너에게</em>
			<span class="date">2018.08.02&nbsp;-&nbsp;2019.01.27</span>
		</a>
	</div>
	<span class="thumbnail">
		<a href="">
			<img src="resources/images/objet/objetmainposter.jpg" alt="나는 코코 카피탄, 오늘을 살아가는 너에게">
		</a>
	</span>
</li>
</ul>
</div>
<div class="objet_list">
<ul class="objet_ul">
<li class="objet_li">
	<div class="info">
		<a href="">
			<em class="tit01">Coco Capitan: <br>Is It Tomorrow Yet?</em>
			<em class="tit02">나는 코코 카피탄, <br>오늘을 살아가는 너에게</em>
			<span class="date">2018.08.02&nbsp;-&nbsp;2019.01.27</span>
		</a>
	</div>
	<span class="thumbnail">
		<a href="">
			<img src="resources/images/objet/objetmainposter.jpg" alt="나는 코코 카피탄, 오늘을 살아가는 너에게">
		</a>
	</span>
</li>
</ul>
</div>
</div>
<br><br>
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
<br><br><br><br><br>
</section>
<c:import url="../headerSearch.jsp" />
<c:import url="../footer.jsp" />
</body>
</html>






