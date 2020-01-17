<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로워 목록</title>
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
	$(".listTr").slice(0, 10).fadeIn();
    $("#moreFollowList").click(function(e) { 
          e.preventDefault();
          $(".listTr:hidden").slice(0, 5).fadeIn(); 
          if ($(".listTr:hidden").length == 0) { 
              $('#moreFollowList').fadeOut();
          }
      });
}) //document Ready...


//팔로우 추가
function insertFollowing(data){
		var from_user = '<c:out value="${loginUser.userid}"/>'
		if(from_user != null && from_user != ""){
			$.ajax({
		         url:"insertFollowing.do",
		         type:"get",
		         data:{from_user:from_user, to_user:data },
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
		}else{
			if(confirm("로그인/회원가입 하시고 해당 작가의 소식을 받아보세요!") == true){
				window.location.href='moveLogin.do';
			}
		}
	}
	
	
// 구독취소
function deleteFollowing(data){
	var from_user = '<c:out value="${loginUser.userid}"/>'
		$.ajax({
	         url:"deleteFollowing.do",
	         type:"get",
	         data:{from_user:from_user, to_user:data },
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
<!-- 팔로잉 목록 페이지 시작! -->
	<div class="wrapFollowingPage">
	
		<p style="font-size: 23pt; padding-top:50px; color:#373737; text-align:center;">이 작가를 구독하는 <span style="color:#2bddbe;font-size: 23pt;" id="count">${fn:length(followerList)} </span>명</p>
		<br><br>
		<center>
		<div style="text-decoration: underline; color: #aaa; margin-top: -30px;">&emsp;&emsp;&emsp;</div>
		<center>
		
		<div class="followingList">
				<table class="eachFollwing">
				<c:forEach var="list" items="${followerList }">
				
					<tr class="listTr" style="display: none;">
						<td style="width:10%"><c:if test="${list.userrpic == null }">
												<div class="profileImage3" onclick="window.open('artistHomeMain.do?userid=${list.userid}&loginUser=${loginUser.userid }')" style="background-image:url('resources/images/basicprofilepic.png') "></div>
											</c:if>
											<c:if test="${list.userrpic != null }">
												<div class="profileImage3" onclick="window.open('artistHomeMain.do?userid=${list.userid}&loginUser=${loginUser.userid }')" style="background-image:url('resources/users_upfiles/${list.userrpic}') "></div>
											</c:if>
						</td>
						<td style="width:70%; text-align: left;"><span style="font-size: 15pt;" onclick="window.open('artistHomeMain.do?userid=${list.userid}&loginUser=${loginUser.userid }')">${list.nickname }</span><br>
																<span style="font-size: 10pt; color:#aaa;">${list.userintros }</span>
						</td>
						<td style="width:20%"><c:if test="${list.followyn eq'Y' }"><button class="small ui teal basic button" onclick="deleteFollowing('${list.userid}')">구독중&ensp;<i class="check icon" style="width:7px;"></i></button></c:if>
											 <c:if test="${list.followyn eq 'N' }"><button class="small ui teal button" onclick="insertFollowing('${list.userid}')" >구독하기</button></c:if>
											 <c:if test="${list.followyn eq 'E' }">&ensp;</c:if>
											 
						</td>
					<tr>
				
				</c:forEach>	
				</table>
				
				<br><br>
				<button class="mainBtn" id="moreFollowList">더 보기</button>		
		</div>
		
		
		
	</div><!-- 팔로잉 목록 페이지 끝! -->
	<br><br><br><br>
</body>
<c:import url="../footer.jsp" />
</html>