<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>

	<!-- 문의내역 페이지 시작 -->
	<div class="wrapMyObjetList">
	
		<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">문의 내역</p>
		
		<!-- 검색창시작 -->
		<div align="center">
			<div class="objetSearchBox" style="height: 130px;">
			<form action="" method="post">
				<a class="ui large teal label">문의제목</a>&ensp;
					<div class="ui input"><input type="text" name="keyword" style="width:300px; height:35px;"></div>&ensp;
			<br><br>
				<a class="ui large teal label">답변상태</a>&ensp;
					<input type="radio" name="qnaansweryn" value="ALL" checked="checked"><label>&ensp;전체</label>&emsp;&emsp;
					<input type="radio" name="qnaansweryn" value="Y"><label>&ensp;답변완료</label>&emsp;&emsp;
					<input type="radio" name="qnaansweryn" value="N"><label>&ensp;미답변</label>&emsp;&emsp;
					<div class="ui buttons"><button class="ui small grey button" type="submit">검색</button></div>
				
			</form>
			</div>
		</div>
		<!-- 검색창 끝 -->
		
		<div class="objetListSection">
			<div align="left" style="font-size: 10pt;">총<span style="font-weight: 700;">13</span>건</div>
			<br>
			
		<!-- 문의 내역 리스트 시작 -->
			<table class="searchListTable">
				<tr style="height: 30px;">
					<th width="2%"><input type="checkbox" class="chk" id="allCheck"/></th>
					<th width="60%">제목</th>
					<th width="20%">작성일</th>
					<th width="18%">답변상태</th>
				</tr>
				<tr>
					<td><input type="checkbox" class="chk" name="RowCheck" value=""></td>
					<td>전시 승인 부탁드립니다</td>
					<td>19.12.18</td>
					<td>미답변</td>
				</tr>
			</table>
		</div>
		<br>
		<div align="left">
			<button class="ui mini blue button">삭제</button>
		</div>
		<br>
		<!-- 페이징 -->
		<div align="center">페이징 부분</div><br><br>
		
		
		
		
		
		
		

		
	</div>
	<!-- 문의내역 페이지 끝 -->
	
	<br><br><br>


</body>
<c:import url="../footer.jsp" />
</html>