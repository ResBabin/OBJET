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
<title>감사메시지</title>
<c:import url="../header.jsp" />
<c:import url="../headerSearch.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript">
 </script>
  <style type="text/css">
@font-face {
	font-family: 'OTEnjoystoriesBA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/OTEnjoystoriesBA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.msg {
	font-family: 'OTEnjoystoriesBA';
	font-size: 25pt;
	font-weight: 600;
	line-height: 30pt;
	margin-top: 20px;
	margin-bottom: 30px;
}

.msg1 {
	font-family: 'OTEnjoystoriesBA';
	font-size: 25pt;
	font-weight: 600;
	line-height: 30pt;
	margin-top: 20px;
	margin-bottom: 30px;
}
</style>

</head>

<body>

<div class="wrapSupportList">

	<div align="center">
	<div style="position: relative;">
			<img alt="후원감사메시지" src="resources/support_upfiles/thanksmsg.jpg">
				<div style="top:150px; padding-left: 18%; padding-right: 18%;font-size: 1.8em; font-weight: bold; color:black; position: absolute;">
					<p class="msg" style="text-align: left;">To. ${loginUser.nickname}님께:)</p><br><br>
					<p class="msg1">${fn:replace(thanksmsg, newLineN, "<br>")}</p>
					<br><br>
					<p class="msg" style="text-align: right;">From. ${artistnickname} 드림</p>

				</div>
	</div>
	
	<br><br><br>
	
	<input type="button" class="mainBtn" onclick="location.href='main.do'" value="오브제 홈"> &nbsp;
				<input type="button" class="mainBtn1" onclick="location.href='artistHomeMain.do?userid=${artistid}&loginUser=${loginUser.userid}'" value="작가 홈 이동"> &nbsp;
				
</div>
		
		
</div> <!-- supportWrap 끝 -->
<c:import url="../footer.jsp" />
</body>
</html>