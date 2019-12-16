<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<!-- 회원가입 페이지 시작 -->
<div class="wrapEnrollPage">

	<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">내 정보 수정</p>
	
	<!-- 회원정보입력섹션 시작! -->
	<div class="enrollSection">
	<form action="" method="post">
		<table class="enrollTable">
			<tr>
				<th>아이디</th>
				<td style="font-size: 12pt; color:#aaa;"> mychoe
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><div class="ui input" style="width:350px;"><input type="password" id="userpwd" name="userpwd" value="qwerty123" placeholder="영문 소문자/숫자 중 3가지 이상 조합(4자~20자)" required></div>
					<div class="enrolldiv" id="divpwd">암호는 영어소문자와 숫자만으로 4~20자리로 입력해야 합니다.</div>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호 확인</th>
				<td><div class="ui input" style="width:350px;"><input type="password" id="userpwd2" value="qwerty123" placeholder="작성한 비밀번호와 동일하게 입력해주세요." required></div>
					<div class="enrolldiv" id="divpwd2">암호가 일치하지 않습니다. 다시 입력하세요.</div>
				</td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td style="font-size: 12pt; color:#aaa;">최민영
				</td>
			</tr>
			
			<tr>
				<th>닉네임</th>
				<td><div class="ui input" style="width:350px;"><input type="text" id="nickname" name="nickname" value="오브제프로젝트" placeholder="한글 최대 8자, 영문  최대 24자" required></div>&emsp;
									<button class="ui teal button" id="checkNickname">중복확인</button>
									<div class="enrolldiv" id="divid">사용 가능한 닉네임입니다.</div>
				</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td><div class="ui input" style="width:350px;"><input type="email" id="email" name="email" value="objetofficial@objet.com" placeholder="예: objetofficial@objet.com" required></div>
				</td>
			</tr>
			
			<tr>
				<th>휴대폰</th>
				<td><div class="ui input" style="width:350px;"><input type="tel" id="phone" name="phone" value="01033303358" placeholder="숫자만 입력" required></div>
				</td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td style="font-size: 12pt; color:#aaa;">여성
				</td>
			</tr>
		</table>
		
	</div>
	
	<!-- 회원정보입력섹션 끝! -->
	<p style="text-decoration: underline; color:#aaa;padding-top:15px;" onclick="location.href='moveQuitPage.do'">탈퇴하기</p>
		<br>
		<div align="center">
			<input type="submit" class="ui green button" value="수정하기" id="btnsub"></a> &nbsp;
			<input type="reset" class="ui button" value="다시작성"> &nbsp;
		</div>
		</form>
</div>
<!-- 회원가입 페이지 끝 -->
<br><br><br>
</body>
<c:import url="../footer.jsp" />
</html>