<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<c:import url="../header.jsp" />
</head>
<style>



/* �������� */

/* �������� Ÿ��Ʋ */
.noticestart{
margin-top:5px;
margin-left: 25px;
}
.noticehead{
font-size: 40px;
}
/* Notice list */
.noticelist{
margin-top: 70px;
margin-left: 90px;
}
.notice-list:hover{
background-color:;
}
.notice-list {width: 1000px; margin:10px 0;  padding:24px 20px 26px; background:rgba(0, 0, 0, 0.04); /* border:1.5px solid black */ }
.notice-list:after { content:''; clear:both; display:block }
.notice-list .notice-item {text-decoration:none}
.notice-list:hover{ background:rgba(0, 0, 0, 0.1);}
/* .notice-list .notice-item:hover .title {color:black} */
.notice-list .notice-item .thumb {float:left; width:150px; height:150px; margin:6px 30px 5px 0}
.notice-list .notice-item .title {font-weight:bold;font-size:1.375em}
.notice-list .notice-item .writer {margin-top:4px; color:black; vertical-align:top; font:normal 0.875em 'NanumBarunGothic','Noto Sans', sans-serif; line-height:1.5em;}
.notice-list .info {margin-top:6px; font-size:0.875em; color:black;}

.notice-list .info .pipe {display:inline-block; margin:0 10px; color:black}
.notice-list .info .date {color:black}

/* ���� �̹��� */


* {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

       
        .gallery_content:hover .overlay.right {
            top: 0;
        }

        #gallery_layout {
        margin-left: 540px;
        margin-top: 235px;
       /* border: 2px solid yellow; */
            width: 300px;
            
        }

        #gallery_layout:after {
            content: "";
            display: block;
            clear: both;
        }

        .gallery_content {
        
          margin-bottom: 10px;
          /* border: 2px solid red; */
            position: relative;
            float: left;
            width: 300px;
            height: 140px;
            overflow: hidden;
        }

        .gallery_content img {
            width: 100%;
            height: 100%;
            display: block;
            margin: 0 auto;
            transition: all 1s ease-in-out;
        }

        .content {
            z-index: 1;
            display: none;
            color: #fff;
            
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        
        .content h1 {
        color: white;
            font-size: 1.2em;
            text-transform: uppercase;
            text-align: center;
        }
        .content p {
           color: white;
            padding: 2px 0;
            font-size: 0.8em;
            text-align: center;
        }        
        .gallery_content:hover .content {
            display: block;
            transition: all 1s ease-in-out;
        }

        .gallery_content:hover img {
            transform: scale(1.2);
            transition: all 1s ease-in-out;
        }

        .overlay {
            display: none;
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            transition: top 0.3s, right 0.3s, bottom 0.3s, left 0.3s;
        }

        /* overlay color */
        .overlay {
            background-color:rgba(0, 0, 0, 0.5);
        }
          .gallery_content:hover .overlay {
            display: block;
            transition: all 0.5s ease-in-out;
        }
        
        @media all and (min-width: 960px) {
            #gallery_layout {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }  
        }

        @media all and (max-width: 959px) {
        #gallery_layout {
            width: 100%;
        }
        .gallery_content {
            width: 50%;
        }

        }
        @media all and (max-width: 499px) {
        #gallery_layout {
            width: 100%;
        }
        .gallery_content {
            width: 100%;
        }

        }
</style>
<body>
<c:import url="../search.jsp" />

     <div class="noticelist">
     
        <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">�������� ����</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> �з�[�Ϲ�]
                <span class="pipe">|</span>
                <span class="date">12��14��</span>
            </p>
        </div>
        <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">�������� ����</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> �з�[�Ϲ�]
                <span class="pipe">|</span>
                <span class="date">12��14��</span>
            </p>
        </div>
        <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">�������� ����</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> �з�[�Ϲ�]
                <span class="pipe">|</span>
                <span class="date">12��14��</span>
            </p>
        </div>
        <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">�������� ����</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> �з�[�Ϲ�]
                <span class="pipe">|</span>
                <span class="date">12��14��</span>
            </p>
        </div>
        <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">�������� ����</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> �з�[�Ϲ�]
                <span class="pipe">|</span>
                <span class="date">12��14��</span>
            </p>
        </div>
        <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">�������� ����</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> �з�[�Ϲ�]
                <span class="pipe">|</span>
                <span class="date">12��14��</span>
            </p>
        </div>
        <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">�������� ����</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> �з�[�Ϲ�]
                <span class="pipe">|</span>
                <span class="date">12��14��</span>
            </p>
        </div>
        <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">�������� ����</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> �з�[�Ϲ�]
                <span class="pipe">|</span>
                <span class="date">12��14��</span>
            </p>
        </div>
        <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">�������� ����</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> �з�[�Ϲ�]
                <span class="pipe">|</span>
                <span class="date">12��14��</span>
            </p>
        </div>
        </div>
<!-- ���� �̹��� -->

<div id="gallery_layout">
        <div class="gallery_content">
            <img src="resources/images/main/sample6.jpg" alt="travel_img">
            <div class="content">
                <h1>travel</h1>
                <p>�������� ������, �ƹ��͵� ���� �� ����.</p>
            </div>
            <div class="overlay darkBlue"></div>
        </div>
        <div class="gallery_content top">
            <img src="resources/images/main/main1.jpg"> 
             
            <div class="content">
                <h1>travel</h1>
                <p>������ ������ ���� ������ �ƴϰ� ����� ������.</p>
            </div>
            <div class="overlay"></div>
        </div>
        <div class="gallery_content">
            <img src="resources/images/main/sample1.jpg" alt="�����̹���3">
            <div class="content">
                <h1>travel</h1>
                <p>������ ������ �ٽ� �������� �ϴ� ���̴�.</p>
            </div>
            <div class="overlay"></div>
        </div>
        <div class="gallery_content">
            <img src="resources/images/main/sample5.jpg"  alt="�����̹���4">
            <div class="content">
                <h1>travel</h1>
                <p>����� ��ȭ�� ����ϴ� ����� ������ ���� ����̴�.</p>
            </div>
            <div class="overlay"></div>
        </div>
        <div class="gallery_content">
            <img src="resources/images/main/sample2.jpg" alt="�����̹���5">
            <div class="content">
                <h1>travel</h1>
                <p>�ٺ��� ��Ȳ�� �ϰ� ������ ����� ������ �Ѵ�.</p>
            </div>
            <div class="overlay"></div>
        </div>
        <div class="gallery_content">
            <img src="resources/images/main/sample4.jpg" alt="�����̹���6">
            <div class="content">
                <h1>travel</h1>
                <p>���� ���̶� ����.</p>
                <p>���� �����ڰ� ���� ���̴�.</p>
            </div>
            <div class="overlay gold"></div>
        </div>
    </div>

       

<c:import url="../footer.jsp" />
</body>
</html>