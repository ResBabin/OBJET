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
.detailbtn{
cursor: pointer;
}
.detailbtn:active, .detailbtn:hover{
background: #ddd;
}
#detaillabel{
margin: 5px;
width: 935px;
padding-top: 20px;
padding-left: 15px;
padding-right: 15px;
text-align: left;
background: #cccccc99;
border: 1px solid #ddd;
}
#datediv{
text-align: right;
}
#linkbtn{
margin: 5px;
width: 100px;
background: #16b9aa;
color: white;
padding: 10px;
}
#delbtn{
margin: 5px;
width: 100px;
background: #555;
color: white;
padding: 10px;
}
#delbtn:active{
background: #333;
}
.closebtn{
margin: 5px;
width: 460px;
background: #888;
color: white;
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
.detailtr{
background: #f5f5f5;
}

</style>


<script type="text/javascript">
$(function() { 
	
	
	
	$(".detailbtn").click(function() {
		
		var detailbtn = $(this);
		var rptr = detailbtn;
		var rptd = rptr.children(); 
		var rptdc = rptd.children(); 
		$(rptr).next().toggle(100);
		var dereportedb = $(this).next().find('input[name="delreportedb"]').val();  
		var deoriginno = $(this).next().find('input[name="deloriginno"]').val();  
		
	var rc = $(rptr).children().eq(2).find('input[name="rcount"]').val();
	$(rptr).next().children().eq(0).html("총" + rc + "건");
	if( $(rptd).eq(1).text() == 'REVIEW' ){
	 $.ajax({ 
			url : "reportdetail.do",
			data : { objetno : deoriginno, userid : dereportedb },
			type : "post",
			success : function(result) {
				console.log(result);
				var detail = "<div class='ui large label' style='width: 935px; padding: 15px; background: #ffffff99; border: 1px solid #ddd;margin: 5px;'>" + result + "</div>";
				var rptrnext = $(rptr).next();
				$(rptrnext).find(".detaild").html(detail +$(".detaild").html() ); 
			},
			error : function(request, status, errorData) { 
				console.log("error code : " + request.status
						+ "\nMessage : " + request.responseText
						+ "\nError : " + errorData);
			} 
		}); 
	}
	});
		
$(".delbtn").click(function() {
	var deltr = $(this).parent();
	var deltr2 = $(deltr).parent();
	var deltr3 = $(deltr).parent().prev();
	console.log($(this).val());
	var delreportedb = $(this).find('input[name="dellreportedb"]').val();  
	var deloriginno = $(this).find('input[name="delloriginno"]').val();  
	console.log("delorigin : " + deloriginno); 
	console.log("delreport : " + delreportedb); 

	var deltype = $(this).val();
	console.log("deltype : " + deltype);
	 $.ajax({ 
		url : "reportdel.do",
		data : { reportbtype : $(this).val(), originno : deloriginno, reportedb : delreportedb },
		type : "post",
		success : function(result) {
			console.log(result);
			$(deltr).remove();
			$(deltr2).remove();
			$(deltr3).remove();
		},
		error : function(request, status, errorData) { 
			console.log("error code : " + request.status
					+ "\nMessage : " + request.responseText
					+ "\nError : " + errorData);
		} 
		
	}); 
}); 
});

</script>

</head>
<body>
	<div style="padding: 200px;">
		<table class="ui sortable celled table" id="reportd">
			<thead align="center">
				<tr> 
					<th width="150">신고된 게시글 번호</th>
					<th >원글 분류</th>
					<th width="200">신고된 작성자</th>
					<th width="120"></th>
					<th width="120"></th>
				</tr>
			</thead>
			<tbody id="ddddd" class="rttable">
				<c:forEach items="${ reportall }" var="reportall" varStatus="stat">
				<c:url var="objetmove" value="objetOne.do">
						<c:param name="objetno" value="${ reportall.originno }" />
						</c:url>
						<input type="hidden" value="${ reportall.originno }" name="delloriginno">
						<input type="hidden" value="${ reportall.reportedb }" name="dellreportedb">
					<tr class="detailbtn">
						<td class="ori">${ reportall.originno }</td>
						<td class="ori">${ reportall.reportbtype }</td>
						<td class="reb">${ reportall.reportedb }<input type="hidden" name="rcount" value="${ reportall.reportcount }"></td>
						<td> <a href="${ objetmove }"><button id='linkbtn' class='ui button'>원글로 이동</button></a></td>
							<c:set var="delreportbtype" value="${ reportall.reportbtype }"/>
						<td><button id="delbtn" class="ui button delbtn" value="${ delreportbtype }">원글 삭제</button></td>
					</tr>
						<tr class="detailtr" style="display: none;">
						<td class="tdtd"></td>
						<td colspan="4" class="detaild">
						<c:forEach items="${reportblist}" var="rblist">
						<input type="hidden" value="${ rblist.originno }" name="deloriginno">
						<input type="hidden" value="${ rblist.reportedb }" name="delreportedb">
						<c:if test="${ rblist.originno eq reportall.originno and rblist.reportbtype eq reportall.reportbtype and rblist.reportedb eq reportall.reportedb }">
					
						<div class='ui large label' id='detaillabel'>
						 ${ rblist.reporterb } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   ${ rblist.reportbreason }
						 <div id='datediv'>${ rblist.reportbdate } </div>
						</div>
						
						</c:if>
						</c:forEach>
						</td>
						</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>