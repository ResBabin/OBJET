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
<!--  <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">     -->                      
<style>

.QnaSearchBox1{
border-bottom:3px solid black;
width: 50%;
/* box-shadow: 0px 0px 20px 10px rgba(0.2,0,0,0.4); */

}

.qnaTable{

margin-left: 500px;
}
.gotowrite{
width: 152px;
margin-left: 620px;
margin-top: 9px;
}

.paging{text-align: center;margin-top: 30px;}

.page{border: 1px solid black; background: black;
   	   color: white; padding: 3px 10px 3px 10px; border-radius: 6px;font-weight: bold;}
.pre_page, .next_page{border: 1px solid rgb(244, 244, 244); background: rgb(244, 244, 244);
   	   color: #3e3e3e; padding: 3px 10px 3px 10px; border-radius: 6px;font-weight: bold;    display: inline-block;}
</style>
</head>
<body>

			
	<!-- 문의내역 페이지 시작 -->
	

	
		<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">문의 내역</p>
	
		<!-- 검색창시작 -->
	<div align="center">
			<div class="QnaSearchBox1" style="height: 130px;">
			<form action="selectQnaSearchList.do?userid=${loginUser.userid}"method="post">
                <a class="ui large black label">문의제목</a>&ensp;
					<div class="ui input"><input type="text" name="search" style="width:340px; height:30px;"></div>&ensp;
			 <br><br>
				<a class="ui large black label">답변상태</a>&ensp;
				 <input type="radio" name="searchtype" value="all" checked><label>&ensp;전체</label>&emsp;&emsp; 
				 <input type="radio" name="searchtype" value="y"><label>&ensp;답변완료</label>&emsp;&emsp;
					<input type="radio" name="searchtype" value="n"><label>&ensp;미답변</label>&emsp;&emsp; 
					<div class="ui buttons"><button class="ui small black button" type="submit">검색</button></div> 
			</form>
				<div class="gotowrite"><button class="ui middle black button" onclick="location.href='MoveinsertQna.do?userid=${loginUser.userid}'">
		<i class="edit outline icon"></i>문의글 작성</button></div>
			</div>
		</div>  
		<!-- 검색창 끝 -->
<%-- <div align="left" style="font-size: 10pt;"><span style="font-weight: 700;">${list.size()}</span>건</div> --%>
<br>
		<!-- 문의 내역 리스트 시작 -->
		
		
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
		$(".qnalist").slice(0, 10).fadeIn();
        $("#moreqnalist").click(function(e) { 
              e.preventDefault();
              $(".qnalist:hidden").slice(0, 5).fadeIn(); 
              if ($(".qnalist:hidden").length == 0) { 
                  $('#moreqnalist').fadeOut();
              }
          });
	}) 
</script>



	<div class="wrapQna">
               <table class="qnaTable">
				<!-- 반복영역 -->
				<c:forEach items="${requestScope.list}" var="qna" varStatus="status">
						<c:url var="ndt" value="selectQnaDetail.do">
		            <c:param name="qnano" value="${qna.qnano}" />
		       
				</c:url>
					<tr class="qnalist" style="display: none;">
				<c:if test="${fn:contains(qna.qnaanswertype,'Y')}">
				<td width="5%" class="qnalistname"><i class=" yellow lightbulb outline icon"></i></td></c:if> 
				<c:if test="${fn:contains(qna.qnaanswertype,'N')}">
				<td width="5%" class="qnalistname"><i class="lightbulb outline icon"></i></td></c:if> 
				
					   <td width="90%" class="qnalistname"><a href="${ ndt }">${qna.qnatitle }</a><span style="font-size: 9pt; color:#aaa;"> &ensp;
						<fmt:formatDate value="${qna.questiondate}" pattern="(yy.MM.dd E)"/></span> &ensp;&ensp;&ensp;
						</td>
						<td width="15%" class="qnalistname"><i class="trash alternate outline icon" onclick="deleteQna('<c:out value="${qna.qnano}"/>');"></i></td>
					</tr>
				</c:forEach>
				</table>
		
		<br>
	
		
			<div>

		
		
		</div>
		<br>
	 
<div class="paging">
		
		<!-- 맨 처음 페이지 -->
<c:if test="${requestScope.currentPage le 1 }"><p class="pre_page"><<</p></c:if>
<c:if test="${requestScope.currentPage gt 1 }"><a href="selectQnaList.do?page=1&userid=${loginUser.userid}"><p class="pre_page"><<</p></a></c:if>
<c:forEach var="p" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
	<c:if test="${p eq requestScope.currentPage }">		
		<font><b class="page">${ p }</b></font>
	</c:if>
	<c:if test="${p ne requestScope.currentPage }"><a href="selectQnaList.do?page=${ p }&userid=${loginUser.userid}"><p class="pre_page">${ p }</p></a></c:if>
</c:forEach>
<!-- 맨 마지막페이지 -->
<c:if test="${currentPage ge maxPage }"><p class="next_page">>></p></c:if>
<c:if test="${currentPage lt maxPage }"><a class="next_page" href="selectQnaList.do?page=${ requestScope.maxPage }&userid=${loginUser.userid}">>></a></c:if>  

</div>
		
		
		
		
		

		
	</div>
	<!-- 문의내역 페이지 끝 -->
	
	<br><br><br>


</body>
<c:import url="../footer.jsp" />
</html>