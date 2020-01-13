<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ userinfo.userid }님의 회원정보 입니다.</title>
<style type="text/css">
body {
	overflow: hidden;
}
</style>
<!-- 시맨틱유아이 cdn -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
</head>
<script type="text/javascript">
$(function() {
	$("#closebtn").click(function() {
		self.close();
	});
});
</script>
<body>
<div align="center" style="padding: 20px;">
<h4 class="ui horizontal divider header">
  ${ userinfo.userid } 님의 회원정보 입니다.
</h4>
<div style="display: flex; border: 1px solid #ddd; padding: 10px;">
<div style="width: 190px; background: #f7f7f7; padding: 20px;">
<h4 style="letter-spacing: 3px;">
ID<br><br>
닉네임<br><br>
이름<br><br>
성별<br><br>
e-mail<br><br>
전화번호<br><br>
가입일<br>
</h4>
</div>
<div style="width: 190px; letter-spacing: 3px; padding: 20px;">
${ userinfo.userid }<br><br>
${ userinfo.nickname }<br><br>
${ userinfo.username }<br><br>
${ userinfo.gender }<br><br>
${ userinfo.email }<br><br>
${ userinfo.phone }<br><br>
${ userinfo.enrolldate }<br>
</div>

</div>
<br>
<button class="ui basic button" id="closebtn">닫기</button>

</div>
</body>
</html>