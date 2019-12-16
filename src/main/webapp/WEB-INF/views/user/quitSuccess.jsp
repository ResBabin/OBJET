<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오브제 회원탈퇴 완료</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
</head>
<body>

<!-- 회원가입완료 페이지 시작 -->
<div class="wrapEnrollSuccessPage">
	<div align="center">
		<i class="massive black handshake outline icon"></i>
		<p style="font-size: 25pt; padding-top:20px; color:#373737; text-align:center;">회원탈퇴가 완료되었습니다.</p>
		<p style="font-size: 15pt; margin-top:-20px; color:#aaa; text-align:center;">그동안 오브제를 이용해주셔서 감사합니다.<br>보다 나은 오브제로 다시 만나뵐 수 있기를 바랍니다.</p>
		<br><br>
		<button class="ui black button" onclick="location.href='main.do'" style="width:350px; height:40px; background: #4c4c4c;">오브제 첫화면</button>
	</div>
</div>
<br><br><br><br><br><br><br><br>
</body>
<c:import url="../footer.jsp" />
</html>