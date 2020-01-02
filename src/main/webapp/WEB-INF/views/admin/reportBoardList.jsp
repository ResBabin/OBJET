<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="adminHeader.jsp" />
<style type="text/css">

tbody{
	text-align: center;
}
.detailbtn{
cursor: pointer;
}
#detaillabel{
margin: 5px;
width: 935px;
padding: 10px;
padding-left: 20px;
padding-right: 20px;
text-align: left;
}
#datediv{
text-align: right;
}
#linkbtn{
margin: 5px;
width: 935px;
background: #4dbbb1;
color: white;
}
.closebtn{
margin: 5px;
width: 460px;
background: #999;
color: white;
}
#linkbtn:active {
	background: #489e96;
}
#closebtn:active {
	background: #555;
}




</style>

<script type="text/javascript">
$(function() {
	$(".detailbtn").click(function(){
		var str = ""
		var detailbtn = $(this);
		var rptr = detailbtn;
		var rptd = rptr.children(); 
		
	//	console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
		var originno = rptd.eq(0).text();
		var reportedb = rptd.eq(2).text();
		
		console.log(originno);
		console.log(reportedb);
		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		
		$(rptr).next().toggle(
		);
		function bringreport() {
			$.ajax({
				url : "reportd.do",
				data : {reportedb : reportedb, originno : originno},
				type : "post",
				dataType : "json",
				success : function(result) {
					var objStr = JSON.stringify(result);
					var jsonObj = JSON.parse(objStr);
					//출력용 문자열 준비 
					var rd = "";
					//출력할 문자열 만들기
					for ( var i in jsonObj.list) {
						rd +="<div class='ui large label' id='detaillabel'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div>" 
						+ decodeURIComponent(jsonObj.list[i].id.replace(/\+/gi, " ")) + 
						"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
								 + decodeURIComponent(jsonObj.list[i].reason.replace(/\+/gi, " ")) + 
								"</div><div id='datediv'>" + jsonObj.list[i].date + "</div></div>"
					}
					var rc = $(rptr).children().eq(2).find('input[name="rcount"]').val();
					console.log(rc);
					
		/* 		 $(rptr).next().html("<td style='background : #f9f9f9' width='150'> 총" + rc +
							"건</td><td colspan='2' style='background : #f9f9f9;' width='200'>" + rd + 
							"<button id='linkbtn' class='ui button'>원글로 이동</button><button class='ui button closebtn'>닫기</button></td>"); 
	 */
				var rptrvar =  $(rptr).next();
			 	 $(rptrvar).html("<td style='background : #f9f9f9;' width='150'> 총" + rc +
							"건</td><td colspan='2' style='background : #f9f9f9;' width='200'>" + rd + 
							"<button id='linkbtn' class='ui button'>원글로 이동</button></td>");  
				}, 
				error : function(request, status, errorData) { 
					console.log("error code : " + request.status
							+ "\nMessage : " + request.responseText
							+ "\nError : " + errorData);
				} 
	 
			});
		};
		
	});
	});
</script>
<style type="text/css">
#div1111{
padding-left: 10px;
padding-right: 10px;
}
#div2222{
display: flex;
}
</style>

</head>
<body>
	<div style="padding: 200px;">
		<table class="ui sortable celled table selectable" id="reportd">
			<thead align="center">
				<tr> 
					<th width="150">신고된 게시글 번호</th>
					<th >원글 분류</th>
					<th width="200">신고된 작성자</th>
				</tr>
			</thead>
			<tbody id="ddddd" class="rttable">
				<c:forEach items="${ reportall }" var="reportall" varStatus="stat">
					<tr class="detailbtn">
						<td class="ori">${ reportall.originno }</td>
						<td class="ori">${ reportall.reportbtype }</td>
						<td class="reb">${ reportall.reportedb }<input type="hidden" name="rcount" value="${ reportall.reportcount }"></td>
					</tr>
						<tr class="detailtr"></tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>