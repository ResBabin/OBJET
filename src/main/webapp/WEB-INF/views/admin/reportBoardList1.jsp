<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고글 관리</title>
<c:import url="adminHeader.jsp" />
<style type="text/css">
tbody{
	text-align: center;
} 
.detailtr{
cursor: pointer;
}
.detailtr:active, .detailtr:hover{
background: #fafafa;
font-weight: bold;
color: #626262;
}
#detaillabel{
margin: 5px;
width: 1100px;
padding-top: 20px;
padding-left: 15px;
padding-right: 15px;
text-align: left;
background: #fff;
border: 1px solid #ddd;
}
#datediv{
text-align: right;
}
#linkbtn{
margin: 5px;
width: 85px;
background: #16b9aa;
color: white;
padding: 8px;
}
#delbtn{
margin: 5px;
width: 85px;
background: #555;
color: white;
padding: 8px;
}
#delbtn:active{
background: #333;
}
#linkbtn:active {
	background: #1b9a8e;
}
#closebtn:active {
	background: #555;
}

#div1111{
padding-left: 10px;
padding-right: 10px;
}
#div2222{
display: flex;
}

</style>


<script type="text/javascript">
$(function() { 
	
$(".detailtr").click(function() {
		var detailbtn = $(this);
		var rptr = detailbtn;
		var rptd = rptr.children(); 
		var rptdc = rptd.children();  
		$(rptr).next().toggle(100);
}); 
		 
$(".delbtn").click(function() {
	var con = confirm("해당 신고를 삭제하시겠습니까?");
	if(con){
		var reportedb = $(this).find('input[name="reportedb"]').val();  
		var originno = $(this).find('input[name="originno"]').val();  
		var reportbtype = $(this).find('input[name="reportbtype"]').val();  
	 	   $.ajax({ 
			url : "reportdel.do",
			data : { reportbtype : reportbtype, originno : originno, reportedb : reportedb },
			type : "post",
			success : function(result) {
				console.log(result);
				location.href = location.href;
			},
			error : function(request, status, errorData) { 
				console.log("error code : " + request.status
						+ "\nMessage : " + request.responseText
						+ "\nError : " + errorData);
			} 
		});  
	}
}); 
});

</script>

</head>
<body>
	<div style="padding: 200px; padding-top: 100px;">
		<table class="ui sortable celled table" id="reportboard">
			<thead align="center">
			<tr><th width="250">신고횟수</th><th width="250">오브제 번호</th><th width="300">신고 작가</th>
			<th width="100">원글</th><th width="100">관리 페이지</th><th width="70">삭제</th></tr>
			</thead>
			<tbody>
			<c:forEach items="${ reportblist }" var="reportb">
			<tr class="detailtr"><td>${ reportb.reportcount }</td>
			<td>${ reportb.originno }</td>
			<td>${ reportb.reportedb }</td>
			<td><a href="objetOne.do?objetno=${ reportb.originno }&userid=${ reportb.reportedb }" target="_blank"><button class="ui basic button">이동</button></a></td>
			<td><a href="objetmd.do?objetno=${ reportb.originno }" target="_blank"><button class="ui basic button">이동</button></a></td>
			<td><button class="ui icon button delbtn"><i class="icon trash"></i>
				<input type="hidden" name="reportedb" value="${ reportb.reportedb }">
				<input type="hidden" name="originno" value="${ reportb.originno }">
				<input type="hidden" name="reportbtype" value="${ reportb.reportbtype }">
			</button></td>
			</tr>
			<tr style="display: none;"><td colspan="6" style="background: #f7f7f7; padding: 15px;">
				<c:forEach items="${ reportbdetail }" var="reportbd">
				<c:if test="${ reportb.reportedb eq reportbd.reportedb and reportb.originno eq reportbd.originno }">
				<div class='ui large label' id='detaillabel'>
					${ reportbd.reporterb }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${ reportbd.reportbreason }
					<div id='datediv'>${ reportbd.reportbdate }</div>
				</div>
				</c:if>
				</c:forEach>
				</td></tr>
			</c:forEach>
			</tbody>
		</table>
	<!-- 	<div align="center">
		<div class="ui pagination menu">
			<a class="item"> 1 </a>
			<div class="disabled item">...</div>
			<a class="item active"> 10 </a> <a class="item"> 11 </a> <a
				class="item"> 12 </a>
		</div>
		</div> -->
	</div>
</body>
</html>