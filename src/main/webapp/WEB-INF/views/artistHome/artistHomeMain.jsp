<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오브제프로젝트의 오브제</title>
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
    
    
    // 방명록 글자수 세기
	 $("#gbcontent").keyup(function(e){
		 var content = $(this).val();
		 $("#counter").html("( <span style='color:#4ecdc4;'>"+content.length+"</span> / 최대 500자 )");	// 글자수 실시간 카운팅
		 
		 if(content.length > 500){
			 alert("최대 500자까지만 입력 가능합니다.");
			 $(this).val(content.substring(0,500));
			 $("#counter").html("( <span style='color:red;'>500 </span>/ 최대 500자)");
		 } 
		 
	 });

	});	// document ready...
	
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
				<tr><td style="font-size: 17pt;color: #9c9c9c;" onclick="location.href='moveFollowerPage.do'">12</td>
					<td style="font-size: 17pt;color: #9c9c9c;" onclick="location.href='moveFollowingPage.do'">34</td></tr>
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
				<button class="ui mini grey basic button" id="profileEdit" onclick="location.href='moveMyPageEdit.do'">내정보 수정</button>
				<button class="ui mini grey basic button" id="profileReport" onclick="location.href='moveProfileReport.do'">작가 신고</button>
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
			<div class="innerTab">
			
			<!-- 본인 작가홈이 아닐 때 방명록 작성 칸 보이기 시작 -->
				<div class="gblist">
					<form action="" method="post">
					<input type="hidden" name="userid" value="">
					<input type="hidden" name="artistid" value="">
					<table class="gbwrite">
						<tr><td style="width:15%"><div class="profileImage4" style="background-image:url('resources/images/basicprofilepic.png') "></div></td>
							<td style="width:85%; height: 150px;"><div class="ui form"><textarea style="width:630px;margin-left:20px;"rows="5" cols="100" name="gbcontent" id="gbcontent" required></textarea></div></td>
						</tr>
						<tr style="height:25px;">
							<td></td>
							<td><div style="color:#202020; margin-left:20px; margin-top:-15px;" id="counter">( <span style="color:#4ecdc4">0</span> / 최대 500자 )</div>
								<span style="float:left; color:#202020; margin-left:515px; margin-top:-15px;"><input type="checkbox" name="privateyn" value="Y"><label>&ensp;비밀글</label></span>
								<span><button class="ui mini button" type="submit" style="background: #4c4c4c; color:#fff; float:left;margin-left:10px; margin-top:-20px;">등록</button></span></td>
						</tr>
					</table>
					</form>
				</div>
				
				<!-- 본인 작가홈이 아닐 때 방명록 작성 칸 보이기 끝!-->
				
				
				<!-- 방명록 리스트 보기 시작-->
				<div class="gblist">
					<table class="gbwrite">
						<tr style="height:25px;">
							<td colspan="2" style="width:auto; background:#dfdfdf;">
								<span style="width:10%; margin-left: 20px;">No. 555551</span>
				   				<span style="margin-left: 15px;"><a href='' style="font-weight: 600; color:#14123a;">티라미수맛아몬드</a></span>
				  				<span style="margin-left: 5px;font-size: 9pt;">(2019.11.17  17:11)</span>
			     				<div style="float:right; margin-right:10px;">
			     				<!-- 작가홈 주인일 때 --><a onclick="location.href=''">비밀로하기</a> | 
			     								  <a onclick="location.href=''">신고</a> | 
			     								  <a onclick="location.href=''">삭제</a></div>
			     				<!-- 글쓴이일때(공개글) <a onclick="location.href=''">비밀로하기</a> | 
			     								  <a onclick="location.href=''">수정</a> | 
			     								  <a onclick="location.href=''">삭제</a></div> -->
							</td>
						</tr>
						<tr><td style="width:15%"><div class="profileImage4" style="background-image:url('resources/images/basicprofilepic.png') "></div></td>
							<td style="width:85%;"><div class="gbcontent">
							방명록 내용<br>어느세월에 다하지<br>비밀글 하지말걸 ㅠ</div>
						</tr>
						
						<!-- 작가 홈 주인일 때 답변 내용이 없으면 답변 쓰기 창 -->
						<!-- 
						<tr style="height:60px;">
							<form action="" method="post">
								<input type="hidden" name="gbno" value="">
								<input type="hidden" name="replyprivateyn" value="">
									<td colspan="2"><div class="ui form" style="float:left;"><textarea style="width:680px;height:30px;margin-left:20px;"rows="1" cols="100" name="replycontent" id="replycontent" placeholder="최대 100자까지 입력 가능합니다." required></textarea></div>
									<span><button class="ui mini button" type="submit" style="background: #4c4c4c; margin-left:20px;color:#fff;">등록</button></span></td>
							<tr>
						</form> -->
						<!-- 작가홈 주인or관람객 답변 내용이 달렸을 때 -->
						<tr>
							<td colspan="2" style="height: 30px;background:#dfdfdf;">
								<span style="width:10%; margin-left: 20px; color:#4ecdc4; font-weight:600;">오브제프로젝트</span>
								<span style="margin-left: 5px;font-size: 9pt;">(2019.11.17  17:11)</span>
								<div style="float:right; margin-right:10px;">
				     				<!-- 작가홈 주인일 때 --><a onclick="location.href=''">수정</a> | 
				     								  <a onclick="location.href=''">삭제</a></div>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="background:#dfdfdf;">
								<p class="replycontent">아니ㅠㅠ댓글달지마 걍~</p></td>
						</tr>
						
					</table>
					
				</div>
				<!-- 방명록 리스트 보기 끝 -->
				
				<!-- (비밀글일때)방명록 리스트 보기 시작-->
				<div class="gblist">
					<table class="gbwrite">
						<tr style="height:25px;">
							<td colspan="2" style="width:auto; background:#dfdfdf;">
				<!-- 방명록번호 --> <span style="width:10%; margin-left: 20px;">No. 555550</span>
				   <!-- 작성자 --> <span style="margin-left: 15px;"><a href='' style="font-weight: 600; color:#14123a;">티라미수맛아몬드</a></span>
				   <!-- 작성일 --> <span style="margin-left: 5px;font-size: 9pt;">(2019.11.17  17:11)</span>
			     <!-- 관리버튼 -->	<div style="float:right; margin-right:10px;">
			     				<!-- 작가홈 주인일 때 -->
			     								  <a onclick="location.href=''">신고</a> | 
			     								  <a onclick="location.href=''">삭제</a></div>
			     				<!-- 글쓴이일때(공개글) <a onclick="location.href=''">비밀로하기</a> | 
			     								  <a onclick="location.href=''">수정</a> | 
			     								  <a onclick="location.href=''">삭제</a></div> -->
							</td>
						</tr>
						<tr><td style="width:15%"><div class="profileImage4" style="background-image:url('resources/images/basicprofilepic.png') "></div></td>
							<td style="width:85%;"><div class="gbcontent">
							<i class="large teal lock icon"></i><span style="color:#4ecdc4;">비밀글입니다 :)</span><br><br>
							작가홈 주인이거나<br>자신이 남긴 글일 때만<br>해당 비밀글이 보이고<br>아니면 그냥 비밀글입니다만 보이게 해야 함</div>
						</tr>
						<tr style="height:60px;">
						<form action="" method="post">
						<input type="hidden" name="gbno" value="">
						<input type="hidden" name="replyprivateyn" value="">
							<td colspan="2" style="background:#dfdfdf;"><div class="ui form" style="float:left;"><textarea style="width:680px;height:30px;margin-left:20px;"rows="1" cols="100" name="replycontent" id="replycontent" placeholder="댓글을 입력하세요. 최대 100자까지 입력 가능합니다." required></textarea></div>
							<span><button class="ui mini button" type="submit" style="background: #4c4c4c; margin-left:20px;color:#fff;">등록</button></span></td>
						</form>
						</tr>
					</table>
					
				</div>
				<!-- 방명록 리스트 보기 끝 -->
				
				
				<!-- 작가홈 주인일 때 페이징버튼 & 검색창 -->
				<div align="center">페이징 부분</div><br><br>
				
				<div align="center">
					<form action="" method="post">
						<select class="ui search dropdown" name="searchtype" id="searchtype">
						  <option value="userid">작성자</option>
						  <option value="gbcontent">내용</option>
						</select>
					<div class="ui input"><input type="text" name="keyword"></div>
					&ensp;<div class="ui buttons"><button class="ui button" type="submit">검색</button></div>
						
					</form>
				</div>
				
					

				
				
				<!-- 작가홈 구경온 사람일 때는 내가 쓴 글 보기 -->
			<br>
			<div align="center"><button class="ui medium grey basic button" id="mygblist" onclick="location.href=''">내가 쓴 글 보기</button></div>
			<br><br><br>
				
			</div>
			
		</div>
			
	</div><!-- 작가홈 메뉴바 끝! -->

	
</div> <!-- 작가홈 끝! -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
<c:import url="../footer.jsp" />
</html>