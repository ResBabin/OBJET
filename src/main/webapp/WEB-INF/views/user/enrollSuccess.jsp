<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오브제 회원가입 완료!</title>
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
		<i class="massive black check circle icon"></i>
		<p style="font-size: 25pt; padding-top:20px; color:#373737; text-align:center;">회원가입이 완료되었습니다.</p>
		<p style="font-size: 15pt; margin-top:-20px; color:#aaa; text-align:center;">나만의 작은 전시회, 오브제를 만나보세요 :)</p>
		<br><br>
		<button class="ui black button" onclick="location.href='moveLogin.do'" style="width:150px; height:40px; background: #4c4c4c;">로그인</button>
		<button class="ui grey button" onclick="location.href=''" style="width:150px;height:40px; background: #aaa;">HOME</button>
	</div>
</div>

</body>
</html>