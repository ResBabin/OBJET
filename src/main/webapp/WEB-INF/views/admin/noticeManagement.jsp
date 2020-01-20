<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
<c:import url="adminHeader.jsp"/>
<style type="text/css">
#um {
	padding: 150px;
	padding-top: 40px;
	padding-bottom: 40px;
}
</style>
<script type="text/javascript">
$(function() {
	$('.dropdown').dropdown({});
	$("input[name=noticecontent]").hide();
	
	$("#searchcontent").click(function() { 
	$("input[name=noticetitle]").hide();
	$("input[name=noticetitle]").val("");
	$("input[name=noticecontent]").show();
	});
	$("#searchtitle").click(function() {
	$("input[name=noticecontent]").hide();
	$("input[name=noticecontent]").val("");
	$("input[name=noticetitle]").show();
	});
});

</script>


</head>
<body>
<div style="background: black; height: 100px; margin-top: -15px; color: white; text-align: center; font-size: 20pt; padding: 30px;">
공지사항 ： ${ listCount } </div>
<div id="um">
<div align="right">
<c:url value="noticem.do" var="noticeuri">
	<c:if test="${ !empty noticetitle }"><c:param value="${ noticetitle }" name="noticetitle" /></c:if>
	<c:if test="${ !empty noticecontent }"><c:param value="${ noticecontent }" name="noticecontent" /></c:if>
	<c:if test="${ !empty noticetype and noticetype.length() eq 1 }"><c:param value="${ noticetype }" name="noticetype" /></c:if>
	</c:url>
			<form action="noticem.do" method="get">
				<input type="submit" class="ui basic button" value="검색">
				<div class="ui right action left icon input">
					<i class="search icon"></i>
					<input type="search" placeholder="제목 검색" name="noticetitle"> 
					<input type="search" placeholder="내용 검색" name="noticecontent"> 
					<input type="hidden" value="1" name="page">
					<input type="hidden" value="" name="noticetype">
					<div class="ui basic floating dropdown button">
						<div class="text">제 목</div>
						<i class="dropdown icon"></i>
						<div class="menu">
							<div class="item" id="searchtitle">제 목</div>
							<div class="item" id="searchcontent">내 용</div>
						</div>
					</div>
				</div>
			</form>
			<div></div>
		</div>
		<c:if test="${ empty noticetitle }">
			<div class="ui small basic buttons">
				<a href="noticem.do?page=1"><div class="ui button order" id="allbtn">전체</div></a>
				<a href="noticem.do?noticetype=전시&page=1"><div class="ui button order" id="exbtn">전시</div></a>
				<a href="noticem.do?noticetype=일반&page=1"><div class="ui button order" id="norbtn">일반</div></a>
				<a href="noticem.do?noticetype=회원&page=1"><div class="ui button order" id="userbtn">회원</div></a>
			</div>
		</c:if>
		<c:if test="${ !empty noticetitle }">
			<div class="ui small basic buttons">
				<a href="${ noticeuri }&page=1"><div class="ui button order" id="allbtn">전체</div></a>
				<a href="${ noticeuri }&noticetype=전시&page=1"><div class="ui button order" id="exbtn">전시</div></a>
				<a href="${ noticeuri }&noticetype=일반&page=1"><div class="ui button order" id="norbtn">일반</div></a>
				<a href="${ noticeuri }&noticetype=회원&page=1"><div class="ui button order" id="userbtn">회원</div></a>
			</div>
		</c:if>
				&nbsp;<a href="noticem.do?page=1"><div class="ui basic button order" id="userbtn">리셋</div></a>
<table class="ui sortable celled table selectable">
<thead>
<tr>
<th width="80">첨부파일</th>
<th width="100">번호</th>
<th>관리자ID</th>
<th>분류</th>
<th>제목</th>
<th>작성일</th>
</tr>
</thead>
<tbody>
<c:if test="${ empty noticelist }">
				<tr align="center" style="font-size: 13pt;"><td colspan="10" >
				<c:if test="${ !empty noticetitle }">
				제목 &nbsp;"${ noticetitle }"&nbsp; 에 해당하는 검색 결과가 없습니다.
				</c:if>
				<c:if test="${ !empty noticecontent }">
				내용 &nbsp;"${ noticecontent }"&nbsp; 에 해당하는 검색 결과가 없습니다.
				</c:if>
				</td></tr>
			</c:if>
<c:forEach var="noticem" items="${ noticelist }">
<c:url var="noticemd" value="noticemd.do">
	<c:param name="noticeno" value="${ noticem.noticeno }"/>
</c:url>
<tr>
<td style="text-align: center;">
<c:if test="${ !empty noticem.noticeofile }">
	<i class="paperclip grey icon"></i> 
