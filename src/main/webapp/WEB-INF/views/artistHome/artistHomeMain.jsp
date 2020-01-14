<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineN", "\n"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${usersProfile.nickname}의 작가홈</title>
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

function artistObjetList(){
	var userid = '<c:out value="${usersProfile.userid}"/>';
	$.ajax({
		url : "selectArtistObjetList.do",
		type : "post",
		data : { userid: userid },
		dataType : "json",
		success : function(result){
			var objStr = JSON.stringify(result);
			var jsonObj = JSON.parse(objStr);
			var start = '';
			var end = '';
			
			for ( var i in jsonObj.objetlist) {
				var tagl = decodeURIComponent(jsonObj.objetlist[i].objettag.replace(/\+/gi, " ")).length;
				var tags = decodeURIComponent(jsonObj.objetlist[i].objettag.replace(/\+/gi, " ")).split(",");
				var objettitle = decodeURIComponent(jsonObj.objetlist[i].objettitle.replace(/\+/gi, " "));
				var objetno = jsonObj.objetlist[i].objetno;
				var userid = '${loginUser.userid}';
				var tag = "";
			
				start += '<table class="artisthomeObjetTable"><tr style="height:23px;"><td style="width:85%;padding-top:30px;">';
				start += '<a style="float: left;font-size: 15pt; font-weight:600; color:#202020;" href="objetOne.do?objetno=' + objetno + '&userid=' + userid + '">'+ objettitle +'&ensp;</a>';
				
				if(jsonObj.objetlist[i].objetstatus=='OPEN'){
					start += '<div class="objetStatusLabel" style="background:#df0000;">전시중</div></td>' + '<td rowspan="2" style="width:15%; text-align: center;padding-top:30px;">'
					+ '<a class="ui tiny blue button" href="objetOne.do?objetno=' + objetno + '&userid=' + userid + '">전시관람</a></td></tr>';
				}else if(jsonObj.objetlist[i].objetstatus=='STANDBY'){
					start += '<div class="objetStatusLabel" style="background:lightpink;">전시예정</div></td>' + '<td rowspan="2" style="width:15%; text-align: center;padding-top:30px;">'
						+ '<a class="ui tiny blue button" disabled>전시예정</a></td></tr>';
				}else if(jsonObj.objetlist[i].objetstatus=='CLOSE'){
					start += '<div class="objetStatusLabel" style="background:#aaa;">전시종료</div></td>' + '<td rowspan="2" style="width:15%; text-align: center;padding-top:30px;">'
					+ '<a class="ui tiny grey button">전시종료</a></td></tr>';
				}
				
				start += '<tr style="height: 10px;"><td style="width:85%; font-size: 9pt;">' + jsonObj.objetlist[i].objetstartdate + ' ~ ' +  jsonObj.objetlist[i].objetenddate + '</td></tr>';
				
				start += '<tr><td colspan="2"><div class="artisthomeObjetListImg" style="background-image:url(\'resources/images/objet/' + jsonObj.objetlist[i].renamemainposter + '\') "></div></td></tr>';
				
				start += '<tr><td colspan="2"><div class="artisthomeObjetListIntro" href="objetOne.do?objetno=' + objetno + '&userid=' + userid + '">' + decodeURIComponent(jsonObj.objetlist[i].objetintro.replace(/\+/gi, " ")) + '</div></td></tr>';
				
			    start += '<td colspan="2"><div style="font-size: 9pt;">';
			    
			    start += '관심 ' + jsonObj.objetlist[i].likecount + '&emsp;댓글 ' + jsonObj.objetlist[i].reviewcount + '&emsp;<i class="small eye icon"></i> ' + jsonObj.objetlist[i].objetview + '</td></tr>';
				
			    start += '<tr><td colspan="2" class="artisthomeObjetTableLastTr">';
				
				 for(var i in tags){
					start +='<a class="ui mini grey basic label" href="search.do?keyword=' + tags[i] + '">' + tags[i] + '</a> &nbsp;';
				 }
				 
			    start += '</td></tr></table>';
			    
			    
			}
			$(".artisthomeObjetSection").html(start);
			
			
			if(start != '' && start != null){
		    	end = '<button class="ui grey basic button" style="width:200px;" id="moreObjetList">더 보기</button><br><br><br><br><br><br>';
		    }else{
		    	end = '<br><br><br><br><p>진행한 오브제가 없습니다<p><br><br><br><br><br><br><br>';
		    }
			
			
			
			$("#objetListBottom").html(end);
			
			
			$(".artisthomeObjetTable").slice(0, 3).fadeIn();
			
		    $("#moreObjetList").click(function(e) { 
		          e.preventDefault();
		          $(".artisthomeObjetTable:hidden").slice(0, 3).fadeIn(); 
		          if($(".artisthomeObjetTable:hidden").length == 0) { 
		              $('#moreObjetList').fadeOut();
		          }
		      });
			
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});// 전시용 ajax
}
	
function objetSearch(){
	var userid = '<c:out value="${usersProfile.userid}"/>';
	var keyword = $("#keyword").val();
	$.ajax({
		url : "selectArtistObjetSearch.do",
		type : "post",
		data : { userid: userid, keyword: keyword },
		dataType : "json",
		success : function(result){
			var objStr = JSON.stringify(result);
			var jsonObj = JSON.parse(objStr);
			var start = '';

			for ( var i in jsonObj.objetlist) {
				var tagl = decodeURIComponent(jsonObj.objetlist[i].objettag.replace(/\+/gi, " ")).length;
				var tags = decodeURIComponent(jsonObj.objetlist[i].objettag.replace(/\+/gi, " ")).split(",");
				var objettitle = decodeURIComponent(jsonObj.objetlist[i].objettitle.replace(/\+/gi, " "));
				var objetno = jsonObj.objetlist[i].objetno;
				var userid = '${loginUser.userid}';
				var tag = "";
				start += '<table class="artisthomeObjetTable" style="display: none;"><tr style="height:23px;"><td style="width:85%;padding-top:30px;">';
				start += '<a style="float: left;font-size: 15pt; font-weight:600; color:#202020;" href="objetOne.do?objetno=' + objetno + '&userid=' + userid + '">'+ objettitle +'&ensp;</a>';
				
				if(jsonObj.objetlist[i].objetstatus=='OPEN'){
					start += '<div class="objetStatusLabel" style="background:#df0000;">전시중</div></td>' + '<td rowspan="2" style="width:15%; text-align: center;padding-top:30px;">'
					+ '<a class="ui tiny blue button" href="objetOne.do?objetno=' + objetno + '&userid=' + userid + '">전시관람</a></td></tr>';
				}else if(jsonObj.objetlist[i].objetstatus=='STANDBY'){
					start += '<div class="objetStatusLabel" style="background:lightpink;">전시예정</div></td>' + '<td rowspan="2" style="width:15%; text-align: center;padding-top:30px;">'
						+ '<a class="ui tiny blue button" disabled>전시예정</a></td></tr>';
				}else if(jsonObj.objetlist[i].objetstatus=='CLOSE'){
					start += '<div class="objetStatusLabel" style="background:#aaa;">전시종료</div></td>' + '<td rowspan="2" style="width:15%; text-align: center;padding-top:30px;">'
					+ '<a class="ui tiny grey button">전시종료</a></td></tr>';
				}
				
				start += '<tr style="height: 10px;"><td style="width:85%; font-size: 9pt;">' + jsonObj.objetlist[i].objetstartdate + ' ~ ' +  jsonObj.objetlist[i].objetenddate + '</td></tr>';
				
				start += '<tr><td colspan="2"><div class="artisthomeObjetListImg" style="background-image:url(\'resources/images/objet/' + jsonObj.objetlist[i].renamemainposter + '\') "></div></td></tr>';
				
				start += '<tr><td colspan="2"><div class="artisthomeObjetListIntro">' + decodeURIComponent(jsonObj.objetlist[i].objetintro.replace(/\+/gi, " ")) + '</div></td></tr>';
				
			    start += '<td colspan="2"><div style="font-size: 9pt;">';
			    
			    start += '관심 ' + jsonObj.objetlist[i].likecount + '&emsp;댓글 ' + jsonObj.objetlist[i].reviewcount + '&emsp;<i class="small eye icon"></i> ' + jsonObj.objetlist[i].objetview + '</td></tr>';
				
			    start += '<tr><td colspan="2" class="artisthomeObjetTableLastTr">';
				
				 for(var i in tags){
					start +='<a class="ui mini grey basic label" href="search.do?keyword=' + tags[i] + '">' + tags[i] + '</a> &nbsp;';
				 }
				 
			    start += '</td></tr></table>';
			}
			
			$(".artisthomeObjetSection").html(start);
			
			if(start != '' && start != null){
		    	end = '<button class="ui grey basic button" style="width:200px;" id="moreObjetList">더 보기</button><br><br><br><br><br><br>';
		    }else{
		    	end = '<br><br><br><br><p>검색 결과가 없습니다.<p><br><br><br><br><br><br><br>';
		    }
			
			$("#objetListBottom").html(end);
			
			$(".artisthomeObjetTable").slice(0, 3).fadeIn();
		    $("#moreObjetList").click(function(e) { 
		          e.preventDefault();
		          $(".artisthomeObjetTable:hidden").slice(0, 3).fadeIn(); 
		          if($(".artisthomeObjetTable:hidden").length == 0) { 
		              $('#moreObjetList').fadeOut();
		          }
		      });
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});// 전시검색용 ajax
}

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
	
// 팔로우 추가
function insertFollowing(){
		var from_user = '<c:out value="${loginUser.userid}"/>'
		var to_user = '<c:out value="${param.userid}"/>'
		
			$.ajax({
		         url:"insertFollowing.do",
		         type:"get",
		         data:{from_user:from_user, to_user:to_user },
		         success: function(result){
		             if(result == "ok"){
		               console.log("팔로우 추가 성공!")
		               window.location.reload();
		             }
		             else{
		            	alert("팔로우 추가 실패!")
		             }
		          },
		          error: function(request, status, errorData){
						console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
					}
		       });   
	}
	
	
// 구독취소
function deleteFollowing(){
	var from_user = '<c:out value="${loginUser.userid}"/>'
	var to_user = '<c:out value="${param.userid}"/>'
	
		$.ajax({
	         url:"deleteFollowing.do",
	         type:"get",
	         data:{from_user:from_user, to_user:to_user },
	         success: function(result){
	             if(result == "ok"){
	               console.log("팔로잉 취소 성공!")
	               window.location.reload();
	             }
	             else{
	            	alert("팔로잉 취소 실패!")
	             }
	          },
	          error: function(request, status, errorData){
					console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
				}
	       });   
}

	
</script>
</head>
<body>

<!-- 작가홈 시작 -->

<div class="wrapHome">
<section class="wrapSection">

	<!-- 상단 프로필 부분 -->
	<div class="wrapProfile">
		<!-- 프로필 글자부분 -->
		<div class="profileTextSection">
		<span>
			<p class="profileText" style="font-size: 25px; color:#373737;">${usersProfile.nickname}</p>
			<p class="profileText" style="font-size: 10pt; color:#aaa;">${usersProfile.userintros}</p>
			<a href='moveVRView.do'>이동</a>
			<br><br>
		</span>
		<c:if test="${usersProfile.blackyn == 'N' && usersProfile.quityn == 'N'}">
			<table>
				<tr><td style="width:100px; font-size: 10pt; color: #aaa;">구독자</td>
					<td style="width:100px; font-size: 10pt; color: #aaa;">관심작가</td>
				<tr><td style="font-size: 17pt;color: #9c9c9c;" onclick="location.href='moveFollowerPage.do?artistid=${usersProfile.userid}&loginUserid=${loginUser.userid }'">${follower }</td>
					<td style="font-size: 17pt;color: #9c9c9c;" onclick="location.href='moveFollowingPage.do?artistid=${usersProfile.userid}&loginUserid=${loginUser.userid }'">${following }</td></tr>
			</table>
		</c:if>
		<c:if test="${usersProfile.quityn == 'Y'}">
		<p style="color:red;">존재하지 않거나 탈퇴한 회원입니다.</p>
		</c:if>
		<c:if test="${usersProfile.blackyn == 'Y' and usersProfile.quityn == 'N'}">
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
			
			<c:if test="${usersProfile.userid != loginUser.userid && usersProfile.blackyn == 'N' && usersProfile.quityn == 'N'}">
					<c:if test="${followyn eq 'Y' }">
						<button class="mini ui basic teal button" onclick="deleteFollowing()">구독중&ensp;<i class="check icon" style="width:7px;"></i></button>
					</c:if>
					<c:if test="${followyn eq 'N' }">
						<button class="mini ui teal button" onclick="insertFollowing()">구독하기</button>
					</c:if>
					<button class="mini ui teal button" onclick="location.href='moveArtistGuestBook.do?artistid=${usersProfile.userid}&userid=${loginUser.userid }&currentPage=1'">방명록 작성</button>
			</c:if>
			
			<c:if test="${usersProfile.blackyn == 'N' && usersProfile.userid == loginUser.userid}">
				<button class="mini ui teal button" onclick="location.href='moveArtistGuestBook.do?artistid=${usersProfile.userid}&userid=${loginUser.userid }&currentPage=1'">방명록 관리</button>
			</c:if>
			<c:if test="${usersProfile.quityn == 'N'}">
			<i class="grey ellipsis vertical icon" id="profileMenu"></i>
			</c:if>
		</div>
		
		<!-- 프로필 메뉴 버튼 클릭 시 버튼 나타날 영역 -->
		<c:if test="${usersProfile.quityn == 'N'}">
		<div class="profileMenuOpen">
			<div id="ProfileMenuBtn" style="display:none">
			<!-- 작가홈 아이디와 로그인 아이디에 따라 아래 버튼 다르게 보이게 해야 함 -->
			<c:if test="${usersProfile.userid == loginUser.userid }">
				<button class="ui mini grey basic button" id="profileEdit" onclick="location.href='moveReaffirmUserpwd.do'">내정보 수정</button>
			</c:if>
			<c:if test="${usersProfile.userid != loginUser.userid }">
			<button class="ui mini grey basic button" id="profileReport" onclick="location.href='moveProfileReport.do?reportedu=${usersProfile.userid}'">작가 신고</button>
			</c:if>
			</div>
		</div>
		</c:if>
	</div> <!-- 상단 프로필 부분 끝! -->

	<!-- 작가홈 메뉴바 -->	
	<c:if test="${usersProfile.blackyn == 'N' && usersProfile.quityn == 'N'}">
		<div class="artisthomeMenu">
			<div id="artistMenu" class="two item ui tabular menu" style="width:100%;">
				<a id="item" class="item active" data-tab="first">작가소개</a>
				<a id="item" class="item" data-tab="second" href="javascript:artistObjetList();">오브제</a>
			</div>
		</div>
	</c:if>
	<!-- 작가소개 영역 ************************************************************************************************** -->
	<c:if test="${usersProfile.blackyn == 'N' && usersProfile.quityn == 'N'}">
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
		 	
		 	
		 	<!-- 작가홈 본인일때만 작가소개 수정 버튼 -->
		 	<br><br><br><br><br>
		 	<c:if test="${usersProfile.userid == loginUser.userid }">
			<div align="center"><button class="ui medium grey basic button" id="editArtistIntro" onclick="location.href='moveArtistIntroEdit.do?userid=${loginUser.userid}'">작가소개 수정</button></div>
			</c:if>
			<c:if test="${usersProfile.userid != loginUser.userid }">
			<div align="center"><button class="ui medium grey basic button" id="editArtistIntro" onclick="">전시일정 보기</button></div>
			</c:if>
			<br>
			</div>
		</div>
	</c:if>	
		
	<!-- 오브제 영역 ************************************************************************************************** -->	
		<div class="ui tab" data-tab="second">
			<div class="innerTab">
				<div class="artisthomeObjetSection">
				
				</div>
				<br><br><br><br>
				
				<div align="center" id="objetListBottom">
				
				</div>
				
				<div align="center">
				오브제명&ensp;<div class="ui input"><input type="text" name="keyword" id="keyword"></div>
					&ensp;<div class="ui buttons"><button class="ui button" type="submit" onclick="objetSearch();">검색</button></div>
				</div>
				
			</div>
		</div>
	
		<!-- 오브제 부분 끝! -->
		<script type="text/javascript">
		$(function(){
			$('#keyword').keypress(function(e){
				if(e.keyCode == 13){
					objetSearch();
				}
				});
		})
		</script>


		
	</section>	
	</div><!-- 작가홈 메뉴바 끝! wrapHome -->
	

	

 <!-- 작가홈 끝! -->


<c:import url="../footer.jsp" />
</body>

</html>