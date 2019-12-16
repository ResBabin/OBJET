<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오브제 회원가입</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript">
 $(function(){
	// 체크박스 전체선택 및 전체해제
	$("#allCheck").click(function(){
		if($(this).is(":checked")){
			$(".chk").prop("checked", true);
		} else {
			$(".chk").prop("checked", false);
		}
	});

	// 한개 체크박스 선택 해제시 전체선텍 체크박스도 해제 & 약관 전체동의 시에만 가입하기 버튼 활성화
	$(".chk").click(function(){
		if($("input[name='RowCheck']:checked").length == 2){
			$("#allCheck").prop("checked", true);
			$("#btnsub").removeAttr('disabled');
		}else{
			$("#allCheck").prop("checked", false);
			$("#btnsub").attr("disabled", true);
		}	
	});
	
}); // document.ready...



window.open('', '', ', height=300, width=200, left='+ popupX + ', top='+ popupY);

// 이용약관 팝업
function winOpen1(){
	window.open('terms1.html', '이용약관', 'left='+(screen.availWidth-400)/2 + ',top='+(screen.availHeight-600)/2+', width=400px,height=600px');
}

// 개인정보처리방침 팝업
function winOpen2(){
	window.open('terms2.html', '개인정보처리방침', 'left='+(screen.availWidth-400)/2 + ',top='+(screen.availHeight-600)/2+', width=400px,height=600px');
}
	
 </script>
</head>
<body>
<!-- 회원가입 페이지 시작 -->
<div class="wrapEnrollPage">

	<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">오브제 회원가입</p>
	
	<!-- 회원정보입력섹션 시작! -->
	<div class="enrollSection">
	<form action="" method="post">
		<table class="enrollTable">
			<tr>
				<th>아이디</th>
				<td><div class="ui input" style="width:350px;"><input type="text" id="userid" name="userid" placeholder="영문소문자/숫자, 8~12자" required></div>&emsp;
									<button class="ui teal button" id="checkId">중복확인</button>
									<div class="enrolldiv" id="divid">사용 가능한 아이디입니다.</div>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><div class="ui input" style="width:350px;"><input type="password" id="userpwd" name="userpwd" placeholder="영문 소문자/숫자 중 3가지 이상 조합(4자~20자)" required></div>
					<div class="enrolldiv" id="divpwd">암호는 영어소문자와 숫자만으로 4~20자리로 입력해야 합니다.</div>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호 확인</th>
				<td><div class="ui input" style="width:350px;"><input type="password" id="userpwd2" placeholder="작성한 비밀번호와 동일하게 입력해주세요." required></div>
					<div class="enrolldiv" id="divpwd2">암호가 일치하지 않습니다. 다시 입력하세요.</div>
				</td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td><div class="ui input" style="width:350px;"><input type="text" id="username" name="username" placeholder="한글만 가능(최대 5자)" required></div>
				</td>
			</tr>
			
			<tr>
				<th>닉네임</th>
				<td><div class="ui input" style="width:350px;"><input type="text" id="nickname" name="nickname" placeholder="한글 최대 8자, 영문  최대 24자" required></div>&emsp;
									<button class="ui teal button" id="checkNickname">중복확인</button>
									<div class="enrolldiv" id="divid">사용 가능한 닉네임입니다.</div>
				</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td><div class="ui input" style="width:350px;"><input type="email" id="email" name="email" placeholder="예: objetofficial@objet.com" required></div>
				</td>
			</tr>
			
			<tr>
				<th>휴대폰</th>
				<td><div class="ui input" style="width:350px;"><input type="tel" id="phone" name="phone" placeholder="숫자만 입력" required></div>
				</td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="F" checked="checked" required><label>&ensp;여성</label>&emsp;&emsp;&emsp;
					<input type="radio" name="gender" value="M" required><label>&ensp;남성</label>
				</td>
			</tr>
		</table>
	</div>
	<!-- 회원정보입력섹션 끝! -->
	
	<!-- 약관동의섹션 -->
	<div class="termsSection">
		<p style="font-size:15pt; font-weight:600; padding:15px;">이용약관동의<span style="color:red"> *</span>
		<span style="font-size: 9pt; color:#aaa; font-weight: 200;">이용약관에 동의하지 않은 경우, 회원가입 및 서비스 이용이 불가능 합니다.</span></p>
		<div class="termsCheck">
			<input type="checkbox" class="chk" id="allCheck"/> <span style="font-weight: 600;">전체 동의</span><br>
			&emsp;<input type="checkbox" class="chk" name="RowCheck"> 이용약관<span class="termsCheckLabel"> (필수)</span>&ensp;<a onclick="winOpen1();">약관보기▶</a><br>
			&emsp;<input type="checkbox" class="chk" name="RowCheck"> 개인정보처리방침<span class="termsCheckLabel"> (필수)</span>&ensp;<a onclick="winOpen2();">약관보기▶</a>
		</div>
	</div>
	<br><br><br>
	<div align="center">
		<input type="submit" class="ui green button" value="가입하기" id="btnsub" disabled></a> &nbsp;
		<input type="reset" class="ui button" value="다시작성"> &nbsp;
		<br><a href="moveEnrollSuccess.do">회원가입완료 임시이동</a>
	</div>
	</form>
		<br><br>
		
</div>
<!-- 회원가입 페이지 끝 -->
<br>
</body>
<c:import url="../footer.jsp" />
</html>