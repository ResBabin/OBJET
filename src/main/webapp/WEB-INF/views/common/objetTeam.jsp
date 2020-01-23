<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오브제 팀 소개</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
<link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
<style type="text/css">
	.objetTeam_Intro1 {
		margin-left: 10%;
		margin-right: 10%;
		margin-top: 50px;
		margin-bottom: 50px;
		height: 50%;
		width: 85%;
		
		border: 3px solid green;
	}
	
	.objetTeam_div_intro {
		float: left;
		width: 20%;
	}
	
	.objetTeam_img_intro {
		margin: 20px;
		width: 70%;
		height: 120px;
		border-radius : 50%;
		opacity: 1;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	    align:center;
	}
	
	.objetTeam_h2_intro {
		text-align: center;
	}
	
	.objetTeam_p1_intro {
		text-align: center;
	}
	
	.objetTeam_p2_intro {
		text-align: center;
	}
</style>
</head>
<body>
<c:import url="../headerSearch.jsp" />
<section class="objetTeam_Intro1">
	<div class="objetTeam_div_intro">
		<img src="resources/images/main/KS.jpg" class="objetTeam_img_intro">
			<h2 class="objetTeam_h2_intro">박근수</h2> <br>
			<p class="objetTeam_p1_intro">팀장</p> <br>
			<p class="objetTeam_p2_intro">안녕하세요 박근수입니다.</p>
	</div>
	<div class="objetTeam_div_intro">
		<img src="resources/images/main/MY.jpg" class="objetTeam_img_intro">
			<h2 class="objetTeam_h2_intro">최민영</h2> <br>
			<p class="objetTeam_p1_intro">팀원</p> <br>
			<p class="objetTeam_p2_intro">안녕하세요 최민영입니다.</p>
	</div>
	<div class="objetTeam_div_intro">
		<img src="resources/images/main/YY.jpg" class="objetTeam_img_intro">
			<h2 class="objetTeam_h2_intro">박예은</h2> <br>
			<p class="objetTeam_p1_intro">팀원</p> <br>
			<p class="objetTeam_p2_intro">안녕하세요 박예은입니다.</p>
	</div>
	<div class="objetTeam_div_intro">
		<img src="resources/images/main/YU.jpg" class="objetTeam_img_intro">
			<h2 class="objetTeam_h2_intro">이유진</h2> <br>
			<p class="objetTeam_p1_intro">팀원</p> <br>
			<p class="objetTeam_p2_intro">안녕하세요 이유진입니다.</p>
	</div>
	<div class="objetTeam_div_intro">
		<img src="resources/images/main/ES.jpg" class="objetTeam_img_intro">
			<h2 class="objetTeam_h2_intro">김은솔</h2> <br>
			<p class="objetTeam_p1_intro">팀원</p> <br>
			<p class="objetTeam_p2_intro">안녕하세요 김은솔입니다.</p>
	</div>
</section>
<c:import url="../footer.jsp" />
</body>
</html>