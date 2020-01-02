<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재확인</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 <style type="text/css">
 </style>
 <script type="text/javascript">
 window.onload = function(){
	 $("#userpwd").focus();
 }
 </script>
</head>
<body>
<!-- 로그인 섹션 시작! -->
<div id="loginSection">
		<p style="font-size: 25pt; padding-top:50px; color:#373737;">비밀번호 재확인</p><br>
		<p style="color:#aaa; font-size: 9pt;margin-top: -35px;">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 재확인 합니다.<br><br></p>
	
	<form action="reaffirmUserpwd.do" method="post">
	<div class="field">
          <div class="ui large left icon input" style="width:300px;">
            <i class="user icon"></i><input type="text" name="userid" value="${sessionScope.loginUser.userid }" readonly>
          </div>
        </div>
        <br>
        
        <div class="field">
          <div class="ui large left icon input" style="width:300px;">
            <i class="lock icon"></i><input type="password" name="userpwd" id="userpwd" placeholder="PASSWORD" required>
          </div>
        </div>
        <br><br><br><br>
        
       <button class="ui blue button" type="submit" style="width:300px; height:40px; background: #4c4c4c;">확인</button>
	</form>
	<br><br><br>
	<!-- 비밀번호 재확인 실패 시 문구 표출 -->
	<c:if test="${message != null }">
	<div style="font-size: 10pt; color:red;">${ message }</div>
	</c:if>

</div><!-- 로그인 섹션 끝! -->
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
<c:import url="../footer.jsp" />
</html>