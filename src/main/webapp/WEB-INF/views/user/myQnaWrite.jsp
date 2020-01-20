<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의하기</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<!-- 문의수정 페이지 시작 -->
	
	
	
	
	<div class="wrapMyObjetList">
	
		<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">1:1 문의하기</p>
		
		<!-- 문의내역 테이블 -->
		  <form action="insertQna.do" method="post" enctype="multipart/form-data">

			<table class = "form">
			
				<tr>
					<th>작성자</th>
					<td><input type="text" size="30" name="userid" required="required" value="${sessionScope.loginUser.userid}"></td>


				</tr>
		
				
				<tr>
					<th>제목</th>
					<td><input type="text" size="30" name="qnatitle" required="required"></td>


				</tr>

				<tr>
					<th>종류</th>
					<td><select name="qnatype" required="required">
							<option value="일반">일반</option>
							<option value="전시">전시</option>
							<option value="회원">회원</option>
						</select></td>
				</tr>

	<!-- 	<tr>
					<th>첨부파일</th>
					<td colspan="3"><input multiple="multiple" type="file" name="upfile">
				</tr> -->

				<tr>
					<td colspan="4">
							<textarea id="editor2" name="qnacontent" required></textarea>
							</td>
				</tr>
			</table>
	
			<script type="text/javascript" src="${pageContext.request.contextPath }/resources/editor/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
 CKEDITOR.replace('editor2',{height: 500,
                	 filebrowserImageUploadUrl :'${pageContext.request.contextPath }/noticeFile.do'
                		
                	
 });


</script> 
             
			 	<div align="center">
				<input type="submit" class="ui green button" value="문의하기" > &nbsp;
				<input type="button" class="ui button" value="문의취소" onclick="location.href='javascript:history.go(-1)'"> &nbsp;
			</div>
             </form>    
              
		<br><br>
		<!-- 수정삭제버튼 -->
		
		
		<br><br>

		
		
		<br>
		
		
		
		
		
		
		
		

		
	</div>
	<!-- 문의수정 페이지 끝 -->
	


</body>
<c:import url="../footer.jsp" />
</html>