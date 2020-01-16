<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	//background-image: url("${ pageContext.request.contextPath }/resources/images/warn.png");
	background-color: #000;
	padding: 150px;
	padding-top: 50px;
}


#warning{
	font-size: 30pt;
	border: 7px solid black;
	padding-top: 40px;
	padding-bottom: 50px;
}
#warnimg{
	margin-bottom: -50px;
}

#warntext {
  color: black;
  position: relative;
  margin-top: 60px;
}

#tomain{
font-size: 20pt;
}
a {
 color: #0000aa;
 text-decoration: none;	
}
a:hover {
	color: #00aaaa;
	
}
</style>
</head>
<body>
<div id="dddd">
<br>
<div id="ddd"></div><br><br>
<div id="warning" align="center" style="background: white; padding: 80px;">

<img alt="" src="${ pageContext.request.contextPath }/resources/images/warn.png" id="warnimg" width="120" draggable="false">
<font style="text-align: center; font-weight: 900;">
※주의※
</font>
<img alt="" src="${ pageContext.request.contextPath }/resources/images/warn.png" id="warnimg" width="120" draggable="false" >
<div style="font-size: 25pt;" id="warntext">
관리자 페이지에 대한 접근 권한이 없습니다.
<br>
</div>
<div id="tomain"><br>
<a href="main.do">오브제 메인으로</a></div>
</div>
</div>
</body>
</html>