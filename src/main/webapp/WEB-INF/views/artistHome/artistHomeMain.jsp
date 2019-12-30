<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineN", "\n"); %>

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
		 $("#counter").html("( <span style='color:#4ecdc4;font-size: 9pt;'>"+content.length+"</span> / 최대 500자 )");	// 글자수 실시간 카운팅
		 
		 if(content.length > 500){
			 alert("최대 500자까지만 입력 가능합니다.");
			 $(this).val(content.substring(0,500));
			 $("#counter").html("( <span style='color:red;font-size: 9pt;'>500 </span>/ 최대 500자)");
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
			<p class="profileText" style="font-size: 25px; color:#373737;">${usersProfile.nickname}</p>
			<p class="profileText" style="font-size: 10pt; color:#aaa;">${usersProfile.userintros}</p>
			<br><br>
		</span>
		<c:if test="${usersProfile.blackyn == 'N'}">
			<table>
				<tr><td style="width:100px; font-size: 10pt; color: #aaa;">구독자</td>
					<td style="width:100px; font-size: 10pt; color: #aaa;">관심작가</td>
				<tr><td style="font-size: 17pt;color: #9c9c9c;" onclick="location.href='moveFollowerPage.do?artistid=${usersProfile.userid}&loginUserid=${loginUser.userid }'">${follower }</td>
					<td style="font-size: 17pt;color: #9c9c9c;" onclick="location.href='moveFollowingPage.do?artistid=${usersProfile.userid}&loginUserid=${loginUser.userid }&'">${following }</td></tr>
			</table>
		</c:if>
		<c:if test="${usersProfile.blackyn == 'Y'}">
		<p style="color:red;">오브제 가이드라인을 위반하여 일시 정지된 계정입니다.</p>
		</c:if>
		</div>
		
		<!-- 프로필 사진부분 -->
			<div class="profileImageSection">
			<c:if test="${usersProfile.userrpic==null }">
				<div class="profileImage" style="background-image:url('resources/images/basicprofilepic.png') "></div>
			</c:if>
			<c:if test="${usersProfile.userrpic!=null }">
				<div class="profileImage" style="background-image:url('resources/users_upfiles/${usersProfile.userrpic}') "></div>
			</c:if>
			<br><br><br><br><br><br><br><br>
			<c:if test="${usersProfile.blackyn == 'N'}">
			<button class="mini ui teal button" onclick="">전시일정</button>
			</c:if>
			<c:if test="${usersProfile.userid != loginUser.userid }">
			<c:if test="${usersProfile.blackyn == 'N'}">
			<button class="mini ui teal button" onclick="" style="display:none;">구독중</button>
			<button class="mini ui teal basic button" onclick="" style="display:inline">구독하기</button>
			</c:if>
			</c:if>
			<i class="grey ellipsis vertical icon" id="profileMenu"></i>
		</div>
		
		<!-- 프로필 메뉴 버튼 클릭 시 버튼 나타날 영역 -->
		<div class="profileMenuOpen">
			<div id="ProfileMenuBtn" style="display:none">
			<!-- 작가홈 아이디와 로그인 아이디에 따라 아래 버튼 다르게 보이게 해야 함 -->
			<c:if test="${usersProfile.userid == loginUser.userid }">
				<button class="ui mini grey basic button" id="profileEdit" onclick="location.href='moveMyPageEdit.do'">내정보 수정</button>
			</c:if>
			<c:if test="${usersProfile.userid != loginUser.userid }">
			<button class="ui mini grey basic button" id="profileReport" onclick="location.href='moveProfileReport.do?reportedu=${usersProfile.userid}'">작가 신고</button>
			</c:if>
			</div>
		</div>
	</div> <!-- 상단 프로필 부분 끝! -->

	<!-- 작가홈 메뉴바 -->	
	<c:if test="${usersProfile.blackyn == 'N'}">
	<div class="artisthomeMenu">
		<div id="artistMenu" class="three item ui tabular menu" style="width:100%;">
			<a id="item" class="item active" data-tab="first">작가소개</a>
			<!-- <a id="item" class="item" data-tab="second" onclick="location.href='moveLogin.do'">오브제</a>
			<a id="item" class="item" data-tab="thrid">방명록</a> -->
		</div>
	</div>
	<!-- 작가소개 영역 ************************************************************************************************** -->
	
		<div class="ui tab active" data-tab="first">
		 	<div class="innerTab">
		 	<p class="artistIntroCategory">소개</p>
			 	<p class="artistIntroContent">
			 	<c:if test="${usersProfile.userintrol != null }">
			 		${fn:replace(usersProfile.userintrol, newLineN, "<br>")}
				</c:if>
				<c:if test="${usersProfile.userintrol == null }">
				 	작성한 소개글이 없습니다.
				</c:if>
				
				</p>
				
				<!-- 관련태그 영역 -->
				<c:if test="${usersProfile.usertag != null}">
				<c:forTokens var="tag" items="${ usersProfile.usertag }" delims="," >
					<c:if test="${value eq '건축'}"><c:set var="usertag1" value="건축"/></c:if>
					<c:if test="${value eq '공예'}"><c:set var="usertag2" value="공예"/></c:if>
					<c:if test="${value eq '디자인'}"><c:set var="usertag3" value="디자인"/></c:if>
					<c:if test="${value eq '사진'}"><c:set var="usertag4" value="사진"/></c:if>
					<c:if test="${value eq '서예'}"><c:set var="usertag5" value="서예"/></c:if>
					<c:if test="${value eq '조각'}"><c:set var="usertag6" value="조각"/></c:if>
					<c:if test="${value eq '회화'}"><c:set var="usertag7" value="회화"/></c:if>
					<c:if test="${value eq '기타'}"><c:set var="usertag8" value="기타"/></c:if>
					<a class="ui mini grey basic label">${tag }</a>
				</c:forTokens>
		 		</c:if>
		 		
		 	<c:if test="${usersProfile.portfolio != null }">
		 	<p class="artistIntroCategory">기타 이력 및 포트폴리오</p>
		 		<p class="artistIntroContent">
		 		${fn:replace(usersProfile.portfolio, newLineN, "<br>")}
			</c:if>
		 		</p>
		 		
		 	<c:if test="${usersProfile.facebook != null or usersProfile.instagram != null or usersProfile.etcurl != null or usersProfile.artistemail != null}">
		 	<p class="artistIntroCategory">작가 연결사이트</p>
		 	
		 	<c:if test="${usersProfile.facebook != null }">
		 	<!-- 페이스북 --><div class="artistURL" value="${usersProfile.facebook}"><i class="facebook f icon"></i></div>
		 	</c:if>
		 	<c:if test="${usersProfile.instagram != null }">
		 	<!-- 인스타그램 --><div class="artistURL" value="${usersProfile.instagram }"><i class="instagram icon"></i></div>
		 	</c:if>
		 	<c:if test="${usersProfile.etcurl != null }">
		 	<!-- 기타URL --><div class="artistURL" value="${usersProfile.etcurl }"><i class="linkify icon"></i></div>
		 	</c:if>
		 	<c:if test="${usersProfile.artistemail != null }">
		 	<!-- 이메일 --><div class="artistURL" value="mailto:${usersProfile.artistemail }"><i class="envelope outline icon"></i></div>
		 	</c:if>
		 	
		 	</c:if>
		 	</div>
		 	
		 	<!-- 작가홈 본인일때만 작가소개 수정 버튼 -->
		 	<br><br><br><br><br>
		 	<c:if test="${usersProfile.userid == loginUser.userid }">
			<div align="center"><button class="ui medium grey basic button" id="editArtistIntro" onclick="location.href='moveArtistIntroEdit.do?userid=${loginUser.userid}'">작가소개 수정</button></div>
			</c:if>
			<br>
		</div>
		
		
	<!-- 오브제 영역 ************************************************************************************************** -->	
		<div class="ui tab" data-tab="second">
			<div class="innerTab">
				<div class="artisthomeObjetSection">
				<!-- 오브제 리스트 테이블 시작! -->
				 <table class="artisthomeObjetTable">
					<tr style="height:23px;">
						<!-- 오브제 제목, 상태, 전시관람 버튼 영역 -->
						<td style="width:85%;padding-top:30px;">
							<div style="float: left;font-size: 15pt; font-weight:600; color:#202020;"></div>
							<div class="objetStatusLabel" style="background:#df0000;">전시중</div>
							<div class="objetStatusLabel" style="background:#202020; display: none;">전시예정</div>
							<div class="objetStatusLabel" style="background:#aaa; display: none;">전시종료</div>
						</td>
						<td rowspan="2" style="width:15%; text-align: center;padding-top:30px;">
							<button class="ui tiny blue button">전시관람</button>
						</td>
					</tr>
					<tr style="height: 10px;">
						<!-- 오브제 기간 영역 -->
						<td style="width:85%; font-size: 9pt;">2019.12.02(월) ~ 2019.12.24(화)</td>
					</tr>
					<tr>
						<!-- 오브제 포스터 영역 -->
						<td colspan="2">
							<div class="artisthomeObjetListImg" style="background-image:url('resources/objet_upfiles/animation.jpg') "></div>
						</td>
					</tr>
					<tr>
						<!-- 오브제 소개 영역 -->
						<td colspan="2">
							<div class="artisthomeObjetListIntro">
								각기 상이하지만, 동시대 뉴 미디어 기술을 바탕으로 새로운 형식의 예술 장르를 탐구하고자 하는 진취적 시도라는 점에서 함께 묶어낼 수 있다. 우리가 함께 살고있는 디지털 환경 속에 애니메이션이라는 장르가 유연하게 녹아들 수 있도록 그 개념을 확장하고, 현대미술 분야에서 애니메이션의 예술적인 어쩌구다.
								각기 상이하지만, 동시대 뉴 미디어 기술을 바탕으로 새로운 형식의 예술 장르를 탐구하고자 하는 진취적 시도라는 점에서 함께 묶어낼 수 있다. 우리가 함께 살고있는 디지털 환경 속에 애니메이션이라는 장르가 유연하게 녹아들 수 있도록 그 개념을 확장하고, 현대미술 분야에서 애니메이션의 예술적인 어쩌구다.
							</div>
						</td>
					</tr>
					<tr>
						<!-- 관련태그 영역 -->
						<td colspan="2">
							<a class="ui mini grey basic label">디자인</a>
							<a class="ui mini grey basic label">건축</a>
							<a class="ui mini grey basic label">사진</a>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="artisthomeObjetTableLastTr"><!-- 관심 댓글 조회수 영역 -->
							<div style="font-size: 9pt;">관심 21&ensp;·&ensp;댓글  18&ensp;·&ensp;<i class="small eye icon"></i> 0</div>
						</td>
					</tr>
				</table>
				
				<!-- 오브제 리스트 테이블 끝! -->
				
				<br><br><br>
				<!-- 페이징&검색 -->
				<div align="center">
				<%-- 	<div id="paging">
					
						<!-- 전체 리스트 페이징 -->
						 <c:if test="${ objetkind eq 'all' }"> 
							 <c:if test="${ paging.startPage != 1 }">
							 	<a href="selectArtistObjetList.do?currentPage=${paging.startPage - 1}">이전</a>
							 </c:if>
							 
							<c:forEach var="num" begin="${ paging.startPage }"
								end="${ paging.endPage }">
								<a href="selectArtistObjetList.do?currentPage=${num}">${num}</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="selectArtistObjetList.do?currentPage=${paging.endPage + 1}">다음</a>
							</c:if>
						 </c:if> 
						 
						 
						 <!-- 검색용 페이징 -->
						<c:if test="${ objetkind eq 'sort' }">
							<c:if test="${ paging.startPage != 1 }">
							 	<a href="selectArtistObjetSearch.do?currentPage=${paging.startPage - 1}&type=${type}">이전</a>
							 </c:if>
							
							<c:forEach var="num" begin="${ paging.startPage }"
								end="${ paging.endPage }">
								<a href="selectArtistObjetSearch.do?currentPage=${num}&type=${ type }">${num}</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="selectArtistObjetSearch.do?currentPage=${paging.endPage + 1}&type=${type}">다음</a>
							</c:if>
						</c:if>
					</div> --%>
				
				</div>
				<br><br>
				
				<div align="center">
					<form action="" method="post">
						오브제명&ensp;<div class="ui input"><input type="text" name="keyword"></div>
					&ensp;<div class="ui buttons"><button class="ui button" type="submit">검색</button></div>
					</form>
				</div>
			</div>
		</div>
	</div>
		<!-- 오브제 부분 끝! -->

		
		
		
		
		
	<!-- 방명록 영역 ************************************************************************************************** -->
		<div class="ui tab" data-tab="thrid">
			<div class="innerTab">
			<br><br>
			<!-- 본인 작가홈이 아닐 때 방명록 작성 칸 보이기 시작 -->
			<c:if test="${usersProfile.userid != loginUser.userid }">
				<div class="gblist">
					<form action="" method="post">
					<input type="hidden" name="userid" value="">
					<input type="hidden" name="artistid" value="">
					<table class="gbwrite">
						<tr><td style="width:15%"><div class="profileImage4" style="background-image:url('resources/users_upfiles/${loginUser.userrpic}') "></div></td>
							<td style="width:85%; height: 150px;"><div class="ui form"><textarea style="width:600px;margin-left:20px;"rows="5" cols="100" name="gbcontent" id="gbcontent" required></textarea></div></td>
						</tr>
						<tr style="height:25px;">
							<td></td>
							<td><div style="color:#202020; margin-left:20px; margin-top:-15px; font-size: 9pt;" id="counter">( <span style="color:#4ecdc4; font-size: 9pt;">0</span> / 최대 500자 )</div>
								<span style="float:left; color:#202020; margin-left:495px; margin-top:-15px;"><input type="checkbox" name="privateyn" value="Y"><label style="font-size: 9pt;">&ensp;비밀글</label></span>
								<span><button class="ui mini button" type="submit" style="background: #4c4c4c; color:#fff; float:left;margin-left:10px; margin-top:-20px;">등록</button></span></td>
						</tr>
					</table>
					</form>
				</div>
			</c:if>
				<!-- 본인 작가홈이 아닐 때 방명록 작성 칸 보이기 끝!-->
				
				
				<!-- 방명록 리스트 보기 시작-->
				<div class="gblist">
					<table class="gbwrite">
						<tr style="height:25px;">
							<td colspan="2" style="width:auto; background:#efefef;">
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
						<!-- ★★ ArrayList로 방명록 리스트 불러와서 포문 돌릴 때 그 안에 방명록 댓글 폼 포함해서 넣어야 gbno를 hidden으로 보낼 수 있음. 방명록댓글이 있으면 방명록 댓글 보이게~! -->
						
						
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
							<td colspan="2" style="height: 30px;background:#efefef;">
								<span style="width:10%; margin-left: 20px; color:#4ecdc4; font-weight:600;">오브제프로젝트</span>
								<span style="margin-left: 5px;font-size: 9pt;">(2019.11.17  17:11)</span>
								<div style="float:right; margin-right:10px;">
				     				<!-- 작가홈 주인일 때 --><a onclick="location.href=''">수정</a> | 
				     								  <a onclick="location.href=''">삭제</a></div>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="background:#efefef;">
								<p class="replycontent">아니ㅠㅠ댓글달지마 걍~</p></td>
						</tr>
						
					</table>
					
				</div>
				<!-- 방명록 리스트 보기 끝 -->
				
				<!-- (비밀글일때)방명록 리스트 보기 시작-->
				<div class="gblist">
					<table class="gbwrite">
						<tr style="height:25px;">
							<td colspan="2" style="width:auto; background:#efefef;">
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
							<i class="large teal lock icon"></i><span style="color:#4ecdc4;font-size: 10pt;">비밀글입니다 :)</span><br><br>
							작가홈 주인이거나<br>자신이 남긴 글일 때만<br>해당 비밀글이 보이고<br>아니면 그냥 비밀글입니다만 보이게 해야 함</div>
						</tr>
						<tr style="height:60px;">
						<form action="" method="post">
						<input type="hidden" name="gbno" value="">
						<input type="hidden" name="replyprivateyn" value="">
							<td colspan="2" style="background:#efefef;"><div class="ui form" style="float:left;"><textarea style="width:650px;height:30px;margin-left:20px;"rows="1" cols="100" name="replycontent" id="replycontent" placeholder="댓글을 입력하세요. 최대 100자까지 입력 가능합니다." required></textarea></div>
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
		
			</div>
			
		</div>
		</c:if>
	</div><!-- 작가홈 메뉴바 끝! -->
	

	

 <!-- 작가홈 끝! -->


</body>
<br><br><br><br><br><br><br><br><br><br><br><br>
<c:import url="../footer.jsp" />
</html>