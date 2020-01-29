<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("newLineN", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산신청 상세보기</title>
<c:import url="adminHeader.jsp"/>
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript">
 
  // 신청처리 버튼
 	function submitRequest(){
 		if(confirm("해당 신청을 처리하시겠습니까? 처리 후 수정이 불가합니다.") == true){
 			$("#requestform").submit();
 			return true;
 		}else{
 			return false;
 		}
  }
 	
 	
 	// 정산완료 셀렉박스 선택 시 파일 첨부 나타내기
 	$(function(){
 		$('#selectbox').change(function(){
 			var state = $('#selectbox option:selected').val();
 			if(state == "DONE"){
 				$("#sptupfiles").show();
 			}else{
 				$("#sptupfiles").hide();
 			}
 		})
 	});

 </script>
</head>

<body>

<div class="wrapSupportList">

<p style="font-size: 20pt; color:#373737; text-align:center;">신청내역 상세</p>

	<!-- 상세보기 시작 -->
		<div align="center">
		<p class="supportdetailP"><i class="chevron olive circle right icon"></i>인적사항</p>
		<form action="updateRequestSupportDetailm.do" method="post" enctype="multipart/form-data" id="requestform">
		<input type="hidden" name="requestno" value="${request.requestno }">
		<input type="hidden" name="adminid" value="${loginUser.userid }">
		<input type="hidden" name="artistid" value="${users.userid}">
		<input type="hidden" name="requestyear" value="${request.requestyear}">
		<input type="hidden" name="requestmonth" value="${request.requestmonth}">
			<table class="supportdetailTable">
				<tr>
					<th style="width:15%">ID</th><td style="width:35%">${users.userid}</td>
					<th style="width:15%">닉네임</th><td style="width:35%">${users.nickname}</td>
				</tr>
				<tr>
					<th style="width:15%">이름</th><td style="width:35%">${users.username}</td>
					
					<th style="width:15%">이메일</th><td style="width:35%">${users.email}</td>
				</tr>
				<tr>
					<th style="width:15%">휴대폰</th><td style="width:35%">${users.phone}</td>
					<th style="width:15%">계좌</th><td style="width:35%">${applysupport.sptbank}&ensp;${applysupport.sptaccount}</td>
				</tr>
			</table>
			<br><br><br>
			
			<p class="supportdetailP"><i class="chevron olive circle right icon"></i>신청정보</p>
			<table class="supportdetailTable">
				<tr>
					<th style="width:15%">신청정산</th><td style="width:35%">${request.requestyear} / ${request.requestmonth}</td>
					<th style="width:15%">신청일</th><td style="width:35%">${request.sptdate}</td>
				</tr>
				<tr>
					<th style="width:15%">처리상태</th>
					<td style="width:35%">
									<c:if test="${request.sptstatus != null }">
										  <c:if test="${request.sptstatus == 'WAIT' }">대기&ensp;▶&ensp;</c:if>
										  <c:if test="${request.sptstatus == 'DONE' }">정산완료</span></c:if> 
										  <c:if test="${request.sptstatus == 'RJCT' }"><span style="color:red;">반려</span></c:if> 
									</c:if>
									<c:if test="${request.sptstatus == 'WAIT' }">
										  <select name="sptstatus" id="selectbox">
										  	<option value="DONE">정산완료</option>
										  	<option value="RJCT">반려</option>
										  </select>
									</c:if>
					</td>
					<th style="width:15%">정산파일</th>
					<td style="width:35%"><c:if test="${!empty request.sptrfile and request.status eq 'DONE'}">
										<i class="olive folder open icon"></i><span style="text-decoration: underline; font-size:9pt; cursor: pointer;" onclick="location.href='requestFileDown.do?filename=${request.sptrfile}'">${request.sptrfile }</span></c:if>
										  
										  <c:if test="${empty request.sptrfile and status == 'WAIT'}"><input type="file" id="sptupfiles" name="sptupfiles" style="display: hidden" required></c:if>
											<c:if test="${empty request.sptrfile and status == 'RJCT'}">&nbsp;</c:if>
					</td>
				</tr>
			</table>
			<br><br><br>
			
			
			<p class="supportdetailP"><i class="chevron olive circle right icon"></i>반려사유</p>
			<table class="supportdetailTable">
				<tr>
					<th style="width:15%">담당자</th>
					<td style="width:35%"><c:if test="${!empty request.adminid}">${request.adminid }</c:if>
										  <c:if test="${empty request.adminid}">${loginUser.userid }</c:if>
					
					</td>
					<th style="width:15%">처리일</th>
					<td style="width:35%"><c:if test="${!empty request.sptdonedate}">${request.sptdonedate}</c:if>
										  <c:if test="${empty request.sptdonedate}">
										  <jsp:useBean id="today" class="java.util.Date"/>
										  <fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/>
										  </c:if>
					</td>
				</tr>
				<tr>
					<th style="width:15%">사유</th>
					<td colspan="3" style="width:85%; text-align: left;"><c:if test="${empty request.adminmemo}">&nbsp;</c:if>
										 <c:if test="${!empty request.adminmemo}"><span style="color:red;">${request.adminmemo}</span></c:if>
										 <c:if test="${empty request.adminmemo}">
										 <span class="ui form"><span class="field">
		    							 <input type="text" name="adminmemo" id="adminmemo" style="width:90%;" placeholder="반려 또는 기타 사유발생 시 필히 작성(200자 이내)"></span></span></c:if>
					</td>
				</tr>
			</table>
			</form>
			<br><br><br><br><br>
			<c:if test="${request.sptstatus == 'WAIT' }">
			<input type="button" class="mainBtn" value="신청처리" onclick="submitRequest()">
			</c:if>
			<input type="button" class="mainBtn" value="목록이동" onclick="location.href='supportRequest.do?currentPage=1'">
			
		</div>
		<!-- 상세보기 끝 -->
	
					
		
		
</div> <!-- supportWrap 끝 -->
<c:import url="../footer.jsp" />
</body>
</html>