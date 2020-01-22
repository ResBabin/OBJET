<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다녀온 오브제</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<!-- Full Calendar --><!-- BootStrap 4 -->
<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
<link href='resources/FullCalendar/core/main.css' rel='stylesheet' />
<link href='resources/FullCalendar/bootstrap/main.css' rel='stylesheet' />
<script src='resources/FullCalendar/core/main.js'></script>
<script src='resources/FullCalendar/interaction/main.js'></script>
<script src='resources/FullCalendar/bootstrap/main.js'></script>
<script src='resources/FullCalendar/daygrid/main.js'></script>
<script src='resources/FullCalendar/js/theme-chooser.js'></script>
<script src='resources/FullCalendar/core/locales/ko.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.js"></script>

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
	
		//캘린더 모달
		$("#visit_objet_cal").on("click", function() {
			$("#cal_modal").modal("show");
		});	
		
		$('.dropdown-menu').dropdown();
		
	<%-- 	// 한개 체크박스 선택 해제시 전체선텍 체크박스도 해제
	 $(".chk").click(function(){
		if($("input[name='RowCheck']:checked").length == <%= list.size() %>){
			$("#allCheck").prop("checked", true);
		}else{
			$("#allCheck").prop("checked", false);
		}	
	});
	--%>
		}); // document.ready...

//다녀온 오브제 일정
  document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar;

	    initThemeChooser({
	      init: function(themeSystem) {
	    	 var today = moment().day();
	        calendar = new FullCalendar.Calendar(calendarEl, {
	          plugins: [ 'bootstrap', 'interaction', 'dayGrid', 'timeGrid', 'list' ],
	          locale: 'ko',
	          themeSystem: themeSystem,
	          header: {
	            left: 'prev,next today',
	            center: 'title',
	            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
	          },
	          firstDay: today,
	          weekNumbers: false,
	          navLinks: true, // can click day/week names to navigate views
	          editable: false,
	          eventLimit: true, // allow "more" link when too many events
	          events: function(info, successCallback) {
	        	var userid = '${loginUser.userid}';
	        	  $.ajax({
	          		url : "visitedObjetPlan.do",
	          		type : "post",
	          		data: {userid:userid},
	          		dataType : "json",
	          		success : function(plan){
	          			var objStr = JSON.stringify(plan);
	          			var jsonObj = JSON.parse(objStr);
	    				var events = [];
	          			for(var i in jsonObj.plan){
	   						events.push({
	   							title: decodeURIComponent(jsonObj.plan[i].title).replace(/\+/gi, " "),
								start: jsonObj.plan[i].start,
								color: jsonObj.plan[i].color,
								allday: true
	   						});
	    		      	}		 
	          			console.log(events);
	          			successCallback(events);	
	          		},
	          		error : function(jqXHR, textStatus, errorThrown){
	          			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
	          		}
	              });
	          } 
	        });
	          calendar.render();
	      },

	      change: function(themeSystem) {
	        calendar.setOption('themeSystem', themeSystem);
	      }
	    });
	  });
		
		
		
  function visitedObjet_delete(){
		var lists = [];
		$("input[name='objetno']:checked").each(function(i){
			lists.push($(this).val());
		});
		var list = lists.join(",");
		$.ajax({
			url:"deleteMyVisitedObjetList.do",
			type:"get",
			data:{ lists : list },
			success : function(message){
				if(message == 'ok'){
	        		alert("해당 다녀온 오브제가 삭제되었습니다.");
	    			window.location.reload(); 
	        	}
			},
			error : function(request, error, XMLHttpRequest, textStatus, jqXHR, errorThrown) {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		})
	}//내 다녀온 오브제 삭제
</script>
<style>
  body {
    margin: 0;
    padding: 0;
    font-family: 'Nanum Gothic', sans-serif;
  }
  #cal_modal {
  	position: fixed;
  	align:center;
  	height: 92%;
  	width:60%;
  }
  
  #top,
  #calendar.fc-unthemed {
    font-family: 'Nanum Gothic', sans-serif;
  }

  #top {
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 15px;
    line-height: 30px;
    font-size: 14px;
    color: #000;
    height: 70px;
  }

  #top .selector {
    display: inline-block;
  }

  #top select {
    font: inherit; 
  }

  .left { float: left }
  .right { float: right }
  .clear { clear: both }

  #calendar {
    max-width: 80%;
    margin: 40px auto;
    padding: 0 10px;
  }

</style>
</head>
<body>

