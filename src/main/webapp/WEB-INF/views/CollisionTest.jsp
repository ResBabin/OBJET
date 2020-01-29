<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="resources/images/favicon-32x32.png">
<link rel="icon" href="resources/images/favicon-32x32.png">
<title>ObjetVR</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main.css">
<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<style type="text/css">
body {
	background: white;
	overflow: hidden;
}

#info {
	position: absolute;
	background: #fffffff5;
	width: 400px;
	height: 500px;
	color: black;
	 top: 15%; 
	 transform: translateY(-15%);
	 left: 50%; 
	 transform: translateX(-50%);
	//border: 1.5px solid #ccc;
	border-radius: 5px; 
	display : none;
	padding: 20px;
	padding-top: 30px;
	box-shadow: 0em 0.35em .75em rgba(100, 100, 100, 0.7);
	font-family: 'Nanum Gothic';
} 
#objetinfo {
	position: absolute;
	background: #ffffffee;
	width: 300px;
	height: 300px;
	color: black;
	 top: 30%; 
	 transform: translateY(-30%);
	 left: 50%; 
	 transform: translateX(-50%);
	//border: 1.5px solid #ccc;
	border-radius: 5px; 
	padding: 25px;
	padding-top: 30px;
//	box-shadow: 0px 1px 3px #777;
	box-shadow: 0em 0.35em .75em rgba(100, 100, 100, 0.7);
	display: none;
	font-family: 'Nanum Gothic';
} 
#qdiv {
	position: absolute;
	background: #ffffffee;
	width: 300px;
	height: 235px;
	color: black;
	 top: 35%; 
	 transform: translateY(-35%);
	 left: 50%; 
	 transform: translateX(-50%);
	//border: 1.5px solid #ccc;
	border-radius: 5px; 
	padding: 30px;
//	box-shadow: 0px 1px 3px #777;
	box-shadow: 0em 0.35em .75em rgba(100, 100, 100, 0.7);
	display: none;
	font-family: 'Nanum Gothic';
	font-weight: bold;
	line-height: 25pt;
} 
#infobtn{
position: absolute;
top: 15px;
left: 60px;
border: 1.5px solid #eee;
background: white;
padding: 5px;
padding-top: 10px;
border-radius: 20px;
width: 40px;
height: 40px;
font-size: 15pt;
font-weight: bolder;
opacity: 0.9;
	box-shadow: 0em 0.25em .75em rgba(124,124,124, 0.7);
}
#qbtn{
position: absolute;
top: 15px;
left: 10px;
border: 1.5px solid #eee;
background: white;
padding: 5px;
padding-top: 10px;
border-radius: 20px;
width: 40px;
height: 40px;
font-size: 15pt;
font-weight: bolder;
opacity: 0.9;
	box-shadow: 0em 0.25em .75em rgba(124,124,124, 0.7);
}
#closebtn, #closebtn1, #closebtn2{
position: absolute;
bottom: 5%;
transform: translateY(5%);
left: 50%;
transform: translateX(-50%);
//border: 1.5px solid #eee;
background: #ddd;
padding: 10px;
border: none;
border-radius: 5px;
cursor: pointer;
}
#closebtn2{
position: absolute;
bottom: 10%;
transform: translateY(10%);
left: 50%;
transform: translateX(-50%);
//border: 1.5px solid #eee;
background: #ddd;
padding: 10px;
border: none;
border-radius: 5px;
cursor: pointer;
}
 #objetlogo{
width: 100px;

} 
#title{
font-weight: bolder;
font-size: 13pt;
}
#title1{
font-weight: bolder;
font-size: 13pt;
}
#intro{
letter-spacing: 1px;
height: 315px;
line-height: 20pt;
overflow: auto;
padding-left : 10px;
padding-right: 10px;
}
#intro1{
letter-spacing: 1px;
line-height: 20pt;
height: 200px;
padding-top: 10px;
overflow: auto;
}
#loading{
position: absolute;
	background: #000000ee;
	width: 400px;
	height: 200px;
	color: white;
	 top: 30%; 
	 transform: translateY(-30%);
	 left: 50%; 
	 transform: translateX(-50%);
	border-radius: 5px; 
	padding: 20px;
	padding-top: 30px;
	box-shadow: 0em 0.25em .75em rgba(124,124,124, 0.7);
	font-family: 'Nanum Gothic';
	text-align: center;
	font-size: 20pt;
	font-weight: bolder;
}
#loadback{
	width: 100%;
	height: 100%;
	position: absolute;
	background: #ffffffee;
	}
