<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../header.jsp" />
</head>
<style>



/* 공지사항 */

/* 공지사항 타이틀 */
.noticestart{
margin-top:5px;
margin-left: 25px;
}
.noticehead{
font-size: 40px;
}
/* Notice list */
.noticelist{
margin-top: 70px;
margin-left: 90px;
}
.notice-list:hover{
background-color:;
}
.notice-list {width: 2000px;margin:10px 0;  padding:24px 20px 26px;   background:rgba(0, 0, 0, 0.00);  }
.notice-list:after { content:''; clear:both; display:block }
.notice-list .notice-item {text-decoration:none}
/* .notice-list:hover{ background:black;} */
.notice-list .notice-item:hover .title {color:white} 
.notice-list .notice-item .thumb {float:left; width:150px; height:150px; margin:6px 30px 5px 0}
.notice-list .notice-item .title {font-weight:bold;font-size:1.375em; color:black;}
.notice-list .notice-item .writer {margin-top:4px; color:black; vertical-align:top; font:normal 0.875em 'NanumBarunGothic','Noto Sans', sans-serif; line-height:1.5em;}
.notice-list .info {margin-top:6px; font-size:0.875em; color:black;}

.notice-list .info .pipe {display:inline-block; margin:0 10px; color:black}
.notice-list .info .date {color:black}

.paging{text-align: center;margin-top: 30px;}

.page{border: 1px solid black; background: black;
   	   color: white; padding: 3px 10px 3px 10px; border-radius: 6px;font-weight: bold;}
.pre_page, .next_page{border: 1px solid rgb(244, 244, 244); background: rgb(244, 244, 244);
   	   color: #3e3e3e; padding: 3px 10px 3px 10px; border-radius: 6px;font-weight: bold;    display: inline-block;}
        
* {padding: 0; margin: 0;}
/* body {background: #1a237e;} */
.box-wrap {
/* margin-bottom: 20px; */
margin-top: 30px;
margin-left: 30px;
   box-shadow: 8px 8px 13px 5px rgba(0,0,0,0.3);
  width: 95%;
    height: 150px;
    /* display: flex; */
    justify-content: center;
    align-items: center
}
.box {
    position: relative;

    /* overflow: hidden; */
}

 .box:hover {
 width: 100%;
    background:black;
} 
.box:before, .box:after {

    content:'';
    background: #fff;
    position: absolute;
    left: 50%; top: 50%;
    opacity: 0;
    z-index: 1;
    transform: translate(-50%, -50%);
    transition: all 0.4s ease;
}
.box:before {
    width: 60px; height: 1px; left: 100%;
}
.box:after {
    width: 1px; height: 60px; top: 0%;
}
.box:hover:before, 
.box:hover:after {

    opacity: 1;
    left: 50%; top: 50%;
}
       
        
</style>
<body>
<%-- <c:import url="../search.jsp" /> --%>
<!-- 관리자한테만 보여질 글쓰기 버튼 -->
<a href="insertNotice.do" ><button>글쓰기</button></a>
<!-- 검색창 -->
<div class="search">
<form action="selectNoticeSearchList.do" method="post">
<select class="searchmenu" name="searchmenu" style="border-radius:5px; width:100px; height:40px">
     <option value="noticetitle">제목</option>
     </select>


<input placeholder="내용입력" name="search" style="border-radius:5px; width:200px; height:40px;">
<input type="submit" value="검색" name="submit" style="border-radius:5px; width:100px; height:40px;">

</form>
</div>
<!-- //검색창 -->


<h1 align="center">공지사항 </h1>

<c:forEach var="notice" items="${requestScope.list }"> 
<c:url var="ndt" value="noticeDetail.do">
	<c:param name="noticeno" value="${notice.noticeno}" />
										<%-- <c:param name="page" value="${ requestScope.currentPage }" /> --%>
									</c:url>	
									
<div class="box-wrap">
    <div class="box">
       <div class="notice-list">
            <a href="${ ndt } " class="notice-item">
                <h1 class="title">${notice.noticetitle}</h1>
                <div class="writer">${notice.adminid}</div>
            </a>
            <p class="info"> 분류[${notice.noticetype}]
                <span class="pipe">|</span>
                <span class="date"><fmt:formatDate value="${notice.noticedate}" type="date"/></span>
            </p>
        </div>
        </div>
               
    </div>
    </c:forEach>
  
<div class="paging">
<!-- 맨 처음 페이지 -->
<c:if test="${requestScope.currentPage le 1 }"><p class="pre_page"><<</p></c:if>
<c:if test="${requestScope.currentPage gt 1 }"><a href="selectNoticeList.do"><p class="pre_page"><<</p></a></c:if>
<!-- 이전 페이지 -->
<%-- <c:if test="${(currentPage - 10) lt startPage and (currentPage - 10) gt 1 }">
<a class="pre_page" href="selectNoticeList.do?page=${requestScope.startPage - 10 }"><p class="pre_page"><</p></a>
</c:if> --%>
<%-- <c:if test="${(currentPage - 10) ge startPage or (currentPage - 10) le 1 }">
<p class="pre_page"><</p>
</c:if>  --%>
<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->

<c:forEach var="p" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
	<c:if test="${p eq requestScope.currentPage }">		
		<font><b class="page">${ p }</b></font>
	</c:if>
	<c:if test="${p ne requestScope.currentPage }"><a href="selectNoticeList.do?page=${ p }"><p class="pre_page" style="margin:0px 2px 0px 2px">${ p }</p></a></c:if>
</c:forEach>
<!-- 다음 페이지 -->
<%-- <c:if test="${(currentPage + 10) gt endPage and (currentPage + 10) lt maxPage }">
	<a class="next_page" href="selectNoticeList.do?page=${requestScope.endPage + 10 }"><p class="next_page">></p></a>
</c:if> --%>
<%-- <c:if test="${(currentPage + 10) le endPage or (currentPage + 10) ge maxPage }">
<p class="next_page">></p>
</c:if> --%>
<!-- 맨 마지막페이지 -->
<c:if test="${currentPage ge maxPage }"><p class="next_page">>></p></c:if>
<c:if test="${currentPage lt maxPage }"><a class="next_page" href="selectNoticeList.do?page=${ requestScope.maxPage }">>></a></c:if>  

</div>
<!-- //페이징 -->
    
   <!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5e1eb3ef27773e0d832d9a56/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script--> 

<c:import url="../footer.jsp" />
</body>
</html>