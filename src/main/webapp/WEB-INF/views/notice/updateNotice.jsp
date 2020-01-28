<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>공지사항 작성</title>


<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

function deleteFile(rfilename, noticeno){
	
	console.log(rfilename);
	
	$.ajax({
		url: "deleteNoticeFile.do",
        data:{
           
            rfilename: rfilename+",",
            noticeno : noticeno
        },success: function(){
            console.log("파일삭제 성공");
        },error: function(request, status, errorData){
				console.log("error code : " + request.status + 
							"\nMesaage : " + request.responseText + 
                                "\nError : " + errorData);
                }
		
	});
	
}


</script>


<c:import url="../header.jsp" />
</head>
<style>
.noticeform{
margin-left: 500px;
}

</style>
<body>

  <form action="updateNotice.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="noticeno" value="${requestScope.notice.noticeno}">
<input type="hidden" name="noticerfile" value="${requestScope.notice.noticerfile}">  
<input name="origin" value="${ notice.noticeofile }" type="hidden">
<input name="rename" value="${ notice.noticerfile }" type="hidden">    
       <table class = "noticeform">
       
				<tr>
					<th>작성자</th>
					<td><input type="text" size="30" name="adminid" value="${loginUser.userid}" required="required"></td>

				</tr>
		
				
				<tr>
					<th>제목</th>
					<td><input type="text" size="30" name="noticetitle" value="${notice.noticetitle}" required="required"></td>


				</tr>

				<tr>
					<th>종류</th>
					<td><select name="noticetype"  value="${notice.noticetype}" required="required">
							<option value="일반">일반</option>
							<option value="전시">전시</option>
							<option value="회원">회원</option>
						</select></td>
				</tr>

				<tr>
				
				  
				  <th>첨부파일</th>
					<td colspan="3">
				
                   <c:if test="${ empty notice.noticeofile }">첨부파일 없음</c:if>
                   <c:if test="${ !empty notice.noticeofile }">${ notice.noticeofile }</c:if>&nbsp;&nbsp;&nbsp;
                   <input type="file" name="upfile"> 
					<br>

<!-- 파일업로드 -->
				  
				<tr>
					<td colspan="4">
							<textarea id="editor2"  name="noticecontent" required>${notice.noticecontent}</textarea>
							</td>
							
				</tr>
			</table>
	
			<script type="text/javascript" src="${pageContext.request.contextPath }/resources/editor/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
 CKEDITOR.replace('editor2',{height: 500,
                	 filebrowserImageUploadUrl :'${pageContext.request.contextPath }/updateNoticeFile.do'
                		
                	
 });


</script> 

			<button type="submit" class="insert">완료</button>
             </form>    


<c:import url="../footer.jsp" />
</body>
</html>