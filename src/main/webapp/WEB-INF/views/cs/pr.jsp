<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../header.jsp" />
</head>
<style>
* {
  box-sizing: border-box;
}

section{
/* background:linear-gradient(white,black); */
} 
img {
  max-width: 100%;
  height: auto;
}
.img1{
width: 379px;

}

.wrapper {
  width: 100%;
  padding: 0 2rem;
  text-align: center;
}
.polaroid {
width: 420px;
  background:#fff;
  padding: 1rem;
  box-shadow: 0 0.25rem 1rem rgba(0,0,0,0.3); 
}
.caption {
  color: black;
  font-size: 20px;;
  text-align: center;
  line-height: 2em;
}
.item {
  display: inline-block;
  margin-top: 2rem;
   filter: grayscale(100%); 
}

.item .polaroid:before {
  content: '';
  position: absolute;
  z-index: -1;
  transition: all 0.35s;
}
.item:nth-of-type(4n+1) {
 transform: scale(0.8, 0.8) rotate(5deg);
  transition: all 0.35s;
}
.item:nth-of-type(4n+1) .polaroid:before {
  transform: rotate(6deg);
  height: 20%;
  width: 47%;
  bottom: 30px;
  right: 12px;
  box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.4);
}
.item:nth-of-type(4n+2) {
  transform: scale(0.8, 0.8) rotate(-5deg);
  transition: all 0.35s;
}
.item:nth-of-type(4n+2) .polaroid:before {
  transform: rotate(-6deg);
  height: 20%;
  width: 47%;
  bottom: 30px;
  left: 12px;
  box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.4);
}
.item:nth-of-type(4n+4) {
  transform: scale(0.8, 0.8) rotate(3deg);
  transition: all 0.35s;
}
.item:nth-of-type(4n+4) .polaroid:before {
  transform: rotate(4deg);
  height: 20%;
  width: 47%;
  bottom: 30px;
  right: 12px;
  box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.3);
}
.item:nth-of-type(4n+3) {
  transform: scale(0.8, 0.8) rotate(-3deg);
  transition: all 0.35s;
}
.item:nth-of-type(4n+3) .polaroid:before {
  transform: rotate(-4deg);
  height: 20%;
  width: 47%;
  bottom: 30px;
  left: 12px;
 box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.3);
}
.item:hover {
  filter: none;
  transform: scale(1, 1) rotate(0deg) !important;
  transition: all 0.35s;
}
.item:hover .polaroid:before {
  content: '';
  position: absolute;
  z-index: -1;
  transform: rotate(0deg);
  height: 90%;
  width: 90%;
  bottom: 0%;
  right: 5%;
  box-shadow: 0 1rem 3rem rgba(0,0,0,0.2);
  transition: all 0.35s;
}
}

</style>
<body>
<section>
<div class="wrapper">

  <div class="item">
    <div class="polaroid"><img src="resources/images/main/KS.jpg" class= img1>
      <div class="caption">박근수</div>
    </div>
  </div>

  <div class="item">
    <div class="polaroid"><img src="resources/images/main/MY.jpg" class= img1>
      <div class="caption">최민영</div>
    </div>
  </div>

  <div class="item">
    <div class="polaroid"><img src="resources/images/main/YY.jpg" class= img1>
      <div class="caption">박예은</div>
    </div>
  </div>

  <div class="item">
    <div class="polaroid"><img src="resources/images/main/YU.jpg" class= img1>
      <div class="caption">이유진</div>
    </div>
  </div>
  
  <div class="item">
    <div class="polaroid"><img src="resources/images/main/ES.jpg" class= img1>
      <div class="caption">김은솔</div>
    </div>
  </div>

</div>
<c:import url="../footer.jsp" />
</section>

</body>

</html>