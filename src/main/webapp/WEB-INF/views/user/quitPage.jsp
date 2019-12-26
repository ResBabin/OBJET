<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오브제 탈퇴하기</title>
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
		
		// 기타 선택 시에만 textarea 활성화
		$("input:radio[name=quitreason]").click(function(){
	        if($("input[name=quitreason]:checked").val() == "기타"){
	            $("textarea[name=quitreasonDetail]").attr("disabled",false);
	            $("textarea[name=quitreasonDetail]").focus();
	            $("textarea[name=quitreasonDetail]").attr("placeholder","기타 사유를 입력해주세요.(최대 100자)")
	            $("#counter").css("display","block");
	            // radio 버튼의 value 값이 '기타'면 textarea활성화 & 자동포커스 & placeholder & 글자수세기 나오기
	 
	        }else {// 아니라면 text 비활성화&placeholder없음&글자수세기 없음
	        	$("textarea[name=quitreasonDetail]").val("");
	              $("textarea[name=quitreasonDetail]").attr("disabled",true);
	              $("textarea[name=quitreasonDetail]").removeAttr("placeholder","기타 사유를 입력해주세요.(최대 100자)")
	              $("#counter").css("display","none");
	          	 // 이전 기타 textarea작성 값 초기화
			        $("textarea[name=quitreasonDetail]").val("");
			        $("#counter").html("( <span style='color:#4ecdc4;font-size:9pt;'>0</span> / 최대 100자 )");
	            
	        }
    	});
		
		
		// 기타사유 글자수 세기
		 $("#quitreasonDetail").keyup(function(e){
			 var content = $(this).val();
			 $("#counter").html("( <span style='color:#4ecdc4;font-size:9pt;'>"+content.length+"</span> / 최대 100자 )");	// 글자수 실시간 카운팅
			 
			 if(content.length > 100){
				 alert("최대 100자까지만 입력 가능합니다.");
				 $(this).val(content.substring(0,100));
				 $("#counter").html("( <span style='color:red;font-size:9pt;'>100 </span>/ 최대 100자)");
			 } 
			 
		 });
		
		
		// 동의 체크 시에만 탈퇴하기 버튼 활성화
			$("#agree").click(function(){
				if($(this).is(":checked")){
					$("#btnsub").removeAttr('disabled');
				}else{
					$("#btnsub").attr("disabled", true);
				}	
			});
	})//documentReady...
 </script>
</head>
<body>
<form action="updateQuitUser.do" method="post">
<input type="hidden" name="userid" value=${sessionScope.loginUser.userid }>
 <div class="wrapQuitPage">

	<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">오브제 탈퇴하기</p>
	<p class="quitHeader" style="font-weight: 600;">오브제를 탈퇴하시는 이유는 무엇인가요?</p>
	<p class="quitHeader" style="font-size: 8pt; color: #aaa;">회원님께서 오브제를 탈퇴하시는 이유를 알려주시면 보다 좋은 서비스제공을 위해 노력하겠습니다.</p>
	
	<div align="center" style="padding-top: 15px;">
		
			<div class="choiceQuitReason">
				<div class="ui form">
					    <div class="field">
					      <div class="ui radio checkbox">
					        <input type="radio" name="quitreason" value="사생활 기록 삭제 목적" checked="checked">
					        <label>사생활 기록 삭제 목적</label>
					      </div>
					    </div>
					    <div class="field">
					      <div class="ui radio checkbox">
					        <input type="radio" name="quitreason" value="서비스 기능 불편">
					        <label>서비스 기능 불편</label>
					      </div>
					    </div>
					    <div class="field">
					      <div class="ui radio checkbox">
					        <input type="radio" name="quitreason" value="새 아이디 생성 목적">
					        <label>새 아이디 생성 목적</label>
					      </div>
					    </div>
					    <div class="field">
					      <div class="ui radio checkbox">
					        <input type="radio" name="quitreason" value="개인정보 및 보안 우려">
					        <label>개인정보 및 보안 우려</label>
					      </div>
					    </div>
					    <div class="field">
					      <div class="ui radio checkbox">
					        <input type="radio" name="quitreason" value="기타">
					        <label>기타</label>
					      </div>
					    </div>
						    <textarea rows="2" cols="10" name="quitreasonDetail" id="quitreasonDetail" disabled required></textarea>
							<span style="color:#aaa; display: none; font-size:9pt;" id="counter">( <span style="color:#4ecdc4;font-size:9pt;">0</span> / 최대 100자 )</span>
							
			</div>
		</div>
			
		
	</div>

		<br> <br>
		<p class="quitHeader" style="font-size: 8pt; color: #aaa;">
		
			탈퇴하시면 이용 중인 오브제가 폐쇄되며, 
			<span style="color: red; font-size: 8pt;">모든 데이터는 복구가 불가능합니다.</span>
		</p>
		<p class="quitHeader" style="font-size: 8pt; color: #aaa;">
		아래 사항을 확인하신 후에 신중하게 결정해 주세요.</p>
		<br><br>
	<center>
		<div id="checkBeforeQuit">
		· 제작한 전시회, 첨부파일 등 모든 정보가 삭제됩니다.<br>
		· 오브제 프로필 및 연결된 SNS 정보 등이 모두 삭제됩니다.<br>
		· 관심작가, 관심전시회, 다녀온 전시회 등 모든 정보가 삭제 됩니다.<br>
		· 30일 동안 동일한 아이디와 닉네임으로 오브제 재가입이 불가능합니다.<br>
		· 작성한 댓글은 삭제되지 않고 남게 되오니 탈퇴 전 미리 확인하시기 바랍니다.<br>
		· 가입 시 입력한 정보는 탈퇴 후 30일간 보관한 뒤에 삭제됩니다.
		</div>
		<br>
		<input type="checkbox" id="agree"><label>&ensp;안내사항을 모두 확인하였으며, 이에 동의합니다.</label>
		<br><br><br>
		<input type="submit" class="ui green button" value="탈퇴하기" id="btnsub" disabled></a> &nbsp;
		<input type="button" class="ui button" value="취소" onclick="location.href='main.do'"> &nbsp;
		
	</center>
	</div><!-- 탈퇴페이지 끝 -->
	</form>
<br><br>

</body>
<c:import url="../footer.jsp" />
</html>