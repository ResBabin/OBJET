<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 메인</title>
<c:import url="../header.jsp" />
</head>
<style>


 a:hover { color: black; text-decoration: none;}

.js-index-notice{
font: 17px 'nbg' bold;
  color: white;
  clear: both;
  width: 100%;
  height: 55px;
   background-color:black;
  margin-top: 2px;
  position: absolute;
}

.js-index-notice h3{
  background-color:black;
  width: 100px;
  height: 55px;
  float: left;
  padding: 15px 0 0 37px;
  font: 17px 'nbg' bold;
  color: white;
  position:relative;
}
.js-index-notice h3:after{

  content:"";
  width: 1px;
  height:19px;
  background: #c0bebc;
  display: inline-block;
  right: 20px;
  position: absolute;
  top: 18px;
}

.js-main-noticle {
  position:relative;
  overflow:hidden;
}
.js-main-noticle ol{
  position:absolute;
  top:6px;
  left:100px;
  width: calc(100% - 136px);
}
.js-main-noticle ol li {
  height:55px;
  padding:5px 0 0;
}

.js-main-noticle ol li a {
font: 17px 'nbg' bold;
  color: white;
  display:inline-block;
  width:90%;
}
.js-main-noticle .js-top-arrow{
  position:absolute;
  top:6px;
  right:5px;
  border: none;
  cursor: pointer;
}

.js-main-noticle .js-down-arrow{
  position:absolute;
  bottom:6px;
  right:5px;
  cursor: pointer;
}

.js-index-notice .js-index-notice-right{
 
  float: right;
}

.js-index-notice .js-arrow{
  width: 20px;
  height:20px;
  border:none;
  text-indent: -9999px;
  display: block;
  outline:none;
} 

.js-index-notice .js-top-arrow{
  background: url(../img/js-top-arrow.png) no-repeat 50% 50%;
}

.js-index-notice .js-down-arrow{
  background: url(../img/js-down-arrow.png) no-repeat 50% 50%;
}

.tabdisplay{
width:80px;
margin-left:10px;
border: 3px solid black;

}
.tabuser{
width:80px;
margin-left:10px;
border: 3px solid black;

}
.tabgeneral{
margin-top:30px;
width:80px;
margin-left:50px;
border: 3px solid black;


}
.door{

margin-left: 120px;
width: 100%;
height: 265px;
 margin-bottom: 30px;
}

section1{
 margin-top: 30px;
 float: left;
 margin-left: 40px;
  /* margin:50px auto; */
  position:relative;
  width: 300px;height: 200px;
 perspective: 1000px; 

} 
div1{

  position:absolute;
  width: 300px; height: 250px;
  text-align: center;
 
}
div1:nth-child(1){

  background: #fff;
  transform-origin: right center;
  transition: 2s;
  
  z-index:1;
}
div1:nth-child(2){
box-shadow: 5px 5px 15px #333;
  background:#fff;
  trnasform-origin: right center;
 transition: 10s;
  z-index;2;
}
div1:nth-child(1):hover{
  transform: rotateY(-180deg);
  background: #fff;
  color: #fff;
 
}

.alldiv{
margin-top:100px;
width:100%;
height:60%;
text-align:center;
line-height: 100px;
font-weight: bold;

}
.box1{
margin-left:162px;

float: left;
width: 27%;
height: 100%;

}
.box1-1{
width:330px;
box-shadow: 5px 5px 10px grey;
height: 30%;


}
.box1-2{
width:330px;
margin-top: 15px;
box-shadow: 5px 5px 10px grey;
height: 30%;

}
.box1-3{
width:330px;
margin-top: 15px;
box-shadow: 5px 5px 10px grey;
height: 30%;

}
.box2{

float: right;
width: 40%;
height: 40%
}
.box3{
margin-top:85px;
border-bottom: 3px black solid;
float: right;
width: 27%;
height: 40%
}
.bottombox{
border: 3px black solid;
width: 100%;
height: 35%
}
.direct{
margin-left: 130px;
border: 3px black solid;
border: 2px solid black;
width: 80%;
height: 100%;
}
.dircet1{

text-align:center;
float:left;
width: 25%;
height:100%;
background:white;
border: 2px solid blue;
}
.dircet2{
text-align:center;
float:left;
width: 25%;
height:100%;
background:white;
border: 2px solid blue;
}
.dircet3{
text-align:center;
float:left;
width: 25%;
height:100%;
background:white;
border: 2px solid blue;
}
.dircet4{
text-align:center;
float:left;
width: 25%;
height:60%;
background:white;
border: 2px solid blue;
}
.noticeicon{
float: left;
width: 30%;
height: 60%;

}
.noticetitle{
float: left;
font-size: 40px;
width: 70%;
height: 60%;

}
.noitceintro{
font-size: 20px;
height: 20%;

}

