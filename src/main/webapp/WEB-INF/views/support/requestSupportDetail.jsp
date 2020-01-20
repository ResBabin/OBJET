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
 
 	function deleteRequestSupport(requestno){
 		$.ajax({
	         url:"deleteRequestSupport.do",
	         type:"get",
	         data:{requestno : requestno},
	         success: function(result){
	             if(result == "ok"){
	            alert("해당 정산신청이 취소되었습니다.");
	               window.location.href="moveRequestSupport.do?artistid=${loginUser.userid}&currentPage=1";
	             }
	             else{
	            	alert("해당 정산신청 취소에 실패했습니다.");
	            	window.location.reload();
	             }
	          },
	          error: function(request, status, errorData){
					console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
				}
	       }); 
 	}

 </script>
</head>

<body>

<div class="wrapSupportList">

<p style="font-size: 20pt; color:#373737; text-align:center;">신청내역 상세</p>

	<!-- 상세보기 시작 -->
		<div align="center">
		<p class="supportdetailP"><i class="chevron olive circle right icon"></i>인적사항</p>
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
					<th style="width:15%">계좌</th><td style="width:35%">${requestsupport.sptbank}&ensp;${requestsupport.sptaccount}</td>
				</tr>
			</table>
			<br><br><br>
			
			<p class="supportdetailP"><i class="chevron olive circle right icon"></i>신청정보</p>
			<table class="supportdetailTable">
				<tr>
					<th style="width:15%">신청정산</th><td style="width:35%">${requestsupport.requestyear} / ${requestsupport.requestmonth}</td>
					<th style="width:15%">신청일</th><td style="width:35%">${requestsupport.sptdate}</td>
				</tr>
				<tr>
					<th style="width:15%">처리상태</th>
					<td style="width:35%"><c:if test="${requestsupport.sptstatus == 'WAIT' }">대기</c:if>
										  <c:if test="${requestsupport.sptstatus == 'DONE' }">정산완료</span></c:if> 
										  <c:if test="${requestsupport.sptstatus == 'RJCT' }"><span style="color:red;">반려</span></c:if> 
					</td>
					<th style="width:15%">정산파일</th>
					<td style="width:35%"><c:if test="${!empty requestsupport.sptrfile}">
										<i class="olive folder open icon"></i><span style="text-decoration: underline; font-size:9pt; cursor: pointer;" onclick="location.href='requestFileDown.do?filename=${requestsupport.sptrfile}'">${requestsupport.sptrfile }</span></c:if>
										  <c:if test="${empty requestsupport.sptrfile}">&nbsp;</c:if>
					</td>
				</tr>
			</table>
			<br><br><br>
			
			
			<p class="supportdetailP"><i class="chevron olive circle right icon"></i>반려사유</p>
			<table class="supportdetailTable">
				<tr>
					<th style="width:15%">담당자</th>
					<td style="width:35%"><c:if test="${!empty requestsupport.adminid}">${requestsupport.adminid }</c:if>
										  <c:if test="${empty requestsupport.adminid}">&nbsp;</c:if>
					
					</td>
					<th style="width:15%">처리일</th>
					<td style="width:35%"><c:if test="${!empty requestsupport.sptdonedate}">${requestsupport.sptdonedate}</c:if>
										  <c:if test="${empty requestsupport.sptdonedate}">&nbsp;</c:if>
					</td>
				</tr>
				<tr>
					<th style="width:15%">사유</th>
					<td colspan="3" style="width:85%; text-align: left;"><c:if test="${empty requestsupport.adminmemo}">&nbsp;</c:if>
										 <c:if test="${!empty requestsupport.adminmemo}"><span style="color:red;">${requestsupport.adminmemo}</span></c:if>
					</td>
				</tr>
			</table>
			
			<br><br><br><br><br>
			<input type="button" class="mainBtn" value="목록이동" onclick="javascript:history.go(-1)">
			<input type="button" class="mainBtn" value="1:1문의" onclick="location.href='insertQna.do'">
			<!-- 신청 대기일 때에만 취소버튼 -->
			<c:if test="${requestsupport.sptstatus == 'WAIT' }">
			<br><br><br><input type="button" class="mainBtn1" value="신청취소" onclick="deleteRequestSupport(${requestsupport.requestno})">
			</c:if>
			
		</div>
		<!-- 상세보기 끝 -->
	
					
		
		
</div> <!-- supportWrap 끝 -->
<c:import url="../footer.jsp" />
</body>
</html>