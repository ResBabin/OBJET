<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
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
$(function(){
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
	 
});// documentReady...

	 // 방명록 제출
	 function GbFormSub(){
		var form = $("form[name=gbform]").serialize();
	
		$.ajax({
			url : "insertGuestBook.do",
			type: "post",
			data: form,
			success : function(result){
				if(result == "ok"){
					alert("등록이 완료되었습니다.");
					location.reload();
				}else{
					alert("등록에 실패하였습니다.");
					location.reload();
				}
				
			},
			error : function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
			}
			
		})//ajax...
}// GbFormSub()...

// 비밀로 하기
function changePrivate(gbno, privateyn, artistid, userid, curPage){
	var str = null;
	if(privateyn == 'Y')
		str = '비밀';
	else
		str = '공개'
	$.ajax({
		url : "updateGuestBookPrivate.do",
		type: "post",
		data: {gbno: gbno, privateyn : privateyn},
		success : function(result){
			if(result == "ok"){
				alert(str+"글로 변경되었습니다.");
				window.location.href='moveArtistGuestBook.do?artistid='+artistid + '&userid=' + userid + '&currentPage='+ curPage;
			}else{
				alert(str+"글 변경에 실패하였습니다.");
				window.location.href='moveArtistGuestBook.do?artistid='+artistid + '&userid=' + userid + '&currentPage='+ curPage;
			}
			
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
		
	})//ajax...
} //changePrivate()...


//방명록 삭제
function deleteGB(gbno, artistid, userid, curPage){
	$.ajax({
		url : "deleteGuestBook.do",
		type: "post",
		data: {gbno: gbno},
		success : function(result){
			if(result == "ok"){
				alert("방명록이 삭제 되었습니다.");
				window.location.href='moveArtistGuestBook.do?artistid='+artistid + '&userid=' + userid + '&currentPage='+ curPage;
			}else{
				alert("방명록 삭제에 실패하였습니다.");
				window.location.href='moveArtistGuestBook.do?artistid='+artistid + '&userid=' + userid + '&currentPage='+ curPage;
			}
			
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
		
	})//ajax...
} //deletePrivate()...


//방명록 댓글 작성
function insertReply(gbno, artistid, userid, curPage){
	$.ajax({
		url : "insertGuestBookReply.do",
		type: "post",
		data: {gbno: gbno, artistid: artistid, replycontent:$("#replycontent").val(), userid:userid},
		success : function(result){
			if(result == "ok"){
				alert("댓글이 작성되었습니다.");
				window.location.href='moveArtistGuestBook.do?artistid='+artistid + '&userid=' + userid + '&currentPage='+ curPage;
			}else{
				alert("댓글 작성에 실패하였습니다.");
				window.location.href='moveArtistGuestBook.do?artistid='+artistid + '&userid=' + userid + '&currentPage='+ curPage;
			}
			
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
		
	})//ajax...
} //changePrivate()...
	 
</script>
</head>
<body>

<!-- 방명록 시작 -->
<div class="wrapHome">


	<!-- 상단 프로필 부분 -->
	<div class="wrapProfile">
		<!-- 프로필 글자부분 -->
		<div class="profileTextSection">
		<span>
			<p class="profileText" style="font-size: 25px; color:#373737;">${artist.nickname}</p>
			<p class="profileText" style="font-size: 10pt; color:#aaa;">${artist.userintros}</p>
			<br><br>
		</span>
		<c:if test="${artist.blackyn == 'Y'}">
		<p style="color:red;">오브제 가이드라인을 위반하여 일시 정지된 계정입니다.</p>
		</c:if>
		</div>
		
		<!-- 프로필 사진부분 -->
			<div class="profileImageSection">
			<c:if test="${artist.userrpic == null }">
				<div class="profileImage" style="background-image:url('resources/images/basicprofilepic.png') "></div>
			</c:if>
			<c:if test="${artist.userrpic!=null }">
				<div class="profileImage" style="background-image:url('resources/users_upfiles/${artist.userrpic}') "></div>
			</c:if>
			<br><br><br><br><br><br><br><br>
		</div>
	
	</div> <!-- 상단 프로필 부분 끝! -->


<!-- 본인 작가홈이 아닐 때 방명록 작성 칸 보이기 시작 -->
			<c:if test="${artist.userid != loginUser.userid }">
				<div class="gblist">
					<form name="gbform">
					<input type="hidden" name="userid" value="${loginUser.userid }">
					<input type="hidden" name="artistid" value="${artist.userid}">
					<input type="hidden" name="currentPage" value="${paging.currentPage }">
						<table class="gbwrite">
							<tr>
								<td style="width:15%">
								<c:if test="${loginUser.userrpic == null }">
									<div class="profileImage4" style="background-image:url('resources/images/basicprofilepic.png')"></div>
								</c:if>
								<c:if test="${loginUser.userrpic != null }">
									<div class="profileImage4" style="background-image:url('resources/users_upfiles/${loginUser.userrpic}') "></div>
								</c:if>
							</td>
								<td style="width:85%; height: 150px;"><div class="ui form"><textarea style="width:600px;margin-left:20px;"rows="5" cols="100" name="gbcontent" id="gbcontent" required></textarea></div></td>
							</tr>
							<tr style="height:25px;">
								<td></td>
								<td><div style="color:#202020; margin-left:20px; margin-top:-15px; font-size: 9pt;" id="counter">( <span style="color:#4ecdc4; font-size: 9pt;">0</span> / 최대 500자 )</div>
									<span style="float:left; color:#202020; margin-left:495px; margin-top:-15px;"><input type="checkbox" name="privateyn" value="Y"><label style="font-size: 9pt;">&ensp;비밀글</label></span>
									<span><button class="ui mini button" onclick="GbFormSub()" style="background: #4c4c4c; color:#fff; float:left;margin-left:10px; margin-top:-20px;">등록</button></span></td>
							</tr>
						</table>
					</form>
				</div>
			</c:if>
<!-- 본인 작가홈이 아닐 때 방명록 작성 칸 보이기 끝!-->


<!-- 방명록 리스트 시작! -->
				<c:forEach var="list" items="${list }" varStatus="status">
				<!-- 방명록 리스트 보기 시작-->
				<div class="gblist">
					<table class="gbwrite">
						<tr style="height:25px;">
							<td colspan="2" style="width:auto; background:#efefef;">
								<span style="width:10%; margin-left: 20px;">No. ${list.gbno}</span>
<%-- 								<span style="width:10%; margin-left: 20px;">No. ${(paging.listCount - status.index)-((paging.currentPage-1)*paging.limit)}</span> --%>
				   				<span style="margin-left: 15px;"><a href='artistHomeMain.do?userid=${list.userid}&loginUser=${loginUser.userid }' style="font-weight: 600; color:#14123a;">${list.usernickname }</a></span>
				  				<span style="margin-left: 5px;font-size: 9pt;"><fmt:formatDate value="${list.gbdate}" pattern="(yyyy.MM.dd hh:ss)"/></span>
			     				<div style="float:right; margin-right:10px;">
			     				<!-- 작가홈 주인일 때 -->
			     				<c:if test="${list.artistid == loginUser.userid}">
				     				<c:if test="${list.privateyn == 'N' }">
				     					<a onclick="changePrivate('${list.gbno}', 'Y', '${list.artistid}','${loginUser.userid}','${paging.currentPage }');">비밀로하기</a> | 
				     				</c:if>
				     				<c:if test="${list.privateyn == 'Y' }">
			     				 		<a onclick="changePrivate('${list.gbno}', 'N', '${list.artistid }','${loginUser.userid }','${paging.currentPage }');">공개하기</a> | 
			     				 	</c:if>
			     						<a onclick="location.href='moveProfileReport.do?reportedu=${list.userid}'">신고</a> | 
			     						<a onclick="deleteGB('${list.gbno}', '${list.artistid}','${loginUser.userid}','${paging.currentPage }');">삭제</a></div>
			     				</c:if>
			     				
			     				<!-- 글쓴이일때 -->
			     				<c:if test="${list.userid == loginUser.userid && list.artistid != loginUser.userid}">
			     				<c:if test="${list.privateyn == 'N' }">
			     				 	<a onclick="changePrivate('${list.gbno}', 'Y', '${list.artistid }','${loginUser.userid }','${paging.currentPage }');">비밀로하기</a> | 
			     				 </c:if>
			     				 <c:if test="${list.privateyn == 'Y' }">
			     				 	<a onclick="changePrivate('${list.gbno}', 'N', '${list.artistid }','${loginUser.userid }','${paging.currentPage }');">공개하기</a> | 
			     				 </c:if>
			     					<a onclick="location.href=''">수정</a> | 
			     					<a onclick="deleteGB('${list.gbno}', '${list.artistid}','${loginUser.userid}','${paging.currentPage }');">삭제</a></div> 
			     				</c:if>
							</td>
						</tr>
						<!-- 방명록 내용 -->
						<tr><td style="width:15%">
							<c:if test="${list.userrpic == null }">
								<div class="profileImage4" style="background-image:url('resources/images/basicprofilepic.png') "></div>
							</c:if>
							<c:if test="${list.userrpic != null }">
								<div class="profileImage4" style="background-image:url('resources/users_upfiles/${list.userrpic}') "></div>
							</c:if>
						</td>
							<td style="width:85%;"><div class="gbcontent">
							<c:if test="${list.privateyn == 'Y' }">
								<c:if test="${artist.userid != loginUser.userid && list.userid != loginUser.userid }">
									<i class="large teal lock icon"></i><span style="color:#4ecdc4;font-size: 10pt;">비밀글입니다 :)</span><br><br>
								</c:if>
								<c:if test="${artist.userid == loginUser.userid || list.userid == loginUser.userid }">
									<i class="large teal lock icon"></i><span style="color:#4ecdc4;font-size: 10pt;">비밀글입니다 :)</span><br><br>
									${list.gbcontent }
								</c:if>
							</c:if>
							<c:if test="${list.privateyn == 'N'}">
								${list.gbcontent }
							</c:if>
							</div>
						</tr>
						<!-- ★★ ArrayList로 방명록 리스트 불러와서 포문 돌릴 때 그 안에 방명록 댓글 폼 포함해서 넣어야 gbno를 hidden으로 보낼 수 있음. 방명록댓글이 있으면 방명록 댓글 보이게~! -->
						
						
						<!-- 작가 홈 주인일 때 답변 내용이 없으면 답변 쓰기 창 -->
						<c:if test="${list.artistid == loginUser.userid && list.replyyn == 'N' }">
						<tr style="height:60px;">
									<td colspan="2"><div class="ui form" style="float:left;"><textarea style="width:650px;height:30px;margin-left:20px;"rows="1" cols="100" name="replycontent" id="replycontent" placeholder="댓글은 최대 100자까지 입력 가능합니다." required></textarea></div>
									<span><button class="ui mini button" onclick="insertReply('${list.gbno}','${list.artistid }','${list.userid }','${paging.currentPage}')" style="background: #4c4c4c; margin-left:10px;color:#fff;">등록</button></span></td>
						<tr>
						</c:if>
						
						<!-- 작가홈 주인or관람객 답변 내용이 달렸을 때 -->
						<c:if test="${list.replyyn == 'Y' }">
						<tr>
							<td colspan="2" style="height: 30px;background:#efefef;">
								<span style="width:10%; margin-left: 20px; color:#4ecdc4; font-weight:600;">${list.artistnickname }</span>
								<span style="margin-left: 5px;font-size: 9pt;"><fmt:formatDate value="${list.replydate}" pattern="(yyyy.MM.dd hh:ss)"/></span>
								<!-- 작가홈 주인일 때 -->
									<c:if test="${list.artistid == loginUser.userid }">
										<div style="float:right; margin-right:10px;">
				     						<a onclick="location.href=''">수정</a> | 
				     						<a onclick="location.href=''">삭제</a>
				     					</div>
				     				</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="replybg" style="background:#efefef; min-height: 60px;">
							<c:if test="${list.privateyn == 'N'}">
									<p class="replycontent">${list.replycontent }</p>
							</c:if>
							<c:if test="${list.privateyn == 'Y' }">
								<c:if test="${list.artistid != loginUser.userid || list.userid != loginUser.userid }">
									&emsp;<i class="large teal lock icon"></i><span style="color:#4ecdc4;font-size: 10pt;">작성자만 볼 수 있습니다.</span>
								</c:if>
								<c:if test="${list.artistid == loginUser.userid || list.userid == loginUser.userid }">
									<p class="replycontent">${list.replycontent }</p>
								</c:if>
							</c:if>
							</td>
						</tr>
						</c:if>
						
					</table>
				</div>
				</c:forEach>
<!-- 방명록 리스트 보기 끝 -->
				
				
				
				<!--  페이징 -->
				<div align="center">페이징 부분</div><br><br>
				
				<!-- 작가홈 주인일 때 검색창 -->
				<c:if test="${artist.userid == loginUser.userid }">
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
				</c:if>
				
					

				
				
				<!-- 작가홈 구경온 사람일 때는 내가 쓴 글 보기 -->
			<br>
			<c:if test="${artist.userid != loginUser.userid }">
				<div align="center"><button class="ui medium grey basic button" id="mygblist" onclick="location.href=''">내가 쓴 글 보기</button></div>
			</c:if>
			</div>

</body>
<br><br><br><br><br><br><br><br><br><br><br><br>
<c:import url="../footer.jsp" />
</html>