</style>
	</head>
	<body>
		<button class="ui button icon" id="infobtn" align="center"><i class="icon small info"></i></button>
		<button class="ui button icon" id="qbtn" align="center"><i class="icon small question"></i></button>
		<div id="info" align="center">
		<font id="title">${ objet.objettitle }</font><br><hr style="margin-top: 20px;"><br>
		<div id="intro">${ objet.objetintro }</div>
		<button id="closebtn">Close</button>
		</div>
		<div id="qdiv" align="left">
		이동 : 방향키 ←↑↓→<br>
		확대 : 마우스 휠<br>
		회전 : 마우스 왼쪽 클릭<br>
		정보 : 전시작 클릭
		<button id="closebtn2">Close</button>
		</div>
		<div id="objetinfo" align="center">
		<font id="title1"></font><br><hr style="margin-top: 20px;">
		<div id="intro1"></div>
		<button id="closebtn1" style="bottom: 10%">Close</button>
		</div>
		<div id="loadback"><div id="loading"><br><i class="big sync loading icon"></i><br><br>L O A D I N G<br></div></div>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$("#infobtn").click(function() {
			$("#qdiv").hide();
			$("#objetinfo").hide();
			$("#info").fadeIn();
		});
		$("#qbtn").click(function() {
			$("#objetinfo").hide();
			$("#info").hide();
			$("#qdiv").fadeIn();
		});
		$("#closebtn").click(function() {
			$("#info").hide();
		});
		$("#closebtn1").click(function() {
			$("#objetinfo").hide();
		});
		$("#closebtn2").click(function() {
			$("#qdiv").hide();
		});
	});
	</script>
		<script type="module">
			import * as THREE from '${ pageContext.request.contextPath }/three.js-master/build/three.module.js';
			import { OBJLoader } from '${ pageContext.request.contextPath }/three.js-master/examples/jsm/loaders/OBJLoader.js';					//Obj 파일 불러오는 js
			import { PointerLockControls } from '${ pageContext.request.contextPath }/three.js-master/examples/jsm/controls/PointerLockControls.js';
			import { TrackballControls } from '${ pageContext.request.contextPath }/three.js-master/examples/jsm/controls/TrackballControls.js';	
			import { GLTFLoader } from '${ pageContext.request.contextPath }/three.js-master/examples/jsm/loaders/GLTFLoader.js'; 				//GLTF 파일 불러오는 js
			var container, controls;						// 미리 변수 선언함
			var camera, scene, renderer, light;					//three js 기본 속성임
			var object, object1, object2, object3, object4, object5, object6, object7, object8, object9, object10, object11, object12, object13, object14, object15, object16;
			var raycaster = new THREE.Raycaster(),INTERSECTED;
			var mouse = new THREE.Vector2();
			var loader1;
			var objet = [];
			var collisiondistance = 20; 
			var speed = 800.0;      
			var moveForward = false;
			var moveBackward = false;
			var moveLeft = false;
			var moveRight = false;
			var playerVelocity = new THREE.Vector3();
			var clock;
			var ambLight;
			// 각각 전시작들임
			
			init();
			function init() {
				clock = new THREE.Clock();
				container = document.createElement( 'div' );
				document.body.appendChild( container );
				var loader = new GLTFLoader();
				loader.load( '${ pageContext.request.contextPath }/resources/vr/objetsample.gltf', function ( gltf )  {
				scene.add( gltf.scene );
				$("#info").fadeIn();
				$("#loadback").hide();
				});
				camera = new THREE.PerspectiveCamera( 50, window.innerWidth / window.innerHeight, 1, 1000 );
				//camera.position.set( -70, 60, 350 );   
				camera.position.y = 45; // Height the camera will be looking from
   				camera.position.x = 50;
    			camera.position.z = 150;				
				scene = new THREE.Scene();
				scene.background = new THREE.Color( 0xf5f5f5 );
			
				ambLight = new THREE.AmbientLight( 0xffffff, 1.1 );
				scene.add(ambLight);

				light = new THREE.DirectionalLight( 0x999999, 0.5 );
				light.position.set( 0, 100, 0 );
				scene.add( light );

				function loadModel() {
					object1.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture1;			//메쉬가 있을 때 텍스쳐 씌움
					} );
					object2.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture2;
					} );
					object3.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture3;
					} );
					object4.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture4;
					} );
					object5.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture5;
					} );
					object6.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture6;
					} );
					object7.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture7;
					} );
					object8.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture8;
					} );
					object9.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture9;
					} );
					object10.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture10;
					} );
					object11.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture11;
					} );
					object12.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture12;
					} );
					object13.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture13;
					} );
					object14.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture14;
					} );
					object15.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture15;
					} );
					object16.traverse( function ( child ) {
						if ( child.isMesh ) child.material.map = texture16;
					} );
					scene.add( object1 );			//화면에 오브젝트 추가
					scene.add( object2 );
					scene.add( object3 );
					scene.add( object4 );
					scene.add( object5 );
					scene.add( object6 );
					scene.add( object7 );
					scene.add( object8 );
					scene.add( object9 );
					scene.add( object10 );
					scene.add( object11 );
					scene.add( object12 );
					scene.add( object13 );
					scene.add( object14 );
					scene.add( object15 );
					scene.add( object16 ); 

				}
			var manager = new THREE.LoadingManager( loadModel );			//콘솔로 로딩상황 보여줌
				manager.onProgress = function ( item, loaded, total ) {
					console.log( item, loaded, total );
				};
				// textures
				var texturepath = '${ pageContext.request.contextPath }/resources/images/objet/';				// 텍스쳐 경로를 변수에 저장해서 불러올 수도 있음
				var textureLoader = new THREE.TextureLoader( manager );

				var texture1 = textureLoader.load( texturepath + '${ objet.objetrfile1 }' );	// 작성한 경로에서 텍스쳐 불러와서 변수에 저장
				var texture2 = textureLoader.load( texturepath + '${ objet.objetrfile2 }' );
				var texture3 = textureLoader.load( texturepath + '${ objet.objetrfile3 }' );
				var texture4 = textureLoader.load( texturepath + '${ objet.objetrfile4 }' );
				var texture5 = textureLoader.load( texturepath + '${ objet.objetrfile5 }' );
				var texture6 = textureLoader.load( texturepath + '${ objet.renamemainposter }' );
				var texture7 = textureLoader.load( texturepath + '${ objet.objetrfile7 }' );
				var texture8 = textureLoader.load( texturepath + '${ objet.renamemainposter }' );
				var texture9 = textureLoader.load( texturepath + '${ objet.objetrfile8 }' );
				var texture10 = textureLoader.load( texturepath + '${ objet.objetrfile1 }' );
				var texture11 = textureLoader.load( texturepath + '${ objet.objetrfile2 }' );
				var texture12 = textureLoader.load( texturepath + '${ objet.objetrfile3 }' );
				var texture13 = textureLoader.load( texturepath + '${ objet.objetrfile4 }' );
				var texture14 = textureLoader.load( texturepath + '${ objet.objetrfile5 }' );
				var texture15 = textureLoader.load( texturepath + '${ objet.objetrfile6 }' );
				var texture16 = textureLoader.load( texturepath + '${ objet.objetrfile7 }' );

				// model

				function onProgress( xhr ) {			//콘솔에 로딩 보여줌
					if ( xhr.lengthComputable ) {
						var percentComplete = xhr.loaded / xhr.total * 100;
						console.log( 'model ' + Math.round( percentComplete, 2 ) + '% downloaded' );
					}
				}

				loader1 = new OBJLoader( manager );		
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/01.obj', function ( obj ) {		//변수에 전시작 불러와서 저장함
					object1 = obj;
					object1.userData = { title : "${ objet.objettitle1 }", intro : "${ objet.objetintro1 }" };
					objet.push(object1);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/2.obj', function ( obj ) {
					object2 = obj;
					object2.userData = { title : "${ objet.objettitle2 }", intro : "${ objet.objetintro2 }" };
					objet.push(object2);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/3.obj', function ( obj ) {
					object3 = obj;
					object3.userData = { title : "${ objet.objettitle3 }", intro : "${ objet.objetintro3 }" };
					objet.push(object3);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/4.obj', function ( obj ) {
					object4 = obj;
					object4.userData = { title : "${ objet.objettitle4 }", intro : "${ objet.objetintro4 }" };
					objet.push(object4);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/5.obj', function ( obj ) {
					object5 = obj;
					object5.userData = { title : "${ objet.objettitle5 }", intro : '${ objet.objetintro5 }' };
					objet.push(object5);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/6.obj', function ( obj ) {
					object6 = obj;
					object6.userData = { title : "메인 포스터", intro : '"${ objet.objettitle}" 메인 포스터 입니다.' };
					objet.push(object6);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/7.obj', function ( obj ) {
					object7 = obj;
					object7.userData = { title : "${ objet.objettitle7 }", intro : "${ objet.objetintro7 }" };
					objet.push(object7);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/08.obj', function ( obj ) {
					object8 = obj;
					object8.userData = { title : "메인 포스터", intro : '"${ objet.objettitle}" 메인 포스터 입니다.' };
					objet.push(object8);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/9.obj', function ( obj ) {
					object9 = obj;
					object9.userData = { title : "${ objet.objettitle1 }", intro : "${ objet.objetintro1 }" };
					objet.push(object9);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/10.obj', function ( obj ) {
					object10 = obj;
					object10.userData = { title : "${ objet.objettitle2 }", intro : "${ objet.objetintro3 }" };
					objet.push(object10);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/11.obj', function ( obj ) {
					object11 = obj;
					object11.userData = { title : "${ objet.objettitle4 }", intro : "${ objet.objetintro3 }" };
					objet.push(object11);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/12.obj', function ( obj ) {
					object12 = obj;
					object12.userData = { title : "${ objet.objettitle4 }", intro : "${ objet.objetintro4 }" };
					objet.push(object12);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/13.obj', function ( obj ) {
					object13 = obj;
					object13.userData = { title : "${ objet.objettitle2 }", intro : "${ objet.objetintro2 }" };
					objet.push(object13);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/14.obj', function ( obj ) {
					object14 = obj;
					object14.userData = { title : "${ objet.objettitle2 }", intro : "${ objet.objetintro2 }" };
					objet.push(object14);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/15.obj', function ( obj ) {
					object15 = obj;
					object14.userData = { title : "${ objet.objettitle2 }", intro : "${ objet.objetintro2 }" };
					objet.push(object15);
				});
				loader1.load( '${ pageContext.request.contextPath }/resources/vr/16.obj', function ( obj ) {
					object16 = obj;
					object16.userData = { title : "${ objet.objettitle2 }", intro : "${ objet.objetintro2 }" };
					objet.push(object16);
				});
				//renderer = new THREE.WebGLRenderer();
			 	  renderer = new THREE.WebGLRenderer({
                    antialias: true
                });
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				renderer.shadowMap.enabled = true;
				container.appendChild( renderer.domElement );

				
				//controls
				controls = new PointerLockControls(camera, renderer.domElement);
    			scene.add(controls.getObject());
			    playerMove();
				animate();
				
				//eventListener
			  	container.addEventListener( 'mousemove', onDocumentMouseMove, false );
			  	container.addEventListener( 'mousedown', onDocumentMouseDown, false );
				window.addEventListener( 'resize', onWindowResize, false );
			}

				//events
			 function onDocumentMouseMove( event ) {
			     event.preventDefault();
			   	var gap1 = event.clientY - event.offsetY;
			    var gap2 = event.clientX - event.offsetX; 
			    mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
			    mouse.y = -(event.clientY / window.innerHeight) * 2 + 1;
			    }
			function onDocumentMouseDown(event) {	//마우스 클릭 시 이벤트 --> 작품정보 function 실행
			    event.preventDefault();
			    var gap1 = event.clientY - event.offsetY;
			    var gap2 = event.clientX - event.offsetX; 
			    mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
			    mouse.y = -(event.clientY / window.innerHeight) * 2 + 1;
			  	var intersects = raycaster.intersectObjects( objet, true);
			    raycaster.setFromCamera(mouse, camera);
				if (intersects.length > 0 && intersects[0].distance < 120 ) {
				objetinfo(intersects);
			    }
			};
			function objetinfo(intersects){		//해당 작품 정보 띄우는 function
				$("#info").hide();
				$("#title1").html(intersects[0].object.parent.userData.title);
				$("#intro1").html(intersects[0].object.parent.userData.intro);
				$("#objetinfo").fadeIn();
			}
			
			function playerMove() {		//키보드 코드로 플레이어 동작하게 + 빛 조절
			    var onKeyDown = function (event) {			//키보드 눌렀을 때 이벤트
			        switch (event.keyCode) {
			            case 38: // up
			                moveForward = true;
			                break;
			                
			            case 87: // w
							up();
							break;
			
			            case 37: // left
			                moveLeft = true;
			                break;
			                
			            case 65: // a
			                left();
			                break;
			
			            case 40: // down
			                moveBackward = true;
			                break;
			                
			           case 83: // s
							down();
							break;
			
			            case 39: // right
			                moveRight = true;
			                break;
			                
			            case 68: // d
			                right();
			                break;
			
						case 49 :
							light1();	break;
						case 50 :
							light2();	break;
						case 51 :
							light3();	break;
						case 52 :
							light4();	break;
						case 53 :
							light5();	break;
			        }
			
			    };
			
			    var onKeyUp = function (event) {		//키보드 땠을 때 이벤트
			        switch (event.keyCode) {
			
			            case 38: // up
			                moveForward = false;
			                break;
			                
			            case 87: // w
			                break;
			
			            case 37: // left
			  moveLeft = false;
			            
			                break;
			            case 65: // a
			                break;
			
			            case 40: // down
			                moveBackward = false;
			                break;
			            case 83: // s
			                break;
			
			            case 39: // right
			                moveRight = false;
			                break;
			                
			            case 68: // d
			                break;
			            
						case 87 :
							break;
			
						case 49 : break;
						case 50 : break;
						case 51 : break;
						case 52 : break;
						case 53 : break;
			        }
    };

	    document.addEventListener('keydown', onKeyDown, false);		//키보드 눌렀을때 이벤트 추가
	    document.addEventListener('keyup', onKeyUp, false);				//키보드 땠을 때 이벤트 추가
}
			
			function onWindowResize() {		//창에 맞게 실행화면 자동 리사이즈
				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();
				renderer.setSize( window.innerWidth, window.innerHeight );
			}

			function animate() {
				render();
				requestAnimationFrame( animate );
				var delta = clock.getDelta();
				player(delta)
			}
			function render() {
			 raycaster.setFromCamera(mouse, camera);
			        var intersects = raycaster.intersectObjects( objet, true);
			    if (intersects.length > 0 && intersects[0].distance < 120) {
			        if (INTERSECTED != intersects[0].object) {
			            if (INTERSECTED) INTERSECTED.material.emissive.setHex(INTERSECTED.currentHex);
			            INTERSECTED = intersects[0].object;
			            INTERSECTED.currentHex = INTERSECTED.material.emissive.getHex();
			            INTERSECTED.material.emissive.setHex(0x222222);
			            container.style.cursor = 'pointer';
			        }
			    } else {
			        if (INTERSECTED) {
						INTERSECTED.material.emissive.setHex(INTERSECTED.currentHex);
						container.style.cursor = 'auto';
						}
			        INTERSECTED = null;
			    }

			    renderer.render(scene, camera);
				
			}
			
			function player(delta) {		//플레이어 동작 (속도) 계산 + 충돌감지시 속도 0으로 만드는 function
			    playerVelocity.x -= playerVelocity.x * 10.0 * delta;
			    playerVelocity.z -= playerVelocity.z * 10.0 * delta;
			
			    if (detectCollision() == false) {
			        if (moveForward) {
			            playerVelocity.z -= speed * delta;
			        }
			        if (moveBackward) playerVelocity.z += speed * delta;
			        if (moveLeft) playerVelocity.x -= speed * delta;
			        if (moveRight) playerVelocity.x += speed * delta;
			
			        controls.getObject().translateX(playerVelocity.x * delta);
			        controls.getObject().translateZ(playerVelocity.z * delta);
			    } else {
			        playerVelocity.x = 0;
			        playerVelocity.z = 0;
			    }
			}
			
			function detectCollision() {		// 충돌감지 function
			    var rotationMatrix;
			    var cameraDirection = controls.getDirection(new THREE.Vector3(0, 0, 0)).clone();
			
			    if (moveBackward) {
			        rotationMatrix = new THREE.Matrix4();
			        rotationMatrix.makeRotationY(degreesToRadians(180));
			    }
			    else if (moveLeft) {
			        rotationMatrix = new THREE.Matrix4();
			        rotationMatrix.makeRotationY(degreesToRadians(90));
			    }
			    else if (moveRight) {
			        rotationMatrix = new THREE.Matrix4();
			        rotationMatrix.makeRotationY(degreesToRadians(270));
			    }
			
			    if (rotationMatrix !== undefined) {
			        cameraDirection.applyMatrix4(rotationMatrix);
			    }
			
			    var rayCaster = new THREE.Raycaster(controls.getObject().position, cameraDirection);
			
			    if (rayIntersect(rayCaster, collisiondistance)) {
			        return true;
			    } else {
			        return false;
			    }
			}
			
			function rayIntersect(ray, distance) {	
			    var intersects = ray.intersectObjects(scene.children, true);
			    for (var i = 0; i < intersects.length; i++) {
			        if (intersects[i].distance < distance) {
			            return true;
			        }
			    }
			    return false;
			}
			function left(){		//카메라 왼쪽 회전
			    camera.rotation.y += 0.05;
			}
			function right(){	//카메라 오른쪽 회전
			    camera.rotation.y -= 0.05;
			}
			function up(){		//카메라 위치 위도 이동
			    camera.position.y += 0.5;
			}
			function down(){	//카메라 위치 아래로 이동
			    camera.position.y -= 0.5;
			}
			
			function light1(){		//빛 양 조절 
			scene.remove(ambLight);
			ambLight = new THREE.AmbientLight( 0xaaaaaa );
			scene.add(ambLight);
			}
			function light2(){
			scene.remove(ambLight);
			ambLight = new THREE.AmbientLight( 0xcccccc );
			scene.add(ambLight);
			}
			function light3(){
			scene.remove(ambLight);
			ambLight = new THREE.AmbientLight( 0xffffff );
			scene.add(ambLight);
			}
			function light4(){
			scene.remove(ambLight);
			ambLight = new THREE.AmbientLight( 0xffffff, 1.1 );
			scene.add(ambLight);
			}
			function light5(){
			scene.remove(ambLight);
			ambLight = new THREE.AmbientLight( 0xffffff, 1.3 );
			scene.add(ambLight);
			}
			
			
			function degreesToRadians(degrees) {
			    return degrees * Math.PI / 180;
			}
			
			function radiansToDegrees(radians) {
			    return radians * 180 / Math.PI;
			}

		</script>
	</body>
</html>