<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 자세히 보기</title>
<c:import url="../header.jsp" />
</head>
<style>
/* Notice View */
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
.prenext{
background:grey;
margin-top:-37px;
width: 100%;
height: 100px;
font-size: 20px;
}
.article_bottom{
font-size:17px;
border:6px double black ;
height:63px;
}
.article{
font-weight: bold;
    font-family: auto;
    margin-left: 30px;
    height: 500px;
    font-size: 20px;
}
.author{
font-size: 10px;
font-weight:bold;
}
.date{
font-size: 18px;
font-weight:bold;

}
.notice-header {margin-bottom:10px; background:#fff; border:5px double black ;width:100%;}
.notice-header:after {display:block; clear:both; content:''}
.notice-header .title-wrap {padding:20px 20px 10px 20px}
.notice-header .title-wrap .category-info a {color:black}
.notice-header .title-wrap .notice-title {margin-top:5px; font-size:2em; color:black;}
.notice-header .info-wrap {margin-top:10px; padding:10px 20px;border-top: 3px solid grey; background:lightgrey; }
.notice-header .info-wrap:after {display:block; clear:both; content:''}
.notice-header .info-wrap .notice-info {font-family: auto; float:left; list-style:none}
.notice-header .info-wrap .notice-info:after {display:block; clear:both; content:''}
.notice-header .info-wrap .notice-info li {margin-right:15px; float:left; font-size:15px; color:black;}
.notice-header .info-wrap .notice-info li i {margin-right:4px; color:#fff}

</style>
<body>

        <!-- notice header -->
        <div class="noitcedetail">
        <div class="notice-header">
            <div class="title-wrap">
                
                <h2 class="notice-title">&nbsp;&nbsp;${notice.noticetitle}</h2>
            </div>
            <div class="info-wrap">
                <ul class="notice-info">
                <li class="author"><i class="fa fa-user-circle"></i>&nbsp;&nbsp;분류[${notice.noticetype}] |</li>
              
                  <li class="author"><i class="fa fa-user-circle"></i> ${notice.adminid}|</li>
                    <li class="date"><i class="fa fa-clock-o"></i> <fmt:formatDate value="${notice.noticedate}"  type="date"/>|</li>
                    <li class="author"><i class="fa fa-user-circle"></i></li>
                    <c:url var="down" value="nfdown.do">
                       <c:param name="fname" value="${ notice.noticerfile }"/>
                         <c:param name="oname" value="${ notice.noticeofile }"/>
                             </c:url>
                             
              <c:if test="${ empty notice.noticeofile }">첨부파일 없음</c:if>
              <c:if test="${ !empty notice.noticeofile }"><a href="${ down }">${ notice.noticeofile }</a></c:if>
            
           

			
  
			
                      
                    
                </ul>
            </div>
        </div>
 
        <div class="article">
        ${notice.noticecontent}
         </div>
              <div class="article_bottom">
              
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button class="ui inverted button"><a href="selectNoticeList.do">목록</a></button>
               <c:if test= "${loginUser.usertype eq 'ADMIN'}"> 
          <button class="ui inverted button"><a href="updateNotice.do?noticeno=${notice.noticeno }">수정</a></button>
         <button class="ui inverted button"> <a href="deleteNotice.do?noticeno=${notice.noticeno }">삭제</a></button>
         </c:if>
         
        </div>
</div>
        <!-- //notice view -->
        
	<c:url var="noticemdp" value="noticeprenext.do">
				<c:param name="noticeno" value="${ prevnotice.noticeno }" />
			</c:url>
			<c:url var="noticemdn" value="noticeprenext.do">
				<c:param name="noticeno" value="${ nextnotice.noticeno }" />
			</c:url>
			<br>
			<table class="prenext">
				<c:if test="${ empty prevnotice }">
					<tr class="prenexttr">
						<th width="170"></th>
						<td>&nbsp;&nbsp;&nbsp;이전 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ !empty prevnotice }">
					<tr>
						<th width="170">&nbsp;&nbsp;&nbsp;Pre<i class="arrow alternate circle up outline icon"></i></th>
						<td>&nbsp;&nbsp;&nbsp;<a href="${ noticemdp }">${ prevnotice.noticetitle } </a></td>
					</tr>
				</c:if>
				<c:if test="${ empty nextnotice }">
					<tr>
						<th>End</th>
						<td>&nbsp;&nbsp;&nbsp;다음 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ !empty nextnotice }">
					<tr>
						<th>Next<i class="arrow alternate circle down outline icon"></i></th>
						<td>&nbsp;&nbsp;&nbsp;<a href="${ noticemdn }">${ nextnotice.noticetitle }</a></td> 
					</tr>
				</c:if>
        
        </table>
     


<c:import url="../footer.jsp" />
</body>
</html>