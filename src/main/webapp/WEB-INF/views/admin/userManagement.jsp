<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오브제 관리자 - 회원관리</title>
<!-- 시맨틱유아이 cdn -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<style type="text/css">
#um {
	padding: 150px;
	padding-top: 50px;
}

#popdiv {
	position: absolute;
	background: #f7f7f7; 
	border: 1px solid #ccc;
	width: 500px;
	height: 480px;
	left: 35%;
	top: 30%; 
	border-radius: 5px;
	padding: 30px;
	box-shadow: 1px 1px 2px #999;
	display: none;
	z-index: 1;
}
#quitdiv {
	position: absolute;
	background: #f7f7f7;
	border: 1px solid #ccc;
	width: 500px;
	height: 415px;
	left: 35%;
	top: 40%; 
	border-radius: 5px;
	padding: 30px;
	box-shadow: 1px 1px 2px #999;
	display: none;
	z-index: 2;
}
#popselect{
	width: 458px;
}
#bllabel{
	font-size: 13pt;
	font-weight: bold;
	margin-left: 70px;
}
#qlabel{
	font-size: 13pt;
	font-weight: bold;
	margin-left: 100px;
}
#blackend{
	width: 375px;
	border: 1px solid #aaa;
	height: 35px;
	border-radius: 5px;
	margin-top: -10px;
	margin-left: 30px;	
	padding-left: 5px;
}
textarea {
	border-radius: 5px;
}
</style>

