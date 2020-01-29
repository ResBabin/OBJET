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
		height: 70%;
		width: 85%;
	}
	
	.objetTeam_div_intro {
		float: left;
		width: 20%;
		height: 500px;
	}
	
	.objetTeam_img_intro {
		margin: 20px;
		width: 150px;
		height: 150px;
		border-radius : 50%;
		opacity: 1;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	    object-fit : cover;
	}
	
	.objetTeam_h2_intro {
		text-align: center;
		margin-right: 10%;
		color: orange;
		
	}
	
	.objetTeam_p1_intro {
		text-align: center;
		margin-right: 10%;
		font-size: 15pt;
		font-weight: bold;
	}
	
	.objetTeam_p2_intro {
		text-align: center;
		margin-right: 10%;
		font-size: 12pt;
		color: olive;	
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
			<p class="objetTeam_p2_intro">다녀온 오브제, 관심 오브제 파트 개발자 오브제 이용안내, 오브제 팀 설명은 덤,  <br>도움이 많이 필요한 사나이</p>
	</div>
	<div class="objetTeam_div_intro">
		<img src="resources/images/main/MY.jpg" class="objetTeam_img_intro">
			<h2 class="objetTeam_h2_intro">최민영</h2> <br>
			<p class="objetTeam_p1_intro">팀원</p> <br>
			<p class="objetTeam_p2_intro">후원, 작가홈, 방명록, 피드알림, 팔로우, 팔로잉, 작가들(유저) 관리파트 개발자, 섬세함이 돋보이는 팀원 사실상 팀장</p>
	</div>
	<div class="objetTeam_div_intro">
		<img src="resources/images/main/YY.jpg" class="objetTeam_img_intro">
			<h2 class="objetTeam_h2_intro">박예은</h2> <br>
			<p class="objetTeam_p1_intro">팀원</p> <br>
			<p class="objetTeam_p2_intro">한줄평, 오브제 등록, 오브제 상세보기, 캘린더, 내 오브제 수정,	검색, 오브제 리스트, 작가리스트, 오브제 신고, 전시 감상파트 개발자, 적극적이고 활발한 팀원</p>
	</div>
	<div class="objetTeam_div_intro">
		<img src="resources/images/main/YU.jpg" class="objetTeam_img_intro">
			<h2 class="objetTeam_h2_intro">이유진</h2> <br>
			<p class="objetTeam_p1_intro">팀원</p> <br>
			<p class="objetTeam_p2_intro">공지사항, 고객센터, 문의내역 파트 개발자, 개성넘치고 파이팅 넘치는 팀원</p>
	</div>
	<div class="objetTeam_div_intro">
		<img src="resources/images/main/ES.jpg" class="objetTeam_img_intro">
			<h2 class="objetTeam_h2_intro">김은솔</h2> <br>
			<p class="objetTeam_p1_intro">팀원</p> <br>
			<p class="objetTeam_p2_intro">관리자 전체파트 개발자, 3d vr 전문 개발자, 조용하지만 열심히 자기 몫을 해내는 숨은 에이스</p>
	</div>
</section>
<c:import url="../footer.jsp" />
</body>
</html>