<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내역</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<!-- 문의내역 페이지 시작 -->
	<div class="wrapMyObjetList">
	
		<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">문의 상세보기</p>
		
		<!-- 문의내역 테이블 -->
		<table class="myQnaDetailTable">
			<tr>
				<th style="width:15%;">제목</th><td style="width:50%;"><span style="font-weight: 600; color:green; font-size: 10pt;">[회원]</span>&ensp;${qna.qnatitle}</td>
				<th style="width:15%;">작성일</th><td style="text-align: center;"><fmt:formatDate value="${qna.questiondate}" type="date"/></td>
			</tr>
			
			<tr>
				<th>첨부파일</th><td colspan="3" style="color:#aaa;">없음</td>
			</tr>
			
			<tr>
				<th style="height: 300px;">내용</th>
				<td colspan="3" style="vertical-align: top;">${qna.qnacontent}</td>
			</tr>
		</table>
		
		<!-- 수정삭제버튼 -->
		<div align="right">
		     <c:if test="${qna.qnaanswertype eq '미답변'}">
			<button class="ui mini black button" onclick="location.href='MoveupdateQna.do?qnano=${qna.qnano}&userid=${loginUser.userid}'">수정</button></c:if>
			<c:if test="${qna.qnaanswertype eq '답변완료'}">
			<a href="javascript:alert('답변완료시 수정이 불가능 합니다.')"><button class="ui mini black button">수정불가</button></a></c:if>
			<button class="ui mini grey button" onclick="location.href='deleteDetailQna.do?qnano=${qna.qnano}&userid=${loginUser.userid}'" >삭제</button>
		</div>
		<br><br>
		
		<!-- 관리자 답변 테이블 -->
		<c:if test="${qna.qnaanswer ne null}">
	
		<table class="myQnaAnswerTable1">
			<tr style="height:15px;">
				<th style="text-align: left;color:navy;">관리자 답변 &emsp;<span style="font-size: 9pt; color:#aaa;"><fmt:formatDate value="${qna.answerdate}" type="date"/></span></th>
			</tr>
			
			<tr>
				<td>${qna.qnaanswer}</td>
			</tr>
		</table></c:if>
		
		<!-- 답변이 없을 경우  -->
		<c:if test="${qna.qnaanswer eq null}">
		<table class="myQnaAnswerTable1">
			<tr style="height:15px;">
				<th style="text-align: left;color:navy;">현재 작성된 답변이 없습니다. 조금만 기다려주세요 :)</th>
			</tr>
			
		</table></c:if>
		
		
		<br>
		<div align="center">
			<a href="selectQnaList.do?userid=${loginUser.userid}"><button class="ui mini grey button">목록</button></a>
			
		</div>
		<br>
		
		
		
		
		
		
		

		
	</div>
	<!-- 문의내역 페이지 끝 -->
	
	<br><br><br>


</body>
<c:import url="../footer.jsp" />
</html>