<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>������ ����</title>
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

/* �������� */
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
line-height: 30px; /* li�� ���� ���� */
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

/* ��¥�� ������ �Ÿ��� ����ش�. */
#notice ul li span{
display: inline-block;
float: right;
width: 150px;
text-align:center;
} 
/* �����ϱ� */
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

	    // ����� ���� ������ �Լ� ����
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

       // ����� ���� ������ �Լ� ����
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
 <div class="faq_more"><h4>������</h4></div>
    <div class="box">
        <strong class="title title1">������ ������ ��� �ϳ���?</strong>
        <div class="cont">
     <p>������ ��ܿ� �����ϱ� ��ư�� �����ð� 
����ϰ� ��ô� īī��, �̸��� ���� �� ���ϴ� ��������
�����ϱ⸦ �����ϴ�. �ش� �������� ������ ���� ��, 
�̸��� �̸��� �ּҸ� �Է��Ͻø� ������ �Ϸ�˴ϴ�.</p></div>
    </div>
    <div class="box">
        <strong class="title">Ÿ��Ʋ2</strong>
        <div class="cont">����222222222222222</div>
    </div>
    <div class="box">
        <strong class="title">Ÿ��Ʋ3</strong>
        <div class="cont"> ����33333333333</div>
    </div>
    <div class="box">
        <strong class="title">Ÿ��Ʋ4</strong>
        <div class="cont">44444</div>
    </div>
    <div class="box">
        <strong class="title">Ÿ��Ʋ5</strong>
        <div class="cont">55555555555555555</div>
    </div>
</div>

<!-- �������� -->
<div id="notice">
<h1>��������</h1> 
<div class="notice_more"><a href="Movenotice.do"><h4>������</h4></a></div>
<ul>
<li class= "ntitle">����<span class="ndate">��¥</span></li>
<li class="ncontent"><a href="Movenoticedetail.do">�������� ���� ��� �ϴ� ��</a><span>2019-12-12</span></li>
<li class= "ntitle">����<span class="ndate">��¥</span></li>
<li class="ncontent">�������� ���� ��� �ϴ� ��<span>2019-12-12</span></li>
<li class= "ntitle">����<span class="ndate">��¥</span></li>
<li class="ncontent">�������� ���� ��� �ϴ� ��<span>2019-12-12</span></li>
<li class= "ntitle">����<span class="ndate">��¥</span></li>
<li class="ncontent">�������� ���� ��� �ϴ� ��<span>2019-12-12</span></li>
<li class= "ntitle">����<span class="ndate">��¥</span></li>
<li class="ncontent">�������� ���� ��� �ϴ� ��<span>2019-12-12</span></li>
</ul>
</div>
<div class= "qn">
<h1>���� �ϱ�</h1>
</div>















<c:import url="../footer.jsp" />
</body>
</html>