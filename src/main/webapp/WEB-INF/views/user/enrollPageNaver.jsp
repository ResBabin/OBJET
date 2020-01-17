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

 	var nnTF = "F";

 	
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

 	
 	// 가입하기 버튼 눌렀을 때
 		 $("#btnsub").click(function(){
 		      if(nnTF=="T")
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

	<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">간편 회원가입 추가정보</p>
	
	<!-- 회원정보입력섹션 시작! -->
	
	<div style="align:center; background: #f6f6f6; width: 100%; height: 400px; margin-top: 40px;">
	<form action="insertUsers.do" method="post">
			<input type="hidden" name="usertype" value="USER">
			<input type="hidden" name="userid" value="${naverid }">	
			<input type="hidden" name="naverid" value=${naverid }>
			<input type="hidden" name="username" value=${username }>
			<input type="hidden" name="email" value=${email }>
			<input type="hidden" name="gender" value=${gender }>
			<input type="hidden" name="userpwd" value="NaverLoginPassword">
		<table class="enrollTable">
			<tr>
				<th>아이디</th>
				<td><p style="color:red;">네이버 계정으로 가입 시 자동 발급</p>				
				</td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td>${username}
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
				<td>${email}
				
				</td>
			</tr>
			
			<tr>
				<th>휴대폰</th>
				<td><div class="ui input" style="width:350px;"><input type="tel" id="phone" name="phone" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g, '');" required></div>
				</td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td><c:if test="${gender eq 'F' }">여성</c:if>
					<c:if test="${gender eq 'M' }">남성</c:if>
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
		<input type="submit" class="ui green button" value="가입하기" id="btnsub" disabled> &nbsp;
		<input type="reset" class="ui button" value="다시작성"> &nbsp;
	</div>
	</form>
</div>

<!-- 회원가입 페이지 끝 -->
<br><br><br><br>
</body>
<c:import url="../footer.jsp" />
</html>