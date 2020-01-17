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
	 
	// 회원가입 유효성 체크
	var idTF = "F";
  	var pwTF = "F";
 	var pwEq = "F";
 	var unTF = "F";
 	var emTF = "F";
	 
 	
 	// 아이디 중복체크
	 $("#checkId").click(function(){
		 $.ajax({
	         url:"checkId.do",
	         type:"post",
	         data:{userid:$("#userid").val()},
	         success: function(result){
	             if(result == "ok"){
	                var idReg = /^(?=.*[a-z])[a-z0-9]{6,15}$/;     
	                if(!idReg.test($("#userid").val())){
	                   $("#divid").html("영어소문자와 숫자만으로 6~15자리로 입력해야 합니다.");
	                   idTF = "F";
	                }else{
	                   $("#divid").html("<span style='color:#48d239;'>사용 가능한 아이디입니다.</span>");
	                   idTF = "T";
	                }
	             }
	             else{
	                $("#divid").html("이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요.");
	                idTF = "F";
	             }
	          },
	          error: function(request, status, errorData){
					console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
				}
	       });   
	       return false;
	    });
 	
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
 	
 	
 	// 이름 한글만 입력 
 		$("#username").keyup(function(){
		      var pwdReg = /^[가-힣]{2,5}$/;    //한글만 2~5자입력
		      if(!pwdReg.test($("#username").val())){
		         $("#divusername").html("한글만 2~5자 입력 가능합니다");
		         unTF = "F";
		      }
		      else{
		         $("#divusername").html("<span style='color:#48d239;'>사용 가능합니다.</span>");
		         unTF = "T";
		      }
		     
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
 		                $("#divNickname").html("이미 사용중인 닉네임 입니다. 다른 닉네임을 입력해주세요.");
 		               nnTF = "F";
 		             }
 		          },
 		          error: function(request, status, errorData){
 						console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
 					}
 		       });   
 		       return false;
 		    });
 	
 		// 이메일 중복체크
 		 $("#checkEmail").click(function(){
 			 $.ajax({
 		         url:"checkEmail.do",
 		         type:"post",
 		         data:{email:$("#email").val()},
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
 		       return false;
 		    });
 	
 	// 가입하기 버튼 눌렀을 때
 		 $("#btnsub").click(function(){
 		      if(idTF=="T" && pwTF=="T" && pwEq=="T" && unTF=="T" && nnTF=="T" && emTF=="T")
 		         return true;
 		      else{
 		         alert("입력한 내용을 다시 확인해주세요.");
 		         return false;
 		      }
 		   });
	
	 
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
	<form action="insertUsers.do" method="post">
			<input type="hidden" name="usertype" value="USER">
		<table class="enrollTable">
			
			<tr>
				<th>아이디</th>
				<td><div class="ui input" style="width:350px;"><input type="text" id="userid" name="userid" placeholder="영문소문자/숫자, 8~12자" required></div>&emsp;
									<button class="mainBtn" id="checkId">중복확인</button>
									<div class="enrolldiv" id="divid"></div>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><div class="ui input" style="width:350px;"><input type="password" id="userpwd" name="userpwd" placeholder="영문/숫자/특수문자 각 1개 이상 포함하여 8-20자" required></div>
					<div class="enrolldiv" id="divpwd"></div>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호 확인</th>
				<td><div class="ui input" style="width:350px;"><input type="password" id="userpwd2" placeholder="작성한 비밀번호와 동일하게 입력해주세요." required></div>
					<div class="enrolldiv" id="divpwd2"></div>
				</td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td><div class="ui input" style="width:350px;"><input type="text" id="username" name="username" placeholder="한글만 가능(최대 5자)" required></div>
					<div class="enrolldiv" id="divusername"></div>
				</td>
			</tr>
			
			<tr>
				<th>닉네임</th>
				<td><div class="ui input" style="width:350px;"><input type="text" id="nickname" name="nickname" placeholder="한글/영소문자/숫자만 가능(최대 8자)" required></div>&emsp;
									<input type="button" class="mainBtn" value="중복확인" id="checkNickname">
									<div class="enrolldiv" id="divNickname"></div>
				</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td><div class="ui input" style="width:350px;"><input type="email" id="email" name="email" placeholder="예: objetofficial@objet.com" required></div>&emsp;
									<input type="button" class="mainBtn" value="중복확인" id="checkEmail">
									<div class="enrolldiv" id="divEmail"></div>
				
				</td>
			</tr>
			
			<tr>
				<th>휴대폰</th>
				<td><div class="ui input" style="width:350px;"><input type="tel" id="phone" name="phone" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g, '');" required></div>
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
	</div>
	</form>
</div>

<!-- 회원가입 페이지 끝 -->

</body>
<c:import url="../footer.jsp" />
</html>