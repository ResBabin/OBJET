<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산 현황 관리</title>
<c:import url="adminHeader.jsp"/>
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
<style type="text/css">
#um {
	padding: 150px;
	padding-top: 40px;
	padding-bottom: 40px;
}
</style>
<script type="text/javascript">
</script>


</head>
<body>
<div style="background: black; height: 100px; margin-top: -15px; color: white; text-align: center; font-size: 20pt; padding: 30px;">
총 정산수 ： ${ listCount } </div>
<div id="um">
<div align="right">

<!-- 검색창시작 -->
		<div align="center">
			<div class="objetSearchBox" style="height: 80px;">
				<div align="center">
				<form action="supportRequestSearchm.do" method="get">
				<input type="hidden" name="currentPage" value="1">
				<label class="ui grey button">신청ID</label>
				<span class="ui form"><span class="field">
		    		<input type="text" name="artistid" id="artistid" style="width:15%;"></span></span>
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<label class="ui grey button">정산날짜</label>
					<select class="ui search dropdown" name="requestyear" id="requestyear">
							  <option value="0">연도</option>
							  <option value="2020" <c:if test="${requestyear == 2020}">selected</c:if>>2020</option>
							  <option value="2019" <c:if test="${requestyear == 2019}">selected</c:if>>2019</option>
					</select>
					<select class="ui search dropdown" name="requestmonth" id="requestmonth">
							  <option value="0">월</option>
							  <option value="1"<c:if test="${requestmonth == 1}">selected</c:if>>01</option>
							  <option value="2"<c:if test="${requestmonth == 2}">selected</c:if>>02</option>
							  <option value="3"<c:if test="${requestmonth == 3}">selected</c:if>>03</option>
							  <option value="4"<c:if test="${requestmonth == 4}">selected</c:if>>04</option>
							  <option value="5"<c:if test="${requestmonth == 5}">selected</c:if>>05</option>
							  <option value="6"<c:if test="${requestmonth == 6}">selected</c:if>>06</option>
							  <option value="7"<c:if test="${requestmonth == 7}">selected</c:if>>07</option>
							  <option value="8"<c:if test="${requestmonth == 8}">selected</c:if>>08</option>
							  <option value="9"<c:if test="${requestmonth == 9}">selected</c:if>>09</option>
							  <option value="10"<c:if test="${requestmonth == 10}">selected</c:if>>10</option>
							  <option value="11"<c:if test="${requestmonth == 11}">selected</c:if>>11</option>
							  <option value="12"<c:if test="${requestmonth == 12}">selected</c:if>>12</option>
					</select>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					
					<label class="ui grey button">정산여부</label>
					<select class="ui search dropdown" name="sptstatus" id="sptstatus">
							  <option value="">전체</option>
							  <option value="DONE" <c:if test="${sptstatus == 'DONE'}">selected</c:if>>정산완료</option>
							  <option value="WAIT"<c:if test="${sptstatus == 'WAIT'}">selected</c:if>>대기</option>
							  <option value="RJCT"<c:if test="${sptstatus == 'RJCT'}">selected</c:if>>반려</option>
					</select>
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<input type="submit" class="mainBtn" value="검색">
				</form>
				</div>
			</div>
		</div>
		<!-- 검색창 끝 -->
		</div>
		
<table class="ui sortable celled table selectable">
<thead>
<tr>
<th width="5%">번호</th>
<th width="10%">신청ID</th>
<th width="10%">정산연도</th>
<th width="10%">정산월</th>
<th width="10%">신청일</th>
<th width="10%">정산여부</th>
<th width="10%">처리일</th>
<th width="10%">처리자</th>
</tr>
</thead>
<tbody>

<c:forEach var="request" items="${ list }" varStatus="status">
<tr>
	<td>${(paging.listCount - status.index)-((paging.currentPage-1)*paging.limit)}</td>
	<td>${request.artistid }</td>
	<td>${request.requestyear }</td>
	<td>${request.requestmonth }</td>
	<td>${request.sptdate }</td>
	<td><c:if test="${request.sptstatus == 'WAIT' }"><span style="text-decoration: underline; cursor: pointer;" onclick="location.href='requestSupportDetailm.do?requestno=${request.requestno}'">대기</span></c:if>
		<c:if test="${request.sptstatus == 'DONE' }"><span style="text-decoration: underline; cursor: pointer;" onclick="location.href='requestSupportDetailm.do?requestno=${request.requestno}'">정산완료</span></c:if> 
		<c:if test="${request.sptstatus == 'RJCT' }"><span style="text-decoration: underline; cursor: pointer;" onclick="location.href='requestSupportDetailm.do?requestno=${request.requestno}'">반려</span></c:if> </td>
	<td>${request.sptdonedate }</td>
	<td>${request.adminid }</td>
</tr>
</c:forEach>
</tbody>
</table>
<div align="right">
</div>
<br>

<!-- 검색결과 리스트 끝! -->
	<br><br>
					<!--  페이징 -->
				<div align="center">
					<div id="paging">
					<c:if test="${!empty list }">
						 <c:if test="${ kind eq 'all' }"> 
							 <c:if test="${ paging.startPage != 1 }">
							 	<a href="supportRequest.do?currentPage=${paging.startPage - 1}">이전</a>
							 </c:if>
							 
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="supportRequest.do?currentPage=${num}">&emsp;
								<c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
								<c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
								</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="supportRequest.do?currentPage=${paging.endPage + 1}">다음</a>
							</c:if>
						 </c:if> 

												
						<c:if test="${ kind eq 'search' }">
							<c:if test="${ paging.startPage != 1 }">
						 		<a href="supportRequestSearchm.do?currentPage=${paging.startPage - 1}&artistid=${artistid}&requestyear=${requestyear}&requestmonth=${requestmonth}&sptstatus=${sptstatus}">이전</a>
							</c:if>
						
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="supportRequestSearchm.do?currentPage=${num}&artistid=${artistid}&requestyear=${requestyear}&requestmonth=${requestmonth}&sptstatus=${sptstatus}">&emsp;
								<c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
								<c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
								</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="supportRequestSearchm.do?currentPage=${paging.endPage + 1}&artistid=${artistid}&requestyear=${requestyear}&requestmonth=${requestmonth}&sptstatus=${sptstatus}">다음</a>
							</c:if>
						</c:if>
					</c:if>
					</div>
				</div>
			<!-- 페이징처리 끝 -->


</div>
<br><br><br>
<c:import url="../footer.jsp"/>
</body>
</html>