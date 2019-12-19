<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시관리</title>
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

<!-- 전시관리 페이지 시작 -->
<div class="wrapMyObjetList">

	<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">내 오브제</p>
	
	<!-- 검색창시작 -->
	<div align="center">
		<div class="objetSearchBox" style="height: 180px;">
		<form action="" method="post">
			<a class="ui large teal label">승인여부</a>&ensp;
				<input type="radio" name="publicyn" value="ALL" checked="checked"><label>&ensp;전체</label>&emsp;&emsp;
				<input type="radio" name="publicyn" value="Y"><label>&ensp;승인</label>&emsp;&emsp;
				<input type="radio" name="publicyn" value="N"><label>&ensp;반려</label>&emsp;&emsp;
		<br><br>
			<a class="ui large teal label">전시상태</a>&ensp;
				<input type="radio" name="objetstatus" value="ALL" checked="checked"><label>&ensp;전체</label>&emsp;&emsp;
				<input type="radio" name="objetstatus" value="OPEN"><label>&ensp;전시중</label>&emsp;&emsp;
				<input type="radio" name="objetstatus" value="STANDBY"><label>&ensp;예정</label>&emsp;&emsp;
				<input type="radio" name="objetstatus" value="CLOSE"><label>&ensp;종료</label>&emsp;&emsp;
				<input type="radio" name="objetstatus" value="WAIT"><label>&ensp;승인대기</label>
		<br><br>
			<a class="ui large teal label">오브제명</a>&ensp;
				<div class="ui input"><input type="text" name="keyword" style="width:300px; height:35px;"></div>&ensp;
				<div class="ui buttons"><button class="ui small grey button" type="submit">검색</button></div>
		</form>
	
		</div>
	</div>
	<!-- 검색창 끝 -->

	<div class="objetListSection">
		<div align="left" style="font-size: 10pt;">총<span style="font-weight: 700;">13</span>건</div>

		<br>
		
		<!-- 오브제 리스트 시작 -->
		<table class="searchListTable">
			<tr style="height: 30px;">
				<th width="2%"><input type="checkbox" class="chk" id="allCheck"/></th>
				<th width="45%">오브제명</th>
				<th width="8%">전시상태</th>
				<th width="17%">전시기간</th>
				<th width="8%">승인여부</th>
				<th width="10%">등록일</th>
			</tr>
			<tr>
				<td><input type="checkbox" class="chk" name="RowCheck" value=""></td>
				<td><p style="font-size:10pt;"onclick="location.href='moveMyObjetDetail.do'">애니매이션의 확장</p></td>
				<td>진행중</td>
				<td>19.12.02 - 19.12.24</td>
				<td>승인</td>
				<td>19.11.16</td>
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
<!-- 전시관리 페이지 끝 -->

<br><br><br>
</body>
<c:import url="../footer.jsp" />
</html>