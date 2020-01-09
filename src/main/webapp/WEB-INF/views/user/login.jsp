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
 <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript">
 
		window.onload = function() {
		    if (getCookie("id")) { // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우
		    	document.loginForm.userid.value = getCookie("id"); //input 이름이 id인곳에 getCookie("id")값을 넣어줌
		        document.loginForm.idSave.checked = true; // 체크는 체크됨으로
		    }
		}
		
		function setCookie(name, value, expiredays) //쿠키 저장함수
		{
		    var todayDate = new Date();
		    todayDate.setDate(todayDate.getDate() + expiredays);
		    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
		    //쿠키이름=쿠키값; Domain=도메인값; Path=경로값; Expires=GMT형식의만료일시
		}
		
		function getCookie(Name) { // 쿠키 불러오는 함수
		    var search = Name + "=";
		    if (document.cookie.length > 0) { // if there are any cookies
		        offset = document.cookie.indexOf(search);
		        if (offset != -1) { // if cookie exists
		            offset += search.length; // set index of beginning of value
		            end = document.cookie.indexOf(";", offset); // set index of end of cookie value
		            if (end == -1)
		                end = document.cookie.length;
		            return unescape(document.cookie.substring(offset, end));
		        }
		    }
		}
		
		function sendit() {
		    var frm = document.loginForm;
		    if (!frm.userid.value) { //아이디를 입력하지 않으면.
		        alert("아이디를 입력해주세요.");
		        frm.userid.focus();
		        return;
		    }
		    if (!frm.userpwd.value) { //패스워드를 입력하지 않으면.
		        alert("패스워드를 입력 해주세요.");
		        frm.userpwd.focus();
		        return;
		    }
		
		    if (document.loginForm.idSave.checked == true) { // 아이디 저장을 체크 하였을때
		        setCookie("id", document.loginForm.userid.value, 7); //쿠키이름을 id로 아이디입력필드값을 7일동안 저장
		    } else { // 아이디 저장을 체크 하지 않았을때
		        setCookie("id", document.loginForm.userid.value, 0); //날짜를 0으로 저장하여 쿠키삭제
		    }
		    document.loginForm.submit(); //유효성 검사가 통과되면 서버로 전송.
		
		}
 </script>
</head>
<body>
<!-- 로그인 섹션 시작! -->
<div id="loginSection">
	<p style="font-size: 25pt; padding-top:50px; color:#373737;">오브제 시작하기</p>
	
	<form action="login.do" method="post" name="loginForm" id="loginForm">
	<div class="field">
          <div class="ui large left icon input" style="width:300px;">
            <i class="user icon"></i><input type="text" name="userid" placeholder="ID" required>
          </div>
        </div>
        <br>
        
        <div class="field">
          <div class="ui large left icon input" style="width:300px;">
            <i class="lock icon"></i><input type="password" name="userpwd" placeholder="PASSWORD" required>
          </div>
        </div>
        <br><br><br><br>
        
       <button class="ui black button" id="btnsub" onclick="sendit()" style="width:300px; height:40px; background: #4c4c4c;">로그인</button>
	<br><br>
		<button class="ui grey button" onclick="location.href='moveEnrollPage.do'" style="width:300px;height:40px; background: #aaa;">회원가입</button>
	<br><br>
	<div class="text-center">
		<a href="${naver_url}">
		<img width="300px" height="40px" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" alt="Naver Login"/>
		</a>
	</div>

		<br><br><br><br><br><br>
		
		<div class="ui checkbox">
		  <input type="checkbox" name="idSave" value="saveOk"><label>아이디 저장</label>
		</div>&emsp;&emsp;&emsp;
		<span style="font-size:9pt;">
			<span onclick="location.href='moveFindUserid.do'">아이디 찾기</span>&ensp;│&ensp;
			<span onclick="location.href='moveFindUserpwd.do'">비밀번호 찾기</span>
		</span>
	</form>
</div><!-- 로그인 섹션 끝! -->
</body>
</html>