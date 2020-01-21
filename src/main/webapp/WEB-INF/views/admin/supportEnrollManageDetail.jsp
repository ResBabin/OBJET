<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 등록 현황 관리</title>
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
<c:import url="adminHeader.jsp"/>
<style type="text/css">
#um {
	padding: 150px;
	padding-top: 40px;
	padding-bottom: 40px;
}
</style>
<script type="text/javascript">
$(function() {
	$('.dropdown').dropdown({});
	$("input[name=noticecontent]").hide();
	
	$("#searchcontent").click(function() { 
	$("input[name=noticetitle]").hide();
	$("input[name=noticetitle]").val("");
	$("input[name=noticecontent]").show();
	});
	$("#searchtitle").click(function() {
	$("input[name=noticecontent]").hide();
	$("input[name=noticecontent]").val("");
	$("input[name=noticetitle]").show();
	});
});

function deleteApplySupport(artistid){
	 if(confirm('후원 정보를 삭제하시겠습니까?')==true){
		 $.ajax({
			 url: 'deleteApplySupport.do',
			 data : {artistid : artistid },
			 method : "get",
			 success : function(result){
				 if(result == "ok"){
					 alert("후원 정보가 삭제되었습니다.");
					 window.location.href="supportEnrollListm.do?currentPage=1";
				 }else{
					 alert("후원 정보 삭제에 실패했습니다.");
					 window.location.href="supportEnrollListm.do?currentPage=1";
				 }
			 },
			error : function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
			}
			 
		 }) // ajax...
		 return true;
	 }else{
		 return false;
	 }
}

</script>


</head>
<body>

<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">회원 상세정보</p>
	<!-- 후원정보입력섹션 시작! -->
	<div align="center">
	<div class="applySection" style="width:70%;">
	
		<table class="applyTable">
			<tr><th>헤드라인<span style="color:red">*</span></th></tr>
			<tr><td>나를 한마디로 표현할 수 있는 멋진 문구를 입력해주세요.&emsp;
					<div class="ui form"><span class="field">
		    		<input type="text" name="sptheader" id="sptheader" value="${detail.sptheader}" style="width:100%;" readonly></span></div>
			</td></tr>
			
			<tr><th><br><br>소개<span style="color:red">*</span></th></tr>
			<tr><td>성공적인 후원을 위해 가장 중요한 영역입니다. 간략한 작가 소개, 창작동기, 후원 목표 등 <br>
					후원자들이 궁금해 할 내용들이 포함되면 좋습니다.&emsp;
					<div class="ui form"><span class="field">
		    		<textarea name="sptintro" id="sptintro" style="width:100%;height:400px;" readonly>${detail.sptintro}</textarea></span></div>
			</td></tr>
			
			<tr><th><br><br>감사 메시지<span style="color:red">*</span></th></tr>
			<tr><td>후원한 팬들에게 보내는 감사 메시지를 입력해주세요.&emsp;
					<div class="ui form"><span class="field">
		    		<textarea name="thanksmsg" id="thanksmsg" style="width:100%;height:180px;" readonly>${detail.thanksmsg}</textarea></span></div>
			</td></tr>
			
			<tr><th><br><br>후원 계좌<span style="color:red">*</span></th></tr>
			<tr><td>후원 받을 계좌를 입력해주세요. <span style="color:#aaa;">(정산용 계좌이며 후원자에게 노출되지 않습니다)</span><br>
			<span class="ui form"><span class="field">
		    		<input type="text" name="sptbank" id="sptbank" style="width:10%;" value="${detail.sptbank}" readonly></span></span>
					<span class="ui form"><span class="field">
		    		<input type="text" name="sptaccount" id="sptaccount" style="width:20%;"value="${detail.sptaccount}"readonly></span></span>
			</td></tr>
			
			<tr><th><br><br>필수서류<span style="color:red">*</span></th></tr>
			<tr><td>후원금 신청 첨부 파일을 다운로드 하여 필히 작성하여 주세요.&emsp;<span style="color:teal; text-decoration: underline; cursor: pointer;" onclick="location.href='requestFileDown.do?filename=후원금정산신청서.docx'">[후원금 정산신청서]</span><br>
					<span style="color:#aaa;">해당 파일은 안전하게 보관되며 후원자에게 노출되지 않습니다.</span></td></tr>
			<tr><td><table class="supportdetailTable" style="width:100%;">
						<tr>
							<th>첨부</th><td style="text-align: left;"><i class="olive folder open icon"></i><span style="font-weight: 600; color: grey;" onclick="location.href='requestFileDown.do?filename=${detail.artistrfile}'">${detail.artistrfile}</span> </td>
						</tr>
						
					</table>
			</td></tr>
		</table>
	
	<!-- 후원정보입력섹션 끝! -->
	<br>
	<br><br>
	<div align="center">
		<p style="color:#aaa; text-decoration: underline;" onclick="deleteApplySupport('${detail.artistid}')">등록 정보 삭제</p>
	</div>
	
	
	</div>
</div>
<!-- 후원설정 페이지 끝 -->



<br><br><br><br><br><br><br><br>
<c:import url="../footer.jsp"/>
</body>
</html>