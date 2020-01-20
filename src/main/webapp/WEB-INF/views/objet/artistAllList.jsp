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
.objet_title a{
	font-family: 'Nanum Myeongjo';
	font-weight: bold;
    font-size: 32px;
    text-align: center;
    letter-spacing: 1px;
    text-decoration:none;
    padding:0;
    color:rgba(0,0,0.87);
}
.objet_title a:hover{
	font-family: 'Nanum Myeongjo';
	font-weight: bold;
    font-size: 32px;
    text-align: center;
    letter-spacing: 1px;
    text-decoration:none;
    padding:0;
    color:#959595;
}
.objet_more_section {
	margin:0 60px 40px 10px;
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
  margin-top: 10px;
}
.artist_card {
	display:none; 
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  text-align: center;
  background-color: #ffffff;
  float:left;
  margin-right:40px;
  margin-bottom: 50px;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
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
  height : 210px;
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
  height: 254px;
  background-color: #ffffff;
  padding: 25px;
  position: relative;
}

.artist_card .profile_pic {
  border-radius: 50%;
  position: absolute;
  bottom: 90%;
  left: 105px;
  max-width: 110px;
  max-height:110px;
  width:110px;
  height:110px;
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
  height: 40px;
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
  	
  //더보기 버튼
  	$(".artist_card").slice(0, 4).fadeIn(); // 최초 4개 선택
  	$("#more_load").click(function(e) { // Load More를 위한 클릭 이벤트e
  	    e.preventDefault();
  	    $(".artist_card:hidden").slice(0, 4).fadeIn(); // 숨김 설정된 다음 4개를 선택하여 표시
  	  	$("#more_load").css("margin-bottom", "30px");
  	    if ($(".artist_card:hidden").length == 0) { // 숨겨진 DIV가 있는지 체크
  	        $('#more_load').fadeOut();// 더 이상 로드할 항목이 없는 경우
  	    }
  	});
  	
});

//정렬 ajax
	function artistOrder(order){
	  	$.ajax({
			url : "artistOrder.do",
			type : "post",
			data : { order : order },
			dataType : "json",
			success : function(result){
				var objStr = JSON.stringify(result);
				var jsonObj = JSON.parse(objStr);
				var values = "";
				for (var i in jsonObj.list) {
					var length = decodeURIComponent(jsonObj.list[i].userintrol.replace(/\+/gi, " ")).length;
					var newline = "\n";
					var noimages = "'resources/images/noimg2.jpg'";
					var noimg = "'resources/images/basicprofilepic.png'";
					var tags = decodeURIComponent(jsonObj.list[i].usertag.replace(/\+/gi, " ")).split(',');
					var userintrol = decodeURIComponent(jsonObj.list[i].userintrol.replace(/\+/gi, " "));
					values += '<figure class="artist_card hover">'+
						'<div class="img_blur">'+
						'<img src="resources/images/objet/' + jsonObj.list[i].renamemainposter + '" onerror="this.src=' + noimages + '"' + ' class="profile_back"></div>' +
						  '<a href=""><figcaption>' +
						   '<img src="resources/users_upfiles/' + jsonObj.list[i].userrpic + '" onerror="this.src=' + noimg + '"' + ' class="profile_pic">' +
						    '<h2>' + decodeURIComponent(jsonObj.list[i].nickname.replace(/\+/gi, " ")) +
						    '<span>' + decodeURIComponent(jsonObj.list[i].userintros.replace(/\+/gi, " ")) + '</span></h2>';
					         if(length < 60){
					        	values += '<p>' + userintrol.replace(/\\n/gi, "<br/>") + '</p>' ;
					        }else{
					        	values += '<p>' + userintrol.substring(0,30) + '...</p>' ;
					        } 
					values += '<center>';
					     for(var i in tags){
					    	values +='<a href="" id="tag" class="ui basic small gray circular button">' + tags[i] + '</a>' ;
					    } 
						values +=  '</center>' +
						  '</figcaption></a>' +
						'</figure>';
				}
				
				$(function() {
				$(".artist_pic_main").html(values);
				$(".artist_card").slice(0, 4).fadeIn();
			 	$("#more_load").show(); 
				$("#more_load").click(function(e) { 
			  	    e.preventDefault();
			  	    $(".artist_card").slice(0, 4).fadeIn(); 
			  	  	$("#more_load").css("margin-bottom", "30px");
			  	    if ($(".artist_card:hidden").length == 0) { 
			  	        $('#more_load').fadeOut();
			  	    }
			  	});
				});
				console.log("ok : " + order);
			},
			error : function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
			}
		});// 정렬 ajax
	}
</script>
</head>
<body>
<c:import url="../headerSearch.jsp" />
<section class="artist_allList">
<h3 class="objet_title"><a href="artistAllList.do">OBJET ALL ARTIST</a></h3>
<section class="objet_more_section">
<div class="search-option-cate">
<span class="search-option">
    <a href="javascript:void(0);" onclick="artistOrder('statusdesc');" class="option on">&nbsp;전시중인순</a>&nbsp;&nbsp;
    <a href="javascript:void(0);" onclick="artistOrder('nameasc');" class="option">&nbsp;가나다순</a>&nbsp;&nbsp;
</span>&nbsp;&nbsp;
</div>
<div class="artist_pic">
<div class="artist_pic_main">
<c:if test="${artistList != null && list == null}">
<c:forEach var="Artist" items="${artistList }">
<c:set var="length" value="${fn:length(Artist.userintrol)}"/>
<c:set var="newline" value="\n" />
<c:set var="noimages" value="resources/images/noimg2.jpg" />
<c:set var="noimg" value="resources/images/basicprofilepic.png" />
<c:set var="tagl" value="${fn:length(Artist.usertag)}"/>
<figure class="artist_card hover">
<div class="img_blur">
<img src="resources/images/objet/${Artist.renamemainposter }" onerror="this.src='${noimages }'"  class="profile_back"></div>
  <a href="artistHomeMain.do?userid=${Artist.userid }&loginUser=${loginUser.userid}"><figcaption>
   <img src="resources/users_upfiles/${Artist.userrpic }" onerror="this.src='${noimg }'" class="profile_pic">
    <h2><c:out value="${Artist.nickname}"/>
    <span><c:out value="${Artist.userintros}"/></span></h2>
    <c:choose>
        <c:when test="${length < 65}">
        <p>${fn:replace(Artist.userintrol, newline, '<br>')}</p>
        </c:when>
        <c:otherwise>
         <p><c:out value="${fn:substring(Artist.userintrol,0,30)}"/>...</p>
        </c:otherwise> 
	</c:choose>
    <center>
    <c:forTokens var="tags" items="${Artist.usertag }" delims=",">
        <a href="" id="tag" class="ui basic small gray circular button">${tags}</a>
    </c:forTokens>
    </center>
  </figcaption></a>
</figure>
</c:forEach>
</c:if>
</div>
</div>
</section>
<center>
<div class="ui basic large gray animated button" id="more_load" style="vertical-align:middle;" align="center">
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