.conBox on{

}
#content {
width:300px;
margin-top:10px;
margin-left:80px;
    padding: 10px;
    background: black;
}

#rank-list a {
    color: white;
    text-decoration: none;
}

#rank-list a:hover {
    text-decoration: underline;
}

#rank-list {
    overflow: hidden;
    width: 300px;
    height: 20px;
    margin: 0;
}

#rank-list dt {

    display: none;
}

#rank-list dd {
  position: relative;
    margin: 0;
}

#rank-list ol {
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
    list-style-type: none;
}

#rank-list li {
   
    height: 20px;
    line-height: 20px;
}


.tab{
border-bottom: 3px solid black;
    margin-left: 200px;
    width:400px;
    height:270px;;
    overflow:hidden;
}
 
.tab ul{
        height: 65px;
    padding:0;
    margin:0;
    list-style:none;
    width:100%:
    overflow:hidden;
} 
.tab ul li{
     font-size: 20px;
    display:inline-block;
  
    line-height:40px;
    text-align:center;
    cursor:pointer;
}
 

.tab .conBox{
    width:100%;

    overflow:hidden;
    min-height:200px;
    display:none;
    text-align:center;
}
 
.tab .conBox.on {
    margin-top: 30px;
    display: block;
    width: 100%;
    overflow: hidden;
}
.tab ul{
    padding:0;
    margin:0;
    list-style:none;
    width:100%:
    height:auto;
    overflow:hidden;
}
 
 
  .tab ul li:hover,
.tab ul li.on{
/* 탭박스 안에 전시,일반,회원 */
} 
 

