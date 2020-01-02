<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
<!-- 비밀번호 찾기 섹션 시작! -->
<div id="loginSection">
	<p style="font-size: 25pt; padding-top:50px; color:#373737;">비밀번호 찾기</p>
	<br>
	
	<form action="findUserpwd.do" method="post">
	<input type="hidden" name="userpwd" value="">
		<div class="field">
	        <div class="ui large left icon input" style="width:300px;">
	          <i class="id badge icon"></i><input type="text" name="username" placeholder="이름">
	        </div>
	     </div>
	     <br>
	     
		<div class="field">
	        <div class="ui large left icon input" style="width:300px;">
	          <i class="user icon"></i><input type="text" name="userid" placeholder="아이디">
	        </div>
	     </div>
        	<br>
        	
        <div class="field">
          <div class="ui large left icon input" style="width:300px;">
            <i class="envelope icon"></i><input type="text" name="email" placeholder="이메일">
          </div> 
        </div>
        <br><br><br><br>
        
       <button class="ui black button" type="submit" style="width:300px; height:40px; background: #4c4c4c;">찾기</button>
	</form>
	
	<br><br><br><br><br><br><br><br>
		<span style="font-size:9pt;">
			<span onclick="location.href='moveFindUserid.do'">아이디 찾기</span>&ensp;│&ensp;
			<span onclick="location.href='main.do'">오브제 홈</span>
		</span>
	

</div><!-- 로그인 섹션 끝! -->
</body>
</html>