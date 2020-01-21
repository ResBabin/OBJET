<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 메인</title>
<c:import url="../header.jsp" />
</head>
<style>

.pagebox{ position:absolute;
  width: 200px; height: 250px;
  text-align: center;
  box-shadow: 5px 5px 15px #333;

}

.pagebox:nth-child(1){
  background: #abc;
  transform-origin: left center;
  transition: 2s;
  z-index:1;
}
.pagebox:nth-child(2){
  background: #cba;
  trnasform-origin: left center;
  transition: 2s;   
  z-index;2;
}
.pagebox:nth-child(1):hover{
  transform: rotateY(-180deg);
  background: #666;
}

.alldiv{

background: green;
width:100%;
height:60%;
border: 2px soild #000;
text-align:center;
line-height: 100px;
font-weight: bold;

}
.box1{
background:red;
float: left;
width: 27%;
height: 100%

}
.box1-1{
height: 32%;
background:white;
}
.box1-2{
height: 32%;
background:red;
}
.box1-3{
height: 32%;
background:yellow;
}
.box2{
background:yellow;
float: left;
width: 38%;
height: 40%
}
.box3{
margin-right:-100px;
background:blue;
float: left;
width: 25%;
height: 40%
}
.bottombox{
background:blue;
width: 100%;
height: 35%
}
.direct{
margin-left: 130px;
background:white;
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
border:2px solid red;
}
.noticetitle{
float: left;
font-size: 40px;
width: 70%;
height: 60%;
border:2px solid yellow;
}
.noitceintro{
font-size: 20px;
border:2px solid blue;
height: 20%;

}


#content {
width:300px;
border:2px solid grey;
margin-top:60px;
margin-left:40px;
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
    width:580px;
    height:430px;;
    overflow:hidden;
}
 
.tab ul{
    padding:0;
    margin:0;
    list-style:none;
    width:100%:
    height:auto;
    overflow:hidden;
}
 
.tab ul li{
    display:inline-block;
    width:33.3333%;
    float:left;
    line-height:40px;
    text-align:center;
    cursor:pointer;
}
 
.tab ul li:hover,
.tab ul li.on{
    background:lightgreen;
}
 
.tab .conBox{
    width:100%;
    height:100%;
    overflow:hidden;
    min-height:200px;
    background:lightgreen;
    display:none;
    text-align:center;
}
 
.tab .conBox.on{
    display:block;
    
    .tab{
    width:500px;
    height:300px;;
    overflow:hidden;
}
 
.tab ul{
    padding:0;
    margin:0;
    list-style:none;
    width:100%:
    height:auto;
    overflow:hidden;
}
 
.tab ul li{
    display:inline-block;
    width:33.3333%;
    float:left;
    line-height:40px;
    text-align:center;
    cursor:pointer;
}
 
.tab ul li:hover,
.tab ul li.on{
    background:#ccc;
}
 
.tab .conBox{
    width:100%;
    height:100%;
    overflow:hidden;
    min-height:200px;
    background:#ccc;
    display:none;
    text-align:center;
}
 
.tab .conBox.on{
    display:block;
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


   </script>
<body>
<div class="alldiv">
<div class="box1">

<a href="selectNoticeList.do"><div class="box1-1">
<div class="noticeicon">
<i class="huge bullhorn icon"></i></div>
<div class="noticetitle">공지사항</div>
</div>
</a>
<a href="selectFaqList.do"><div class="box1-2">
<div class="noticeicon">
<i class="huge question circle outline icon"></i></div>
<div class="noticetitle">FAQ</div>
</div>
</a>

<div class="box1-3">
<a href="selectQnaList.do">
<div class="noticeicon">
<i class="huge edit icon"></i></div>
<div class="noticetitle">문의하기</div>
</a>

</div>

</div>
<div class="box2">
<div class="tab">
    <ul>
        <li data-id="con1" class="on">일반</li>
        <li data-id="con2">전시</li>
        <li data-id="con3">기타</li>
    </ul>
 
    <div id="con1" class="conBox on">
      <c:forEach var="notice" items="${ nlist }" end="2">  
<li> ${notice.noticetitle}</li>
     </c:forEach>
    </div>
  
    
    <div id="con2" class="conBox">
        cont2
    </div>
    <div id="con3" class="conBox">
        cont3
    </div>

</div>
</div>
<div class="box3">

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
<div class="bottombox">
<div class="direct">
<div class="dircet1">
<i class="massive user plus icon"></i><br>
<h1>회원가입</h1>
</div>
<div class="dircet2">
<i class="massive home icon"></i><br>
<h1>사이트 소개</h1>
</div>
<div class="dircet3">
<i class="massive address card icon"></i><br>
<h1>내정보수정<h1>
</div>
<div class="dircet3">
<i class="massive gem outline icon"></i><br>
<h1>후원하기</h1>
</div>
</div>
</div>

  <div class= "pagebox">
    <h1>page1</h1>
    <p>마우스를 올려주세요</p>
  </div>
  <div class="pagebox">
    <h1>page2</h1>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, tenetur.</p>
  </div>  

<c:import url="../footer.jsp" />   
</body>

</html>