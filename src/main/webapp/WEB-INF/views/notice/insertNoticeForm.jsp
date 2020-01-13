<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>공지사항 작성</title>
<c:import url="../header.jsp" />
</head>
<style>
.noticeform{
margin-left: 500px;
}

</style>
<body>
           <form action="insertNotice.do" method="post" enctype="multipart/form-data">
  
			<table class = "noticeform">
				<tr>
					<th>작성자</th>
					<td><input type="text" size="30" name="adminid" required="required"></td>


				</tr>
		
				
				<tr>
					<th>제목</th>
					<td><input type="text" size="30" name="noticetitle" required="required"></td>


				</tr>

				<tr>
					<th>종류</th>
					<td><select name="noticetype" required="required">
							<option value="일반">일반</option>
							<option value="전시">전시</option>
							<option value="회원">회원</option>
						</select></td>
				</tr>

				<tr>
					<th>첨부파일</th>
					<td colspan="3"><input multiple="multiple" type="file" name="upfile">
                  <!-- 파일업로드 -->
				</tr>

				<tr>
					<td colspan="4">
							<textarea id="editor2" name="noticecontent" required></textarea>
							</td>
				</tr>
			</table>
	
			<script type="text/javascript" src="${pageContext.request.contextPath }/resources/editor/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
 CKEDITOR.replace('editor2',{height: 500,
                	 filebrowserImageUploadUrl :'${pageContext.request.contextPath }/noticeFile.do'
                		
                	
 });


</script> 
             
			<button type="submit" class="insert">완료</button>
             </form>    
             
   
             
             
           
             
             

<c:import url="../footer.jsp" />
</body>
</html>