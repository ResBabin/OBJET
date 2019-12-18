<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 신고하기</title>
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
	            $("textarea[name=etc]").attr("disabled",false);
	            $("textarea[name=etc]").focus();
	            $("textarea[name=etc]").attr("placeholder","기타 사유를 입력해주세요.(최대 100자)")
	            $("#counter").css("display","block");
	            // radio 버튼의 value 값이 '기타'면 textarea활성화 & 자동포커스 & placeholder & 글자수세기 나오기
	 
	        }else {// 아니라면 text 비활성화&placeholder없음&글자수세기 없음
	              $("textarea[name=etc]").attr("disabled",true);
	              $("textarea[name=etc]").removeAttr("placeholder","기타 사유를 입력해주세요.(최대 100자)")
	              $("#counter").css("display","none");
	           // 이전 기타 textarea작성 값 초기화
		        $("textarea[name=etc]").val("");
		        $("#counter").html("( <span style='color:#4ecdc4;font-size:9pt;'>0</span> / 최대 100자 )");
	            
	        }
    	});
		
		
		// 기타사유 글자수 세기
		 $("#etc").keyup(function(e){
			 var content = $(this).val();
			 $("#counter").html("( <span style='color:#4ecdc4;font-size:9pt;'>"+content.length+"</span> / 최대 100자 )");	// 글자수 실시간 카운팅
			 
			 if(content.length > 100){
				 alert("최대 100자까지만 입력 가능합니다.");
				 $(this).val(content.substring(0,100));
				 $("#counter").html("( <span style='color:red;font-size:9pt;'>100 </span>/ 최대 100자)");
			 } 
			 
		 });
		
	})//documentReady...
 </script>
</head>
<body>

<!-- 작가 신고하기 페이지 시작! -->
 <div class="wrapQuitPage">

	<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">작가 신고하기</p>
	<p class="quitHeader" style="font-weight: 600;">어떤 문제가 있나요?</p>
	<form action="" method="post">
	<div align="center" style="padding-top: 15px;">
			<div class="choiceReportReason">
				<div class="ui form">
					    <div class="field">
					      <div class="ui radio checkbox">
					        <input type="radio" name="quitreason" value="권리침해 및 저작권 침해" checked="checked">
					        <label>권리침해 및 저작권 침해</label>
					      </div>
					    </div>
					    <div class="field">
					      <div class="ui radio checkbox">
					        <input type="radio" name="quitreason" value="명의 도용">
					        <label>명의 도용</label>
					      </div>
					    </div>
					    <div class="field">
					      <div class="ui radio checkbox">
					        <input type="radio" name="quitreason" value="폭력적 위협">
					        <label>폭력적 위협</label>
					      </div>
					    </div>
					    <div class="field">
					      <div class="ui radio checkbox">
					        <input type="radio" name="quitreason" value="부적절한 콘텐츠">
					        <label>부적절한 콘텐츠</label>
					      </div>
					    </div>
					    <div class="field">
					      <div class="ui radio checkbox">
					        <input type="radio" name="quitreason" value="스팸 및 사기">
					        <label>스팸 및 사기</label>
					      </div>
					    </div>
					    <div class="field">
					      <div class="ui radio checkbox">
					        <input type="radio" name="quitreason" value="사생활 침해">
					        <label>사생활 침해</label>
					      </div>
					    </div>
					    <div class="field">
					      <div class="ui radio checkbox">
					        <input type="radio" name="quitreason" value="기타">
					        <label>기타</label>
					      </div>
					    </div>
						    <textarea rows="2" cols="10" name="etc" id="etc" disabled required></textarea>
							<span style="color:#aaa; display: none; font-size:9pt;" id="counter">( <span style="color:#4ecdc4;font-size:9pt;">0</span> / 최대 100자 )</span>
							
			</div>
		</div>
			
		
	</div>

		<br>
		<center>
		<div style="width:515px;">
		<p class="quitHeader" style="font-size: 8pt; color: #aaa; line-height: 12pt;">
			오브제 팀에서는 신고된 작가의 커뮤니티 가이드 위반 여부를 판단하기 위해<br>연중무휴 24시간 검토 작업을 하고 있습니다.
			커뮤니티 가이드를 위반한 계정은 제재를 받게 되며<br>심각하거나 반복적인 위반 행위에 대해서는 계정 해지 조취가 취해질 수 있습니다.
		</p>
		</div>
		<br><br>
		<input type="submit" class="ui green button" value="신고하기" id="btnsub"></a> &nbsp;
		<input type="button" class="ui button" value="취소" onclick="location.href='main.do'"> &nbsp;
	</center>
	</form>
	</div><!-- 작가신고 페이지 끝 -->
	
<br><br><br>

</body>
<c:import url="../footer.jsp" />
</html>