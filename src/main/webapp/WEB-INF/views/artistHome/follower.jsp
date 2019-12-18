<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로워 보기</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">


</script>
</head>
<body>
<!-- 팔로잉 목록 페이지 시작! -->
	<div class="wrapFollowingPage">
	
		<p style="font-size: 23pt; padding-top:50px; color:#373737; text-align:center;">이 작가를 구독하는 <span style="color:#2bddbe;font-size: 23pt;" id="count">12</span>명</p>
		<br><br>
		<center>
		<div style="text-decoration: underline; color: #aaa; margin-top: -30px;">&emsp;&emsp;&emsp;</div>
		<center>
		
		<div class="followingList">
				<table class="eachFollwing">
					<tr>
						<td style="width:10%"><div class="profileImage3" style="background-image:url('resources/images/basicprofilepic.png') "></div></td>
						<td style="width:70%; text-align: left;"><span style="font-size: 15pt;">김맛아몬드</span><br>
																<span style="font-size: 10pt; color:#aaa;">개발자</span></td>
						<td style="width:20%"><button class="small ui teal button" onclick="" style="display:none;">구독중</button>
												<button class="small ui teal basic button" onclick="" >구독하기</button></td>
					<tr>
					
					<tr>
						<td style="width:10%"><div class="profileImage3" style="background-image:url('resources/images/basicprofilepic.png') "></div></td>
						<td style="width:70%; text-align: left;"><span style="font-size: 15pt;">김맛아몬드</span><br>
																<span style="font-size: 10pt; color:#aaa;">개발자</span></td>
						<td style="width:20%"><button class="small ui teal button" onclick="" style="display:none;">구독중</button>
												<button class="small ui teal basic button" onclick="">구독하기</button></td>
					<tr>
				</table>
				
				<br><br>
				<button class="ui grey basic button" style="width:200px;">더 보기</button>		
		</div>
		
		
		
	</div><!-- 팔로잉 목록 페이지 끝! -->
	<br><br><br><br>
</body>
<c:import url="../footer.jsp" />
</html>