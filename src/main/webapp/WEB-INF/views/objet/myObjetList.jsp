<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시관리</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
<script type="text/javascript">
$(function(){
		// 체크박스 전체선택 및 전체해제
		$("#allCheck").click(function(){
			if($(this).is(":checked")){
				$(".chk").prop("checked", true);
			} else {
				$(".chk").prop("checked", false);
			}
		});
	
 	// 한개 체크박스 선택 해제시 전체선텍 체크박스도 해제
	 $(".chk").click(function(){
		if($("input[name='RowCheck']:checked").length == ${fn:length(list) }){
			$("#allCheck").prop("checked", true);
		}else{
			$("#allCheck").prop("checked", false);
		}	
	});
 
 	$("#objet_del").on("click", function() {
		$("#objet_del_modal").modal('show');
	});
 
}); // document.ready...

function objet_delete(){
	var lists = [];
	$("input[name='RowCheck']:checked").each(function(i){
		lists.push($(this).val());
	});
	var list = lists.join(",");
	$.ajax({
		url:"deleteObjet.do",
		type:"get",
		data:{ lists : list },
		success : function(message){
			if(message == 'ok'){
        		alert("해당 오브제가 삭제되었습니다.");
    			window.location.reload(); 
        	}
		},
		error : function(request, error, XMLHttpRequest, textStatus, jqXHR, errorThrown) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	})
}//내 오브제 삭제

//내 오브제 수정
function objetModify(){
	if($("input[name='RowCheck']:checked").length > 1){
		alert("여러개는 수정하실 수 없습니다.");
	}
    if($("input[name='RowCheck']:checked").length == 1 && $("#status").val() == '승인대기' && $("#public").val() == '승인대기'){
		var objetno = $("input[name='RowCheck']:checked").val();
		window.location.href = 'moveEditObjet.do?objetno=' + objetno;
	}
	else if($("#status").val() != '승인대기'){
		alert("전시중, 전시예정, 전시종료된 전시는 수정하실 수 없습니다.");
	}
	else if($("#public").val() == '반려'){
		alert("반려된 전시는 수정하실 수 없습니다.");
	}
}
</script>
</head>
<body>

