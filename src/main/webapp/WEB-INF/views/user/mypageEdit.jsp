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
	  	var pwTF = "T";
	 	var pwEq = "T";
	 	var nnTF = "T";
	 	var emTF = "T";
	 
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
			      
			      if($("#userpwd").val() != $("#userpwd2").val()){
				         $("#divpwd2").html("암호가 일치하지 않습니다.");
				         pwEq = "F";
				  }else{
				         $("#divpwd2").html("<span style='color:#48d239;'>암호가 일치합니다.</span>");
				         pwEq = "T";
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
	 			var nickname1 = '<c:out value="${sessionScope.loginUser2.nickname}"/>';
		 		var nickname2 = $("#nickname").val();
	 		if(nickname1 != nickname2) {
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
	 		             else {
	 		                $("#divNickname").html("이미 사용중인 닉네임 입니다.\n다른 닉네임을 입력해주세요.");
	 		               nnTF = "F";
	 		             }
	 		          },
	 		          error: function(request, status, errorData){
	 						console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
	 					}
	 		       });   
	 		     
	 		    
	 		} else {
	 			$("#divNickname").html("<span style='color:#48d239;'>현재 닉네임입니다.</span>");
			nnTF = "T";
		}
	 		 });
		
		
	 		// 이메일 중복체크
	 		 $("#checkEmail").click(function(){
	 			var email1 = '<c:out value="${sessionScope.loginUser2.email}"/>';
		 		var email2 = $("#email").val();
	 		if(email1 != email2) {
	 			 $.ajax({
	 		         url:"checkEmail.do",
	 		         type:"post",
	 		        data:{nickname:$("#email").val()},
	 		         success: function(result){
	 		             if(result == "ok"){
	 		                var emReg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	 		                if(!emReg.test($("#email").val())){
	 		                   $("#divEmail").html("이메일 형식에 맞지않습니다. 다시 입력해 주세요.");
	 		                  emTF = "F";
	 		                }else{
	 		                   $("#divEmail").html("<span style='color:#48d239;'>사용 가능한 이메일 입니다.</span>");
	 		                  emTF = "T";
	 		                }
	 		             }
	 		             else{
	 		                $("#divEmail").html("이미 사용중인 이메일 입니다. 다른 이메일을 입력해주세요.");
	 		               emTF = "F";
	 		             }
	 		          },
	 		          error: function(request, status, errorData){
	 						console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
	 					}
	 		       });    
	 		} else {
	 			$("#divEmail").html("<span style='color:#48d239;'>현재 이메일 입니다.</span>");
	 			emTF = "T";
		}
	 		 });
	 		
	 		
		
 		// 수정하기 버튼 눌렀을 때
 		 $("#btnsub").click(function(){
 		      if(pwTF=="T" && pwEq=="T" && nnTF=="T" && emTF=="T" ){
 		    	 return true;
 		      }else{
 		         alert("입력한 내용을 다시 확인해주세요.");
 		         return false
 		      }
 		   });
	 	
 }); // document Ready...
 

 </script>
</head>
<body>
<!-- 내정보수정 페이지 시작 -->
<div class="wrapEnrollPage">

	<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">내 정보 수정</p>
	<form action="updateMyPage.do" method="post">
	<input type="hidden" name="userid" id="userid" value="${loginUser2.userid}">
	<!-- 내정보수정 섹션 시작! -->
	<div class="enrollSection">
	
		<table class="enrollTable">
			<tr>
				<th>아이디</th>
				<td style="font-size: 12pt; color:#aaa;"> ${loginUser2.userid}
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><div class="ui input" style="width:350px;"><input type="password" id="userpwd" name="userpwd" value="${loginUser2.userpwd}" placeholder="영문/숫자/특수문자 각 1개 이상 포함하여 8-20자" required></div>
					<div class="enrolldiv" id="divpwd"></div>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호 확인</th>
				<td><div class="ui input" style="width:350px;"><input type="password" id="userpwd2" value="${loginUser2.userpwd}" placeholder="작성한 비밀번호와 동일하게 입력해주세요." required></div>
					<div class="enrolldiv" id="divpwd2"></div>
				</td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td style="font-size: 12pt; color:#aaa;">${loginUser2.username}
				</td>
			</tr>
			
			<tr>
				<th>닉네임</th>
				<td><div class="ui input" style="width:350px;"><input type="text" id="nickname" name="nickname" value="${loginUser2.nickname}" placeholder="한글 최대 8자, 영문  최대 24자" required></div>&emsp;
									<input type="button" class="ui teal button" value="중복확인" id="checkNickname"/>
									<div class="enrolldiv" id="divNickname"></div>
				</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td><div class="ui input" style="width:350px;"><input type="email" id="email" name="email" value="${loginUser2.email}" placeholder="예: objetofficial@objet.com" required></div>&emsp;
									<input type="button" class="ui teal button" value="중복확인" id="checkEmail"/>
									<div class="enrolldiv" id="divEmail"></div>
				</td>
			</tr>
			
			<tr>
				<th>휴대폰</th>
				<td><div class="ui input" style="width:350px;"><input type="text" id="phone" name="phone" value="${loginUser2.phone}" placeholder="숫자만 입력" required></div>
				</td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td style="font-size: 12pt; color:#aaa;"><c:if test="${loginUser2.gender eq 'F'}">여성</c:if>
														<c:if test="${loginUser2.gender eq 'M'}">남성</c:if>
				</td>
			</tr>
		</table>
		
	</div>
	
	<!-- 회원정보입력섹션 끝! -->
	<p style="text-decoration: underline; color:#aaa;padding-top:15px; font-size: 10pt;" onclick="location.href='moveQuitPage.do'">탈퇴하기</p>
		<br>
		<div align="center">
			<input type="submit" class="ui green button" value="수정하기" id="btnsub"> &nbsp;
			<input type="reset" class="ui button" value="다시작성"> &nbsp;
		</div>
	</form>	
</div>

<!-- 회원가입 페이지 끝 -->
<br><br><br>
</body>
<c:import url="../footer.jsp" />
</html>