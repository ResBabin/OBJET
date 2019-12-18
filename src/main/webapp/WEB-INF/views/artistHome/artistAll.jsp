<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- favicon 위치 -->
<link rel="shortcut icon" href="resources/images/favicon-32x32.png">
<link rel="icon" href="resources/images/favicon-32x32.png">
<c:import url="../header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<link rel = "stylesheet" type="text/css" href="/objet/resources/css/main.css">
<link rel = "stylesheet" type="text/css" href="/objet/resources/css/search.css">
<style type="text/css">
/* 이미지 동그랗게 */
/* .objet_img {
	-webkit-border-radius : 50%;
	width : 20%;
}  */

/* 섹션 */
section:after {
  content: "";
  display: table;
  clear: both;
}

.artistIntro{
	float : left;
	border : 1px solid black;
	margin-bottom : 80px; 
  	margin-left : 28px;
  	margin-right :20px;
  	text-align : center;
  	width : 25%;
  	height : 10%;
}

.status{
	background-color : red;
	border : 1px solid white;
	-webkit-border-radius : 20px;
	width : 15%;
	height : 3%;
  	margin-left : 160px;
  	margin-top : 15px;
  	margin-bottom : 15px;
  	text-align : center;
 	color : white;
}

.title{
	text-align : center;
	font-size : 40px;
	color: black;
    font-family: Nanum Gothic;
}

.acting{
	float : right;
	margin-right : 20px;
	margin-left : 20px;
}

.writer.coment{
	line-height : 50px;
}

.moreView {
	font-size : 20pt;
	width : 150px;
	height : 50px;
	border : 1px solid black;
	text-align : center;
	margin-left : 680px;
}
</style>
</head>
<body>
<section>
<div class="section">
<h1 class="title">OBJET ALL ARTISTS</h1>
<div class="acting">전시중인 순
<div class="acting">가나다 순
</div>
</div>
</div>
</section>
<section>
	<div class="artistIntro">
		<div class="status">전시중</div>
			<img src="resources/images/main/MY.jpg" width="20%" >
				<p><i class="fas fa-user-circle"></i></p>
				<div class="writer name"><h2>안경민경</h2></div>
				<div class="writer type"><h4>예술가</h4></div>
					<div class="writer coment">
						귀는 생의 찬미를 듣는다 그것은 웅대한 관현<p>
						악이며 미묘한 교향악이다 뼈 끝에 스며들어<p>
						가는 열락의 소리다이것은 피어나기 전인 유<p>
						소년에게서 구하지 못할 바이며 시들어 가는<p>
						노년에게서 구하지 못할 바이며 오직 우리 청<p>
					</div>
	</div>
	<div class="artistIntro">
		<div class="status">전시중</div>
			<img src="resources/images/main/YU.jpg" width="25%">
				<p><i class="fas fa-user-circle"></i></p>
				<div class="writer name"><h2>유노유진</h2></div>
				<div class="Writer type"><h4>창작가</h4></div>
					<div class="writer coment">
						본업은 가수.<p>
						장래희망은 창작가.<p>
						예술가입니다.<p>
						 <p>
						 <p>
						 <p>
					</div>
	</div>
	<div class="artistIntro">
		<div class="status">전시중</div>
			<img src="resources/images/main/ES.jpg" width="20%">
				<p><i class="fas fa-user-circle"></i></p>
				<div class="writer name"><h2>시아은솔</h2></div>
				<div class="writer type"><h4>디자이너</h4></div>
					<div class="writer coment">
						귀는 생의 찬미를 듣는다 그것은 웅대한 관현<p>
						악이며 미묘한 교향악이다 뼈 끝에 스며들어<p>
						가는 열락의 소리다이것은 피어나기 전인 유<p>
						소년에게서 구하지 못할 바이며 시들어 가는<p>
						노년에게서 구하지 못할 바이며 오직 우리 청<p>
					</div>
	</div>
