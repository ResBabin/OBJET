<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineN", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산 현황 내역</title>
<c:import url="../header.jsp" />
<c:import url="../headerSearch.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript">
	function insertRequestSupport(){
		$.ajax({
	         url:"moveInsertRequestSupportyn.do",
	         type:"get",
	         data:{artistid : "${loginUser.userid}"},
	         success: function(result){
	             if(result == "ok"){
	               window.location.href="moveInsertRequestSupport.do?artistid=${loginUser.userid}"
	             }
	             else{
	            	alert("후원정보 먼저 작성하신 후 신청해 주세요.");
	            	window.location.href="moveApplySupport.do"
	             }
	          },
	          error: function(request, status, errorData){
					console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
				}
	       }); 
		
	}
 </script>
</head>

<body>

<div class="wrapSupportList">

<p style="font-size: 20pt; color:#373737; text-align:center;">정산 현황 목록</p>

	<!-- 검색창시작 -->
		<div align="center">
			<div class="objetSearchBox" style="height: 80px;">
				<div align="center">
				<form action="moveRequestSupportSearch.do" method="post">
				<input type="hidden" name="artistid" value="${loginUser.userid }">
				<input type="hidden" name="currentPage" value="1">
				<button class="ui grey button">정산날짜</button>
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
					
					<button class="ui grey button">정산여부</button>
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
		
		<!-- 검색 결과 리스트 시작! -->
	<div class="objetListSection2">
		<div align="left" style="font-size: 10pt; color:black">총 <span style="font-weight: 700;">${fn:length(requestlist)}</span>건</div><br>
		<table class="supportListTable">
			<tr>
				<th style="width:5%">No.</th>
				<th style="width:18%">정산연도</th>
				<th style="width:18%">정산월</th>
				<th style="width:18%">신청일</th>
				<th style="width:18%">정산여부</th>
				<th style="width:18%;">처리일</th>
				<th style="width:5%">파일</th>
			</tr>
			<c:if test="${!empty requestlist }">
			<c:forEach var="list" items="${requestlist}" varStatus="status">
			<tr>
				<td>${(paging.listCount - status.index)-((paging.currentPage-1)*paging.limit)}</td>
				<td>${list.requestyear}</td>
				<td>${list.requestmonth}</td>
				<td>${list.sptdate }</td>
				<td><c:if test="${list.sptstatus == 'WAIT' }"><span style="text-decoration: underline; cursor: pointer;" onclick="location.href='moveRequestSupportDetail.do?requestno=${list.requestno}&artistid=${loginUser.userid}'">대기</span></c:if>
					<c:if test="${list.sptstatus == 'DONE' }"><span style="text-decoration: underline; cursor: pointer;" onclick="location.href='moveRequestSupportDetail.do?requestno=${list.requestno}&artistid=${loginUser.userid}'">정산완료</span></c:if> 
					<c:if test="${list.sptstatus == 'RJCT' }"><span style="text-decoration: underline; cursor: pointer;" onclick="location.href='moveRequestSupportDetail.do?requestno=${list.requestno}&artistid=${loginUser.userid}'">반려</span></c:if> 
				</td>
				<td><c:if test="${empty list.sptdonedate}">&ensp;</c:if>
					<c:if test="${!empty list.sptdonedate}">${list.sptdonedate}</c:if>
				</td>
				<td><c:if test="${empty list.sptrfile}">&ensp;</c:if>
					<c:if test="${!empty list.sptrfile}"><i class="paperclip icon" onclick="location.href='requestFileDown.do?filename=${list.sptrfile}'"></i></c:if>
				</td>
			</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty requestlist }">
			<tr>
				<td colspan="7">내역이 없습니다.</td>
			</tr>
			</c:if>
		</table>
	</div>
	<!-- 검색결과 리스트 끝! -->
	<br><br>
					<!--  페이징 -->
				<div align="center">
					<div id="paging">
					<c:if test="${!empty requestlist }">
						 <c:if test="${ kind eq 'all' }"> 
							 <c:if test="${ paging.startPage != 1 }">
							 	<a href="moveRequestSupport.do?artistid=${loginUser.userid}&currentPage=${paging.startPage - 1}">이전</a>
							 </c:if>
							 
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="moveRequestSupport.do?artistid=${loginUser.userid}&currentPage=${num}">&emsp;
								<c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
								<c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
								</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="moveRequestSupport.do?artistid=${loginUser.userid}&currentPage=${paging.endPage + 1}">다음</a>
							</c:if>
						 </c:if> 

												
						<c:if test="${ kind eq 'search' }">
							<c:if test="${ paging.startPage != 1 }">
						 		<a href="moveRequestSupportSearch.do?artistid=${loginUser.userid}&currentPage=${paging.startPage - 1}&requestyear=${requestyear}&requestmonth=${requestmonth}&sptstatus=${sptstatus}">이전</a>
							</c:if>
						
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<a href="moveRequestSupportSearch.do?artistid=${loginUser.userid}&currentPage=${num}&requestyear=${requestyear}&requestmonth=${requestmonth}&sptstatus=${sptstatus}">&emsp;
								<c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
								<c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
								</a>
							</c:forEach>
							
							<c:if test="${ paging.endPage != paging.maxPage }">
								<a href="moveRequestSupportSearch.do?artistid=${loginUser.userid}&currentPage=${paging.endPage + 1}&requestyear=${requestyear}&requestmonth=${requestmonth}&sptstatus=${sptstatus}">다음</a>
							</c:if>
						</c:if>
					</c:if>
					</div>
				</div>
			<!-- 페이징처리 끝 -->
			<!-- 정산신청 버튼 -->
			<br><br>
			<div align="right">
				<button class="mainBtn2" onclick="insertRequestSupport()">정산신청</button>
			</div>
		
</div> <!-- supportWrap 끝 -->
<c:import url="../footer.jsp" />
</body>
</html>