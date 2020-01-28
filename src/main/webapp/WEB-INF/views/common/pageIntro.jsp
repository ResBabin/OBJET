<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용안내</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
<link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet"> <!-- 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet"> <!-- 나눔 명조 -->
<style type="text/css">
	.wrap_item_type_text{
		/* font-family: '맑은고딕';
		font-family: 'Nanum Myeongjom, serif'; */
	 	font-family: 'Nanum Gothic', sans-serif;
	 	color: #aaa;
	 	font-size: 10pt;
	 	line-height: 15pt;
 	}
 	
 	.wrap_body_text{
		background-color: #fff;
		margin-left: 25%;
		margin-right: 25%;
		margin-top: 80px; /* 상단바 높이만큼 수정 */
		margin-bottom:200px; /* 하단바 높이만큼 수정 */
		min-height: 100%;
	}
	
	.wrap_body_text_img{
		width : 100%;
	}
	
</style>
</head>
<body>

	<div class="wrap_body_text">
		<center><p style="font-size: 14pt; color: black;">오브제 이용안내 </p></center>
		<br><br><br><br><br>
			<p class="wrap_item_type_text">오브제는 '하나의 작은 전시회 공간'입니다. 오브제는 그림, 사진, 건축, 공예 등 예술로 표현되는 것들을 이용하고 제작해온 예비 아티스트들을 위해
			만들어진 공간으로써 다양한 활동과 연결을 통해 하나의 전시회라는 이름아래 공간을 마련하고자 깊게 고민하고 있습니다. 작가의 작품과 독자의 감상은 서로 연결되어 있습니다. 작품을 만드는 작가의 시간만큼
			그것을 감상하고 가치를 알아보고자 하는 독자들의 시간도 매우 소중합니다. 작가의 사소한 사진, 건축, 공예, 그림 등이 작품으로 완성되게 해주는 것은 다름 아닌 독자들의 감상이라고 믿기 때문입니다.
			<br><br><br>
		
			오브제 서비스가 작가와 독자 모두를 위한 플랫폼으로 거듭나기 위해 홈페이지 활성화, 누구나 참여하고 감상할 수 있는 편의성을 강조하고자 합니다. 이제 오브제에서 작품을 등록하거나 감상하기 위해서
			먼저 로그인을 해주세요. 오브제 작가들에게 작품을 전시하는 것이 하나의 활동이었듯 독자들의 감상도 소중한 예술 활동입니다. 그렇기에 이번 오픈은 특히 오브제에 머무르는 독자의 시간을 더 가치있게
			작가들의 역량을 더 발휘할 수 있도록 하는 것에 중점을 두었습니다.</p>
			<br>
			<hr>
			<br><br>
			
			<center><p style="font-size: 30pt; color: black;">오브제에서 작품 활동은 <br><br><br> 무엇이 다를까요?</center>
			<br><br><br>
			<p style="font-size: 13pt; color: black;">작품을 통해 다양하게 활동해보세요</p>
			<p class="wrap_item_type_text">오브제가 추천하는 활동의 핵심가치는 '댜앙성'입니다. 다양성은 여러 가지 많은 특성을 의미합니다. 이색적인 작품은 독자들의 시선을 사로잡을 수 있고
			정교한 작품은 독자들의 섬세한 감상을 이끌어 낼 수 있습니다. 특색있는 작품이라면 독자들은 작가의 다음 작품에 대해서 기대하게 되고 작가는 그에 따라 
			더 많은 더 다양한 작품 활동을 진행할 수 있습니다. <br><br>
			
			오브제는 작가들과 독자들에게 다양성을 제공하기 위해 다양한 전시회와 전시회를 할 수 있는 공간을 제공합니다. 메인 화면에서 전시중인 작품들을 확인할 수 있고
			그 작품에 들어가면 VR로 구현한 가상 전시회 공간을 통해서 작가의 작품을 실제 전시회처럼 확인할 수 있도록, 그 기분을 느낄 수 있는 환경을 제공합니다.
			작가들의 역량을 보여주고 독자들의 풍부하고 깊은 감상을 통해 작가와 독자 모두 한층 더 높은 만족감을 이끌어 낼 수 있는 전시회를 찾아보세요
			이제 오브제에서 전시회를 보기 위해 어려운 발걸음을 계획하지 말고 가상현실을 통해 실제 전시회와 같은 전시회를 감상하는 기회를 가져보세요!
			</p>
			<br><br>
			
			<img class="wrap_body_text_img" src="resources/images/오브제_이용안내.PNG">
			<br><br>
			<p class="wrap_item_type_text">작품들이 많다고 부담가질 필요 없습니다. 무리해서 다 보려고 하지 않아도 됩니다. 상시 전시회가 운영되고 있기 때문에 언제든지 원하는 작품들을 마음껏 감상 할 수 있고
			전시할 수 있도록 오브제는 사이트 창에서 상시 제공할 계획입니다. 언제든지 어느 장소에서든지 필요한, 원하는 작품들을 전시하고 감상해보세요!
			</p>
			<br>
			
			<p style="font-size: 13pt; color: black;">원하는 작품을 선정하여 담아보세요</p>
			<p class="wrap_item_type_text">오브제에는 좋은 작품들이 많습니다. 하지만 내가 원하는 작품, 관심있는 작품을 일일이 찾아가서	 보는 것은 절대 쉬운 일이 아닙니다.<br> 
			그래서 오브제는 관심 오브제를 통해 작가들과 독자들이 원하는 작품을 편리하게 이용할 수 있도록 페이지를 운영하고 있습니다. 관심오브제에 원하는 작품들을
			담아서 한눈에 볼 수 있도록 편하게 구성해보세요 검색을 통해서 작품들을 선별한 뒤 관심 오브제 등록을 통해 언제든지 필요한 작품들을 모아서 감상하실 수 있습니다.
			<br>
			
			관심 오브제를 통해서 많은 작품들 속에서 힘들게 작품을 찾을 필요가 없습니다. 관심 오브제를 활용하여 원하는 작품을 신속하게, 다양하게 이용할 수 있습니다.
			오브제는 작가와 독자들의 편리한 연결을 이어주며, 많은 작품들을 쉽고 간편하게 이용할 수 있도록 전달해 드리겠습니다.
			<br><br>
			
			여러분의 시간은 소중합니다. 관심오브제 이용을 통해 시간을 아끼고 더 다양하고 좋은 작품들을 이용하실 수 있도록 다듬어나갈 예정입니다.
			</p>
			<br>
			
			<p style="font-size: 13pt; color: black;">이용한 작품들을 손쉽게 찾아서 활용해보세요</p>
			<p class="wrap_item_type_text">이전에 감상했던, 전시했던 작품들을 다시 찾아보는 것은 중요한 활동 중에 하나입니다. 내가 찾아서 본 작품, 내가 전시했던 작품들을 찾으며
			이전에 느꼈던 감상, 제작노력 등을 다시금 되새김질 하는 것도 하나의 좋은 활동이기 때문이죠
			<br>
			
			오브제에서는 이런 이용자 여러분들의 소망을 이루고자 다녀온 오브제를 신설하였습니다. 다녀온 오브제를 통해 그동안 감상한 작품들을 다시 확인하고
			자신이 주로 감상한 작품 리스트를 통해 어느 분야를 더 자주 찾았고, 어떤 부분이 더 좋았는지를 아는데 큰 도움이 될 수 있습니다.<br>
			또는 다녀갔던 작품들 중에서 빼고 싶은 작품들이 있다면 삭제를 통해 다녀온 오브제를 관리할 수도 있습니다.	이런 활동을 통해 작가와 더 다가가거나
			독자와 더 다가가는 것을 해소해줌으로써 오브제 공간에서 더 많은 활동과 만족을 얻으실 수 있도록 오브제가 지원하겠습니다.
			<br>
			
			이제 오브제 공간에 들어오셔서 한번 경험해보세요! 오브제는 앞으로도 더욱 작가들과 독자들의 편의에 노력하며 접점을 만들어주고 더 넓혀갈 수 있도록
			하겠습니다. 오브제라는 특별한 공간안에서 여러분의 감성과 예술성을 마음껏 발휘해보세요!<br><br><br>
			감사합니다.
			
			</p>
	</div>
	<br><br>
<c:import url="../footer.jsp" />
</body>
</html>