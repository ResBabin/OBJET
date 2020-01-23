<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 통계</title>
<!-- 시맨틱유아이 cdn -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
		
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<c:import url="adminHeader.jsp"/>
<style type="text/css">
#um {
	padding-left: 200px;
	padding-right: 50px; padding-top : 50px;
	padding-bottom: 50px;
	background: white;
	padding-top: 50px;
}

canvas {
	border: 1px solid #ddd;
	//box-shadow: 3px 3px 0px #ccc;
}
</style>

<script type="text/javascript">
$(function() {

	var thisyear = new Date();
	var getyear = thisyear.getFullYear();
	var getmonth = thisyear.getMonth() ;
	console.log(thisyear.getFullYear());
	
	var ctx = document.getElementById('myChart');
	var ctx2 = document.getElementById('myChart2');
	var ctx3 = document.getElementById('myChart3');
	var ctx4 = document.getElementById('myChart4');
	var ctx5 = document.getElementById('myChart5');
	var ctx6 = document.getElementById('myChart6');
	var ctx7 = document.getElementById('myChart7');
	
	var logindate = "${ todaycount.logindate }";

	var loginydate = "${ yestercount.logindate }";

	var loginyydate = "${ yestercount2.logindate }";

	var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	    	labels: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'], 
	        datasets: [
	        	{
	    			label: loginydate + ' 시간 별 로그인',
	            	data: [ ${ yestercount2 } ],
	                backgroundColor: [
	                    'rgba(50, 50, 50, 0.1)',
	                ],
	                borderColor: [
	                	  'rgba(50, 50, 50, 0.9)',
	                ],
	                fill: false,
	                borderWidth: 2
	            },{
	        	label: loginydate + ' 시간 별 로그인',
	        	data: [ ${ yestercount } ],
	            backgroundColor: [
	            	  'rgba(0, 180, 255, 0.4)',
	            ],
	            fill: true,
	            borderColor: [
	            	  'rgba(0, 180, 255, 1)',
	            ],
	            borderWidth: 1.5
	        },{
	        	label: logindate + ' 시간 별 로그인',
	        	data: [ ${ todaycount }],
	            backgroundColor: [
	                'rgba(100, 50, 200, 1)',
	            ],
	            borderColor: [
	            	  'rgba(100, 50, 200, 1)',
	            ],
	            borderWidth: 0
	        }]
	    },
	    options: { scales: {
	        yAxes: [{
	            stacked: false
	        }]
	    }, responsive : true }
	    
		});
	var thismonth3 = "${ thismonth }";
	console.log(thismonth3);
	var myChart2 = new Chart(ctx2, {
	    type: 'line',
	    data: {
	    	labels: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'],
	        datasets: [
	        	{
	    			label: getyear + "-" + getmonth + ' 월 평균 로그인',
	            	data: [ ${ thismonth2 } ],
	                backgroundColor: [
	                    'rgba(50, 50, 50, 0.1)',
	                ],
	                borderColor: [
	                	  'rgba(50, 50, 50, 0.9)',
	                ],
	                fill: false,
	                borderWidth: 2
	            },{
	        	label: getyear + "-" + getmonth  + ' 월 평균 로그인',
	        	data: [ ${ thismonth3 } ],
	            backgroundColor: [
	            	  'rgba(0, 180, 255, 0.4)',
	            ],
	            fill: true,
	            borderColor: [
	            	  'rgba(0, 180, 255, 1)',
	            ],
	            borderWidth: 1.5
	        },{
	        	label: getyear + "-" + getmonth + ' 월 평균 로그인',
	        	data: [ ${ thismonth } ],
	            backgroundColor: [
	                'rgba(100, 50, 200, 1)',
	            ],
	            borderColor: [
	            	  'rgba(100, 50, 200, 1)',
	            ],
	            borderWidth: 0
	        }]
	    },
	    options: { scales: {
	        yAxes: [{
	            stacked: false
	        }]
	    }, responsive : true }
	    
		});
	var myChart3 = new Chart(ctx3, {
	    type: 'line',
	    data: {
	    	labels: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'],
	        datasets: [
	        	{
	    			label: getmonth + ' 월 평균 로그인',
	            	data: [ ${ thisweek2 } ],
	                backgroundColor: [
	                    'rgba(50, 50, 50, 0.1)',
	                ],
	                borderColor: [
	                	  'rgba(50, 50, 50, 0.9)',
	                ],
	                fill: false,
	                borderWidth: 2
	            },{
	        	label: getmonth + ' 월 평균 로그인',
	        	data: [ ${ thisweek3 } ],
	            backgroundColor: [
	            	  'rgba(0, 180, 255, 0.4)',
	            ],
	            fill: true,
	            borderColor: [
	            	  'rgba(0, 180, 255, 1)',
	            ],
	            borderWidth: 1.5
	        },{
	        	label: getmonth + ' 월 평균 로그인',
	        	data: [${ thisweek }],
	            backgroundColor: [
	                'rgba(100, 50, 200, 1)',
	            ],
	            borderColor: [
	            	  'rgba(100, 50, 200, 1)',
	            ],
	            borderWidth: 0
	        }]
	    },
	    options: { scales: {
	        yAxes: [{
	            stacked: false
	        }]
	    }, responsive : true }
	    
		});
	
	var myChart4 = new Chart(ctx4, {
	    type: 'line',
	    data: {
	    	labels: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'],
	        datasets: [
	        	{
	    			label: getyear - 2 + ' 년도 평균 로그인',
	            	data: [${ thisyear3 }],
	                backgroundColor: [
	                    'rgba(50, 50, 50, 0.1)',
	                ],
	                borderColor: [
	                	  'rgba(50, 50, 50, 0.9)',
	                ],
	                fill: false,
	                borderWidth: 2
	            },{
	        	label: getyear - 1 + ' 년도 평균 로그인',
	        	data: [${ thisyear2 }],
	            backgroundColor: [
	            	  'rgba(0, 180, 255, 0.4)',
	            ],
	            fill: true,
	            borderColor: [
	            	  'rgba(0, 180, 255, 1)',
	            ],
	            borderWidth: 1.5
	        },{
	        	label: getyear  + ' 월 평균 로그인',
	        	data: [${ thisyear }],
	            backgroundColor: [
	                'rgba(100, 50, 200, 1)',
	            ],
	            borderColor: [
	            	  'rgba(100, 50, 200, 1)',
	            ],
	            borderWidth: 0
	        }]
	    },
	    options: { scales: {
	        yAxes: [{
	            stacked: false
	        }]
	    }, responsive : true }
	    
		});
	
	var myChart5 = new Chart(ctx5, {
	    type: 'bar',
	    data: {
	    	labels: ['0', '1', '2', '3', '4', '5', '6', '7'],
	        datasets: [
	        	{
	    			label: getyear - 2 + ' 년도 평균 로그인',
	            	data: [${ oneweekcount }],
	                backgroundColor: [
	                    'rgba(50, 50, 50, 0.1)',
	                ],
	                borderColor: [
	                	  'rgba(50, 50, 50, 0.9)',
	                ],
		                borderWidth: 2
	            }]
	    },
	    options: { scales: {
	        yAxes: [{
	            stacked: false
	        }]
	    }, responsive : true }
	    
		});
	
	$("#time").click(function() {
		$("#logintime").fadeIn();
	});
	$("#all").click(function() {
		$("#logintime").hide();
		$("#alllogin").fadeIn();
	});
});
</script>
</head>
<body>
<div id="um">
<div>
<button class="ui basic grey button" id="time">시간별 로그인 통계</button>
<button class="ui basic grey button" id="all">전체 로그인</button>
<button class="ui basic grey button">시간별 로그인</button>
<button class="ui basic grey button">시간별 로그인</button>
</div>
<br>
<div style="border: 1.5px solid gray; border-radius: 10px ;padding: 20px; line-height: 20pt; font-weight: bold; font-size: 14pt"  align="center">
<div id="logintime">
<font size="5">시간별 회원 로그인 통계</font><br><br>
3일간 로그인 통계<canvas id="myChart" width="500" height="100" ></canvas><br>
4주간 로그인 통계<canvas id="myChart2" width="500" height="100" ></canvas><br>
3개월간 로그인 통계<canvas id="myChart3" width="500" height="100" ></canvas><br>
3년간 로그인 통계<canvas id="myChart4" width="500" height="100" ></canvas>
</div>
<div id="alllogin" style="display: none;">
<font size="5">시간별 회원 로그인 통계</font><br><br>
3일간 로그인 통계<canvas id="myChart5" width="500" height="100" ></canvas><br>
</div>
</div>
</div>
</body>
</html>