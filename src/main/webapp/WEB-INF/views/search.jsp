<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- favicon 위치 -->
<link rel="shortcut icon" href="resources/images/favicon-32x32.png">
<link rel="icon" href="resources/images/favicon-32x32.png">
<meta charset="UTF-8">
<title>Objet</title>
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<link rel = "stylesheet" type="text/css" href="resources/css/main.css">
<link rel = "stylesheet" type="text/css" href="/objet/resources/css/search.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script type="text/javascript">
   /* 검색 아이콘  */
   $(function() {
       var placeholder = $("#search-text");
       
       $('#close-btn').click(function() {
         $('#search-overlay').fadeOut();
         $('#search-btn').show();
         $("#search-btn2").css("color", "#d6d6d6");
         $(".main").css("display", "table");
         $(".objet_main").css("display", "block");
         if(placeholder.val() != ""){
           placeholder.val("");
           $("#search-btn2").css("color", "#d6d6d6");
        }
       });
       $('#search-btn').click(function() {
         $(this).hide();
         $('#search-overlay').fadeIn();
         $("#search-text").focus();
         $(".search_suggest").show();
         $(".main").css("display", "none");
         $(".objet_main").css("display", "none");
       });
       
       $("#search-text").on("keyup", function(){
          if(placeholder.val() != "" || placeholder.val() != null){  //not null
           $(".search_suggest").hide();
           $(".search_keyword").fadeIn();
           $(".search_keyword").css("display", "flex");
          }if(placeholder.val() == "" || placeholder.val() == null){ //null
           $("#search-btn2").show();
           $(".search_suggest").fadeIn();
           $(".search_keyword").css("display", "none");
           $(".search_keyword").hide();
          }
       });
       
       $("#search-text").focus(function(){
          $("#search-btn2").css("color", "black");
       });
       $("#search-text").focusout(function(){
          if(placeholder.val() == ""){
             $("#search-btn2").css("color", "#d6d6d6");
          }
       });
       
     });

      function submit() {
       document.getElementById("search-btn2").onclick = function() {
           document.getElementById('search-form').submit();
           return false;
        };
     };
   </script>
</head>
<body>
<section class="search">
 <!-- 검색 아이콘  -->
<i id="search-btn" class="material-icons">&#xe8b6;</i>
<!-- 검색창 시작 -->
<div id="search-overlay" class="block">
  <div class="centered">
    <div id='search-box'>
      <i id="close-btn" class="material-icons">&#xe5cd;</i>
      <form action='searchResult.do' id='search-form' method='get' target='_top' 
      class="ui wide fluid transparent icon input">
        <input id='search-text' name="q" type="text" placeholder="검색어를 입력해주세요." />
        <i class="material-icons" id="search-btn2" onClick="submit();">&#xe8b6;</i>
      </form>
      <!-- 오브제 추천 태그 -->
      <div class="search_suggest" align="center">
         <p><span>오브제</span> 추천 태그</p>
         <div class="search_tag">
         <div class="ui circular basic blue button">사진</div> &nbsp;
         <div class="ui circular basic blue button">디자인</div> &nbsp;
         <div class="ui circular basic blue button">기타</div> <br>
         </div>
         <ul class="search_art_list">
            <li class="search_art_list_1">
            <a href="">
            <img id="search_art_list_img" class="ui small circular image" src="resources/images/objet/나의 오랜 연인에게1.jpg"><br>
            <strong>최강예은</strong>
            <span>예술가입니다.</span>
            </a>
            </li>
            <li class="search_art_list_1">
            <a href="">
            <img id="search_art_list_img" class="ui small circular image" src="resources/images/objet/나의 오랜 연인에게2.jpg"><br>
            <strong>안경민경</strong>
            <span>예술가입니다.</span>
            </a>
            </li>
            <li class="search_art_list_1">
            <a href="">
            <img id="search_art_list_img" class="ui small circular image" src="resources/images/objet/나의 오랜 연인에게5.jpg"><br>
            <strong>유노유진</strong>
            <span>예술가입니다.</span>
            </a>
            </li>
            <li class="search_art_list_1">
            <a href="">
            <img id="search_art_list_img" class="ui small circular image" src="resources/images/objet/나의 오랜 연인에게4.jpeg"><br>
            <strong>시아은솔</strong>
            <span>예술가입니다.</span>
            </a>
            </li>
            <li class="search_art_list_1">
            <a href="">
            <img id="search_art_list_img" class="ui small circular image" src="resources/images/objet/나의오랜연인에게커버.jpg"><br>
            <strong>믹키근수</strong>
            <span>예술가입니다.</span>
            </a>
            </li>
         </ul>
     </div>
     <!-- 오브제 검색 키워드 -->
     <div class="search_keyword">
        <div class="objet_keyword"><!-- 오브제 전시 키워드 -->
           <h3 class="keyword_title"><a>전시 검색
           <i id="arrow" class="material-icons">&#xe5cc;</i></a></h3>
           <div class="wrap_objet_list">
              <ul class="objet_list">
                 <li class="objet_list_item"><span>오브제</span>를 말하다.</li>
                 <li class="objet_list_item"><span>오브제</span>를 말하다.</li>
                 <li class="objet_list_item"><span>오브제</span>를 말하다.</li>
                 <li class="objet_list_item"><span>오브제</span>를 말하다.</li>
                 <li class="objet_list_item"><span>오브제</span>를 말하다.</li>
              </ul>
              
           </div>
        </div>
        <div class="artist_keyword"><!-- 오브제 작가 키워드 -->
           <h3 class="keyword_title"><a>작가 검색
           <i id="arrow" class="material-icons">&#xe5cc;</i></a></h3>
           <div class="wrap_artist_list">
              <div class="artist_list">
                 <div class="artist_list_item"><a href="">
                 <img id="artist_list_img" class="ui mini circular image" src="resources/images/objet/나의 오랜 연인에게1.jpg">
                 <span>오브제</span></a></div>
                 <div class="artist_list_item"><a href="">
                 <img id="artist_list_img" class="ui mini circular image" src="resources/images/objet/나의 오랜 연인에게2.jpg">
                 <span>오브제</span></a></div>
                 <div class="artist_list_item"><a href="">
                 <img id="artist_list_img" class="ui mini circular image" src="resources/images/objet/나의오랜연인에게커버.jpg">
                 <span>오브제</span></a></div>
              </div>
           </div>
        </div>
     </div>
    </div>
  </div>
</div>
</section>
<!-- 검색창 끝 -->
</body>
</html>