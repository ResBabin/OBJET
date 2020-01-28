<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main.css">
<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<style type="text/css">
.page {
  padding: 15px 0 0;
}

.bmd-modalButton {
  display: block;
  margin: 15px auto;
  padding: 5px 15px;
}

.close-button {
  overflow: hidden;
}

.bmd-modalContent {
  box-shadow: none;
  background-color: transparent;
  border: 0;
}
  
.bmd-modalContent .close {
  font-size: 30px;
  line-height: 30px;
  padding: 7px 4px 7px 13px;
  text-shadow: none;
  opacity: .7;
  color:#fff;
}

.bmd-modalContent .close span {
  display: block;
}

.bmd-modalContent .close:hover,
.bmd-modalContent .close:focus {
  opacity: 1;
  outline: none;
}

.bmd-modalContent iframe {
  display: block;
  margin: 0 auto;
}
</style>
<script type="text/javascript">
(function($) {
    
    $.fn.bmdIframe = function( options ) {
        var self = this;
        var settings = $.extend({
            classBtn: '.bmd-modalButton',
            defaultW: 640,
            defaultH: 360
        }, options );
      
        $(settings.classBtn).on('click', function(e) {
          var allowFullscreen = $(this).attr('data-bmdVideoFullscreen') || false;
          
          var dataVideo = {
            'src': $(this).attr('data-bmdSrc'),
            'height': $(this).attr('data-bmdHeight') || settings.defaultH,
            'width': $(this).attr('data-bmdWidth') || settings.defaultW
          };
          
          if ( allowFullscreen ) dataVideo.allowfullscreen = "";
          
          // stampiamo i nostri dati nell'iframe
          $(self).find("iframe").attr(dataVideo);
        });
      
        // se si chiude la modale resettiamo i dati dell'iframe per impedire ad un video di continuare a riprodursi anche quando la modale è chiusa
        this.on('hidden.bs.modal', function(){
          $(this).find('iframe').html("").attr("src", "");
        });
      
        return this;
    };
  
})($);

$(function(){
  $("#myModal").bmdIframe();
});
</script>
</head>
<body>
      <div class="container">
        <div class="row">
        <div class="col-xs-12">
          <div class="page">
	<button type="button" class="bmd-modalButton" data-toggle="modal" data-bmdSrc="coltest.do?objetno=1" data-bmdWidth="100%" data-bmdHeight="700" data-target="#myModal">VR</button>
      </div>
        </div>
      </div>
      </div>
<footer>
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content bmd-modalContent">

				<div class="modal-body">
          
          <div class="close-button">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          </div>
          <div class="embed-responsive embed-responsive-16by9">
					            <iframe class="embed-responsive-item" frameborder="0"></iframe>
          </div>
				</div>

			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
  
      </footer>

</body>
</html>
