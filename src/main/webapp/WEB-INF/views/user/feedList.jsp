<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피드알림</title>
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

	<!-- 피드알림 페이지 시작 -->
	<div class="wrapFeedList">
		<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">피드알림</p>
			<table class="feedTable">
				<tr>
					<td width="5%"><i class="blue envelope outline icon"></i></td>
					<td width="90%">허니버터아몬드 님이 회원님을 관심작가로 추가하였습니다.<span style="font-size: 9pt; color:#aaa;">&ensp;(19.11.17)</span></td>
					<td width="15%"><i class="trash alternate outline icon" onclick="location.href=''"></i></td>
				</tr>
				<tr>
					<td width="5%"><i class="blue envelope outline icon"></i></td>
					<td width="90%">티라미수아몬드 님이 방명록을 남겼습니다.<span style="font-size: 9pt; color:#aaa;">&ensp;(19.11.05)</span></td>
					<td width="15%"><i class="trash alternate outline icon" onclick="location.href=''"></i></td>
				</tr>
				<tr>
					<td width="5%"><i class="blue envelope outline icon"></i></td>
					<td width="90%">관심오브제 <춘화 속의  동식물> 오픈!<span style="font-size: 9pt; color:#aaa;">&ensp;(19.10.23)</span></td>
					<td width="15%"><i class="trash alternate outline icon" onclick="location.href=''"></i></td>
				</tr>
			</table>
		
	</div>
	<br><br><br>
		<div align="center"><button class="ui medium grey basic button" id="moreFeedList" onclick="">더 보기</button></div>
		
		
<br><br><br><br><br><br><br><br><br><br><br>

</body>
<c:import url="../footer.jsp" />
</html>