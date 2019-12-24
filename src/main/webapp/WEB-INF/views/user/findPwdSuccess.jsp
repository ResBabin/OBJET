<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 성공!</title>
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 <style type="text/css">
 body{
	background-image:url("resources/images/objetLogin.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
 }
 </style>
</head>
<body>
<!-- 로그인 섹션 시작! -->
<div id="loginSection">
	<p style="font-size: 25pt; padding-top:50px; color:#373737;">비밀번호 찾기</p>
       
        <div><i class=" huge teal clipboard check icon"></i><p class="findResultContent1">임시 비밀번호가 발급되었습니다.</p></div>
        
        <p style="font-size: 9pt;">로그인 후 임시 비밀번호를 꼭 변경해주세요!</p>
        <p class="findResultContent2">임시비밀번호 : <c:out value="${findPwd.userpwd}"/></p>
        <br><br><br>
       <button class="ui black button" onclick="location.href='moveLogin.do'" style="width:300px; height:40px; background: #4c4c4c;">로그인</button>
	
	<br>
		
		

</div><!-- 로그인 섹션 끝! -->
</body>
</html>