<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 메인</title>
<c:import url="../header.jsp" />
</head>
<style>
.group{

text-align: center;
  
}
.box { 
width:500px; margin:10px; 
margin-left: 530px;
}
.box .title { display:block; padding:10px;  background-color:white; color:black;  border-bottom:2px solid black; }

.box .cont {  padding:15px 35px; background-color:grey; background-color:white; border-bottom:2px solid black; }

/* 공지사항 */
#notice{
width:550px;
margin-left: 500px;
box-sizing: border-box;
}
#notice h1{
font-size: 25px;
text-align: center;
margin-top: 30px;
color: black;

}
#notice ul{
width: 100%;
}
#notice ul li{
line-height: 30px; /* li의 세로 간격 */
}
.notice_more{
width: 60px;
margin-left: 500px;
}
/* #notice ul li: first-child{
border-top : 2px solid red;
border-bottom: 2px solid blue;
padding-left: 150px;
} */
 #notice ul li:nth-child(2n){
border-bottom: 2px solid black;
} 

.ntitle{
background-color: black;
color: white;
}
.ndate{
background-color: grey;

}
.ncontent:hover{
color: grey;
}

.faq_more{

width: 60px;
margin-left: 980px;
}

/* 날짜와 제목의 거리를 띄어준다. */
#notice ul li span{
display: inline-block;
float: right;
width: 150px;
text-align:center;
} 
/* 문의하기 */
.qn{
width: 700px;
margin-top: 30px;
margin-left: 500px;
border-bottom: 2px solid black;
margin-bottom: 30px;
}



</style>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">    
	$(function(){

	    var group = $(".group");

	    group.each(function(){
	        var _group = new GroupBox(this);
	    });

	    // 사용자 정의 생성자 함수 정의
	    function GroupBox(groupElement){

	        var box = $(groupElement).find(".box");
	        var title = $(groupElement).find(".box .title");

	        box.each(function(idx){
	            var newBox = new RootBox(this);
	            if (idx > 0){
	                newBox.siblingsClose();
	            }
	        });
	    }

       // 사용자 정의 생성자 함수 정의
	    function RootBox(boxElement){
	        var _this = this;
	        var boxEl = $(boxElement);
	        var target = $(boxEl).find(".title");
	        var cont = $(boxEl).find(".cont");

	        // _groupParent = $(boxEl).parent();

	        target.on("click", anchorClickEvent); 

	        function anchorClickEvent() {

	            if (cont.is(':hidden')) {
	                _this.open();
	            } else {
	                _this.close();
	            }
	        }

	        _this.siblingsClose = function () {
	            cont.css('display','none');
	        }

	        _this.open = function() {
	            cont.slideDown();
	        }
	        _this.close = function() {
	            cont.slideUp();
	        }
	    }
	});
</script>
<body>
<div class="group">
    <h1>FAQ</h1> 
 <div class="faq_more"><h4>더보기</h4></div>
    <div class="box">
        <strong class="title title1">오브제 가입은 어떻게 하나요?</strong>
        <div class="cont">
     <p>오른쪽 상단에 가입하기 버튼을 누르시고 
사용하고 계시는 카카오, 이메일 계정 중 원하는 계정으로
가입하기를 누릅니다. 해당 계정으로 인증을 받은 후, 
이름과 이메일 주소만 입력하시면 가입이 완료됩니다.</p></div>
    </div>
    <div class="box">
        <strong class="title">타이틀2</strong>
        <div class="cont">내용222222222222222</div>
    </div>
    <div class="box">
        <strong class="title">타이틀3</strong>
        <div class="cont"> 내용33333333333</div>
    </div>
    <div class="box">
        <strong class="title">타이틀4</strong>
        <div class="cont">44444</div>
    </div>
    <div class="box">
        <strong class="title">타이틀5</strong>
        <div class="cont">55555555555555555</div>
    </div>
</div>

<!-- 공지사항 -->
<div id="notice">
<h1>공지사항</h1> 
<div class="notice_more"><a href="Movenotice.do"><h4>더보기</h4></a></div>
<ul>
<li class= "ntitle">제목<span class="ndate">날짜</span></li>
<li class="ncontent"><a href="Movenoticedetail.do">공지사항 제목 출력 하는 곳</a><span>2019-12-12</span></li>
<li class= "ntitle">제목<span class="ndate">날짜</span></li>
<li class="ncontent">공지사항 제목 출력 하는 곳<span>2019-12-12</span></li>
<li class= "ntitle">제목<span class="ndate">날짜</span></li>
<li class="ncontent">공지사항 제목 출력 하는 곳<span>2019-12-12</span></li>
<li class= "ntitle">제목<span class="ndate">날짜</span></li>
<li class="ncontent">공지사항 제목 출력 하는 곳<span>2019-12-12</span></li>
<li class= "ntitle">제목<span class="ndate">날짜</span></li>
<li class="ncontent">공지사항 제목 출력 하는 곳<span>2019-12-12</span></li>
</ul>
</div>
<div class= "qn">
<h1>문의 하기</h1>
</div>















<c:import url="../footer.jsp" />
</body>
</html>