<!-- 다녀온 오브제 페이지 시작 -->
	<div class="wrapMyObjetList">
	
		<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">다녀온 오브제</p>
		
	<!-- 검색창시작 -->
		<div align="center">
			<div class="objetSearchBox" style="height: 130px;">
			<form action="selectMyVisitedObjetSearch.do" method="post">
			<input type="hidden" name="currentPage" value="1">
			<input type="hidden" name="userid" value="${loginUser.userid }">
				<a class="ui large grey label">오브제명</a>&ensp;
					<div class="ui input"><input type="text" name="objettitle" value="${objettitle }"style="width:300px; height:35px;"></div>&emsp;&emsp;&emsp;&emsp;
				<a class="ui large grey label">작가명</a>&ensp;
					<div class="ui input"><input type="text" name="nickname" value="${nickname }"style="width:150px; height:35px;"></div>
			<br><br>
				<a class="ui large grey label">전시상태</a>&ensp;
					<c:if test="${!empty objetstatus }">
					<input type="radio" name="objetstatus" value="" <c:if test="${objetstatus == '' }">checked</c:if>><label>&ensp;전체</label>&emsp;&emsp;
					<input type="radio" name="objetstatus" value="OPEN" <c:if test="${objetstatus == 'OPEN' }">checked</c:if>><label>&ensp;전시중</label>&emsp;&emsp;
					<input type="radio" name="objetstatus" value="CLOSE" <c:if test="${objetstatus == 'CLOSE' }">checked</c:if>><label>&ensp;종료</label>&emsp;&emsp;
					<input type="radio" name="objetstatus" value="STANDBY" <c:if test="${objetstatus == 'STANDBY' }">checked</c:if>><label>&nbsp;오픈예정</label>&emsp;&emsp;
					</c:if>
					<c:if test="${empty objetstatus }">
					<input type="radio" name="objetstatus" value="" checked="checked"><label>&ensp;전체</label>&emsp;&emsp;
					<input type="radio" name="objetstatus" value="OPEN"><label>&ensp;전시중</label>&emsp;&emsp;
					<input type="radio" name="objetstatus" value="CLOSE"><label>&ensp;종료</label>&emsp;&emsp;
					<input type="radio" name="objetstatus" value="STANDBY"><label>&nbsp;오픈예정</label>&emsp;&emsp;
					</c:if>
					<div class="ui buttons"><button class="mainBtn" type="submit">검색</button></div>
				
			</form>
			</div>
		</div>
		<!-- 검색창 끝 -->
		<br>
		<!-- 검색 결과 리스트 시작! -->
		<div class="objetListSection2">
		<div align="left" style="font-size: 10pt;">총<span style="font-weight: 700;">${ fn:length(visitedlist) }건</span>
		<button class="ui basic icon button" id="visit_objet_cal" style="float:right;margin-top:-7px;"><i class="calendar alternate outline icon"></i> 캘린더</button></div>
		<br>
		<c:if test="${ !empty visitedlist }">
		<c:forEach var="list" items="${ visitedlist }">
			<div class="eachObjet">
				<table class="eachObjetTable">
					<tr>
						<td><div class="ui checkbox"><input type="checkbox" name="objetno" value="${list.objetno }"><label></label></div></td>
					</tr>
					<tr>
						<td><div class="eachObjetImg" style="background-image:url('resources/images/objet/${list.renamemainposter}') "></div></td>
					</tr>
						
					<tr style="height:25px;">
						<td><center>						
						<c:if test="${list.objetstatus == 'STANDBY' }"><div class="objetStatusLabel2" style="background:#4d4d4d;">오픈 대기</div></c:if>
						<c:if test="${list.objetstatus == 'OPEN' }"><div class="objetStatusLabel2" style="background:#df0000;">전시중</div></c:if>
						<c:if test="${list.objetstatus == 'CLOSE' }"><div class="objetStatusLabel2" style="background:#d4d4d4;">전시 종료</div></c:if>
						<c:if test="${list.objetstatus == 'WAIT' }"><div class="objetStatusLabel2" style="background:#8d8d8d;">검수 대기</div></c:if>
						<center></td>
					</tr>
					<tr style="height:35px;">
						<td><div style="font-size: 16pt; font-weight: 600;">${list.objettitle }</div></td>
					</tr>
					<tr style="height:25px;">
						<td><div style="font-size: 10pt;color:#aaa;">@${list.nickname }</div></td>
					</tr>
				</table>
			</div>
			</c:forEach>
			</c:if>
			
			<br><br>
			

		</div>
		<!-- 검색 결과 리스트 끝! -->
		<br>
		<div align="left">
			<button class="mainBtn2" onClick="visitedObjet_delete()">삭제</button>
		</div>
		<br><br>
		
		<!--  페이징 -->
            <div align="center">
               <div id="paging">
               <c:if test="${!empty visitedlist }">
                   <c:if test="${ kind eq 'all' }"> 
                      <c:if test="${ paging.startPage != 1 }">
                         <a href="moveMyVisitedObjetList.do?userid=${loginUser.userid}&currentPage=${paging.startPage - 1}">이전</a>
                      </c:if>
                      
                     <c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
                        <a href="moveMyVisitedObjetList.do?userid=${loginUser.userid}&currentPage=${num}">&emsp;
                        <c:if test="${ paging.currentPage == num }"><span class="pagingBtn1">${num}</span></c:if>
                        <c:if test="${ paging.currentPage != num }"><span class="pagingBtn2">${num}</span></c:if>
                        </a>
                     </c:forEach>
                     
                     <c:if test="${ paging.endPage != paging.maxPage }">
                        <a href="moveMyVisitedObjetList.do?userid=${loginUser.userid}&currentPage=${paging.endPage + 1}">다음</a>
                     </c:if>
                   </c:if> 

                                    
                  <c:if test="${ kind eq 'search' }">
                     <c:if test="${ paging.startPage != 1 }">
                         <a href="selectMyVisitedObjetSearch.do?userid=${loginUser.userid}&objettitle=${objettitle }&nickname=${nickname }&objetstatus=${objetstatus }&currentPage=${paging.startPage - 1}">이전</a>
                     </c:if>
                  
                     <c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
                        <a href="selectMyVisitedObjetSearch.do?userid=${loginUser.userid}&objettitle=${objettitle }&nickname=${nickname }&objetstatus=${objetstatus }&currentPage=${num}">&emsp;
                        <c:if test="${ paging.currentPage == num }"><span class=pagingBtn11">${num}</span></c:if>
                        <c:if test="${ paging.currentPage != num }"><span class="pagingBtn12">${num}</span></c:if>
                        </a>
                     </c:forEach>
                     
                     <c:if test="${ paging.endPage != paging.maxPage }">
                        <a href="selectMyVisitedObjetSearch.do?userid=${loginUser.userid}&objettitle=${objettitle }&nickname=${nickname }&objetstatus=${objetstatus }&currentPage=${paging.endPage + 1}">다음</a>
                     </c:if>
                  </c:if>
               </c:if>
               </div>
            </div>
         <!-- 페이징처리 끝 -->
	<br><br>	
	</div>
	<!-- 다녀온 오브제 페이지 끝! -->