<script type="text/javascript">
var thclicked = "normal";
	$(function() {
		
		
		$("#checkall").click(function() {
			var check = $("#checkall").prop("checked");
			if (check) {
				$("input[name=userid]").prop("checked", true);
			} else {
				$("input[name=userid]").prop("checked", false);
			}
		});
		$("input[name=userid]").click(function() {
			$("#checkall").prop("checked", false);
		});

		$("#blackpop").click(function() {
			$("#popdiv").css("display", "block");
		});
		$("#blackclose").click(function() {
			$("#popdiv").css("display", "none");
		});
		$("#quitpop").click(function() {
			$("#quitdiv").css("display", "block");
		});
		$("#quitclose").click(function() {
			$("#quitdiv").css("display", "none");
		});

		

		
		$("#blackok").click(function() {
					if ($("input[name=userid]:checked").length > 0) {
						if($("input[name=blackreason]:checked").length > 0){
						var confirm_del = confirm("해당 사용자를 블랙리스트로 등록 하시겠습니까?");
						
						if (confirm_del) {
							var checkArr = [];
							$("input[name=userid]:checked").each(function() {
								checkArr.push($(this).val());
							});
							console.log(checkArr);
							console.log($("input[name=userid]:checked").val());
							var blackreason = $("input[name=blackreason]:checked").val();
							if(blackreason == 'etc'){
								blackreason = $("#etcreason").val();
							}
							console.log(blackreason);
							var data = { userid : checkArr, blackend : $("#blackend").val(), blackreason : blackreason};
							console.log(data);
							$.ajax({
								url : "insertblack.do",
								data : data,
								type : "post",
								success : function(result) {
									console.log(result);
									  location.href = "userm.do";
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
							alert("블랙리스트 등록 사유를 작성해주세요.");
						}
					}else {
						alert("사용자를 선택해주세요.");
					}
				});
		$("#quitok").click(function() { 
			if ($("input[name=userid]:checked").length > 0) { 
				if($("input[name=quitreason]:checked").length > 0){ 
				var confirm_del = confirm("해당 탈퇴시키겠습니까?");
		
				if (confirm_del) {
					var checkArr = [];
					$("input[name=userid]:checked").each(function() {
						checkArr.push($(this).val()); 
					});
					console.log(checkArr);
					console.log($("input[name=userid]:checked").val());
					var blackreason = $("input[name=quitreason]:checked").val();
					if(blackreason == 'etc'){
						blackreason = $("#quitetcreason").val();
					}
					console.log(blackreason);
					var data = { userid : checkArr, quitreason : blackreason};
					console.log(data);
					$.ajax({
						url : "adminquit.do",
						data : data, 
						type : "post",
						success : function(result) {
							console.log(result);
							  location.href = "userm.do";
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
					alert("강제탈퇴 사유를 작성해주세요.");
				}
			}else {
				alert("사용자를 선택해주세요.");
			}
		});
		var adminclick = 0, allclick = 0, userclick = 0, blackclick = 0, quitclick = 0;
		$("#adminbtn").click(function() {
			$("#userbtn, #quitbtn, #blackbtn, #allbtn").attr("class", "ui button");
				thorder("ADMIN", "ida");
				$(".sorted").attr("class", "");
			$("#adminbtn").attr("class", "ui active button");
				adminclick += 1;
				allclick = 0, userclick = 0, blackclick = 0, quitclick = 0;
				clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
		});
		$("#userbtn").click(function() {
			$("#adminbtn, #quitbtn, #blackbtn, #allbtn").attr("class", "ui button");
				thorder("USER", "ida");
				$(".sorted").attr("class", "");
			$("#userbtn").attr("class", "ui active button");
				userclick += 1;
				adminclick = 0, allclick = 0, blackclick = 0, quitclick = 0;
				clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
		});
		$("#quitbtn").click(function() {
			$("#userbtn, #adminbtn, #blackbtn, #allbtn").attr("class", "ui button");
				thorder("quityn", "ida");
				$(".sorted").attr("class", "");
			$("#quitbtn").attr("class", "ui active button");
				quitclick += 1;
				adminclick = 0, allclick = 0, userclick = 0, blackclick = 0;
				clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
		});
		$("#blackbtn").click(function() {
			$("#userbtn, #quitbtn, #adminbtn, #allbtn").attr("class", "ui button");
				thorder("blackyn", "ida");
				$(".sorted").attr("class", "");
			$("#blackbtn").attr("class", "ui active button");
				blackclick += 1;
				adminclick = 0, allclick = 0, userclick = 0, quitclick = 0;
				clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
		});
		$("#allbtn").click(function() {
			$("#userbtn, #quitbtn, #blackbtn, #adminbtn").attr("class", "ui button");
				thorder("all", "ida");
				$(".sorted").attr("class", "");
			$("#allbtn").attr("class", "ui active button");
				allclick += 1;
				adminclick = 0, userclick = 0, blackclick = 0, quitclick = 0;
				clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
		});
		var clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
	
			$("#userid").click(function() {
				if(adminclick > 0){
				if(clickid%2 == 0){
					$(".sorted").attr("class", "");
					$("#userid").attr("class", "sorted descending");
					thorder("ADMIN", "idd");
					clickid += 1;
					clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
				} else if(clickid%2 != 0){
					$(".sorted").attr("class", "");
					$("#userid").attr("class", "sorted ascending");
					thorder("ADMIN", "ida");
					clickid += 1;
					clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
				} 
				}else if (userclick > 0){
					if(clickid%2 == 0){
						$(".sorted").attr("class", "");
						$("#userid").attr("class", "sorted descending");
						thorder("USER", "idd");
						clickid += 1;
						clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} else if(clickid%2 != 0){
						$(".sorted").attr("class", "");
						$("#userid").attr("class", "sorted ascending");
						thorder("USER", "ida");
						clickid += 1;
						clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} 
				}else if (allclick > 0){
					if(clickid%2 == 0){
						$(".sorted").attr("class", "");
						$("#userid").attr("class", "sorted descending");
						thorder("all", "idd");
						clickid += 1;
						clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} else if(clickid%2 != 0){
						$(".sorted").attr("class", "");
						$("#userid").attr("class", "sorted ascending");
						thorder("all", "ida");
						clickid += 1;
						clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} 
				}else if(blackclick > 0){
					if(clickid%2 == 0){
						$(".sorted").attr("class", "");
						$("#userid").attr("class", "sorted descending");
						thorder("blackyn", "idd");
						clickid += 1;
						clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} else if(clickid%2 != 0){
						$(".sorted").attr("class", "");
						$("#userid").attr("class", "sorted ascending");
						thorder("blackyn", "ida");
						clickid += 1;
						clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} 
				}else if(quitclick > 0){
					if(clickid%2 == 0){
						$(".sorted").attr("class", "");
						$("#userid").attr("class", "sorted descending");
						thorder("quityn", "idd");
						clickid += 1;
						clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} else if(clickid%2 != 0){
						$(".sorted").attr("class", "");
						$("#userid").attr("class", "sorted ascending");
						thorder("quityn", "ida");
						clickid += 1;
						clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} 
				}else {
					if(clickid%2 == 0){
						$(".sorted").attr("class", "");
						$("#userid").attr("class", "sorted descending");
						thorder("USER", "idd");
						clickid += 1;
						clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} else if(clickid%2 != 0){
						$(".sorted").attr("class", "");
						$("#userid").attr("class", "sorted ascending");
						thorder("USER", "ida");
						clickid += 1;
						clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} 
				}
			});
			$("#nick").click(function() {
				if(adminclick > 0){
					if(clicknick%2 == 0){
						$(".sorted").attr("class", "");
						$("#nick").attr("class", "sorted descending");
						thorder("ADMIN", "idd");
						clicknick += 1;
						clickid = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} else if(clicknick%2 != 0){
						$(".sorted").attr("class", "");
						$("#nick").attr("class", "sorted ascending");
						thorder("ADMIN", "ida");
						clicknick += 1;
						clickid = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} 
					}else if (userclick > 0){
						if(clicknick%2 == 0){
							$(".sorted").attr("class", "");
							$("#nick").attr("class", "sorted descending");
							thorder("USER", "idd");
							clicknick += 1;
							clickid = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} else if(clicknick%2 != 0){
							$(".sorted").attr("class", "");
							$("#nick").attr("class", "sorted ascending");
							thorder("USER", "ida");
							clicknick += 1;
							clickid = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} 
					}else if (allclick > 0){
						if(clicknick%2 == 0){
							$(".sorted").attr("class", "");
							$("#nick").attr("class", "sorted descending");
							thorder("all", "idd");
							clicknick += 1;
							clickid = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} else if(clicknick%2 != 0){
							$(".sorted").attr("class", "");
							$("#nick").attr("class", "sorted ascending");
							thorder("all", "ida");
							clicknick += 1;
							clickid = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} 
					}else if(blackclick > 0){
						if(clicknick%2 == 0){
							$(".sorted").attr("class", "");
							$("#nick").attr("class", "sorted descending");
							thorder("blackyn", "idd");
							clicknick += 1;
							clickid = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} else if(clicknick%2 != 0){
							$(".sorted").attr("class", "");
							$("#nick").attr("class", "sorted ascending");
							thorder("blackyn", "ida");
							clicknick += 1;
							clickid = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} 
					}else if(quitclick > 0){
						if(clicknick%2 == 0){
							$(".sorted").attr("class", "");
							$("#nick").attr("class", "sorted descending");
							thorder("quityn", "idd");
							clicknick += 1;
							clickid = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} else if(clicknick%2 != 0){
							$(".sorted").attr("class", "");
							$("#nick").attr("class", "sorted ascending");
							thorder("quityn", "ida");
							clicknick += 1;
							clickid = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} 
					}else{
						if(clicknick%2 == 0){
							$(".sorted").attr("class", "");
							$("#nick").attr("class", "sorted descending");
							thorder("USER", "idd");
							clicknick += 1;
							clickid = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} else if(clicknick%2 != 0){
							$(".sorted").attr("class", "");
							$("#nick").attr("class", "sorted ascending");
							thorder("USER", "ida");
							clicknick += 1;
							clickid = 0, clickname = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} 
					}
			});
			$("#name").click(function() {
				if(adminclick > 0){
					if(clickname%2 == 0){
						$(".sorted").attr("class", "");
						$("#name").attr("class", "sorted descending");
						thorder("ADMIN", "idd");
						clickname += 1;
						clickid = 0, clicknick = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} else if(clickname%2 != 0){
						$(".sorted").attr("class", "");
						$("#name").attr("class", "sorted ascending");
						thorder("ADMIN", "ida");
						clickname += 1;
						clickid = 0, clicknick = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
					} 
					}else if (userclick > 0){
						if(clickname%2 == 0){
							$(".sorted").attr("class", "");
							$("#name").attr("class", "sorted descending");
							thorder("USER", "idd");
							clickname += 1;
							clickid = 0, clicknick = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} else if(clickname%2 != 0){
							$(".sorted").attr("class", "");
							$("#name").attr("class", "sorted ascending");
							thorder("USER", "ida");
							clickname += 1;
							clickid = 0, clicknick = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} 
					}else if (allclick > 0){
						if(clickname%2 == 0){
							$(".sorted").attr("class", "");
							$("#name").attr("class", "sorted descending");
							thorder("all", "idd");
							clickname += 1;
							clickid = 0, clicknick = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} else if(clickname%2 != 0){
							$(".sorted").attr("class", "");
							$("#name").attr("class", "sorted ascending");
							thorder("all", "ida");
							clickname += 1;
							clickid = 0, clicknick = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} 
					}else if(blackclick > 0){
						if(clickname%2 == 0){
							$(".sorted").attr("class", "");
							$("#name").attr("class", "sorted descending");
							thorder("blackyn", "idd");
							clickname += 1;
							clickid = 0, clicknick = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} else if(clickname%2 != 0){
							$(".sorted").attr("class", "");
							$("#name").attr("class", "sorted ascending");
							thorder("blackyn", "ida");
							clickname += 1;
							clickid = 0, clicknick = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} 
					}else if(quitclick > 0){
						if(clickname%2 == 0){
							$(".sorted").attr("class", "");
							$("#name").attr("class", "sorted descending");
							thorder("quityn", "idd");
							clickname += 1;
							clickid = 0, clicknick = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} else if(clickname%2 != 0){
							$(".sorted").attr("class", "");
							$("#name").attr("class", "sorted ascending");
							thorder("quityn", "ida");
							clickname += 1;
							clickid = 0, clicknick = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} 
					}else {
						if(clickname%2 == 0){
							$(".sorted").attr("class", "");
							$("#name").attr("class", "sorted descending");
							thorder("USER", "idd");
							clickname += 1;
							clickid = 0, clicknick = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} else if(clickname%2 != 0){
							$(".sorted").attr("class", "");
							$("#name").attr("class", "sorted ascending");
							thorder("USER", "ida");
							clickname += 1;
							clickid = 0, clicknick = 0, clickenroll = 0, clickrep = 0, clickquit = 0;
						} 
					}
			});
			$("#enroll").click(function() {
				if(adminclick > 0){
					if(clickenroll%2 == 0){
						$(".sorted").attr("class", "");
						$("#enroll").attr("class", "sorted descending");
						thorder("ADMIN", "idd");
						clickenroll += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickrep = 0, clickquit = 0;
					} else if(clickenroll%2 != 0){
						$(".sorted").attr("class", "");
						$("#enroll").attr("class", "sorted ascending");
						thorder("ADMIN", "ida");
						clickenroll += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickrep = 0, clickquit = 0;
					} 
					}else if (userclick > 0){
						if(clickenroll%2 == 0){
							$(".sorted").attr("class", "");
							$("#enroll").attr("class", "sorted descending");
							thorder("USER", "idd");
							clickenroll += 1;
							clickid = 0, clicknick = 0, clickname = 0, clickrep = 0, clickquit = 0;
						} else if(clickenroll%2 != 0){
							$(".sorted").attr("class", "");
							$("#enroll").attr("class", "sorted ascending");
							thorder("USER", "ida");
							clickenroll += 1;
							clickid = 0, clicknick = clickname = 0;
						} 
					}else if (allclick > 0){
						if(clickenroll%2 == 0){
							$(".sorted").attr("class", "");
							$("#enroll").attr("class", "sorted descending");
							thorder("all", "idd");
							clickenroll += 1;
							clickid = 0, clicknick = clickname = 0;
						} else if(clickenroll%2 != 0){
							$(".sorted").attr("class", "");
							$("#enroll").attr("class", "sorted ascending");
							thorder("all", "ida");
							clickenroll += 1;
							clickid = 0, clicknick = 0, clickname = 0, clickrep = 0, clickquit = 0;
						} 
					}else if(blackclick > 0){
						if(clickenroll%2 == 0){
							$(".sorted").attr("class", "");
							$("#enroll").attr("class", "sorted descending");
							thorder("blackyn", "idd");
							clickenroll += 1;
							clickid = 0, clicknick = 0, clickname = 0, clickrep = 0, clickquit = 0;
						} else if(clickenroll%2 != 0){
							$(".sorted").attr("class", "");
							$("#enroll").attr("class", "sorted ascending");
							thorder("blackyn", "ida");
							clickenroll += 1;
							clickid = 0, clicknick = 0, clickname = 0, clickrep = 0, clickquit = 0;
						} 
					}else if(quitclick > 0){
						if(clickenroll%2 == 0){
							$(".sorted").attr("class", "");
							$("#enroll").attr("class", "sorted descending");
							thorder("quityn", "idd");
							clickenroll += 1;
							clickid = 0, clicknick = 0, clickname = 0, clickrep = 0, clickquit = 0;
						} else if(clickenroll%2 != 0){
							$(".sorted").attr("class", "");
							$("#enroll").attr("class", "sorted ascending");
							thorder("quityn", "ida");
							clickenroll += 1;
							clickid = 0, clicknick = 0, clickname = 0, clickrep = 0, clickquit = 0;
						} 
					}else{
						if(clickenroll%2 == 0){
							$(".sorted").attr("class", "");
							$("#enroll").attr("class", "sorted descending");
							thorder("USER", "idd");
							clickenroll += 1;
							clickid = 0, clicknick = 0, clickname = 0, clickrep = 0, clickquit = 0;
						} else if(clickenroll%2 != 0){
							$(".sorted").attr("class", "");
							$("#enroll").attr("class", "sorted ascending");
							thorder("USER", "ida");
							clickenroll += 1;
							clickid = 0, clicknick = 0, clickname = 0, clickrep = 0, clickquit = 0;
						} 
					}
			});
			
			$("#report").click(function() {
				if(adminclick > 0){
				if(clickrep%2 == 0){
					$(".sorted").attr("class", "");
					$("#report").attr("class", "sorted descending");
					thorder("ADMIN", "reportd");
					clickrep += 1;
					clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickquit = 0;
				} else if(clickrep%2 != 0){
					$(".sorted").attr("class", "");
					$("#report").attr("class", "sorted ascending");
					thorder("ADMIN", "reporta");
					clickrep += 1;
					clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickquit = 0;
				} 
				}else if (userclick > 0){
					if(clickrep%2 == 0){
						$(".sorted").attr("class", "");
						$("#report").attr("class", "sorted descending");
						thorder("USER", "reportd");
						clickrep += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickquit = 0;
					} else if(clickrep%2 != 0){
						$(".sorted").attr("class", "");
						$("#report").attr("class", "sorted ascending");
						thorder("USER", "reporta");
						clickrep += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickquit = 0;
					} 
				}else if (allclick > 0){
					if(clickrep%2 == 0){
						$(".sorted").attr("class", "");
						$("#report").attr("class", "sorted descending");
						thorder("all", "reportd");
						clickrep += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickquit = 0;
					} else if(clickrep%2 != 0){
						$(".sorted").attr("class", "");
						$("#report").attr("class", "sorted ascending");
						thorder("all", "reporta");
						clickrep += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickquit = 0;
					} 
				}else if(blackclick > 0){
					if(clickrep%2 == 0){
						$(".sorted").attr("class", "");
						$("#report").attr("class", "sorted descending");
						thorder("blackyn", "reportd");
						clickrep += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickquit = 0;
					} else if(clickrep%2 != 0){
						$(".sorted").attr("class", "");
						$("#report").attr("class", "sorted ascending");
						thorder("blackyn", "reporta");
						clickrep += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickquit = 0;
					} 
				}else if(quitclick > 0){
					if(clickrep%2 == 0){
						$(".sorted").attr("class", "");
						$("#report").attr("class", "sorted descending");
						thorder("quityn", "reportd");
						clickrep += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickquit = 0;
					} else if(clickrep%2 != 0){
						$(".sorted").attr("class", "");
						$("#report").attr("class", "sorted ascending");
						thorder("quityn", "reporta");
						clickrep += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickquit = 0;
					} 
				}else {
					if(clickrep%2 == 0){
						$(".sorted").attr("class", "");
						$("#report").attr("class", "sorted descending");
						thorder("USER", "reportd");
						clickrep += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickquit = 0;
					} else if(clickrep%2 != 0){
						$(".sorted").attr("class", "");
						$("#report").attr("class", "sorted ascending");
						thorder("USER", "reporta");
						clickrep += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickquit = 0;
					} 
				}
			});
			$("#quit").click(function() {
				if(adminclick > 0){
				if(clickquit%2 == 0){
					$(".sorted").attr("class", "");
					$("#quit").attr("class", "sorted descending");
					thorder("ADMIN", "quitd");
					clickquit += 1;
					clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0;
				} else if(clickquit%2 != 0){
					$(".sorted").attr("class", "");
					$("#quit").attr("class", "sorted ascending");
					thorder("ADMIN", "quita");
					clickquit += 1;
					clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0;
				} 
				}else if (userclick > 0){
					if(clickquit%2 == 0){
						$(".sorted").attr("class", "");
						$("#quit").attr("class", "sorted descending");
						thorder("USER", "quitd");
						clickquit += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0;
					} else if(clickquit%2 != 0){
						$(".sorted").attr("class", "");
						$("#quit").attr("class", "sorted ascending");
						thorder("USER", "quita");
						clickquit += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0;
					} 
				}else if (allclick > 0){
					if(clickquit%2 == 0){
						$(".sorted").attr("class", "");
						$("#quit").attr("class", "sorted descending");
						thorder("all", "quitd");
						clickquit += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0;
					} else if(clickquit%2 != 0){
						$(".sorted").attr("class", "");
						$("#quit").attr("class", "sorted ascending");
						thorder("all", "quita");
						clickquit += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0;
					} 
				}else if(blackclick > 0){
					if(clickquit%2 == 0){
						$(".sorted").attr("class", "");
						$("#quit").attr("class", "sorted descending");
						thorder("blackyn", "quitd");
						clickquit += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0;
					} else if(clickquit%2 != 0){
						$(".sorted").attr("class", "");
						$("#quit").attr("class", "sorted ascending");
						thorder("blackyn", "quita");
						clickquit += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0;
					} 
				}else if(quitclick > 0){
					if(clickquit%2 == 0){
						$(".sorted").attr("class", "");
						$("#quit").attr("class", "sorted descending");
						thorder("quityn", "quitd");
						clickquit += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0;
					} else if(clickquit%2 != 0){
						$(".sorted").attr("class", "");
						$("#quit").attr("class", "sorted ascending");
						thorder("quityn", "quita");
						clickquit += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0;
					} 
				}else {
					if(clickquit%2 == 0){
						$(".sorted").attr("class", "");
						$("#quit").attr("class", "sorted descending");
						thorder("USER", "quitd");
						clickquit += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0;
					} else if(clickquit%2 != 0){
						$(".sorted").attr("class", "");
						$("#quit").attr("class", "sorted ascending");
						thorder("USER", "quita");
						clickquit += 1;
						clickid = 0, clicknick = 0, clickname = 0, clickenroll = 0, clickrep = 0;
					} 
				}
			});
		function thorder(usertype, order) {
			$.ajax({
						url : "userorder.do",
						data : {
							usertype : usertype,
							order : order
						},
						type : "post",
						dataType : "json",
						success : function(result) {
					var blackuser = '';
					var reporttd = '';
					var quittd = '';
							var objStr = JSON.stringify(result);
							var jsonObj = JSON.parse(objStr);
							//출력용 문자열 준비 
							var bk = '';
							//출력할 문자열 만들기
							for ( var i in jsonObj.list) {
								 if(jsonObj.list[i].reportc == 0){
									reporttd = '<td>'+jsonObj.list[i].reportc+'</td>';
								}else if(jsonObj.list[i].reportc != 0 && jsonObj.list[i].reportc < 3){
									reporttd = '<td class="warning">'+jsonObj.list[i].reportc+'</td>';
								}else {
									 reporttd = '<td class="negative">'+jsonObj.list[i].reportc+'</td>';
								} 
								
								if(jsonObj.list[i].quityn == 'Y'){
									quittd = '<td><i class="check icon"  style="margin-left: 20px;"></i></td>';
								}else {
									quittd = '<td></td>';
								}
								
								 if (jsonObj.list[i].blackyn == 'Y'){
										bkuser = '<i class="big red dont icon" style="margin-right: 0px;"></i> <i class="black user icon"></i></i>';
									}else {
										bkuser = '<i class="big circle outline icon" style="margin-right: 0px;"></i><i class="user icon"></i></i>';
									}
								bk += '<tr><td><div class="ui fitted checkbox"><input type="checkbox" name="userid" value="'+jsonObj.list[i].userid+'"> <label></label></div></td><td id="userid"><i class="small icons" style="bottom: 3px;">'
										+ bkuser
										+ "&nbsp; <a href='usermd.do?userid="+ jsonObj.list[i].userid +"'>"
										+ jsonObj.list[i].userid
										+ "</a></td><td id='nick'><a href='usermd.do?userid="+ jsonObj.list[i].userid +"'>"
										+ decodeURIComponent(jsonObj.list[i].nickname
												.replace(/\+/gi, " "))
										+ "</a></td><td id='name'><a href='usermd.do?userid="+ jsonObj.list[i].userid +"'>"
										+ decodeURIComponent(jsonObj.list[i].username.replace(/\+/gi, " "))
										+ "</a></td><td id='enroll'>"
										+ jsonObj.list[i].enrolldate + quittd + reporttd 
										+ "</td></tr>";
							}
							$("#usertable").html(bk);
						},
						error : function(request, status, errorData) {
							console.log("error code : " + request.status
									+ "\nMessage : " + request.responseText
									+ "\nError : " + errorData);
						}
					});
		}


	});
</script>
<c:import url="adminHeader.jsp"/>
</head>
<body>
	<div id="um">
	<div id="popdiv">
		<label id="bllabel">블랙리스트 기간 및 사유를 선택해 주세요.</label>
		<br><br><hr><br>
		<i class="ui icon grey calendar"></i>&nbsp;&nbsp;&nbsp;&nbsp;기간 
		<br><br>
		<select id="blackend" name="blackend">
		<option value="oneweek"> 1 주일</option>
		<option value="twoweek"> 2 주일</option>
		<option value="threeweek"> 3 주일</option>
		<option value="onemonth"> 1 개월</option>
		<option value="twomonth"> 2 개월</option>
		<option value="threemonth"> 3 개월</option>
		</select>
		<br><br> 
			<div class="ui form">
				<div class="grouped fields">
					사유
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="blackreason" value="욕설 및 비방"> <label>욕설 및 비방</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="blackreason" value="부적절한 컨텐츠"> <label>부적절한 컨텐츠</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="blackreason" value="광고 및 스팸"> <label>광고 및 스팸</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="blackreason" value="etc"> <label>기타</label>
						</div>
					</div>
				</div>
			</div>
			<textarea id="etcreason" rows="4" cols="53" placeholder="기타 사유를 작성해주세요." style="margin-top: 0px; margin-left: 30px; padding: 10px; margin-bottom: 13px; resize: none;"></textarea>
		<br>
		<div align="center">
		<button class="ui grey button" id="blackok">등록</button> &nbsp;&nbsp;&nbsp;
		<button class="ui button" id="blackclose">취소</button>
		</div>
	</div>
	<div id="quitdiv">
		<label id="qlabel">강제 탈퇴 사유를 선택해 주세요.</label>
		<br><br><hr><br>
		<input type="radio" value="욕설 및 비방" name="quitreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 욕설 및 비방<br><br>
		<input type="radio" value="부적절한 컨텐츠" name="quitreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 부적절한 컨텐츠<br><br>
		<input type="radio" value="광고 및 스팸" name="quitreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 광고 및 스팸<br><br>
		<input type="radio" value="etc" name="quitreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 기타<br>
		<textarea id="quitetcreason" rows="4" cols="53" placeholder="기타 사유를 작성해주세요." style="margin-top: 15px; margin-left: 30px; padding: 10px; margin-bottom: 13px; resize: none;"></textarea>
		<br>
		<div align="center">
		<button class="ui grey button" id="quitok">등록</button> &nbsp;&nbsp;&nbsp;
		<button class="ui button" id="quitclose">취소</button>
		</div>
		
	</div>
		<br>
		<div align="right">
		
			<div class="ui small icon input">
				<input type="search" placeholder="회원 검색"> <i
					class="search icon"></i>
			</div>
			<br>
			<div></div>
		</div>
		<br>
		<div>
			<div class="ui small basic buttons">
				<div class="ui button order" id="allbtn">전체회원</div>
				<div class="ui button order" id="adminbtn">관리자</div>
				<div class="ui button order" id="userbtn">일반회원</div>
				<div class="ui button order" id="blackbtn">블랙리스트</div>
				<div class="ui button order" id="quitbtn">탈퇴회원</div>
			</div>
		</div>
		<table class="ui sortable celled table selectable">
			<thead>
				<tr>
					<th width="10">
						<div class="ui fitted checkbox">
							<input type="checkbox" id="checkall"> <label></label>
						</div>
					</th>
					<th class="" id="userid" width="300">회원ID<input type="hidden"  value="0" name="userid"></th>
					<th class="" id="nick" width="300">닉네임</th>
					<th class="" id="name" width="300">이름</th>
					<th class="" id="enroll" width="150">가입일</th> 
					<th class="" width="100" id="quit">탈퇴여부</th>
					<th class="" id="report" width="100">
					신고횟수
					</th>
				</tr>
			</thead>
			<tbody id="usertable">
				<c:forEach items="${ ulist }" var="userm">
				<c:url var="usermd" value="usermd.do">
					<c:param name="userid" value="${ userm.userid }" />
				</c:url>
					<tr>
						<td>
							<div class="ui fitted checkbox">
								<input type="checkbox" name="userid" value="${ userm.userid }"> <label></label>
							</div>
						</td>
						<c:if test="${ userm.blackyn eq 'Y' }">
							<td><i class="small icons" style="bottom: 3px;"> <i
									class="big red dont icon" style="margin-right: 0px;"></i> <i
									class="black user icon"></i></i> &nbsp; <a href="${ usermd }">${ userm.userid }</a></td>
						</c:if>
						<c:if test="${ userm.blackyn eq 'N' }">
							<td><i class="small icons" style="bottom: 3px;"> <i
									class="big circle outline icon" style="margin-right: 0px;"></i>
									<i class="user icon"></i></i> &nbsp; <a href="${ usermd }">${ userm.userid }</a></td>
						</c:if>
						<td><a href="${ usermd }">${ userm.nickname }</a></td>
						<td><a href="${ usermd }">${ userm.username }</a></td>
						<td>${ userm.enrolldate }</td>
						<c:if test="${ userm.quityn eq 'N' }">
							<td></td>
						</c:if>
						<c:if test="${ userm.quityn eq 'Y' }">
							<td><i class="check icon"  style="margin-left: 20px;"></i></td>
						</c:if>
						<c:if test="${ userm.reportcount eq 0}">
							<td>${ userm.reportcount }</td>
						</c:if>
						<c:if test="${ userm.reportcount >= 3 }">
							<td class="negative">${ userm.reportcount }</td>
						</c:if>
						<c:if test="${ userm.reportcount < 3 and userm.reportcount ne 0 }">
							<td class="warning">${ userm.reportcount }</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="right">
			<button class="ui black button" id="blackpop">
				<i class="red dont icon"></i>블랙리스트 등록
			</button>
			<button class="ui grey button" id="quitpop">
				<i class="x icon"></i>강제탈퇴
			</button>
		</div><br>
		<div align="center">
		<div class="ui pagination menu">
		<c:if test="${ currentPage eq 1 }">
		<a href="/objet/userm.do?page=1" class="disabled item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne 1 }">
		<a href="/objet/userm.do?page=1" class="item"><i class="angle double left icon"></i></a>
		</c:if>
		<c:if test="${ beginPage - 10 < 1 }">
		<c:if test="${ currentPage eq 1 }"><a href="/objet/userm.do?page=1" class="disabled item"><i class="angle left icon"></i></a></c:if>
		<c:if test="${ currentPage ne 1 }"><a href="/objet/userm.do?page=1" class="item"><i class="angle left icon"></i></a></c:if>
		</c:if>
		<c:if test="${ beginPage - 10 >= 1 }">
		<a href="/objet/userm.do?page=${ currentPage }" class="item"><i class="angle left icon"></i></a>
		</c:if>
		<c:forEach begin="${ beginPage }" end="${ endPage }" var="p">
		<c:if test="${ p eq currentPage }">
		<a href="/objet/userm.do?page=${ p }" class="active item">${ p }</a>
		</c:if>
		<c:if test="${ p ne currentPage }">
		<a href="/objet/userm.do?page=${ p }" class="item">${ p }</a>
		</c:if>
		</c:forEach>
		<c:if test="${  endPage + 10 > maxPage }">
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/userm.do?page=${ maxPage }" class="disabled item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/userm.do?page=${ maxPage }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		</c:if>
		<c:if test="${ endPage + 10 <= maxPage }">
		<a href="/objet/userm.do?page=${ endPage + 10 }" class="item"><i class="angle right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage eq endPage }">
		<a href="/objet/userm.do?page=${ endPage }" class="disabled item"><i class="angle double right icon"></i></a>
		</c:if>
		<c:if test="${ currentPage ne endPage }">
		<a href="/objet/userm.do?page=${ endPage }" class="item"><i class="angle double right icon"></i></a>
		</c:if>
	</div>
	</div></div>
	
	
</body>

</html>