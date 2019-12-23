<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<c:import url="../header.jsp" />
<style>

.group{

text-align: center;
  
}
.box { 
width:700px; margin:10px; 
margin-left: 430px;
}
.box .title { display:block; padding:10px;  background-color:white; color:black;  border-bottom:2px solid black; }

.box .cont {  padding:15px 35px; background-color:grey; background-color:white; border-bottom:2px solid black; }
    </style>

</head>
    
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
<c:import url="../search.jsp" />
<br><br><br>


<br>
<div class="group">
    <h1>FAQ</h1> 
<
    <div class="box">
        <strong class="title">오브제 가입은 어떻게 하나요?</strong>
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
      <div class="box">
        <strong class="title">타이틀5</strong>
        <div class="cont">55555555555555555</div>
    </div>
      <div class="box">
        <strong class="title">타이틀5</strong>
        <div class="cont">55555555555555555</div>
    </div>
      <div class="box">
        <strong class="title">타이틀5</strong>
        <div class="cont">55555555555555555</div>
    </div>
      <div class="box">
        <strong class="title">타이틀5</strong>
        <div class="cont">55555555555555555</div>
    </div>
      <div class="box">
        <strong class="title">타이틀5</strong>
        <div class="cont">55555555555555555</div>
    </div>
</div>

<c:import url="../footer.jsp" />	
</body>
</html>