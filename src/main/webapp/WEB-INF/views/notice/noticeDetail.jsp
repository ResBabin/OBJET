<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������� �ڼ��� ����</title>
<c:import url="../header.jsp" />
</head>
<style>
/* Notice View */
.noitcedetail{
 
}
.article_bottom{
background:#ff8149;
height:40px;
}
.notice-header {margin-bottom:10px; background:#fff5f0; border:1px solid #ddd ;width:100%;}
.notice-header:after {display:block; clear:both; content:''}
.notice-header .title-wrap {padding:20px 20px 10px 20px}
.notice-header .title-wrap .category-info a {color:#ff8149}
.notice-header .title-wrap .notice-title {margin-top:5px; font-size:2em; color:#111; line-height:1em}
.notice-header .info-wrap {margin-top:10px; padding:10px 20px; background:#ff8149}
.notice-header .info-wrap:after {display:block; clear:both; content:''}
.notice-header .info-wrap .notice-info {float:left; list-style:none}
.notice-header .info-wrap .notice-info:after {display:block; clear:both; content:''}
.notice-header .info-wrap .notice-info li {margin-right:15px; float:left; font-size:0.875em; color:#fff5f0}
.notice-header .info-wrap .notice-info li i {margin-right:4px; color:#fff}

</style>
<body>

        <!-- notice header -->
        <div class="noitcedetail">
        <div class="notice-header">
            <div class="title-wrap">
                <p class="category-info"><a href="/notice">�з�[�Ϲ�]</a></p>
                <h2 class="notice-title">��Ÿ��� ����ȸ�� �������</h2>
            </div>
            <div class="info-wrap">
                <ul class="notice-info">
                
                    <li class="author"><i class="fa fa-user-circle"></i> admin01</li>
                    <li class="date"><i class="fa fa-clock-o"></i>2019-09-12</li>
                     
                </ul>
            </div>
        </div>
 
        <div class="article">
          <p>���� ������ �� �ְ� ��ο��� ������ �� �ִ�<br>

�� �ϳ��� ����ȸ�� ���� �ٸ� � ���ø� �ϰ� �������?<br>

��� �����ϰ��� �߾��� ��, ������ ���� ����� ��, <br>

ù ��ǰ�� ������ ������ �������� ���������� <br>

�׷��� ������ �� ��ǰ. <br>

�׷� ��ǰ���� ���� ������ �ǳװ� �;� ���ϴ�. <br>

���� ������ ���� ����ȸ�� �״ϱ��</p>
<div class="article_bottom"></div>
        </div>
        </div>
        <!-- //notice view -->


<c:import url="../footer.jsp" />
</body>
</html>