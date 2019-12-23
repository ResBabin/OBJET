<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다녀온 오브제</title>
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

<!-- 관심 오브제 페이지 시작 -->
	<div class="wrapMyObjetList">
	
		<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">다녀온 오브제</p>
		
	<!-- 검색창시작 -->
		<div align="center">
			<div class="objetSearchBox" style="height: 130px;">
			<form action="" method="post">
				<a class="ui large teal label">오브제명</a>&ensp;
					<div class="ui input"><input type="text" name="objettitle" style="width:300px; height:35px;"></div>&emsp;&emsp;&emsp;&emsp;
				<a class="ui large teal label">작가명</a>&ensp;
					<div class="ui input"><input type="text" name="userid" style="width:150px; height:35px;"></div>
			<br><br>
				<a class="ui large teal label">전시상태</a>&ensp;
					<input type="radio" name="objetstatus" value="ALL" checked="checked"><label>&ensp;전체</label>&emsp;&emsp;
					<input type="radio" name="objetstatus" value="OPEN"><label>&ensp;전시중</label>&emsp;&emsp;
					<input type="radio" name="objetstatus" value="CLOSE"><label>&ensp;종료</label>&emsp;&emsp;&emsp;
					<div class="ui buttons"><button class="ui small grey button" type="submit">검색</button></div>
				
			</form>
			</div>
		</div>
		<!-- 검색창 끝 -->
		<br>
		<!-- 검색 결과 리스트 시작! -->
		<div class="objetListSection2">
		<div align="left" style="font-size: 10pt;">총<span style="font-weight: 700;">13</span>건</div>
		<br>
			<div class="eachObjet">
				<table class="eachObjetTable">
					<tr>
						<td><div class="ui checkbox"><input type="checkbox" name="objetno" value=""><label></label></div></td>
					</tr>
					
					<tr>
						<td><div class="eachObjetImg" style="background-image:url('resources/objet_upfiles/animation.jpg') "></div></td>
					</tr>
						
					<tr style="height:25px;">
						<td><center><div class="objetStatusLabel2" style="background:#df0000;">전시중</div><center></td>
					</tr>
					<tr style="height:35px;">
						<td><div style="font-size: 16pt; font-weight: 600;">애니매이션의 확장</div></td>
					</tr>
					<tr style="height:25px;">
						<td><div style="font-size: 10pt;color:#aaa;">@와사비맛아몬드</div></td>
					</tr>
					
				</table>
			</div>
			
			<div class="eachObjet">
				<table class="eachObjetTable">
					<tr>
						<td><div class="ui checkbox"><input type="checkbox" name="objetno" value=""><label></label></div></td>
					</tr>
					
					<tr>
						<td><div class="eachObjetImg" style="background-image:url('resources/objet_upfiles/unknownartist.jpg') "></div></td>
					</tr>
						
					<tr style="height:25px;">
						<td><center><div class="objetStatusLabel2" style="background:#d4d4d4;">전시종료</div><center></td>
					</tr>
					<tr style="height:35px;">
						<td><div style="font-size: 16pt; font-weight: 600;">Unknown artist</div></td>
					</tr>
					<tr style="height:25px;">
						<td><div style="font-size: 10pt;color:#aaa;">@김기태</div></td>
					</tr>
					
				</table>
			</div>
			
			<div class="eachObjet">
				<table class="eachObjetTable">
					<tr>
						<td><div class="ui checkbox"><input type="checkbox" name="objetno" value=""><label></label></div></td>
					</tr>
					
					<tr>
						<td><div class="eachObjetImg" style="background-image:url('resources/objet_upfiles/botong.jpg') "></div></td>
					</tr>
						
					<tr style="height:25px;">
						<td><center><div class="objetStatusLabel2" style="background:#d4d4d4;">전시종료</div><center></td>
					</tr>
					<tr style="height:35px;">
						<td><div style="font-size: 16pt; font-weight: 600;">보통의 거짓말</div></td>
					</tr>
					<tr style="height:25px;">
						<td><div style="font-size: 10pt;color:#aaa;">@티라미수맛아몬드</div></td>
					</tr>
					
				</table>
			</div>
			<br><br>
			

		</div>
		<!-- 검색 결과 리스트 끝! -->
		<br>
		<div align="left">
			<button class="ui mini blue button">삭제</button>
		</div>
		<br><br>
		<!-- 페이징 -->
			<div align="center">페이징 부분</div>


		
	</div>
	<!-- 관심 오브제 페이지 끝! -->

<br><br><br><br><br>
</body>
<c:import url="../footer.jsp" />
</html>