.taqtitle{
margin-bottom:10px;
    margin-left: 30px;
height: 40px;
font-size: 15px;
}
.js-arrow js-top-arrow{
color: white;

}
</style>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script type="text/javascript">
   $(function(){
       $(".tab ul li").click(function(){ 
           $(".tab ul li").removeClass('on');
           $(".tab .conBox").removeClass('on');
           $(this).addClass('on');
           $("#"+$(this).data('id')).addClass('on');
       });
   });

   $(function() {
	    var count = $('#rank-list li').length;
	    var height = $('#rank-list li').height();

	    function step(index) {
	        $('#rank-list ol').delay(2000).animate({
	            top: -height * index,
	        }, 500, function() {
	            step((index + 1) % count);
	        });
	    }

	    step(1);
	});
   
   $(document).ready(function(){
	   /*공지사항 롤링*/
	   function fn_article3(containerID, buttonID, autoStart){
	   	var $element = $('#'+containerID).find('.notice-list');
	   	var $prev = $('#'+buttonID).find('.js-top-arrow'); 
	   	var $next = $('#'+buttonID).find('.js-down-arrow');
	   	var autoPlay = autoStart; //자동으로 돌아가는 설정
	   	var auto = null;
	   	var speed = 2000; //자동으로 돌아가는 설정 시간
	   	var timer = null;
	   	var move = $element.children().outerHeight();//이것에 따라 top값 변경, .notice-list의 li높이
	   	var first = false;
	   	var lastChild;

	   	lastChild = $element.children().eq(-1).clone(true);
	   	lastChild.prependTo($element);
	   	$element.children().eq(-1).remove();

	   	if($element.children().length==1){
	   		$element.css('top','0px');
	   	}else{
	   		$element.css('top','-'+move+'px');
	   	}

	   	if(autoPlay){
	   		timer = setInterval(moveNextSlide, speed);
	   	}

	   	$element.find('>li').bind({
	   		'mouseenter': function(){
	   			if(auto){
	   				clearInterval(timer);
	   			}
	   		},
	   		'mouseleave': function(){
	   			if(auto){
	   				timer = setInterval(moveNextSlide, speed);
	   			}
	   		}
	   	});


	   	$prev.bind({
	   		'click': function(){ 
	   			movePrevSlide();
	   			return false;
	   		},
	   		'mouseenter': function(){ 
	   			if(auto){
	   				clearInterval(timer);
	   			}
	   		},
	   		'mouseleave': function(){
	   			if(auto){
	   				timer = setInterval(moveNextSlide, speed);
	   			}
	   		}
	   	});

	   	$next.bind({
	   		'click': function(){
	   			moveNextSlide();
	   			return false;
	   		},
	   		'mouseenter': function(){
	   			if(auto){
	   				clearInterval(timer);
	   			}
	   		},
	   		'mouseleave': function(){
	   			if(auto){
	   				timer = setInterval(moveNextSlide, speed);
	   			}
	   		}
	   	});

	   	function movePrevSlide(){
	   		$element.each(function(idx){
	   			if(!first){
	   				$element.eq(idx).animate({'top': '0px'},'normal',function(){
	   					lastChild = $(this).children().eq(-1).clone(true);
	   					lastChild.prependTo($element.eq(idx));
	   					$(this).children().eq(-1).remove();
	   					$(this).css('top','-'+move+'px');
	   				});
	   				first = true;
	   				return false;
	   			}

	   			$element.eq(idx).animate({'top': '0px'},'normal',function(){
	   				lastChild = $(this).children().filter(':last-child').clone(true);
	   				lastChild.prependTo($element.eq(idx));
	   				$(this).children().filter(':last-child').remove();
	   				$(this).css('top','-'+move+'px');
	   			});
	   		});
	   	}

	   	function moveNextSlide(){
	   		$element.each(function(idx){
	   			var firstChild = $element.children().filter(':first-child').clone(true);
	   			firstChild.appendTo($element.eq(idx));
	   			$element.children().filter(':first-child').remove();
	   			$element.css('top','0px');
	   			$element.eq(idx).animate({'top':'-'+move+'px'},'normal');
	   		});
	   	}
	   }
	   jQuery(function(){
	   	var $ = jQuery;
	     jQuery('.btn').addClass('pointer').click(function () {
	      var ih = $(this).index() == 0 ? -18 : 18; //위아래로 움직이는 px 숫자
	      var obj = $('.recommend_list');
	      obj.animate({ scrollTop:obj.scrollTop() + ih }, 100);
	     });
	   });
	   jQuery(function(){
	     function fn_article(container,btn, auto){}
	   });
	   fn_article3('notice5','bt5',true);
	 });

 </script>
 
<body>
<div id="notice5" class="js-index-notice">
    <article class="js-main-noticle js-layout">
      <h3 class="js-white">공지</h3>
      <ol class="notice-list">
      <c:forEach var="notice" items="${ nlist }" end="2">  
      <c:url var="ndt" value="noticeprenext.do">
      	<c:param name="noticeno" value="${notice.noticeno}" />
      	</c:url>
        <li>
          <a href="${ndt}" class="js-white">[${notice.noticetype}] ${notice.noticetitle}</a>
          <span class="js-white"><fmt:formatDate value="${notice.noticedate}" type="date"/></span>
        </li>
        </c:forEach>
      </ol>
     
      <div class="js-index-notice-right" id="bt5">
        <button type="button" name="button" class="js-arrow js-top-arrow"><i>이전</i></button>
        <button type="button" name="button" class="js-arrow js-down-arrow">다음</button>
      </div>
     
    </article>
 
  </div>

<div class="alldiv">
<div class="box1">
<a href="selectFaqList.do"><div class="box1-1">
<div class="noticeicon">
<i class="huge question circle outline icon"></i></div>
<div class="noticetitle">FAQ</div>
</div>
</a>

<a href="selectNoticeList.do"><div class="box1-2">
<div class="noticeicon">
<i class="huge bullhorn icon"></i></div>
<div class="noticetitle">공지사항</div>
</div>
</a>
 <c:if test="${sessionScope.loginUser ne null}">
<div class="box1-3">
<a href="selectQnaList.do?userid=${loginUser.userid}">  
<div class="noticeicon">
<i class="huge edit icon"></i></div>
<div class="noticetitle">문의하기</div>
</c:if>
</a>
<c:if test="${sessionScope.loginUser eq null}">
<div class="box1-3">
<a href="moveLogin.do">
<div class="noticeicon">
<i class="huge edit icon"></i></div>
<div class="noticetitle">문의하기</div>
</c:if>
</a>


