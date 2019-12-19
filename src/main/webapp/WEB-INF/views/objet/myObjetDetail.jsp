<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오브제 상세보기</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
</script>

</head>
<body>

<!-- 오브제 등록 페이지 시작 -->
	<div class="wrapCreateObjet">
	
		<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">오브제 상세보기</p>
		
		<!-- 등록 테이블 시작 -->
		<div align="center">
			<table class="createObjetTable">
				<tr style="height:60px;">
					<th>전시상태</th>
					<td><p class="detailText">예정</p>
					</td>
				</tr>
				
				<tr style="height:60px;">
					<th>승인여부</th>
					<td><p class="detailText">승인(반려시 사유 노출)</p>
					</td>
				</tr>
				
				<tr>
					<th>오브제명</th>
					<td><p class="detailText">애니매이션의 확장</p>
					</td>
				</tr>
				
				<tr>
					<th style="vertical-align: top;padding-top: 10px;">오브제 소개</th>
					<td><div class="detailTextBox">
						각기 상이하지만, 동시대 뉴 미디어 기술을 바탕으로 새로운 형식의 예술 장르를 탐구하고자하는 진취적 시도라는 점에서 함께 묶어낼 수 있다. 
						우리가 함께 살고있는 디지털 환경 속에애니메이션이라는 장르가 유연하게 녹아들 수 있도록 그 개념을 확장하고, 현대미술 분야서 애니메이션의 예술적인 어쩌구다.</div>
					</td>
				</tr>
				
				<tr>
					<th style="vertical-align: top;padding-top: 10px;">오브제 포스터</th>
					<td><img class="objetposter" id="objetposter" src="resources/objet_upfiles/animation.jpg">
					</td>
				</tr>
				
				<tr>
					<th>오브제 기간</th>
					<td><p class="detailText">2019.12.02  -  2019.12.24</p></td>
				</tr>
				
				<tr>
					<th>관련태그</th>
					<td>
						<a class="ui small grey basic label">디자인</a>
						<a class="ui small grey basic label">건축</a>
						<a class="ui small grey basic label">사진</a>
					</td>
				</tr>
			</table>
			<br><hr><br>
			
			<!-- 작품등록 영역 시작 -->
				<table class="myObjetDetailTable">
					<tr>
						<th colspan="3" style="text-align: left;">오브제작품
							<div style="color:#00c73c; font-size:7pt;font-weight: normal;line-height: 9pt;"></div>
						</th>
					</tr>
				<% for(int i = 1; i < 9; i++){ %>
					 <tr style="height: 300px;">
			            <td style="width:5%;">
			            	<%= i %>.
			            </td>
			            
			            <td style="width:20%;">
				            <img class="createobjetimg" id="createobjetimg<%= i %>" src="resources/images/objet/sampleobjetimg.jpg">
			            </td>
			            
			            <td style="width:75%;">
			            	<a class="ui teal circular label">작품명</a><br>
			            		<div class="myobjettitle">마당을 나온 암탉</div>
			            	<br>
			            	<a class="ui teal circular label">작품소개</a><br>
			            		<div class="myobjetintro">제가 고등학교때였나요 이게 개봉했던 거 같은데 
														친구가 그렇게 보러가자고 했거든여 제가 고등학교때였나요 이게 개봉했던 거 같은데 
														친구가 그렇게 보러가자고 했거든여 제가 고등학교때였나요 이게 개봉했던 거 같은데 
														친구가 그렇게 보러가자고 했거든여 제가 고등학교때였나요 이게 개봉했던 거 같은데 
														친구가 그렇게 보러가자고 했거든여 제가 고등학교때였나요 이게 개봉했던 거 같은데 
														친구가 그렇게 보러가자고 했거든여 
														
								</div>
			            </td>
			        </tr>
			<%} %>
				</table>
			<!-- 작품등록 영역 끝 -->
			
			<br><br>
			
			<!-- 신청버튼 -->
				<div align="center">
					<input type="button" class="ui green button" value="전시수정" onclick="location.href='moveEditObjet.do'"> &nbsp;
					<input type="button" class="ui button" value="전시삭제" onclick="">
				</div>
				<br><br>
				<div style="color:#bb0004; font-size:9pt;line-height: 13pt;">
					* 전시 삭제 시 복구 불가 하오니 신중하게 진행하여 주시길 바랍니다.<br>
					* 진행중인 오브제인 경우, 수정 시 전시는 일시 중단되며 관리자 검수 및 승인 후 정상 오픈 됩니다.<br>
					* 관리자 승인은 신청일로부터 최대 7일(영업일 기준) 소요되오니 이 점 유의바랍니다.
				</div>
		</div>
		<!-- 등록 테이블 끝 -->
	</div>
<!-- 전시 등록 페이지 끝 -->


</body>
<br><br><br><br>
<c:import url="../footer.jsp" />
</html>