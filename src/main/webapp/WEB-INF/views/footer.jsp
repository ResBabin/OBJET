<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- favicon 위치 -->
<link rel="shortcut icon" href="resources/images/favicon-32x32.png">
<link rel="icon" href="resources/images/favicon-32x32.png">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 footer {
  bottom:0;
  background-color: black;
  padding: 10px;
  text-align: center;
  color: #aaa;
  border-top:1px solid lightgray;
  height: 200px;
  text-align: left;
  width:100%;
  z-index:0;
}

.footeralink {
	text-decoration: none;
	font-weight:600;
	color: #aaa;
}

.footeralink:hover {
	font-weight: 1000;
	text-decoration: underline;
	color:#fff;
}

.logoImage{
	width: 40px;
	height: 40px;
	background-color: #fff;
	border-radius: 50%;
	background-repeat: no-repeat;
	background-position: center;
	background-size: contain;
}
</style>
</head>
<body>
 <footer>
	 <div style="margin-left: 20%; margin-right: 10%; margin-top: 1%;">

		<div style="float: left; width: 30%;">
			<div class="logoImage" style="background-image: url('resources/images/objet_logo_black.png')"></div>
			<br>
			<p style="font-family: Centaur; font-size: 13pt; font-style: italic; color:#fff;">All good things which exist are<br>the fruits of originality.</p>
			<span style="font-family: Centaur; font-size: 9pt; font-style: italic;">- John Stuart Mill</span>
		</div>
		
		
		<div style="float: left; width: 23%;">
			<a class="footeralink">오브제 이용안내</a><br><br>
			<a href="moveEnrollPage.do" class="footeralink">가입신청</a><br><br>
			<a href="moveCs.do" class="footeralink">고객센터</a>
			
		</div>
		
		
		<div style="float: left; width: 23%;">
			<a href="oppolicy.do" target="_blank" class="footeralink">운영정책</a><br><br>
			<a href="terms.do" target="_blank" class="footeralink">이용약관</a><br><br>
			<a href="privacy.do" target="_blank" class="footeralink">개인정보 처리방침</a><br><br>
			<a href="safeguard.do" target="_blank" class="footeralink">청소년 보호정책</a><br><br>
			
			
		</div>
		
		
		<div style="float: left; width: 23%;">
			<a class="footeralink" target="_blank">오브제팀</a><br><br>
			<a href="http://www.instagram.com" target="_blank" class="footeralink">오브제 인스타그램</a><br><br>
			<a href="http://www.facebook.com" target="_blank" class="footeralink">오브제 페이스북</a><br><br>
			<a href="http://www.youtube.com" target="_blank" class="footeralink">오브제 유튜브</a>
		</div>
		
	</div>
		

 
  </footer>
</body>
</html>