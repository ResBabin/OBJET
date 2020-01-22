<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("newLineN", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 후원하기</title>
<c:import url="../header.jsp" />
<c:import url="../headerSearch.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 <!-- 카운터 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="resources/js/jquery.counterup.min.js"></script>

 <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript">

 
 $(function(){
//소개 500자 제한
	 $("#sptcomment").keyup(function(e){
		 var content = $(this).val();
		 $("#counter").html("( <span style='color:#4ecdc4;'>"+content.length+"</span> / 최대 100자 )");	// 글자수 실시간 카운팅
		 
		 if(content.length > 100){
			 alert("최대 100자까지만 입력 가능합니다.");
			 $(this).val(content.substring(0,100));
			 $("#counter").html("( <span style='color:red;'>100 </span>/ 최대 100자)");
		 } 
	 });
	 
// 후원 100원 이상
	 $("#sptamount").focusout(function(){
		 if($(this).val() < 100){
			 alert("후원은 100원부터 가능합니다.");
			 $(this).val('');
		 }
		 return false;
	 });
	 
	 $('.counter').counterUp({
		    delay: 10,
		    time: 1000
		});
	 
	 
	 
 }); // documentReady...
 
 </script>
 <style type="text/css">
 
@font-face {
	font-family: 'Cafe24Oneprettynight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.supportheader {
	font-family: 'Cafe24Oneprettynight';
	font-size: 25pt;
	font-weight: 600;
	line-height: 30pt; 
	margin-top: 20px;
	margin-bottom: 30px;
}
.supportintro{
	font-family: 'Cafe24Oneprettynight';
	font-size: 17pt;
	line-height: 25pt; 
	margin-top: 20px;
	margin-bottom: 30px;
}
</style>
</head>

<body>

<div class="supportWrap">
	<c:if test="${maintype == 1 }">
	<!-- 후원하기 홍보 페이지 ===================================================================================== -->
	<div style="position: relative;">
		<img alt="후원배너" src="resources/support_upfiles/support.jpg" style="width:100%; height:100%;">
			<div style="margin-left: 29%; top:400px; font-size: 1.8em; font-weight: bold; color:white; position: absolute;">
				<p> 현재까지 <span class="counter" style="color:#9bca39; font-size: 30px;"><fmt:formatNumber type="number" value="${countartist }"/></span>명의 작가가 
				<span class="counter" style="color:#9bca39; font-size: 30px;"><fmt:formatNumber type="number" value="${countsupport }"/></span>건의 후원을 받았습니다!</p>
			</div>
	</div>
	
	<br><hr><br>
	<div align="center">
	<div class="supportheader"><i class="Medium quote left icon"></i>&ensp;${support.sptheader}&ensp;<i class="Medium quote right icon"></i></div>
	<div class="supportintro">${fn:replace(support.sptintro, newLineN, "<br>")}</div>
	</div>
	<br><br><br>
		<c:if test="${support.artistid ne loginUser.userid }">
		<form action="goSupport.do" method="post">
		<div id="checkBeforeSupport" style="width:100%;">
			<input type="hidden" name="artistid" value="${support.artistid}">
			<input type="hidden" name="sptid" value="${loginUser.userid }">
				· &nbsp;후&nbsp;원&nbsp;금&nbsp;액&nbsp;:&nbsp;<div class="ui input" style="width:150px;">
				<input type="text" name="sptamount" id="sptamount" placeholder="100원부터 가능" onKeyup="this.value=this.value.replace(/[^0-9]/g, '');" required></div>원<br><br>
				· 응원메시지 : 
				<span class="ui form"><span class="field">
		    						<textarea name="sptcomment" id="sptcomment" placeholder="응원 메시지를 남겨주세요(최대100자)" style="width:80%; height:20px;" required></textarea></span></span>
		
		  		<span style="color:#aaa; font-size: 9pt; vertical-align: bottom;" id="counter">( <span style="color:#4ecdc4">0</span> / 최대 100자 )</span>
		  		
	  	</div>
	  	<br><br>
	  	<div align="center">
				<input type="submit" class="mainBtn" value="후원하기" id="btnsub"> &nbsp;
				<input type="button" class="mainBtn1" onclick="location.href='artistHomeMain.do?userid=${support.artistid}&loginUser=${loginUser.userid}'" value="작가홈이동"> &nbsp;
			</div>
	  	</form>
	  	</c:if>
	  	<c:if test="${support.artistid eq loginUser.userid }">
	  		<div align="center">
				<input type="button" class="mainBtn" value="내용수정" onclick="location.href='moveModifyApplySupport.do?artistid=${support.artistid}'" id="btnsub"> &nbsp;
				<input type="button" class="mainBtn1" onclick="location.href='artistHomeMain.do?userid=${support.artistid}&loginUser=${loginUser.userid}'" value="작가홈이동"> &nbsp;
			</div>
	  	</c:if>
	</c:if>
	
	<c:if test="${maintype == 2 }">
	<!-- 작가 계좌등록 및 후원홍보 작성 페이지 ===================================================================================== -->
	<div style="position: relative;">
		<img alt="후원배너" src="resources/support_upfiles/support2.jpg" style="width:100%; height:100%;">
			<div style="margin-left: 29%; top:400px; font-size: 1.8em; font-weight: bold; color:white; position: absolute;">
				<p> 현재까지 <span class="counter" style="color:#9bca39; font-size: 30px;">${countartist}</span>명의 작가가 
				<span class="counter" style="color:#9bca39; font-size: 30px;">${countsupport}</span>건의 후원을 받았습니다!</p>
		</div>
	</div>

	<br><br><br>
	<div align="center">
		<c:if test="${artistid eq loginUser.userid }">
				<input type="button" class="mainBtn" onclick="location.href='moveApplySupport.do'" value="후원설정하기"> &nbsp;
		</c:if>
		
		<c:if test="${artistid ne loginUser.userid }">
				<input type="button" class="mainBtn" onclick="location.href='moveArtistGuestBook.do?artistid=${artistid}&userid=${loginUser.userid }&currentPage=1'" value="후원설정 제안"> &nbsp;
				<input type="button" class="mainBtn1" onclick="location.href='artistHomeMain.do?userid=${artistid}&loginUser=${loginUser.userid}'" value="작가 홈 이동"> &nbsp;
		</c:if>
	</div>
	</c:if>
	
</div> <!-- supportWrap 끝 -->
<br><br><br>
<c:import url="../footer.jsp" />
</body>
</html>