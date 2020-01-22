<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>ObjetVR</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
		<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main.css">
		<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<!-- 시맨틱유아이 cdn -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
		<style type="text/css">
body {
	background: white;
	overflow: hidden;
}

#info {
	position: absolute;
	background: #ffffffee;
	width: 400px;
	height: 500px;
	color: black;
	 top: 15%; 
	 transform: translateY(-15%);
	 left: 50%; 
	 transform: translateX(-50%);
	//border: 1.5px solid #ccc;
	border-radius: 5px; 
	padding: 20px;
	padding-top: 30px;
//	box-shadow: 0px 1px 3px #777;
	box-shadow: 0em 0.25em .75em rgba(124,124,124, 0.7);

	font-family: 'Nanum Gothic';
} 
#infobtn{
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
}
#closebtn{
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
 #objetlogo{
width: 100px;

} 
#title{
font-weight: bolder;
font-size: 13pt;
}
#intro{
letter-spacing: 1px;
line-height: 20pt;
}
</style>
	</head>
	<body>
		<button class="ui button icon" id="infobtn" align="center"><i class="icon small info"></i></button>
		<div id="info" align="center">
		<%-- <div style="background: none; width: 100px; margin-left: 120px; opacity: 0.4; margin-top: -10px;">
		<img  src="${ pageContext.request.contextPath }/resources/images/objet_logo_black.png" id="objetlogo">
		</div> --%>
		<font id="title">${ objet.objettitle }</font><br><hr>
		<div id="intro">${ objet.objetintro }</div>
		<button id="closebtn">Close</button>
		</div>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$("#infobtn").click(function() {
			$("#info").show();
		});
		$("#closebtn").click(function() {
			$("#info").hide();
		});
	});
	</script>
	
		<script type="module"> 

			import * as THREE from '${ pageContext.request.contextPath }/three.js-master/build/three.module.js';

			import { OBJLoader } from '${ pageContext.request.contextPath }/three.js-master/examples/jsm/loaders/OBJLoader.js';					//Obj 파일 불러오는 js
			import { OrbitControls } from '${ pageContext.request.contextPath }/three.js-master/examples/jsm/controls/OrbitControls.js';		//마우스 + 키보드 컨트롤러 js	
			import { GLTFLoader } from '${ pageContext.request.contextPath }/three.js-master/examples/jsm/loaders/GLTFLoader.js'; 				//GLTF 파일 불러오는 js
			var container, controls;						// 미리 변수 선언함
			var camera, scene, renderer, light;					//three js 기본 속성임
			var object, object1, object2, object3, object4, object5, object6, object7, object8, object9, object10, object11, object12, object13, object14, object15, object16;
			// 각각 전시작들임
			init();
			animate();


			function init() {

				container = document.createElement( 'div' );
				document.body.appendChild( container );

				camera = new THREE.PerspectiveCamera( 60, window.innerWidth / window.innerHeight, 1, 1000 );
			//	camera.position.z = 0;
				//camera.position.y = 500;
				camera.position.set( 50, 150, 300 );      
 
				scene = new THREE.Scene();
				scene.background = new THREE.Color( 0xeeeeee );
				
				var width = 100;
				var height = 100;
				var intensity = 1;

				//var rectLight = new THREE.RectAreaLight( 0xffffff, 2,  500, 1000 );
				//rectLight.position.set( 50, 50, 0 );
				//scene.add( rectLight )
				
				var ambLight = new THREE.AmbientLight( 0xffffff, 1.1 );
				scene.add(ambLight);


			//	light = new THREE.PointLight( 0x0000ff, 10, 50 );
				//light.position.set( 70, 0, 10 );
				//scene.add( light );

				light = new THREE.DirectionalLight( 0xffffff );
				light.position.set( 0, 50, 10 );

				light.castShadow = true;
				light.shadow.camera.top = 0;
				light.shadow.camera.bottom = - 100;
				light.shadow.camera.left = - 120;
				light.shadow.camera.right = 120;
				scene.add( light );

				// grid



			var loader = new GLTFLoader();
	
				loader.load( '${ pageContext.request.contextPath }/resources/vr/objetsample.gltf', function ( gltf ) {
	
				scene.add( gltf.scene );
	});

// manager

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
		

			var manager = new THREE.LoadingManager( loadModel );			//콘솔로 텍스쳐 로딩상황 보여줌

				manager.onProgress = function ( item, loaded, total ) {

					console.log( item, loaded, total );

				};

				// textures
				var objet1 = 'models/gltf/warn.png';				// 텍스쳐 경로를 변수에 저장해서 불러올 수도 있음
				var textureLoader = new THREE.TextureLoader( manager );
			//	var textureLoader = new THREE.CanvasTextureLoader( manager );

				var texture1 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile1 }' );	// 작성한 경로에서 텍스쳐 불러와서 변수에 저장
				var texture2 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile2 }' );
				var texture3 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile3 }' );
				var texture4 =textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile4 }' );
			//	var imgload = new THREE.ImageLoader();

				var texture5 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile5 }' );
				var texture6 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.renamemainposter }' );
				var texture7 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile7 }' );
				var texture8 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.renamemainposter }' );
				var texture9 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile8 }' );
				var texture10 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile1 }' );
				var texture11 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile2 }' );
				var texture12 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile3 }' );
				var texture13 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile4 }' );
				var texture14 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile5 }' );
				var texture15 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile6 }' );
				var texture16 = textureLoader.load( '${ pageContext.request.contextPath }/resources/images/objet/${ objet.objetrfile7 }' );
				// model

				function onProgress( xhr ) {			//콘솔에 로딩 보여줌

					if ( xhr.lengthComputable ) {

						var percentComplete = xhr.loaded / xhr.total * 100;
						console.log( 'model ' + Math.round( percentComplete, 2 ) + '% downloaded' );

					}

				}

				var loader1 = new OBJLoader( manager );		
				var loader2 = new OBJLoader( manager );
				var loader3 = new OBJLoader( manager );
				var loader4 = new OBJLoader( manager );
				var loader5 = new OBJLoader( manager );
				var loader6 = new OBJLoader( manager );
				var loader7 = new OBJLoader( manager );
				var loader8 = new OBJLoader( manager );
				var loader9 = new OBJLoader( manager );
				var loader10 = new OBJLoader( manager );
				var loader11 = new OBJLoader( manager );
				var loader12 = new OBJLoader( manager );
				var loader13 = new OBJLoader( manager );
				var loader14 = new OBJLoader( manager );
				var loader15 = new OBJLoader( manager );
				var loader16 = new OBJLoader( manager );
			

				loader1.load( '${ pageContext.request.contextPath }/resources/vr/01.obj', function ( obj ) {		//변수에 전시작 불러와서 저장함

					object1 = obj;
				});
				loader2.load( '${ pageContext.request.contextPath }/resources/vr/2.obj', function ( obj ) {

					object2 = obj;
				});
					
				loader3.load( '${ pageContext.request.contextPath }/resources/vr/3.obj', function ( obj ) {

					object3 = obj;
				});
					
				loader4.load( '${ pageContext.request.contextPath }/resources/vr/4.obj', function ( obj ) {

					object4 = obj;
				});
					
				loader5.load( '${ pageContext.request.contextPath }/resources/vr/5.obj', function ( obj ) {

					object5 = obj;
				});
					
				loader6.load( '${ pageContext.request.contextPath }/resources/vr/6.obj', function ( obj ) {

					object6 = obj;
				});
					
				loader7.load( '${ pageContext.request.contextPath }/resources/vr/7.obj', function ( obj ) {

					object7 = obj;
				});
				loader8.load( '${ pageContext.request.contextPath }/resources/vr/08.obj', function ( obj ) {

					object8 = obj;
				});
				loader9.load( '${ pageContext.request.contextPath }/resources/vr/9.obj', function ( obj ) {

					object9 = obj;
				});
				loader10.load( '${ pageContext.request.contextPath }/resources/vr/10.obj', function ( obj ) {

					object10 = obj;
				});
				loader11.load( '${ pageContext.request.contextPath }/resources/vr/11.obj', function ( obj ) {

					object11 = obj;
				});
				loader12.load( '${ pageContext.request.contextPath }/resources/vr/12.obj', function ( obj ) {

					object12 = obj;
				});
				loader13.load( '${ pageContext.request.contextPath }/resources/vr/13.obj', function ( obj ) {

					object13 = obj;
				});
				loader14.load( '${ pageContext.request.contextPath }/resources/vr/14.obj', function ( obj ) {

					object14 = obj;
				});
				loader15.load( '${ pageContext.request.contextPath }/resources/vr/15.obj', function ( obj ) {

					object15 = obj;
				});
				loader16.load( '${ pageContext.request.contextPath }/resources/vr/16.obj', function ( obj ) {

					object16 = obj;
				});

				//renderer = new THREE.WebGLRenderer();
			  renderer = new THREE.WebGLRenderer({
                    antialias: true
                });

				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				container.appendChild( renderer.domElement );

				// controls
				controls = new OrbitControls( camera, renderer.domElement );

	//			controls.enableDamping = true; // an animation loop is required when either damping or auto-rotation are enabled
	//		controls.dampingFactor = 0.05;

				controls.screenSpacePanning = false;
				controls.minDistance = 250;
				controls.maxDistance = 400;
				controls.maxPolarAngle = Math.PI / 2.2;
				controls.minPolarAngle = Math.PI / 2.4;
				window.addEventListener( 'resize', onWindowResize, false );

			}

			function onWindowResize() {

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

				renderer.setSize( window.innerWidth, window.innerHeight );

			}

			//

			function animate() {

				requestAnimationFrame( animate );

				renderer.render( scene, camera );


			}

		</script>

	</body>
</html>