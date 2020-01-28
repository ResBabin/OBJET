<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<c:import url="../header.jsp" />
<style>

.faqtitle{
border-top: 3px solid black;
border-bottom: 3px solid black;
width:100%;
height: 90px;

}
p {
  color: #666666;
  font-family: 'Malgun Gothic', Arial, sans-serif;
  font-size: 19px;
  line-height: 1.5;
  margin: 20px;
  padding: 25px;
  }

.container {
   
  max-width: 80%;
  margin: 0 auto;
}

.acc {
  overflow: hidden;
  padding: 0;
}

.acc li {
  list-style-type: none;
  padding: 0;
}

.acc_ctrl {
  background: #FFFFFF;
  border: none;
  border-bottom: solid 2px black;
  cursor: pointer;
  display: block;
  outline: none;
  padding: 2em;
  position: relative;
  text-align: left;
  width: 100%;
}

.acc_ctrl:before {
  background: #44596B;
  content: '';
  height: 2px;
  margin-right: 37px;
  position: absolute;
  right: 0;
  top: 50%;
  -webkit-transform: rotate(90deg);
  -moz-transform: rotate(90deg);
  -ms-transform: rotate(90deg);
  -o-transform: rotate(90deg);
  transform: rotate(90deg);
  -webkit-transition: all 0.2s ease-in-out;
  -moz-transition: all 0.2s ease-in-out;
  -ms-transition: all 0.2s ease-in-out;
  -o-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  width: 14px;
}

.acc_ctrl:after {
  background: #44596B;
  content: '';
  height: 2px;
  margin-right: 37px;
  position: absolute;
  right: 0;
  top: 50%;
  width: 14px;
}

.acc_ctrl.active:before {
  -webkit-transform: rotate(0deg);
  -moz-transform: rotate(0deg);
  -ms-transform: rotate(0deg);
  -o-transform: rotate(0deg);
  transform: rotate(0deg);
}

.acc_ctrl.active h2, .acc_ctrl:focus h2 {
  position: relative;
}

.acc_panel {
  display: none;
  overflow: hidden;
}
    </style>

</head>
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script type="text/javascript">
	$(function() {
		  $('.acc_ctrl').on('click', function(e) {
		    e.preventDefault();
		    if ($(this).hasClass('active')) {
		      $(this).removeClass('active');
		      $(this).next()
		      .stop()
		      .slideUp(300);
		    } else {
		      $(this).addClass('active');
		      $(this).next()
		      .stop()
		      .slideDown(300);
		    }
		  });
		});
   </script>
<body>
<c:import url="../search.jsp" />

<div class="container">
<div class="faqtitle">
 &ensp;&ensp; &ensp;&ensp;
<h1> &ensp;&ensp;FAQ</h1>
</div>

  <ul class="acc">
    <li>
   
     <c:forEach var="faq" items="${ list }">
      <button class="acc_ctrl"><h2>${faq.faqno} . &ensp;&ensp;${ faq.faqtitle }</h2></button>
     
      <div class="acc_panel">
        <p>${ faq.faqcontent } </p>
      </div>
      
      </c:forEach>

    
     </li>
  </ul>

  
</div>

<c:import url="../footer.jsp" />	
</body>
</html>