<!-- 전시관리 페이지 시작 -->
<div class="wrapMyObjetList">

	<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">내 오브제</p>
	
	<!-- 검색창시작 -->
	<div align="center">
		<div class="objetSearchBox" style="height: 180px;">
		<form action="moveMyObjetListSearch.do" method="post">
		<input type="hidden" name="userid" value="${loginUser.userid }">
		<input type="hidden" name="currentPage" value="1">
			<a class="ui large grey label">승인여부</a>&ensp;
				<input type="radio" name="publicyn" value="ALL" <c:if test="${publicyn == 'ALL'}">checked</c:if> checked><label>&ensp;전체</label>&emsp;&emsp;
				<input type="radio" name="publicyn" value="Y" <c:if test="${publicyn == 'Y'}">checked</c:if>><label>&ensp;승인</label>&emsp;&emsp;
				<input type="radio" name="publicyn" value="N" <c:if test="${publicyn == 'N'}">checked</c:if>><label>&ensp;반려</label>&emsp;&emsp;
				<input type="radio" name="publicyn" value="W" <c:if test="${publicyn == 'W'}">checked</c:if>><label>&ensp;승인대기</label>
		<br><br>
			<a class="ui large grey label">전시상태</a>&ensp;
				<input type="radio" name="objetstatus" value="ALL" <c:if test="${objetstatus == 'ALL'}">checked</c:if> checked><label>&ensp;전체</label>&emsp;&emsp;
				<input type="radio" name="objetstatus" value="OPEN" <c:if test="${objetstatus == 'OPEN'}">checked</c:if>><label>&ensp;전시중</label>&emsp;&emsp;
				<input type="radio" name="objetstatus" value="STANDBY" <c:if test="${objetstatus == 'STANDBY'}">checked</c:if>><label>&ensp;전시예정</label>&emsp;&emsp;
				<input type="radio" name="objetstatus" value="CLOSE" <c:if test="${objetstatus == 'CLOSE'}">checked</c:if>><label>&ensp;전시종료</label>&emsp;&emsp;
				<input type="radio" name="objetstatus" value="WAIT" <c:if test="${objetstatus == 'WAIT'}">checked</c:if>><label>&ensp;승인대기</label>
		<br><br>
			<a class="ui large grey label">오브제명</a>&ensp;
				<div class="ui input"><input type="text" name="objettitle" style="width:300px; height:35px;" value="${objettitle}"></div>&ensp;
				<div class="ui buttons"><button class="mainBtn" type="submit">검색</button></div>
		</form>
	
		</div>
	</div>
	<!-- 검색창 끝 -->

	<div class="objetListSection">
		<div align="left" style="font-size: 10pt;">총<span style="font-weight:bold;color:#9bca39;"> ${fn:length(list) }</span>건</div>
		<br>
		<!-- 오브제 리스트 시작 -->
		<table class="searchListTable">
			<tr style="height: 30px;">
				<th width="2%"><input type="checkbox" class="chk" id="allCheck"/></th>
				<th width="45%">오브제명</th>
				<th width="8%">전시상태</th>
				<th width="20%">전시기간</th>
				<th width="8%">승인여부</th>
				<th width="10%">등록일</th>
			</tr>
			<c:if test="${fn:length(list) != 0}">
			<c:forEach var="myObjet" items="${list }" varStatus="status">
			<tr>
				<td><input type="checkbox" id="chk" class="chk" name="RowCheck" value="${myObjet.objetno}"></td>
				<c:if test="${myObjet.objetstatus eq 'OPEN'}">
				<td onclick="location.href='objetOne.do?objetno=${myObjet.objetno}&userid=${loginUser.userid }'" style="cursor:pointer;"><p style="font-size:10pt;"></p>
				${myObjet.objettitle }</td>
				</c:if>
				<c:if test="${myObjet.objetstatus ne 'OPEN'}">
				<td style="cursor:pointer;"><p style="font-size:10pt;"></p>${myObjet.objettitle }</td>
				</c:if>
				<c:if test="${myObjet.objetstatus eq 'OPEN' }">
				<td>전시중</td>
				</c:if>
				<c:if test="${myObjet.objetstatus eq 'STANDBY' }">
				<td>전시예정</td>
				</c:if>
				<c:if test="${myObjet.objetstatus eq 'CLOSE' }">
				<td>전시종료</td>
				</c:if>
				<c:if test="${myObjet.objetstatus eq 'WAIT' }">
				<td id="status">승인대기</td>
				</c:if>
				<td>${myObjet.objetstartdate} - ${myObjet.objetenddate}</td>
				<c:if test="${myObjet.publicyn eq 'Y' }">
				<td>승인</td>
				</c:if>
				<c:if test="${myObjet.publicyn eq 'N' }">
				<td>반려</td>
				</c:if>
				<c:if test="${myObjet.publicyn eq 'W' }">
				<td id="public">승인대기</td>
				</c:if>
				<td>${myObjet.objetregidate }</td>
			</tr>
			</c:forEach>
			</c:if>
			<c:if test="${fn:length(list) == 0}">
			<tr>
			<td colspan="6">내 오브제가 없습니다.</td>
			</tr>
			</c:if>
		</table>
	</div>
	<br>
	<div align="right">
		<button class="mainBtn2" onclick="objetModify();">수정</button>
		<button class="mainBtn2" id="objet_del" >삭제</button>
	</div>
	<br>
	
	<!-- 내 오브제 삭제 버튼 클릭시 모달 -->
	<div class="ui mini modal actions" id="objet_del_modal">
	  <div class="content">
	    <p>정말 이 오브제를 삭제하시겠습니까?</p>
	  </div>
	  <div class="actions">
	    <div class="ui red cancel inverted button">
	      <i class="remove icon"></i>
	      	취소
	    </div>
	    <div id="btnsub_rev_del" class="ui blue ok inverted button" onClick="objet_delete()" style="cursor: pointer;">
	      <i class="checkmark icon"></i>
	      	삭제
	    </div>
	  </div>
	</div>
	
	<!--  페이징 -->
	<div align="center">
	<div id="paging">
		 <c:if test="${ kind eq 'all' }"> 
			 <c:if test="${ paging.startPage != 1 }">
			 	<a href="moveMyObjetList.do?userid=${loginUser.userid }&currentPage=${paging.startPage - 1}">이전</a>
			 </c:if>
			<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
				<a href="moveMyObjetList.do?userid=${loginUser.userid }&currentPage=${num}">&emsp;
				<c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
				<c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
				</a>
			</c:forEach>
			<c:if test="${ paging.endPage != paging.maxPage }">
				<a href="moveMyObjetList.do?userid=${loginUser.userid }&currentPage=${paging.endPage + 1}">다음</a>
			</c:if>
		 </c:if> 
		
		<c:if test="${ kind eq 'search' }">
			<c:if test="${ paging.startPage != 1 }">
		 		<a href="moveMyObjetList.do?userid=${loginUser.userid }&currentPage=${paging.startPage - 1}&publicyn=${publicyn}&objetstatus=${objetstatus}">이전</a>
			</c:if>
			<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
				<a href="moveMyObjetList.do?userid=${loginUser.userid }&currentPage=${num}&publicyn=${publicyn}&objetstatus=${objetstatus}">&emsp;
				<c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
				<c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
				</a>
			</c:forEach>
			<c:if test="${ paging.endPage != paging.maxPage }">
				<a href="moveMyObjetList.do?userid=${loginUser.userid }&currentPage=${paging.endPage + 1}&publicyn=${publicyn}&objetstatus=${objetstatus}">다음</a>
			</c:if>
		</c:if>
	</div>
	</div><br><br>
	
</div>
<!-- 전시관리 페이지 끝 -->

<br><br><br>
</body>
<c:import url="../footer.jsp" />
</html>