</div>

</div>
<div class="box2">
<div class="tab">
    <ul>
        <li data-id="con1" class="on"><div class="tabgeneral">일반</div></li>
        <li data-id="con2"><div class="tabdisplay">전시</div></li>
        <li data-id="con3"><div class="tabuser">회원</div></li>
    </ul>
    <!--공지사항 일반전시 3개만 불러오기  -->
    <div id="con1" class="conBox on">
      <c:forEach var="notice" items="${ nlist }" end="2">  
      <c:url var="ndt" value="noticeprenext.do">
	<c:param name="noticeno" value="${notice.noticeno}" />
	</c:url>
   <a href="${ndt}"><li class="taqtitle">${notice.noticetitle}</li></a> 
     </c:forEach>
    </div>
    <!--공지사항 타입 전시만 3개만 불러오기  -->
   <div id="con2" class="conBox">
       <c:forEach var="notice" items="${ blist }" end="2">  
        <c:url var="ndt" value="noticeprenext.do">
	<c:param name="noticeno" value="${notice.noticeno}" />
	</c:url>
      <a href="${ndt}"><li class="taqtitle">${notice.noticetitle }</li></a>
       </c:forEach>
    </div>
     <!--공지사항 타입 회원만 3개만 불러오기  -->
    <div id="con3" class="conBox">
        <c:forEach var="notice" items="${ clist }" end="2">  
         <c:url var="ndt" value="noticeprenext.do">
	<c:param name="noticeno" value="${notice.noticeno}" />
	</c:url>
       <a href="${ndt}"><li class="taqtitle">${notice.noticetitle }</li></a>
       </c:forEach>
    </div>

</div>
</div>
<div class="box3">

<i class="huge question circle outline icon"></i>
<div id="content">

            <dl id="rank-list">
             
                <dt>실시간 급상승 검색어</dt>
                <dd>
           
                    <ol>
                  <c:forEach var="faq" items="${ list }">
                <li><a href="selectFaqList.do">${faq.faqtitle}</a></li>    
         
                      </c:forEach>  
                    </ol>
                          
                </dd>
             
            </dl>
     
        </div> 

</div>

</div>

<div class="door">
<section1>
  <div1>
  <i class="massive user plus icon"></i>
    <h1>회원가입</h1>
  </div1>
  <div1>
  <br>
  <a href="moveEnrollPage.do"> <i class="large brown user plus icon"></i>
     <h3><p>저희 홈페이지가 처음이신가요?</p></h3>
    <h3><p>모두가 작가가 되는 공간 '오브제 '</p></h3></a>
     <br>
    <button class="large ui inverted brown button">GO</button>
  </div1>  
</section1>
<section1>
  <div1>
  <i class="massive home icon"></i>
    <h1>사이트소개</h1>
  </div1>
  <div1>
     <br>
     <a href="pageIntro.do"><i class="large violet home icon"></i>
    <h3><p>'오브제'에 오신걸 환영합니다.</p></h3>
    <h3><p>모든 사물이 영감이 되는 공간</p></h3></a>
    <br>
    <button class="large ui inverted violet button">GO</button>
  </div1>  
</section1>
<section1>
  <div1>
  <i class="massive address card icon"></i>
    <h1>내정보수정</h1>
  </div1>
  <div1>
  <br>
  <a href="moveReaffirmUserpwd.do"><i class="large orange address card icon"></i>
   <h3><p>수정이 필요한 정보가 있나요?</p></h3>
   <h3><p>바로 업데이트 하세요!</p></h3></a>
   <br>
    <button class="large ui inverted orange button">GO</button>
  </div1>  
</section1>
<section1>
  <div1>
  <i class="massive gem outline icon"></i>
    <h1>팀소개</h1>
  </div1>
  <div1>
    <a href="movePr.do"><h1><i class ="blue small gem outline icon"></i></h1>
    <h3><p>오브제 팀</p></h3>
    <h3><p>소개합니다!</p></h3></a><br>
     <button class="large ui inverted blue button">GO</button>
    
  </div1>  
</section1>
</div>

<c:import url="../footer.jsp" />
 
</body>

</html>