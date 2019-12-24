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
 <script type="text/javascript">
 $(function(){
	 
	// 내정보수정 유효성 체크
	  	var pwTF = "F";
	 	var pwEq = "F";
	 	var nnTF = "F";
	 
	 // 비밀번호 유효성 체크
		   $("#userpwd").keyup(function(){
			      var pwdReg = /^(?=.*[a-z])(?=.*\d)(?=.*[$@$!%*#?&])[a-zA-Z\d$@$!%*#?&]{8,20}$/;    //비밀번호 유효성 - 영어/숫자/특수문자
			      if(!pwdReg.test($("#userpwd").val())){
			         $("#divpwd").html("영문/숫자/특수문자 각 1개씩 포함 8~20자로 입력해야 합니다.");
			         pwTF = "F";
			      }
			      else{
			         $("#divpwd").html("<span style='color:#48d239;'>사용 가능한 암호입니다.</span>");
			         pwTF = "T";
			      }
			     
			   });
			   
	 	// 비밀번호 일치 확인
		   $("#userpwd2").keyup(function(){
		      if($("#userpwd").val() != $("#userpwd2").val()){
		         $("#divpwd2").html("암호가 일치하지 않습니다.");
		         pwEq = "F";
		      }
		      else{
		         $("#divpwd2").html("<span style='color:#48d239;'>암호가 일치합니다.</span>");
		         pwEq = "T";
		      }
		      return false;
		   });
	 	
		// 닉네임 중복체크
	 		 $("#checkNickname").click(function(){
	 			 $.ajax({
	 		         url:"checkNickname.do",
	 		         type:"post",
	 		         data:{nickname:$("#nickname").val()},
	 		         success: function(result){
	 		             if(result == "ok"){
	 		                var nnReg = /^[가-힣a-z0-9]{1,8}$/;
	 		                if(!nnReg.test($("#nickname").val())){
	 		                   $("#divNickname").html("한글/영소문자/숫자만 가능합니다(최대 8자).");
	 		                  nnTF = "F";
	 		                }else{
	 		                   $("#divNickname").html("<span style='color:#48d239;'>사용 가능한 닉네임 입니다.</span>");
	 		                  nnTF = "T";
	 		                }
	 		             }
	 		             else{
	 		                $("#divNickname").html("이미 사용중인 닉네임 입니다.\n다른 닉네임을 입력해주세요.");
	 		               nnTF = "F";
	 		             }
	 		          },
	 		          error: function(request, status, errorData){
	 						console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
	 					}
	 		       });   
	 		       return false;
	 		    });
		
	 		// 수정하기 버튼 눌렀을 때
	 		 $("#btnsub").click(function(){
	 		      if(pwTF=="T" && pwEq=="T" && nnTF = "T")
	 		         return true;
	 		      else{
	 		         alert("입력한 내용을 다시 확인해주세요.");
	 		         return false;
	 		      }
	 		   });
	 		
 }); // document Ready
 
 </script>
</head>
<body>
<!-- 내정보수정 페이지 시작 -->
<div class="wrapEnrollPage">

	<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">내 정보 수정</p>
	
	<!-- 내정보수정 섹션 시작! -->
	<div class="enrollSection">
	<form action="updateMyPage.do" method="post">
		<table class="enrollTable">
			<tr>
				<th>아이디</th>
				<td style="font-size: 12pt; color:#aaa;"> ${user.userid}
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><div class="ui input" style="width:350px;"><input type="password" id="userpwd" name="userpwd" value="${user.userpwd}" placeholder="영문/숫자/특수문자 각 1개 이상 포함하여 8-20자" required></div>
					<div class="enrolldiv" id="divpwd"></div>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호 확인</th>
				<td><div class="ui input" style="width:350px;"><input type="password" id="userpwd2" value="${user.userpwd}" placeholder="작성한 비밀번호와 동일하게 입력해주세요." required></div>
					<div class="enrolldiv" id="divpwd2"></div>
				</td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td style="font-size: 12pt; color:#aaa;">${user.username}
				</td>
			</tr>
			
			<tr>
				<th>닉네임</th>
				<td><div class="ui input" style="width:350px;"><input type="text" id="nickname" name="nickname" value="${user.nickname}" placeholder="한글 최대 8자, 영문  최대 24자" required></div>&emsp;
									<button class="ui teal button" id="checkNickname">중복확인</button>
									<div class="enrolldiv" id="divNickname"></div>
				</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td><div class="ui input" style="width:350px;"><input type="email" id="email" name="email" value="${user.email}" placeholder="예: objetofficial@objet.com" required></div>
				</td>
			</tr>
			
			<tr>
				<th>휴대폰</th>
				<td><div class="ui input" style="width:350px;"><input type="tel" id="phone" name="phone" value="${user.phone}" placeholder="숫자만 입력" required></div>
				</td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td style="font-size: 12pt; color:#aaa;"><c:if test="${user.gender eq 'F'}">여성</c:if>
														<c:if test="${user.gender eq 'M'}">남성</c:if>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<!-- 회원정보입력섹션 끝! -->
	<p style="text-decoration: underline; color:#aaa;padding-top:15px; font-size: 10pt;" onclick="location.href='moveQuitPage.do'">탈퇴하기</p>
		<br>
		<div align="center">
			<input type="submit" class="ui green button" value="수정하기" id="btnsub"> &nbsp;
			<input type="reset" class="ui button" value="다시작성"> &nbsp;
		</div>
		
</div>

<!-- 회원가입 페이지 끝 -->
<br><br><br>
</body>
<c:import url="../footer.jsp" />
</html>