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
background: #f5f5f5;
}
#detaillabel{
margin: 5px;
width: 1080px;
padding-top: 20px;
padding-left: 15px;
padding-right: 15px;
text-align: left;
background: #eee;
border: 1px solid #eee;
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
.detailtr{
background: #f8f8f8;
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
		 
		console.log(dereportedb);
		console.log(deoriginno);
		if( $(rptd).eq(2).text() == 'REVIEW'){
		 $.ajax({ 
				url : "reportdetail.do",
				data : { objetno : deoriginno, userid : dereportedb },
				type : "post",
				success : function(result) {
					console.log(result);
					var detail = "<div class='ui large label' style='width: 1080px; padding: 25px; background: #ffffff99; border: 1px solid #eee;margin: 5px;'>" + result + "</div>";
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
	var dellreportedb = $(deltr).find('input[name="dellreportedb"]').val();  
	var delloriginno = $(deltr).find('input[name="delloriginno"]').val();  
	console.log("delorigin : " + delloriginno); 
	console.log("delreport : " + dellreportedb); 

	var deltype = $(this).val();
	console.log("deltype : " + deltype);
	   $.ajax({ 
		url : "reportdel.do",
		data : { reportbtype : $(this).val(), originno : delloriginno, reportedb : dellreportedb },
		type : "post",
		success : function(result) {
			console.log(result);
		/* 	$(deltr2).next().find(".detaild").remove();
			$(deltr).parent().remove();
			$(deltr2).next().find(".totalcount").remove(); */
			location.href = "reportbm.do";
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
	<div style="padding: 200px; padding-top: 100px;">
		<table class="ui sortable celled table" id="reportd">
			<thead align="center">
				<tr>
					<th width="150">신고 횟수</th>
					<th width="150">신고된 게시글 번호</th>
					<th>원글 분류</th>
					<th width="200">신고된 작성자</th>
					<th width="120"></th>
					<th width="120"></th>
				</tr>
			</thead>
			<tbody id="ddddd" class="rttable">
				<c:forEach items="${ reportall }" var="reportall" varStatus="stat">
					<c:url var="objetmove" value="objetOne.do">
						<c:param name="objetno" value="${ reportall.originno }" />
						<c:param name="userid" value="${ reportall.reportedb }" />
					</c:url>
					<input type="hidden" value="${ reportall.originno }"
						name="delloriginno">
					<input type="hidden" value="${ reportall.reportedb }"
						name="dellreportedb">
					<tr class="detailbtn">
						<td class="rcount"><c:forEach items="${ reportcount }"
								var="rcount">
								<c:if
									test="${ rcount.reportedb eq reportall.reportedb and rcount.originno eq reportall.originno and rcount.reportbtype eq reportall.reportbtype }">
						${ rcount.reportcount }
						</c:if>
							</c:forEach></td>
						<td class="ori">${ reportall.originno }</td>
						<td class="ori">${ reportall.reportbtype }</td>
						<td class="reb">${ reportall.reportedb }<input type="hidden"
							name="rcount" value="${ reportall.reportcount }"></td>
						<td><a href="${ objetmove }" target="_blank"><button
									id='linkbtn' class='ui small button'>원글로 이동</button></a></td>
						<c:set var="delreportbtype" value="${ reportall.reportbtype }" />
						<td><input type="hidden" value="${ reportall.originno }"
							name="delloriginno"> <input type="hidden"
							value="${ reportall.reportedb }" name="dellreportedb">
							<button id="delbtn" class="ui small button delbtn"
								value="${ delreportbtype }">원글 삭제</button></td>
					</tr>
					<tr class="detailtr" style="display: none;">
						<td colspan="6" class="detaild"><c:forEach
								items="${reportblist}" var="rblist">
								<c:if
									test="${ rblist.originno eq reportall.originno and rblist.reportbtype eq reportall.reportbtype and rblist.reportedb eq reportall.reportedb }">
									<input type="hidden" value="${ rblist.originno }"
										name="deloriginno">
									<input type="hidden" value="${ rblist.reportedb }"
										name="delreportedb">

									<div class='ui large label' id='detaillabel'>
										${ rblist.reporterb }
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${ rblist.reportbreason }
										<div id='datediv'>${ rblist.reportbdate }</div>
									</div>
								</c:if>
							</c:forEach>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="center">
		<div class="ui pagination menu">
			<a class="item"> 1 </a>
			<div class="disabled item">...</div>
			<a class="item active"> 10 </a> <a class="item"> 11 </a> <a
				class="item"> 12 </a>
		</div>
		</div>
	</div>
</body>
</html>