</section>
<section>
<div class="artistIntro">
			<div class="status">전시중</div>
				<img src="resources/images/main/YY.jpg" width="20%">
					<p><i class="fas fa-user-circle"></i></p>
					<div class="writer name"><h2>최강예은</h2></div>
					<div class="writer type"><h4>예술가</h4></div>
						<div class="writer coment">
							살어리 살어리랏다 청산에 살어리랏다<p>
							머루랑 다래랑 먹고 청산에 살어리랏다네<p>
							얄리 얄리 얄라셩 얄라리 얄리 얄라성<p>
						</div>
	</div>
	<div class="artistIntro">
		<div class="status">전시중</div>
			<img src="resources/images/main/KS.jpg" width="20%">
				<p><i class="fas fa-user-circle"></i></p>
				<div class="writer name"><h2>믹키근수</h2></div>
				<div class="writer type"><h4>창작가</h4></div>
					<div class="writer coment">
						본업은 가수.<p>
						장래희망은 창작가.<p>
						예술가입니다.<p>
						<p>
						<p>
					</div>
	</div>
	<div class="artistIntro">
		<div class="status">전시중</div>
			<img src="resources/images/main/MY.jpg" width="20%">
				<p><i class="fas fa-user-circle"></i></p>
				<div class="writer name"><h2>오브제짱</h2></div>
				<div class="writer type"><h4>디자이너</h4></div>
					<div class="writer coment">
						귀는 생의 찬미를 듣는다 그것은 웅대한 관현<p>
						악이며 미묘한 교향악이다 뼈 끝에 스며들어<p>
						가는 열락의 소리다이것은 피어나기 전인 유<p>
						소년에게서 구하지 못할 바이며 시들어 가는<p>
						노년에게서 구하지 못할 바이며 오직 우리 청<p>
					</div>
			</div>
</section>
<section>
<div class="artistIntro">
		<div class="status">전시중</div>
			<img src="resources/images/main/YU.jpg" width="20%">
				<p><i class="fas fa-user-circle"></i></p>
				<div class="writer name"><h2>아트쟁이</h2></div>
				<div class="writer type="><h4>예술가</h4></div>
					<div class="writer coment">
						귀는 생의 찬미를 듣는다 그것은 웅대한 관현<p>
						악이며 미묘한 교향악이다 뼈 끝에 스며들어<p>
						가는 열락의 소리다이것은 피어나기 전인 유<p>
						소년에게서 구하지 못할 바이며 시들어 가는<p>
						노년에게서 구하지 못할 바이며 오직 우리 청<p>
					</div>
	</div>
	<div class="artistIntro">
		<div class="status">전시중</div>
			<img src="resources/images/main/ES.jpg" width="20%">
				<p><i class="fas fa-user-circle"></i></p>
				<div class="writer name"><h2>오브제미</h2></div>
				<div class="Writer type"><h4>창작가</h4></div>
					<div class="writer coment">
						본업은 가수.<p>
						장래희망은 창작가<p>
						예술가입니다.<p>
					</div>
	</div>
	<div class="artistIntro">
		<div class="status">전시중</div>
			<img src="resources/images/main/YY.jpg" width="20%">
				<p><i class="fas fa-user-circle"></i></p>
				<div class="writer name"><h2>오브제굳</h2></div>
				<div class="writer type"><h4>디자이너</h4></div>
					<div class="writer coment">
						귀는 생의 찬미를 듣는다 그것은 웅대한 관현<p>
						악이며 미묘한 교향악이다 뼈 끝에 스며들어<p>
						가는 열락의 소리다이것은 피어나기 전인 유<p>
						소년에게서 구하지 못할 바이며 시들어 가는<p>
						노년에게서 구하지 못할 바이며 오직 우리 청<p>
					</div>
	</div>
</section>
<div class="moreView">더보기</div>
<c:import url="../footer.jsp" />
</body>
</html>