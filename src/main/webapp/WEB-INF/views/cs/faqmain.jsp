<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
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
<c:forEach var="faq" items="${ list }">
<div class="box">
        <strong class="title">${ faq.faqtitle }</strong>
        <div class="cont">
     <p>${ faq.faqcontent } </p></div>
    </div>
    </c:forEach>
    </div>

<c:import url="../footer.jsp" />	
</body>
</html>