<!-- 다녀온 오브제 일정 캘린더  -->
<div class="ui modal" id="cal_modal">
 <div id='top'>
    <div class='left'>
      <div id='theme-system-selector' class='selector'>
      &nbsp;
        <select class="dropdown-menu btn-sm">
          <option class="dropdown-item" value='bootstrap' selected>테마 선택</option>
          <option class="dropdown-item" value='standard' >기본테마</option>
        </select>
      </div>
      <div data-theme-system="bootstrap" class='selector' style='display:none'>
      &nbsp;
        <select class="dropdown-menu btn-sm">
          <option class="dropdown-item" value=''>Default</option>
          <option class="dropdown-item" value='cerulean'>Cerulean</option>
          <option class="dropdown-item" value='cosmo'>Cosmo</option>
          <option class="dropdown-item" value='cyborg'>Cyborg</option>
          <option class="dropdown-item" value='darkly'>Darkly</option>
          <option class="dropdown-item" value='flatly'>Flatly</option>
          <option class="dropdown-item" value='journal'>Journal</option>
          <option class="dropdown-item" value='litera'>Litera</option>
          <option class="dropdown-item" value='lumen'>Lumen</option>
          <option class="dropdown-item" value='lux'>Lux</option>
          <option class="dropdown-item" value='materia'>Materia</option>
          <option class="dropdown-item" value='minty'>Minty</option>
          <option class="dropdown-item" value='pulse'>Pulse</option>
          <option class="dropdown-item" value='sandstone'>Sandstone</option>
          <option class="dropdown-item" value='simplex'>Simplex</option>
          <option class="dropdown-item" value='sketchy'>Sketchy</option>
          <option class="dropdown-item" value='slate'>Slate</option>
          <option class="dropdown-item" value='solar'>Solar</option>
          <option class="dropdown-item" value='spacelab'>Spacelab</option>
          <option class="dropdown-item" value='superhero'>Superhero</option>
          <option class="dropdown-item" value='united'>United</option>
          <option class="dropdown-item" value='yeti'>Yeti</option>
        </select>
      </div>
      <span id='loading'  style='display:none;'>테마 로딩중...</span>
    </div>
    <div class='clear'></div>
  </div>

  <div id='calendar'></div>
  </div>
<!-- //다녀온 오브제 일정 캘린더 -->
<br><br><br><br><br>
</body>
<c:import url="../footer.jsp" />
</html>