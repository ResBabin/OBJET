<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Objet 시작하기</title>
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
	<p style="font-size: 25pt; padding-top:50px; color:#373737;">오브제 시작하기</p>
	
	<form action="login.do" method="post">
	<div class="field">
          <div class="ui large left icon input" style="width:300px;">
            <i class="user icon"></i><input type="text" name="userid" placeholder="ID">
          </div>
        </div>
        <br>
        
        <div class="field">
          <div class="ui large left icon input" style="width:300px;">
            <i class="lock icon"></i><input type="password" name="userpwd" placeholder="PASSWORD">
          </div>
        </div>
        <br><br><br><br>
        
       <button class="ui black button" type="submit" style="width:300px; height:40px; background: #4c4c4c;">로그인</button>
	</form>
	
	<br>
		<button class="ui grey button" onclick="location.href='moveEnrollPage.do'" style="width:300px;height:40px; background: #aaa;">회원가입</button>
		<br><br><br><br><br><br>
		
		<div class="ui checkbox">
		  <input type="checkbox" name="idSave"><label>아이디 저장</label>
		</div>&emsp;&emsp;&emsp;
		<span style="font-size:9pt;">
			<span onclick="location.href='moveFindUserid.do'">아이디 찾기</span>&ensp;│&ensp;
			<span onclick="location.href='moveFindUserpwd.do'">비밀번호 찾기</span>
		</span>

</div><!-- 로그인 섹션 끝! -->
</body>
</html>