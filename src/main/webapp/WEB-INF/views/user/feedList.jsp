<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	function deleteFeed(feedno){
		$.ajax({
	         url:"deleteFeed.do",
	         type:"post",
	         data:{feedno:feedno},
	         success: function(result){
	             if(result == "ok"){
	               alert("피드 알림이 삭제되었습니다.");
	               window.location.reload();
	             }else {
	               alert("해당 알림 삭제 실패!");
	             }
	          },
	          error: function(request, status, errorData){
					console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
				}
	       });  
	}
	
	
	$(function(){
		$(".feedtr").slice(0, 10).fadeIn();
        $("#moreFeedList").click(function(e) { 
              e.preventDefault();
              $(".feedtr:hidden").slice(0, 5).fadeIn(); 
              if ($(".feedtr:hidden").length == 0) { 
                  $('#moreFeedList').fadeOut();
              }
          });
	}) //document Ready...
</script>
</head>
<body>

	<!-- 피드알림 페이지 시작 -->
	<div class="wrapFeedList">
		<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">피드알림</p>
			<c:if test="${!empty feedlist }">
				<table class="feedTable">
				<!-- 반복영역 -->
				<c:forEach items="${feedlist }" var="feed" varStatus="status">
					<tr class="feedtr" style="display: none;">
						<td width="5%"><i class="olive envelope outline icon"></i></td>
						<td width="90%">${feed.feedcontent }<span style="font-size: 9pt; color:#aaa;">&ensp;
						<fmt:formatDate value="${feed.feeddate}" pattern="(yy.MM.dd E)"/></span></td>
						<td width="15%"><i class="trash alternate outline icon" onclick="deleteFeed('<c:out value="${feed.feedno }"/>');"></i></td>
					</tr>
				</c:forEach>
				</table>
				<br><br><br>
				<div align="center"><button class="mainBtn" id="moreFeedList">더 보기</button></div>
			</c:if>
			<c:if test="${empty feedlist }">
				<div align="center">
					<br><br><br><br><br><br><i class="blue envelope outline icon"></i>알림이 없습니다.
				</div>
			</c:if>	
			
	</div>
	
		
<c:import url="../footer.jsp" />
</body>
</html>