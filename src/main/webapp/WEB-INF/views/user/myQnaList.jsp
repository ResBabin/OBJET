<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function deleteQna(qnano){
		$.ajax({
	         url:"deleteQna.do",
	         type:"post",
	         data:{qnano:qnano},
	         success: function(result){
	             if(result == "ok"){
	               alert("문의내역이 삭제되었습니다.");
	               window.location.reload();
	             }else {
	               alert("문의내역 삭제 실패!");
	             }
	          },
	          error: function(request, status, errorData){
					console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
				}
	       });  
	}

$(function(){
	// 체크박스 전체선택 및 전체해제
	$("#allCheck").click(function(){
		if($(this).is(":checked")){
			$(".chk").prop("checked", true);
		} else {
			$(".chk").prop("checked", false);
		}
	});

<%-- 	// 한개 체크박스 선택 해제시 전체선텍 체크박스도 해제
 $(".chk").click(function(){
	if($("input[name='RowCheck']:checked").length == <%= list.size() %>){
		$("#allCheck").prop("checked", true);
	}else{
		$("#allCheck").prop("checked", false);
	}	
});
--%>
	}); // document.ready...
</script>
<style>

.paging{text-align: center;margin-top: 30px;}

.page{border: 1px solid black; background: black;
   	   color: white; padding: 3px 10px 3px 10px; border-radius: 6px;font-weight: bold;}
.pre_page, .next_page{border: 1px solid rgb(244, 244, 244); background: rgb(244, 244, 244);
   	   color: #3e3e3e; padding: 3px 10px 3px 10px; border-radius: 6px;font-weight: bold;    display: inline-block;}
</style>
</head>
<body>

			
	<!-- 문의내역 페이지 시작 -->
	
	<div class="wrapMyObjetList">
	
		<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">문의 내역</p>
		
		<!-- 검색창 -->
		
<div class="search">
<form action="selectQnaSearchList.do?userid=${loginUser.userid}" method="post">  
<select class="searchmenu" name="searchmenu" style="border-radius:5px; width:100px; height:40px">
     <option value="qnatitle">제목</option>
     </select>


<input placeholder="내용입력" name="search" style="border-radius:5px; width:200px; height:40px;">
<input type="submit" value="검색" name="submit" style="border-radius:5px; width:100px; height:40px;">

</form>
</div>


<!-- //검색창 -->
		
		
		
		
		<!-- 검색창시작 -->
	<!-- 	<div align="center">
			<div class="objetSearchBox" style="height: 130px;">
			<form action="selectQnaSearchList.do" method="post">
                <a class="ui large teal label">문의제목</a>&ensp;
					<div class="ui input"><input type="text" name="search" style="width:300px; height:35px;"></div>&ensp;
			 <br><br>
				<a class="ui large teal label">답변상태</a>&ensp;
				 <input type="radio" name="searchmenu" value="qnatitle"><label>&ensp;제목별</label>&emsp;&emsp; 
				 <input type="radio" name="searchtype" value="y"><label>&ensp;답변완료</label>&emsp;&emsp;
					<input type="radio" name="searchtype" value="n"><label>&ensp;미답변</label>&emsp;&emsp; 
					<div class="ui buttons"><button class="ui small grey button" type="submit">검색</button></div> 
			</form>
			</div>
		</div>  -->
		<!-- 검색창 끝 -->

	
		

		
		<div class="objetListSection">
			<div align="left" style="font-size: 10pt;"><span style="font-weight: 700;">${list.size()}</span>건</div>
			<br>
			
		<!-- 문의 내역 리스트 시작 -->
		
	
		<table class="searchListTable">
			
		<c:forEach var="qna" items="${requestScope.list}">
	<%-- 	<c:if test="${qna.userid eq sessionScope.loginUser.userid} ">    --%> 
		<c:url var="ndt" value="selectQnaDetail.do">
		<c:param name="qnano" value="${qna.qnano}" />
		
		</c:url>
			
		
				
				<tr style="height: 30px;">
					<th width="2%"><input type="checkbox" class="chk" id="allCheck"/></th>
					<th width="60%">문의사항</th>
					<th width="20%">작성일</th>
					<th width="18%">답변상태</th>
				</tr>
				<tr>
					<td><input type="checkbox" class="chk" name="RowCheck" value=""></td>
					<td> <a href="${ ndt } "><p style="font-size:10pt;">${qna.qnacontent}</a></p></td>
					<td><fmt:formatDate value="${qna.questiondate}" type="date"/></td>
					<td>${qna.qnaanswertype}</td>
				</tr>
		<%--   </c:if>   --%>
				 </c:forEach> 
			
			</table>
	
			
			
		</div>
		
		<br>
		<div align="left">
		<i class="trash alternate outline icon" onclick="deleteQna('<c:out value="${qna.qnano }"/>');"></i>
			</div>
			<div>
			<a href="insertQna.do"><button class="ui mini blue button">글쓰기</button></a>
		</div>
		<br>
	 
<div class="paging">
<!-- 맨 처음 페이지 -->
<c:if test="${requestScope.currentPage le 1 }"><p class="pre_page"><<</p></c:if>
<c:if test="${requestScope.currentPage gt 1 }"><a href="selectQnaList.do"><p class="pre_page"><<</p></a></c:if>
<!-- 이전 페이지 -->
<%-- <c:if test="${(currentPage - 10) lt startPage and (currentPage - 10) gt 1 }">
<a class="pre_page" href="selectNoticeList.do?page=${requestScope.startPage - 10 }"><p class="pre_page"><</p></a>
</c:if> --%>
<%-- <c:if test="${(currentPage - 10) ge startPage or (currentPage - 10) le 1 }">
<p class="pre_page"><</p>
</c:if>  --%>
<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->

<c:forEach var="p" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
	<c:if test="${p eq requestScope.currentPage }">		
		<font><b class="page">${ p }</b></font>
	</c:if>
	<c:if test="${p ne requestScope.currentPage }"><a href="selectQnaList.do?page=${ p }"><p class="pre_page" style="margin:0px 2px 0px 2px">${ p }</p></a></c:if>
</c:forEach>
<!-- 다음 페이지 -->
<%-- <c:if test="${(currentPage + 10) gt endPage and (currentPage + 10) lt maxPage }">
	<a class="next_page" href="selectNoticeList.do?page=${requestScope.endPage + 10 }"><p class="next_page">></p></a>
</c:if> --%>
<%-- <c:if test="${(currentPage + 10) le endPage or (currentPage + 10) ge maxPage }">
<p class="next_page">></p>
</c:if> --%>
<!-- 맨 마지막페이지 -->
<c:if test="${currentPage ge maxPage }"><p class="next_page">>></p></c:if>
<c:if test="${currentPage lt maxPage }"><a class="next_page" href="selectQnaList.do?page=${ requestScope.maxPage }">>></a></c:if>  

</div>
<!-- //페이징 -->
		
		
		
		
		
		
		

		
	</div>
	<!-- 문의내역 페이지 끝 -->
	
	<br><br><br>


</body>
<c:import url="../footer.jsp" />
</html>