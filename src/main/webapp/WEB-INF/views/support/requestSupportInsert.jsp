<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineN", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산신청 상세보기</title>
<c:import url="../header.jsp" />
<c:import url="../headerSearch.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript">
 
 	// 정산신청
	function insertRequestSupport(){
		var form = $("form[name=insertRequestSupportForm]").serialize();
		$.ajax({
			url : "insertRequestSupport.do",
			type: "post",
			data: form,
			success : function(result){
				if(result == "ok"){
					alert("신청이 완료되었습니다.");
					window.location.href="moveRequestSupport.do?artistid=${loginUser.userid}&currentPage=1"
				}else{
					alert("신청에 실패하였습니다.");
					location.reload();
				}
				
			},
			error : function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
			}
			
		})//ajax...
	}//insertRequestSupport()...
 </script>
</head>

<body>

<div class="wrapSupportList">

<p style="font-size: 20pt; color:#373737; text-align:center;">정산 신청</p>

	<!-- 상세보기 시작 -->
		<div align="center">
		<p class="supportdetailP"><i class="chevron olive circle right icon"></i>인적사항&emsp;
		<span style="font-size: 9pt; color:#aaa; font-weight: 300;">변경이 필요할 경우, 
		<span style="text-decoration: underline;cursor: pointer;" onclick="location.href='moveReaffirmUserpwd.do'">내정보수정</span> 또는 
		<span style="text-decoration: underline;cursor: pointer;" onclick="location.href='moveModifyApplySupport.do?artistid=${loginUser.userid}'">후원설정</span>에서 가능합니다.</span>
		</p>
		
			<table class="supportdetailTable">
				<tr>
					<th style="width:15%">ID</th><td style="width:35%">${loginUser.userid}</td>
					<th style="width:15%">닉네임</th><td style="width:35%">${loginUser.nickname}</td>
					
				</tr>
				<tr>
					<th style="width:15%">이름</th><td style="width:35%">${loginUser.username}</td>
					<th style="width:15%">이메일</th><td style="width:35%">${loginUser.email}</td>
				</tr>
				<tr>
					<th style="width:15%">휴대폰</th><td style="width:35%">${loginUser.phone}</td>
					<th style="width:15%">계좌</th><td style="width:35%">${applysupport.sptbank}&ensp;${applysupport.sptaccount}</td>
				</tr>
			</table>
			<br><br><br>
			
			<p class="supportdetailP"><i class="chevron olive circle right icon"></i>신청정보</p>
			<form action="insertRequestSupport.do" method="post" name="insertRequestSupportForm">
			<input type="hidden" name="artistid" value="${loginUser.userid}">
				<table class="supportdetailTable">
					<tr>
						<th style="width:15%">해당 정산</th><td style="width:35%; text-align: left;">
								<select class="ui search dropdown" name="requestyear" id="requestyear" required>
								  <option value="2019">2019</option>
								  <option value="2020">2020</option>
								</select>&ensp;년&emsp;
								<select class="ui search dropdown" name="requestmonth" id="requestmonth" required>
								  <option value="1">01</option>
								  <option value="2">02</option>
								  <option value="3">03</option>
								  <option value="4">04</option>
								  <option value="5">05</option>
								  <option value="6">06</option>
								  <option value="7">07</option>
								  <option value="8">08</option>
								  <option value="9">09</option>
								  <option value="10">10</option>
								  <option value="11">11</option>
								  <option value="12">12</option>
								</select>&ensp;월
						</td>
					</tr>
				</table>
				
			</form>
			<br><br><p style="color:red; font-size: 9pt;">* 정산완료까지 영업일 기준 최대 14일 소요되오니 이 점 참고바랍니다.</p>
			<br><br>
			<input type="submit" class="mainBtn" onclick="insertRequestSupport()" value="정산신청">&ensp;
			<input type="button" class="mainBtn1" value="목록이동" onclick="javascript:history.go(-1)">
			
			
		</div>
		<!-- 상세보기 끝 -->
	
					
		
		
</div> <!-- supportWrap 끝 -->
<c:import url="../footer.jsp" />
</body>
</html>