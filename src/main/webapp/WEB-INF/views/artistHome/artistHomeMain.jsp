<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오브제프로젝트의 오브제</title>
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 
 
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
    //Tab 메뉴
   $("#artistMenu #item").on("click", function(){
      $("#artistMenu #item").removeClass('active');
      $(this).addClass("active");
     
      var tab = $(this).attr("data-tab");
	  $(".tab").removeClass("active");
	  $(".tab[data-tab=\"" + tab + "\"]").addClass("active");
   });
    

    // 점점점 버튼 클릭 시 버튼 보이기
    $("#profileMenu").on("click", function(){
    	if($("#ProfileMenuBtn").css("display")=="none"){	// 클릭 안한 상태이면
    		$("#ProfileMenuBtn").show();
    	}else{		// 클릭한 상태면
    		$("#ProfileMenuBtn").hide();
    	}
    });
    
    
    // 작가 연결 계정 사이트 이동
    $("div.artistURL").click(function(){
		window.open($(this).attr("value"), '_blank'); 
		return false;
	});

	});
</script>
</head>
<body>

<!-- 작가홈 시작 -->
<div class="wrapHome">

	<!-- 상단 프로필 부분 -->
	<div class="wrapProfile">
		<!-- 프로필 글자부분 -->
		<div class="profileTextSection">
		<span>
			<p class="profileText" style="font-size: 25px; color:#373737;">오브제프로젝트</p>
			<p class="profileText" style="font-size: 10pt; color:#aaa;">작전조</p>
			<br><br>
		</span>
			<table>
				<tr><td style="width:100px; font-size: 10pt; color: #aaa;">구독자</td>
					<td style="width:100px; font-size: 10pt; color: #aaa;">관심작가</td>
				<tr><td style="font-size: 17pt;color: #9c9c9c;">12</td>
					<td style="font-size: 17pt;color: #9c9c9c;">34</td></tr>
			</table>
		</div>
		
		<!-- 프로필 사진부분 -->
		<div class="profileImageSection">
			<div class="profileImage" style="background-image:url('resources/images/basicprofilepic.png') "></div>
			<br><br><br><br><br><br><br><br>
			<button class="mini ui teal button" onclick="">전시일정</button>
			<button class="mini ui teal button" onclick="" style="display:none;">구독중</button>
			<button class="mini ui teal basic button" onclick="" style="display:inline">구독하기</button>
			<i class="grey ellipsis vertical icon" id="profileMenu"></i>
		</div>
		
		<!-- 프로필 메뉴 버튼 클릭 시 버튼 나타날 영역 -->
		<div class="profileMenuOpen">
			<div id="ProfileMenuBtn" style="display:none">
			<!-- 작가홈 아이디와 로그인 아이디에 따라 아래 버튼 다르게 보이게 해야 함 -->
				<button class="ui mini grey basic button" id="profileEdit">내정보 수정</button>
				<button class="ui mini grey basic button" id="profileReport">작가 신고</button>
			</div>
		</div>
	</div> <!-- 상단 프로필 부분 끝! -->

	<!-- 작가홈 메뉴바 -->	
	<div class="artisthomeMenu">
		<div id="artistMenu" class="three item ui tabular menu" style="width:100%;">
			<a id="item" class="item active" data-tab="first">작가소개</a>
			<a id="item" class="item" data-tab="second">오브제</a>
			<a id="item" class="item" data-tab="thrid">방명록</a>
		</div>
	<!-- 작가소개 영역 ************************************************************************************************** -->
		<div class="ui tab active" data-tab="first">
		 	<div class="innerTab">
		 	<p class="artistIntroCategory">소개</p>
			 	<p class="artistIntroContent">
				 	일상 생활에 쓰이는 모든 물체는 그 나름의 용도나 기능 또는 독특한 의미를 지니고 있게 마련이나<br>
					이러한 물체가 일단 오브제로 쓰이면 그 본래의 용도나 기능은 의미를 잃게 되고<br>
					이때까지 우리가 미처 체험하지 못했던 어떤 연상작용이나 기묘한 효과를 얻을 수 있게 된다.<br>
					생활에 쓰이는 갖가지 물건들이 작품이 되는 공간, 오브제.
				</p>
				<!-- 관련태그 영역 -->
				<a class="ui mini grey basic label">디자인</a>
				<a class="ui mini grey basic label">건축</a>
				<a class="ui mini grey basic label">사진</a>
		 	
		 	<p class="artistIntroCategory">기타 이력 및 포트폴리오</p>
		 		<p class="artistIntroContent">
		 			2019.01.30 프로젝트 발표<br>
					2019.01.23 Beta Test<br>
					2019.12.26 프로젝트 구현<br>
					2019.12.16 클래스,시퀀스 설계<br>
					2019.12.02 DB설계<br>
					2019.11.18 UI설계<br>
					2019.11.11 프로젝트 기획
		 		</p>
		 	<p class="artistIntroCategory">작가 연결사이트</p>
		 	<!-- 페이스북 --><div class="artistURL" value="http://www.facebook.com"><i class="facebook f icon"></i></div>
		 	<!-- 인스타그램 --><div class="artistURL" value="http://www.instagram.com"><i class="instagram icon"></i></div>
		 	<!-- 기타URL --><div class="artistURL" value="http://www.youtube.com"><i class="linkify icon"></i></div>
		 	<!-- 이메일 --><div class="artistURL" value="mailto:my_choe@naver.com"><i class="envelope outline icon"></i></div>
		 	
		 	</div>
		 	<!-- 작가홈 본인일때만 작가소개 수정 버튼 -->
		 	<br><br><br><br><br><br>
			<div align="center"><button class="ui medium grey basic button" id="editArtistIntro" onclick="location.href='moveArtistIntroEdit.do'">작가소개 수정</button></div>
			<br><br><br>
		</div>
		
		
	<!-- 오브제 영역 ************************************************************************************************** -->	
		<div class="ui tab" data-tab="second">
			<div class="innerTab">오브제 부분</div>
		</div>
		
		
	<!-- 방명록 영역 ************************************************************************************************** -->
		<div class="ui tab" data-tab="thrid">
			<div class="innerTab">방명록 부분</div>
		</div>
			
	</div><!-- 작가홈 메뉴바 끝! -->

	

	


</div> <!-- 작가홈 끝! -->
</body>
</html>