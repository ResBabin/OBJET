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
	padding-left: 250px;
	padding-right: 200px; padding-top : 50px;
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
	var ctx8 = document.getElementById('myChart8');
	var ctx9 = document.getElementById('myChart9');
	
	var logindate = "${ todaycount.logindate }";

	var loginydate = "${ yestercount.logindate }";

	var loginyydate = "${ yestercount2.logindate }";

	var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	    	labels: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'], 
	        datasets: [
	        	{
	    			label: loginyydate + ' 시간 별 로그인',
	            	data: [ ${ yestercount2 } ],
	                backgroundColor: [
	                    'rgba(50, 50, 50, 0.1)',
	                ],
	                borderColor: [
	                	  'rgba(50, 50, 50, 0.9)',
	                ],
	                fill: false,
	                borderWidth: 2
	            },
	        {
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
	        },
	        
	        {
	        	label: logindate + ' 시간 별 로그인',
	        	data: [ ${ todaycount } ],
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
	var myChart2 = new Chart(ctx2, {
	    type: 'line',
	    data: {
	    	labels: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'],
	        datasets: [
	        	{
	    			label: '${ thismonth2.logindate1 }' + ' 월 평균 로그인',
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
	        	label: '${ thismonth3.logindate1 }'  + ' 월 평균 로그인',
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
	        	label: '${ thismonth.logindate1 }' + ' 월 평균 로그인',
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
	    			label: '${ thisweek2.logindate1 }' + ' 주 평균 로그인',
	            	data: [ ${ thisweek2 } ],
	                backgroundColor: [
	                    'rgba(50, 50, 50, 0.1)',
	                ],
	                borderColor: [
	                	  'rgba(50, 50, 50, 0.9)',
	                ],
	                fill: false,
	                borderWidth: 2
	            },
	            {
		        	label: '${ thisweek4.logindate1 }' + ' 주 평균 로그인',
		        	data: [${ thisweek4 }],
		            backgroundColor: [
		                'rgba(0, 255, 255, 1)',
		            ],
		            borderColor: [
		            	  'rgba(0, 255, 180, 1)',
		            ],
		            fill: false,
	                borderWidth: 3
		        },
	            {
	        	label: '${ thisweek3.logindate1 }' + ' 주 평균 로그인',
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
	        	label: '${ thisweek.logindate1 }' + ' 주 평균 로그인',
	        	data: [${ thisweek }],
	            backgroundColor: [
	                'rgba(100, 50, 200, 1)',
	            ],
	            borderColor: [
	            	  'rgba(100, 50, 200, 1)',
	            ],
	            borderWidth: 0
	        }
	       
	        ]
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
	    			label: '${ thisyear3.logindate1 }' + '년도 평균 로그인',
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
	        	label: '${ thisyear2.logindate1 }' + '년도 평균 로그인',
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
	        	label: '${ thisyear.logindate1 }'  + '년도 평균 로그인',
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
	    	labels: [ '${ oneweekcount.get(6).logindate }', '${ oneweekcount.get(5).logindate }', '${ oneweekcount.get(4).logindate }', 
	    		'${ oneweekcount.get(3).logindate }', '${ oneweekcount.get(2).logindate }', '${ oneweekcount.get(1).logindate }', '${ oneweekcount.get(0).logindate }'],
	        datasets: [
	        	{
	    			label: '주별 로그인 총 합',
	            	data: [${ oneweekcount.get(6).loginall }, ${ oneweekcount.get(5).loginall }, ${ oneweekcount.get(4).loginall }, ${ oneweekcount.get(3).loginall },
	            		${ oneweekcount.get(2).loginall }, ${ oneweekcount.get(1).loginall },${ oneweekcount.get(0).loginall }],
	                backgroundColor: [ 
	                    'rgba(100, 60, 140, 1)',
	                    'rgba(100, 60, 140, 1)',
	                    'rgba(100, 60, 140, 1)',
	                    'rgba(100, 60, 140, 1)',
	                    'rgba(100, 60, 140, 1)',
	                    'rgba(100, 60, 140, 1)',
	                    'rgba(100, 60, 140, 1)',
	                ],
	                hoverBackgroundColor : [
	                	  'rgba(50, 50, 50, 0.8)',
	                ],
		                borderWidth: 0
	            }]
	    },
	    options: { scales: {
	        yAxes: [{
	            stacked: true
	        }]
	    }, responsive : true }
	    
		});
	var myChart6 = new Chart(ctx6, {
	    type: 'bar',
	    data: {
	    	labels: [ '${ sixmonthcount.get(5).logindate }', '${ sixmonthcount.get(4).logindate }', '${ sixmonthcount.get(3).logindate }', 
	    		'${ sixmonthcount.get(2).logindate }', '${ sixmonthcount.get(1).logindate }', '${ sixmonthcount.get(0).logindate }'],
	        datasets: [
	        	{
	    			label: '월별 로그인 총 합',
	            	data: [ ${ sixmonthcount.get(5).loginall }, ${ sixmonthcount.get(4).loginall }, ${ sixmonthcount.get(3).loginall }, 
	            		${ sixmonthcount.get(2).loginall }, ${ sixmonthcount.get(1).loginall }, ${ sixmonthcount.get(0).loginall } ],
	                backgroundColor: [ 
	                    'rgba(120, 60, 110, 1)',
	                    'rgba(120, 60, 110, 1)',
	                    'rgba(120, 60, 110, 1)',
	                    'rgba(120, 60, 110, 1)',
	                    'rgba(120, 60, 110, 1)',
	                    'rgba(120, 60, 110, 1)',
	                ],
	                borderColor: [
	                ],
		                borderWidth: 0
	            }]
	    },
	    options: { scales: {
	        yAxes: [{
	            stacked: true
	        }]
	    }, responsive : true }
	    
		});
	console.log(${ enrollmonthsum.get(11).enrolldate });
	var myChart7 = new Chart(ctx7, {
	    type: 'bar',
	    data: {
	    	labels: [ '${ enrollmonthsum.get(11).enrolldate }', '${ enrollmonthsum.get(10).enrolldate }', '${ enrollmonthsum.get(9).enrolldate }', 
	    		'${ enrollmonthsum.get(8).enrolldate }', '${ enrollmonthsum.get(7).enrolldate }', '${ enrollmonthsum.get(6).enrolldate }',
	    		'${ enrollmonthsum.get(5).enrolldate }', '${ enrollmonthsum.get(4).enrolldate }', '${ enrollmonthsum.get(3).enrolldate }',
	    		'${ enrollmonthsum.get(2).enrolldate }', '${ enrollmonthsum.get(1).enrolldate }', '${ enrollmonthsum.get(0).enrolldate }'
	    		],
	        datasets: [
	        	{
	    			label: '월별 가입 합계',
	            	data:  [ '${ enrollmonthsum.get(11).enrollcount }', '${ enrollmonthsum.get(10).enrollcount }', '${ enrollmonthsum.get(9).enrollcount }', 
	    	    		'${ enrollmonthsum.get(8).enrollcount }', '${ enrollmonthsum.get(7).enrollcount }', '${ enrollmonthsum.get(6).enrollcount }',
	    	    		'${ enrollmonthsum.get(5).enrollcount }', '${ enrollmonthsum.get(4).enrollcount }', '${ enrollmonthsum.get(3).enrollcount }',
	    	    		'${ enrollmonthsum.get(2).enrollcount }', '${ enrollmonthsum.get(1).enrollcount }', '${ enrollmonthsum.get(0).enrollcount }'
	    	    		],
	                backgroundColor: [ 
	                	  'rgba(40, 120, 140, 1)',
	                	  'rgba(40, 120, 140, 1)',
	                	  'rgba(40, 120, 140, 1)',
	                	  'rgba(40, 120, 140, 1)',
	                	  'rgba(40, 120, 140, 1)',
	                	  'rgba(40, 120, 140, 1)',
	                	  'rgba(40, 120, 140, 1)',
	                	  'rgba(40, 120, 140, 1)',
	                	  'rgba(40, 120, 140, 1)',
	                	  'rgba(40, 120, 140, 1)',
	                	  'rgba(40, 120, 140, 1)',
	                	  'rgba(40, 120, 140, 1)',
	                ],
	                borderColor: [
	                ],
		                borderWidth: 0
	            }]
	    },
	    options: { scales: {
	        yAxes: [{
	            stacked: true
	        }]
	    }, responsive : true }
	    
		});
	
	var myChart8 = new Chart(ctx8, {
	    type: 'bar',
	    data: {
	    	labels: [ '${ enrollyearsum.get(4).enrolldate }', '${ enrollyearsum.get(3).enrolldate }',
	    		'${ enrollyearsum.get(2).enrolldate }', '${ enrollyearsum.get(1).enrolldate }', '${ enrollyearsum.get(0).enrolldate }'
	    		],
	        datasets: [
	        	{
	    			label: '연도별 가입 합계',
	            	data:  [ '${ enrollyearsum.get(4).enrollcount }', '${ enrollyearsum.get(3).enrollcount }',
	    	    		'${ enrollyearsum.get(2).enrollcount }', '${ enrollyearsum.get(1).enrollcount }', '${ enrollyearsum.get(0).enrollcount }'
	    	    		],
	                backgroundColor: [ 
	                    'rgba(30, 100, 160, 1)',
	                    'rgba(30, 100, 160, 1)',
	                    'rgba(30, 100, 160, 1)',
	                    'rgba(30, 100, 160, 1)',
	                    'rgba(30, 100, 160, 1)',
	                ],
	                borderColor: [
	                ],
		                borderWidth: 0
	            }]
	    },
	    options: { scales: {
	        yAxes: [{
	            stacked: true
	        }]
	    }, responsive : true }
	    
		});
	
	var myChart9 = new Chart(ctx9, {
	    type: 'bar',
	    data: {
	    	labels: [ '${ enrollweeksum.get(7).enrolldate }', '${ enrollweeksum.get(6).enrolldate }', 
	    		'${ enrollweeksum.get(5).enrolldate }', '${ enrollweeksum.get(4).enrolldate }', '${ enrollweeksum.get(3).enrolldate }',
	    		'${ enrollweeksum.get(2).enrolldate }', '${ enrollweeksum.get(1).enrolldate }', '${ enrollweeksum.get(0).enrolldate }'
	    		],
	        datasets: [
	        	{
	    			label: '주별 가입 합계',
	            	data:  [  '${ enrollweeksum.get(7).enrollcount }',  '${ enrollweeksum.get(6).enrollcount }',  
	            		'${ enrollweeksum.get(5).enrollcount }', '${ enrollweeksum.get(4).enrollcount }', '${ enrollweeksum.get(3).enrollcount }',
	    	    		'${ enrollweeksum.get(2).enrollcount }', '${ enrollweeksum.get(1).enrollcount }', '${ enrollweeksum.get(0).enrollcount }'
	    	    		],
	                backgroundColor: [ 
	                    'rgba(40, 140, 120, 1)',
	                    'rgba(40, 140, 120, 1)',
	                    'rgba(40, 140, 120, 1)',
	                    'rgba(40, 140, 120, 1)',
	                    'rgba(40, 140, 120, 1)',
	                    'rgba(40, 140, 120, 1)',
	                    'rgba(40, 140, 120, 1)',
	                    'rgba(40, 140, 120, 1)', 
	                ],
	                borderColor: [
	                ],
		                borderWidth: 0
	            }]
	    },
	    options: { scales: {
	        yAxes: [{
	            stacked: true
	        }]
	    }, responsive : true }
	    
		});
	
	
		
	$("#time").click(function() {
		$("#alllogin").hide();
		$("#enrolls").hide();
		$("#supports").hide();
		$("#logintime").fadeIn();
	});
	$("#all").click(function() {
		$("#enrolls").hide();
		$("#supports").hide();
		$("#logintime").hide();
		$("#alllogin").fadeIn();
	});
	$("#enroll").click(function() {
		$("#logintime").hide();
		$("#alllogin").hide();
		$("#supports").hide();
		$("#enrolls").fadeIn();
	});
	$("#support").click(function() {
		$("#logintime").hide();
		$("#alllogin").hide();
		$("#enrolls").hide();
		$("#supports").fadeIn();
	});
});
</script>
</head>
<body>
<div id="um">
<div>
<button class="ui basic black button" id="time">시간별 로그인 통계</button> &nbsp;&nbsp;
<button class="ui basic black button" id="all">로그인 총합 통계</button>&nbsp;&nbsp;
<button class="ui basic black button" id="enroll">회원 가입 통계</button>&nbsp;&nbsp;
</div>
<br>
<div style="border: 1.5px solid gray; border-radius: 10px ;padding: 20px; line-height: 20pt; font-weight: bold; font-size: 14pt"  align="center">
<div id="logintime">
<font size="5">시간별 회원 로그인 평균</font><br><br>
3일간 로그인 평균<canvas id="myChart" width="500" height="100" ></canvas><br>
4주간 로그인 평균<canvas id="myChart3" width="500" height="100" ></canvas><br>
3개월간 로그인 평균<canvas id="myChart2" width="500" height="100" ></canvas><br>
3년간 로그인 평균<canvas id="myChart4" width="500" height="100" ></canvas>
</div>
<div id="alllogin" style="display: none;">
<font size="5">회원 로그인 합계</font><br><br>
 일주일간 로그인 합계<canvas id="myChart5" width="500" height="100" ></canvas><br> 
 6개월간 로그인 합계<canvas id="myChart6" width="500" height="100" ></canvas><br>
</div>
<div id="enrolls" style="display: none;">
<font size="5">회원 가입 합계</font><br><br>
 주별 회원 가입 합계<canvas id="myChart9" width="500" height="100" ></canvas><br>
 월별 회원 가입 합계<canvas id="myChart7" width="500" height="100" ></canvas><br> 
 연도별 회원 가입 합계<canvas id="myChart8" width="500" height="100" ></canvas><br>
</div>
</div>
</div>
<c:import url="../footer.jsp"/>
</body>
</html>