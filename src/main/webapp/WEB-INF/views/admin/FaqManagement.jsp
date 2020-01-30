<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>

<style type="text/css">
#um { 
	padding: 150px;
	padding-top: 80px;
	padding-bottom: 80px;
}
</style>
<c:import url="adminHeader.jsp"/>
<script type="text/javascript">
$(function() {
		$("#checkall").click(function() {
			var check = $("#checkall").prop("checked");
			if (check) {
				$("input[name=faqnochk]").prop("checked", true);
			} else {
				$("input[name=faqnochk]").prop("checked", false);
			}
		});
		$("input[name=faqnochk]").click(function() {
			$("#checkall").prop("checked", false);
		});

		
		$("#delbtn").click(function() {
			
			if ($("input[name=faqnochk]:checked").length > 0) {
				
				var confirm_del = confirm("해당 글을 삭제하시겠습니까?");
				
				if (confirm_del) {
					var checkArr = [];
					$("input[name=faqnochk]:checked").each(function() {
						checkArr.push($(this).val());
					});
					var data = { faqno : checkArr };
					$.ajax({
						url : "deletefaqad.do",
						data : data,
						type : "post",
						success : function(result) {
							console.log(result);
							  location.href = location.href;
						},
						traditional : true,
						error : function(request, status, errorData) {
							console.log("error code : "
									+ request.status + "\nMessage : "
									+ request.responseText
									+ "\nError : " + errorData);
						}

					});
				}
				
			}else {
				alert("삭제할 글을 선택해주세요.");		
			}
			
			
		});
		
		
		
	$('.dropdown').dropdown({});
	$("input[name=faqcontents]").hide();
	
	$("#searchcontent").click(function() { 
	$("input[name=faqtitles]").hide();
	$("input[name=faqtitles]").val("");
	$("input[name=faqcontents]").show();
	});
	$("#searchtitle").click(function() {
	$("input[name=faqcontents]").hide();
	$("input[name=faqcontents]").val("");
	$("input[name=faqtitles]").show();
	});
});

</script>


</head>
<body>
<div id="um">
<c:url value="faqm.do" var="faqurl">
	<c:if test="${ !empty faqtitle }"><c:param value="${ faqtitle }" name="faqtitles" /></c:if>
	<c:if test="${ !empty faqcontent }"><c:param value="${ faqcontent }" name="faqcontents" /></c:if>
	//<c:if test="${ !empty faqtype and !fn:contains(faqurl, 'faqtype')}"><c:param value="${ faqtype }" name="faqtype" /></c:if>
	<c:param name="page" value="1"/>
	</c:url>
<h4 class="ui header">
FAQ : ${ faqlist.size() }
</h4>
<div align="right">
	<form action="faqm.do" method="get">
				<input type="submit" class="ui basic button" value="검색">
				<div class="ui right action left icon input">
					<i class="search icon"></i>
					<input type="search" placeholder="제목 검색" name="faqtitles"> 
					<input type="search" placeholder="내용 검색" name="faqcontents"> 
					<input type="hidden" value="1" name="page">
					<input type="hidden" value="" name="faqtype">
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
			</div>
	<div class="ui small basic buttons">
				<a href="${ faqurl }"><div class="ui button order" id="allbtn">전체</div></a>
				<a href="${ faqurl }&faqtype=전시"><div class="ui button order" id="exbtn">전시</div></a>
				<a href="${ faqurl }&faqtype=일반"><div class="ui button order" id="norbtn">일반</div></a>
				<a href="${ faqurl }&faqtype=일반"><div class="ui button order" id="norbtn">일반</div></a>
				<a href="${ faqurl }&faqtype=회원"><div class="ui button order" id="userbtn">회원</div></a>
			</div>&nbsp;&nbsp;
<table class="ui sortable celled table selectable">

<thead>
<tr>
<th width="30">
<div class="ui fitted checkbox">
	<input type="checkbox" id="checkall"> <label></label>
</div></th>
<th width="100" id="thth">번호</th>
<th id="thth">관리자ID</th>
<th id="thth">분류</th>
<th id="thth">제목</th>
</tr>
</thead>
<tbody>
<c:forEach var="faqm" items="${ faqlist }">
<c:url var="faqmd" value="faqmd.do">
	<c:param name="faqno" value="${ faqm.faqno }"/>
</c:url>
<tr>
<td>
	<div class="ui fitted checkbox">
		<input type="checkbox" name="faqnochk" value="${ faqm.faqno }"> <label></label>
	</div>
</td>
<td>${ faqm.faqno }</td>
<td>${ faqm.adminid }</td>
<td>${ faqm.faqtype }</td>
<td><a href="${ faqmd }">${ faqm.faqtitle }</a></td>
</tr>
</c:forEach>
</tbody>
</table>
<div align="right">
<a href=""><button class="ui basic button" id="delbtn">삭제</button></a> &nbsp;
<a href="faqWriteAd.do"><button class="ui  basic button">작성</button></a>
</div>
<br><br>
<div align="center">
		<div class="ui pagination menu"  id="pagingdiv">
		<c:if test="${ currentPage eq 1 }">
		<a href="/objet/faqm.do?page=1" class="disabled item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne 1 }">
		<a href="/objet/faqm.do?page=1" class="item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ beginPage - 10 < 1 }">
		<c:if test="${ currentPage eq 1 }"><a href="/objet/faqm.do?page=1" class="disabled item"><i class="angle left icon"></i></a></c:if>
		<c:if test="${ currentPage ne 1 }"><a href="/objet/faqm.do?page=1" class="item"><i class="angle left icon"></i></a></c:if>
		</c:if>
		<c:if test="${ beginPage - 10 >= 1 }">
		<a href="/objet/faqm.do?page=${ currentPage }" class="item"><i class="angle left icon"></i></a>
		</c:if>
		<c:forEach begin="${ beginPage }" end="${ endPage }" var="p">
		<c:if test="${ p eq currentPage }">
		<a href="/objet/faqm.do?page=${ p }" class="active item">${ p }</a> 
		</c:if>
		<c:if test="${ p ne currentPage }">
 		<a href="/objet/faqm.do?page=${ p }" class="item">${ p }</a> 
		</c:if>
		</c:forEach>
		<c:if test="${  endPage + 10 > maxPage }">
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/faqm.do?page=${ maxPage }" class="disabled item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/faqm.do?page=${ maxPage }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		</c:if>
		<c:if test="${ endPage + 10 <= maxPage }">
		<a href="/objet/faqm.do?page=${ endPage + 10 }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/faqm.do?page=${ endPage }" class="disabled item"><i class="angle double right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/faqm.do?page=${ endPage }" class="item"><i class="angle double right icon"></i></a>
		</c:if>
	</div>
	</div>
</div>
<c:import url="../footer.jsp"/>
</body>
</html>