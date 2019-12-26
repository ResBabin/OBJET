<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="adminHeader.jsp" />

<script type="text/javascript">
$(function() {

	
/* 	for(var i = 0; i <= ${ reportall.size() }; i++ ){
		$("#rep").attr("id", "rep" + i);
		console.log(i);
	} */
	
	console.log(${ reportall.size()})
	console.log($("#rep1").val());
	console.log($("#rep0").val());
	
	for(var i = 0; i <= ${ reportall.size() }; i++ ){
	/* 	$("#rep").attr("id", "rep" + i);
		$("#reb").attr("id", "reb" + i);
		$("#ori").attr("id", "ori" + i);
		$("#rt").attr("id", "rt" + i);
		console.log(reportb); */
		
		//var reportb = { reportedb : "${ reportall.get(i).reportedb }", originno : ${ reportall.get(i).originno } };
	$("#rep").click(function() {
		$.ajax({
			url : "reportd.do",
			data : reportb,
			
			type : "post",
			dataType : "json",
			success : function(result) {
				var objStr = JSON.stringify(result);
				var jsonObj = JSON.parse(objStr);
				//출력용 문자열 준비 
				var rd = "";
				//출력할 문자열 만들기
				for ( var i in jsonObj.list) {
					rd += decodeURIComponent(jsonObj.list[i].id.replace(/\+/gi, " "))+ ''
							 + decodeURIComponent(jsonObj.list[i].reason.replace(/\+/gi, " ")) + "";
				}
				$("#content").html(rd);
			}, 
			error : function(request, status, errorData) { 
				console.log("error code : " + request.status
						+ "\nMessage : " + request.responseText
						+ "\nError : " + errorData);
			}
		});
	});
	}
});




</script>
</head>
<body>
	<div style="padding: 150px;">
		<button id="rep">ddd</button>
		<c:forEach items="${ reportall }" var="reportall" varStatus="stat">
			<div class="box">
				<div style="display: flex;">
					<div style="width: 100px">${ reportall.originno }</div>
					<div style="width: 200px;">${ reportall.reportedb }</div>
				</div>
				<div id="content"></div>
			</div>
		</c:forEach>
		<table class="ui sortable celled table selectable">
			<thead>
				<tr>
					<th>신고된 게시글 번호</th>
					<th>신고된 작성자</th>
					<th>신고자</th>
					<th>신고일</th>
					<th>신고사유</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ reportblist }" var="reportbm" varStatus="stat">
					<tr>
						<td>${ reportbm.originno }</td>
						<td>${ reportbm.reportedb }</td>
						<td>${ reportbm.reporterb }</td>
						<td>${ reportbm.reportbdate }</td>
						<td>${ reportbm.reportbreason }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="ui sortable celled table selectable" id="reportd">
			<thead>
				<tr>
					<th>신고된 게시글 번호</th>
					<th>신고된 작성자</th>
				</tr>
			</thead>
			<tbody id="ddddd">
				<c:forEach items="${ reportall }" var="reportall" varStatus="stat">
					<tr id="">
						<td id="ori"><input type="text" name="originno" value="${ reportall.originno }" style="border: none; background: none;" disabled="disabled"></td>
						<td id="reb"><input type="text" name="originno" value="${ reportall.reportedb }" style="border: none; background: none;" disabled="disabled"></td>
					</tr>
					<tr id="rt">
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>