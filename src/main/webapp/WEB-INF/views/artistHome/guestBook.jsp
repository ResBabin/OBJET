<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("newLineN", "\n"); %>
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


	 // 방명록 쓰기
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
		
	if(confirm(str+"글로 변경하시겠습니까?")){
	$.ajax({
		url : "updateGuestBookPrivate.do",
		type: "post",
		data: {gbno: gbno, privateyn : privateyn},
		success : function(result){
			if(result == "ok"){
				alert(str+"글로 변경되었습니다.");
				window.location.reload();
			}else{
				alert(str+"글 변경에 실패하였습니다.");
				window.location.href='moveArtistGuestBook.do?artistid='+artistid + '&userid=' + userid + '&currentPage='+ curPage;
			}
			
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
		
	})//ajax...
	}else{
		return false;
	}
} //changePrivate()...


//방명록 삭제
function deleteGB(gbno, artistid, userid, curPage){
	if(confirm("정말로 삭제하시겠습니까?")){
	$.ajax({
		url : "deleteGuestBook.do",
		type: "post",
		data: {gbno: gbno},
		success : function(result){
			if(result == "ok"){
				alert("방명록이 삭제 되었습니다.");
				window.location.reload();
			}else{
				alert("방명록 삭제에 실패하였습니다.");
				window.location.href='moveArtistGuestBook.do?artistid='+artistid + '&userid=' + userid + '&currentPage='+ curPage;
			}
			
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
		
	})//ajax...
	}else{
		return false;
	}
} //deleteGB()...


//방명록 댓글삭제
function deleteReply(gbno, artistid, userid, curPage){
	if(confirm("정말로 삭제하시겠습니까?")){
	$.ajax({
		url : "deleteGuestBookReply.do",
		type: "post",
		data: {gbno: gbno},
		success : function(result){
			if(result == "ok"){
				alert("댓글이 삭제 되었습니다.");
				window.location.reload();
			}else{
				alert("댓글 삭제에 실패하였습니다.");
				window.location.href='moveArtistGuestBook.do?artistid='+artistid + '&userid=' + userid + '&currentPage='+ curPage;
			}
			
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
		
	})//ajax...
	}else{
		return false;
	}
} //deleteReply()...


//방명록 댓글 작성
function insertReply(gbno, artistid, userid, curPage){
	$.ajax({
		url : "insertGuestBookReply.do",
		type: "post",
		data: {gbno: gbno, artistid: artistid, replycontent:$("#replycontent").val(), userid:userid},
		success : function(result){
			if(result == "ok"){
				alert("댓글이 작성되었습니다.");
				window.location.reload();
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


// 방명록 수정창 열기
function editGB(gbno,replyyn){
	// 댓글 없으면
		if(replyyn=='N'){
			// 기존 내용 숨기고 수정창으로 바꾸기
			$("#showGB"+gbno).css("display","none");
			$("#updateGB"+gbno).css("display", "block");
			$("#showGBMenu"+gbno).css("display", "none");
			$("#upGBMenu"+gbno).css("display", "block");
			
			// 수정 textarea 글자수 세기
			$("#gbcontent"+gbno).keyup(function(e){
				 var content = $(this).val();
				 $("#counter"+gbno).html("( <span style='color:#4ecdc4;font-size: 9pt;'>"+content.length+"</span> / 최대 500자 )");	// 글자수 실시간 카운팅
				 
				 if(content.length > 500){
					 alert("최대 500자까지만 입력 가능합니다.");
					 $(this).val(content.substring(0,500));
					 $("#counter"+gbno).html("( <span style='color:red;font-size: 9pt;'>500 </span>/ 최대 500자)");
				 } 
			 });
			
			// 수정 취소 누르면 원상복구
			$("#upCancel"+gbno).click(function(e){
				$("#showGB"+gbno).css("display","block");
				$("#updateGB"+gbno).css("display", "none");
				$("#showGBMenu"+gbno).css("display", "block");
				$("#upGBMenu"+gbno).css("display", "none");
			 });
			
			
			// 완료 클릭 시 에이작스 보내기
			$("#goUpdateGB"+gbno).click(function(e){
				
				var gbcontent = $("#gbcontent"+gbno).val();
				$.ajax({
					url : "updateGuestBook.do",
					type: "post",
					data: {gbno : gbno, gbcontent: gbcontent},
					success : function(result){
						if(result == "ok"){
							alert("수정이 완료되었습니다.");
							window.location.reload();
						}else{
							alert("수정에 실패하였습니다.");
							location.reload();
						}
						
					},
					error : function(jqXHR, textStatus, errorThrown){
						console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
					}
					
				})//ajax...
			});
	// 댓글 있으면
		}else{
			alert("댓글이 달린 방명록은 수정 불가합니다.");
			return false;
		}
		
	}; // editGB()...
	
	
	
	// 방명록 댓글 수정창 열기
	function editReply(gbno){
			// 기존 내용 숨기고 수정창으로 바꾸기
			$("#showReplyMenu"+gbno).css("display","none");
			$("#upReplyMenu"+gbno).css("display", "block");
			$("#showReply"+gbno).css("display", "none");
			$("#updateGBReply"+gbno).css("display", "block");
			
			// 수정 취소 누르면 원상복구
			$("#upReplyCancel"+gbno).click(function(e){
				$("#showReplyMenu"+gbno).css("display","block");
				$("#upReplyMenu"+gbno).css("display", "none");
				$("#showReply"+gbno).css("display", "block");
				$("#updateGBReply"+gbno).css("display", "none");
			 });
			
			
			// 완료 클릭 시 에이작스 보내기
			$("#goUpdateReply"+gbno).click(function(e){
				
				var replycontent = $("#replycontent"+gbno).val();
				$.ajax({
					url : "updateGuestBookReply.do",
					type: "post",
					data: {gbno : gbno, replycontent: replycontent},
					success : function(result){
						if(result == "ok"){
							alert("수정이 완료되었습니다.");
							window.location.reload();
						}else{
							alert("수정에 실패하였습니다.");
							location.reload();
						}
						
					},
					error : function(jqXHR, textStatus, errorThrown){
						console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
					}
					
				})//ajax...
			});
			
		}; // editReply()...
	
	
	 
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
			<p class="profileText" style="font-size: 25px; color:#373737;">${artist.nickname}&nbsp;<i class="small olive home icon" style="cursor: pointer;" onclick="location.href='artistHomeMain.do?userid=${artist.userid }&loginUser=${loginUser.userid}&currentPage=1'"></i></p>
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
				<div class="profileImage" style="background-image:url('resources/images/basicprofilepic.png');" onclick="location.href='artistHomeMain.do?userid=${artist.userid}&loginUser=${loginUser.userid }&currentPage=1'"></div>
			</c:if>
			<c:if test="${artist.userrpic!=null }">
				<div class="profileImage" style="background-image:url('resources/users_upfiles/${artist.userrpic}');" onclick="location.href='artistHomeMain.do?userid=${artist.userid}&loginUser=${loginUser.userid }&currentPage=1'"></div>
			</c:if>
			<br><br><br><br><br><br><br><br>
		</div>
	
	</div> <!-- 상단 프로필 부분 끝! -->
<!-- 본인 작가홈이 아닐 때 방명록 작성 칸 보이기 시작 -->
			<c:if test="${artist.userid != loginUser.userid && loginUser.blackyn == 'N'}">
				<div class="gblist">
					<form name="gbform">
					<input type="hidden" name="userid" value="${loginUser.userid }">
					<input type="hidden" name="artistid" value="${artist.userid}">
					<input type="hidden" name="currentPage" value="${paging.currentPage }">
						<table class="gbwrite">
							<tr style="height:20px;">
								<td colspan="2" style="background-image: url('resources/images/border.png')"></td>
							</tr>
							<tr>
								<td style="width:15%">
								<c:if test="${loginUser.userrpic == null }">
									<div class="profileImage4" style="background-image:url('resources/images/basicprofilepic.png')"></div>
								</c:if>
								<c:if test="${loginUser.userrpic != null }">
									<div class="profileImage4" style="background-image:url('resources/users_upfiles/${loginUser.userrpic}') "></div>
								</c:if>
							</td>
								<td style="width:85%; height: 150px;"><div class="ui form"><textarea style="width:600px;margin-left:20px;"rows="5" cols="100" name="gbcontent" id="gbcontent" required placeholder="저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 방명록은 이용약관 및 관련 법률에 의해 제재를 받을 수 있습니다. 건전한 방명록 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 비속어를 사용할 경우 계정이 일시중지될 수 있습니다."></textarea></div></td>
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
	<c:if test="${!empty list}">
				<c:forEach var="list" items="${list }" varStatus="status">
				<!-- 방명록 리스트 보기 시작-->
				<div class="gblist">
					<table class="gbwrite">
						<tr style="height:25px;">
							<c:if test="${list.userid eq loginUser.userid }">
								<td colspan="2" style="width:auto; background:#9fe3de;">
							</c:if>
							<c:if test="${list.userid ne loginUser.userid }">
								<td colspan="2" style="width:auto; background:#efefef;">
							</c:if>
 								<span style="width:10%; margin-left: 20px;">No. ${(paging.listCount - status.index)-((paging.currentPage-1)*paging.limit)}</span>
				   				<span style="margin-left: 15px;"><a href='artistHomeMain.do?userid=${list.userid}&loginUser=${loginUser.userid }&currentPage=1' style="font-weight: 600; color:#14123a;">${list.usernickname }</a></span>
				  				<span style="margin-left: 5px;font-size: 9pt;"><fmt:formatDate value="${list.gbdate}" pattern="(yyyy.MM.dd E)"/></span>
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
			     						<a onclick="deleteGB('${list.gbno}', '${list.artistid}','${loginUser.userid}','${paging.currentPage }');">삭제</a>
			     				</c:if>
			     				
			     				<!-- 글쓴이일때 -->
			     				<c:if test="${list.userid == loginUser.userid && list.artistid != loginUser.userid}">
			     				<div id="showGBMenu${list.gbno}" style="display:block;">
			     				<c:if test="${list.privateyn == 'N' }">
			     				 	<a onclick="changePrivate('${list.gbno}', 'Y', '${list.artistid }','${loginUser.userid }','${paging.currentPage }');">비밀로하기</a> | 
			     				 </c:if>
			     				 <c:if test="${list.privateyn == 'Y' }">
			     				 	<a onclick="changePrivate('${list.gbno}', 'N', '${list.artistid }','${loginUser.userid }','${paging.currentPage }');">공개하기</a> | 
			     				 </c:if>
			     					<a href="javascript:void(0);" onclick="editGB('${list.gbno}','${list.replyyn }')">수정</a> | 
			     					<a onclick="deleteGB('${list.gbno}', '${list.artistid}','${loginUser.userid}','${paging.currentPage }');">삭제</a>
			     				</c:if>
								</div>
								<div id="upGBMenu${list.gbno}" style="display:none;">
								<a href="" id="goUpdateGB${list.gbno }">완료</a> | 
			     				<a id="upCancel${list.gbno}">취소</a>
								</div>
			     				
			   					</div> 
							</td>
						</tr>
						<!-- 방명록 내용 -->
						<tr><td style="width:15%;">
							<c:if test="${list.userrpic == null }">
								<div class="profileImage4" style="background-image:url('resources/images/basicprofilepic.png')" onclick="location.href='artistHomeMain.do?userid=${list.userid}&loginUser=${loginUser.userid }&currentPage=1'"></div>
							</c:if>
							<c:if test="${list.userrpic != null }">
								<div class="profileImage4" style="background-image:url('resources/users_upfiles/${list.userrpic}')" onclick="location.href='artistHomeMain.do?userid=${list.userid}&loginUser=${loginUser.userid }&currentPage=1'"></div>
							</c:if>
						</td>
							<td style="width:85%;"><div class="gbcontent" id="showGB${list.gbno }" style="display: block">
							<c:if test="${list.privateyn == 'Y' }">
								<c:if test="${artist.userid != loginUser.userid && list.userid != loginUser.userid }">
									<i class="large teal lock icon"></i><span style="color:#4ecdc4;font-size: 10pt;">비밀글입니다 :)</span><br><br>
								</c:if>
								<c:if test="${artist.userid == loginUser.userid || list.userid == loginUser.userid }">
									<i class="large teal lock icon"></i><span style="color:#4ecdc4;font-size: 10pt;">비밀글입니다 :)</span><br><br>
									${fn:replace(list.gbcontent, newLineN, "<br>")}
								</c:if>
							</c:if>
							<c:if test="${list.privateyn == 'N'}">
								${fn:replace(list.gbcontent, newLineN, "<br>")}
							</c:if>
							</div>
							<!-- 방명록 수정창 -->
							<div class="upGB" id="updateGB${list.gbno }" style="display:none;">
								<br>
									<div class="ui form"><textarea style="width:600px;margin-left:20px;"rows="5" cols="100" name="gbcontent" id="gbcontent${list.gbno }" required>${list.gbcontent }</textarea></div><br>
									<div style="color:#202020; margin-left:20px; margin-top:-15px; font-size: 9pt;" id="counter${list.gbno }">( <span style="color:#4ecdc4; font-size: 9pt;">0</span> / 최대 500자 )</div>
							</div>
							
							</td>
						</tr>
						
						
						<!-- 작가 홈 주인일 때 답변 내용이 없으면 답변 쓰기 창 -->
						<c:if test="${(list.artistid == loginUser.userid) && list.replyyn == 'N' }">
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
								<span style="margin-left: 5px;font-size: 9pt;"><fmt:formatDate value="${list.replydate}" pattern="(yyyy.MM.dd E)"/></span>
								<!-- 작가홈 주인일 때 -->
									<c:if test="${list.artistid == loginUser.userid }">
										<div id="showReplyMenu${list.gbno}" style="display:block; float:right; margin-right:10px;">
				     						<a href="javascript:void(0);" onclick="editReply('${list.gbno}')">수정</a> | 
				     						<a onclick="deleteReply('${list.gbno}', '${list.artistid}','${loginUser.userid}','${paging.currentPage }');">삭제</a>
				     					</div>
										<div id="upReplyMenu${list.gbno}" style="display:none; float:right; margin-right:10px;">
				     						<a href="" id="goUpdateReply${list.gbno }">완료</a> | 
				     						<a id="upReplyCancel${list.gbno}">취소</a>
				     					</div>
				     				</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="replybg" style="background:#efefef; min-height: 60px;">
							<div class="gbreply" id="showReply${list.gbno }" style="display: block">
							<c:if test="${list.privateyn == 'N'}">
									<p class="replycontent">${fn:replace(list.replycontent, newLineN, "<br>")}</p>
							</c:if>
							<c:if test="${list.privateyn == 'Y' }">
								<c:if test="${list.artistid != loginUser.userid || list.userid != loginUser.userid }">
									&emsp;<i class="large teal lock icon"></i><span style="color:#4ecdc4;font-size: 10pt;">작성자만 볼 수 있습니다.</span>
								</c:if>
								<c:if test="${list.artistid == loginUser.userid || list.userid == loginUser.userid }">
									<p class="replycontent">${fn:replace(list.replycontent, newLineN, "<br>")}</p>
								</c:if>
							</c:if>
							</div>
							<!-- 댓글 수정창 -->
							<div class="upGBReply" id="updateGBReply${list.gbno }" style="display:none;">
								<div class="ui form" style="float:left;"><textarea style="width:650px;height:30px;margin-left:20px;"rows="1" cols="100" name="replycontent" id="replycontent${list.gbno }" placeholder="최대 100자까지만 입력 가능합니다." required>${list.replycontent }</textarea></div>
							</div>
							</td>
						</tr>
						</c:if>
						
					</table>
				</div>
				</c:forEach>
<!-- 방명록 리스트 보기 끝 -->
				
				
				
				<!--  페이징 -->
				<div align="center">
					<div id="paging">
						 <c:if test="${ kind eq 'all' }"> 
							 <c:if test="${ paging.startPage != 1 }">
							 	<a href="moveArtistGuestBook.do?artistid=${artist.userid }&userid=${loginUser.userid }&currentPage=${paging.startPage - 1}">이전</a>
							 </c:if>
							 
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="moveArtistGuestBook.do?artistid=${artist.userid }&userid=${loginUser.userid }&currentPage=${num}">&emsp;
								<c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
								<c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
								</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="moveArtistGuestBook.do?artistid=${artist.userid }&userid=${loginUser.userid }&currentPage=${paging.endPage + 1}">다음</a>
							</c:if>
						 </c:if> 
						
						
						<c:if test="${ kind eq 'sort' }">
							<c:if test="${ paging.startPage != 1 }">
						 		<a href="moveMyGuestBook.do?artistid=${artist.userid }&userid=${loginUser.userid }&currentPage=${paging.startPage - 1}">이전</a>
							</c:if>
						
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="moveMyGuestBook.do?artistid=${artist.userid }&userid=${loginUser.userid }&currentPage=${num}">&emsp;
								<c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
								<c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
								</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="moveMyGuestBook.do?artistid=${artist.userid }&userid=${loginUser.userid }&currentPage=${paging.endPage + 1}">다음</a>
							</c:if>
						</c:if>
						
						
						<c:if test="${ kind eq 'search' }">
							<c:if test="${ paging.startPage != 1 }">
						 		<a href="moveGuestBookSearch.do?artistid=${artist.userid }&userid=${loginUser.userid }&currentPage=${paging.startPage - 1}&searchtype=${searchtype}&keyword=${keyword}">이전</a>
							</c:if>
						
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="moveGuestBookSearch.do?artistid=${artist.userid }&userid=${loginUser.userid }&currentPage=${num}&searchtype=${searchtype}&keyword=${keyword}">&emsp;
								<c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
								<c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
								</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="moveGuestBookSearch.do?artistid=${artist.userid }&userid=${loginUser.userid }&currentPage=${paging.endPage + 1}&searchtype=${searchtype}&keyword=${keyword}">다음</a>
							</c:if>
						</c:if>
					</div>
				</div>
		</c:if>
		<c:if test="${empty list}">
		<c:if test="${artist.userid == loginUser.userid }">
			<div align="center" style="padding-top: 240px;"><div class="ui olive message"><p><i class="edit outline icon"></i>&nbsp;작성된 방명록이 없습니다.</p></div>
			</div>
		</c:if>
		<c:if test="${artist.userid != loginUser.userid && loginUser.blackyn == 'N'}">
			<div align="center" style="padding-top: 30px;"><div class="ui olive message"><p>작성된 방명록이 없습니다. 한번 남겨보시는 건 어떠세요? <i class="smile outline icon"></i></p></div>
			</div>
		</c:if>
		<c:if test="${artist.userid != loginUser.userid && loginUser.blackyn == 'Y'}">
			<div align="center" style="padding-top: 240px;"><div class="ui red message"><p>일시정지 계정의 경우 방명록 남기기가 불가능합니다.</p></div>
			</div>
		</c:if>
		</c:if>
				
				<br><br><br><br>
				<!-- 작가홈 주인일 때 검색창 -->
				<c:if test="${!empty list }">
				<c:if test="${artist.userid == loginUser.userid }">
				<div align="center">
					<form action="moveGuestBookSearch.do" method="get">
					<input type="hidden" name="artistid" value="${artist.userid}">
					<input type="hidden" name="currentPage" value="1">
						<select class="ui search dropdown" name="searchtype" id="searchtype">
						  <option value="u.nickname">작성자</option>
						  <option value="g.gbcontent">내용</option>
						</select>
					<c:if test="${keyword != null and keyword != ''}">
						<div class="ui input"><input type="text" name="keyword" value="${keyword }"></div>
					</c:if>
					<c:if test="${keyword == null or keyword == ''}">
						<div class="ui input"><input type="text" name="keyword" id="keyword" required></div>
					</c:if>
					&ensp;<div class="ui buttons"><button class="mainBtn" id="gbsearchbtn" type="submit">검색</button></div>
					</form>
					
					<br><div align="center"><button class="mainBtn1" onclick="location.href='moveArtistGuestBook.do?artistid=${artist.userid}&userid=${loginUser.userid }&currentPage=1'">목록보기</button>&emsp;
					</div>
				</div>
				</c:if>
				</c:if>
					
				<!-- 작가홈 구경온 사람일 때는 내가 쓴 글 보기 -->
			<c:if test="${!empty list }">
			<c:if test="${artist.userid != loginUser.userid }">
				<div align="center"><button class="mainBtn" id="mygblist" onclick="location.href='moveArtistGuestBook.do?artistid=${artist.userid}&userid=${loginUser.userid }&currentPage=1'">목록보기</button>&emsp;
									<button class="mainBtn1" id="mygblist" onclick="location.href='moveMyGuestBook.do?artistid=${artist.userid }&userid=${loginUser.userid }&currentPage=1'">내가 쓴 글 보기</button>
				</div>
			</c:if>
			</c:if>
			</div>
			<div align="right">
				<a href="#"><img src="resources/images/objet/top.png" style="width:8%; height:auto; padding-right: 50px; padding-bottom: 50px;"></a>
			</div>
		</div>	
			
<c:import url="../footer.jsp" />
</body>
</html>