</c:if>
</td>
<td>${ noticem.noticeno }</td>
<td>${ noticem.adminid }</td>
<td>${ noticem.noticetype }</td>
<td><a href="${ noticemd }">${ noticem.noticetitle }</a></td>
<td>${ noticem.noticedate }</td>
</tr>
</c:forEach>
</tbody>
</table>
<div align="right">
<a href=""><button class="ui basic button">삭제</button></a> &nbsp;
<a href="noticeWriteAd.do"><button class="ui  basic button">작성</button></a>
</div>
<br>
<c:if test="${ empty noticetitle }">
<div align="center">
		<div class="ui pagination menu"  id="pagingdiv">
		<c:if test="${ currentPage eq 1 }">
		<a href="/objet/noticem.do?page=1" class="disabled item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne 1 }">
		<a href="/objet/noticem.do?page=1" class="item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ beginPage - 10 < 1 }">
		<c:if test="${ currentPage eq 1 }"><a href="/objet/noticem.do?page=1" class="disabled item"><i class="angle left icon"></i></a></c:if>
		<c:if test="${ currentPage ne 1 }"><a href="/objet/noticem.do?page=1" class="item"><i class="angle left icon"></i></a></c:if>
		</c:if>
		<c:if test="${ beginPage - 10 >= 1 }">
		<a href="/objet/noticem.do?page=${ currentPage }" class="item"><i class="angle left icon"></i></a>
		</c:if>
		<c:forEach begin="${ beginPage }" end="${ endPage }" var="p">
		<c:if test="${ p eq currentPage }">
		<a href="/objet/noticem.do?noticetype=${ noticetype }&page=${ p }" class="active item">${ p }</a> 
<%-- 		<a href="/objet/noticem.do?page=${ p }" class="active item">${ p }</a>  --%>
		</c:if>
		<c:if test="${ p ne currentPage }">
 		<a href="/objet/noticem.do?noticetype=${ noticetype }&page=${ p }" class="item">${ p }</a> 
<%--  		<a href="/objet/noticem.do?page=${ p }" class="item">${ p }</a>  --%>
		</c:if>
		</c:forEach>
		<c:if test="${  endPage + 10 > maxPage }">
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/noticem.do?page=${ maxPage }" class="disabled item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/noticem.do?page=${ maxPage }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		</c:if>
		<c:if test="${ endPage + 10 <= maxPage }">
		<a href="/objet/noticem.do?page=${ endPage + 10 }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/noticem.do?page=${ endPage }" class="disabled item"><i class="angle double right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/noticem.do?page=${ endPage }" class="item"><i class="angle double right icon"></i></a>
		</c:if>
	</div>
	</div>
	</c:if>
<c:if test="${ !empty noticetitle }">
<div align="center">
		<div class="ui pagination menu"  id="pagingdiv">
		<c:if test="${ currentPage eq 1 }">
		<a href="/objet/noticem.do?page=1" class="disabled item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne 1 }">
		<a href="/objet/noticem.do?page=1" class="item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ beginPage - 10 < 1 }">
		<c:if test="${ currentPage eq 1 }"><a href="/objet/noticem.do?page=1" class="disabled item"><i class="angle left icon"></i></a></c:if>
		<c:if test="${ currentPage ne 1 }"><a href="/objet/noticem.do?page=1" class="item"><i class="angle left icon"></i></a></c:if>
		</c:if>
		<c:if test="${ beginPage - 10 >= 1 }">
		<a href="/objet/noticem.do?page=${ currentPage }" class="item"><i class="angle left icon"></i></a>
		</c:if>
		<c:forEach begin="${ beginPage }" end="${ endPage }" var="p">
		<c:if test="${ p eq currentPage }">
		<a href="/objet/noticem.do?noticetype=${ noticetype }&noticetitle=${ noticetitle }&noticecontent=${ noticecontent }&page=${ p }" class="active item">${ p }</a> 
<%-- 		<a href="/objet/noticem.do?page=${ p }" class="active item">${ p }</a>  --%>
		</c:if>
		<c:if test="${ p ne currentPage }">
 		<a href="/objet/noticem.do?noticetype=${ noticetype }&noticetitle=${ noticetitle }&noticecontent=${ noticecontent }&page=${ p }" class="item">${ p }</a> 
<%--  		<a href="/objet/noticem.do?page=${ p }" class="item">${ p }</a>  --%>
		</c:if>
		</c:forEach>
		<c:if test="${  endPage + 10 > maxPage }">
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/noticem.do?page=${ maxPage }" class="disabled item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/noticem.do?page=${ maxPage }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		</c:if>
		<c:if test="${ endPage + 10 <= maxPage }">
		<a href="/objet/noticem.do?page=${ endPage + 10 }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/noticem.do?page=${ endPage }" class="disabled item"><i class="angle double right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/noticem.do?page=${ endPage }" class="item"><i class="angle double right icon"></i></a>
		</c:if>
	</div>
	</div>
	</c:if>
</div>
<c:import url="../footer.jsp"/>
</body>
</html>