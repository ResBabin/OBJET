<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의하기</title>
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
	<!-- 문의수정 페이지 시작 -->
	<div class="wrapMyObjetList">
	
		<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">1:1 문의하기</p>
		
		<!-- 문의내역 테이블 -->
		<form action="" method="post">
		<input type="hidden" name="userid" value="">
		<table class="myQnaDetailTable">
			<tr>
				<th style="width:15%;">제목</th>
				<td style="width:75%;">
					<select class="ui dropdown" name="qnatype" required>
					  <option value="전시">전시</option>
					  <option value="회원">회원</option>
					  <option value="기타">기타</option>
					</select>&ensp;
					<div class="ui input">
	  				<input type="text" name="qnatitle" required style="width:500px;">
					</div>
				</td>
				
			</tr>
			
			<tr>
				<th>첨부파일</th><td><input type="file" name="qnaofile">
							</td>
				
			</tr>
			
			<tr>
				<th>내용</th>
				<td style="vertical-align: top; height:450px;padding:0px;margin:0px;">
					<div class="ui form"><div class="field">
					<textarea rows="50" name="qnacontent" id="qnacontent" style="font-size: 9pt;width:100%;height:450px;" required></textarea></div></div>
				</td>
			</tr>
		</table>
		<br><br>
		<!-- 수정삭제버튼 -->
			<div align="center">
				<input type="submit" class="ui green button" value="문의하기"></a> &nbsp;
				<input type="button" class="ui button" value="문의취소" onclick="location.href='javascript:history.go(-1)'"> &nbsp;
			</div>
		<br><br>
	</form>
		
		
		<br>
		
		
		
		
		
		
		
		

		
	</div>
	<!-- 문의수정 페이지 끝 -->
	


</body>
<c:import url="../footer.jsp" />
</html>