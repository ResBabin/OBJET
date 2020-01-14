<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://aframe.io/releases/1.0.3/aframe.min.js"></script>
<title>vr gallery</title>
<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<script src="resources/js/three.min.js"></script>
</head>
<body>
		<script type="module">

			import * as THREE from '../build/three.module.js';

			import Stats from './jsm/libs/stats.module.js';

			import { TrackballControls } from './jsm/controls/TrackballControls.js';
			import { OBJLoader } from './jsm/loaders/OBJLoader.js';
			import { RGBELoader } from './jsm/loaders/RGBELoader.js';

			var statsEnabled = true;

			var container, stats;

			var camera, scene, renderer, controls;

			init();
			animate();

			function init() {

				container = document.createElement( 'div' );
				document.body.appendChild( container );

				renderer = new THREE.WebGLRenderer( { antialias: true } );
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				container.appendChild( renderer.domElement );

				renderer.outputEncoding = THREE.sRGBEncoding;
				renderer.toneMapping = THREE.ReinhardToneMapping;
				renderer.toneMappingExposure = 3;

				//

				scene = new THREE.Scene();

				camera = new THREE.PerspectiveCamera( 50, window.innerWidth / window.innerHeight, 0.01, 1000 );
				camera.position.z = 2;

				controls = new TrackballControls( camera, renderer.domElement );

				//

				scene.add( new THREE.HemisphereLight( 0x443333, 0x222233, 4 ) );

				//

				var material = new THREE.MeshStandardMaterial();

				new OBJLoader()
					.setPath( 'models/obj/cerberus/' )
					.load( 'Cerberus.obj', function ( group ) {

						var loader = new THREE.TextureLoader()
							.setPath( 'models/obj/cerberus/' );

						material.roughness = 1; // attenuates roughnessMap
						material.metalness = 1; // attenuates metalnessMap

						var diffuseMap = loader.load( 'Cerberus_A.jpg' );
						diffuseMap.encoding = THREE.sRGBEncoding;
						material.map = diffuseMap;
						// roughness is in G channel, metalness is in B channel
						material.metalnessMap = material.roughnessMap = loader.load( 'Cerberus_RM.jpg' );
						material.normalMap = loader.load( 'Cerberus_N.jpg' );

						material.map.wrapS = THREE.RepeatWrapping;
						material.roughnessMap.wrapS = THREE.RepeatWrapping;
						material.metalnessMap.wrapS = THREE.RepeatWrapping;
						material.normalMap.wrapS = THREE.RepeatWrapping;

						group.traverse( function ( child ) {

							if ( child.isMesh ) {

								child.material = material;

							}

						} );

						group.position.x = - 0.45;
						group.rotation.y = - Math.PI / 2;
						scene.add( group );

					} );

				new RGBELoader()
					.setDataType( THREE.UnsignedByteType )
					.setPath( 'textures/equirectangular/' )
					.load( 'venice_sunset_1k.hdr', function ( hdrEquirect ) {

						var hdrCubeRenderTarget = pmremGenerator.fromEquirectangular( hdrEquirect );
						hdrEquirect.dispose();
						pmremGenerator.dispose();

						scene.background = hdrCubeRenderTarget.texture;
						scene.environment = hdrCubeRenderTarget.texture;

					} );

				var pmremGenerator = new THREE.PMREMGenerator( renderer );
				pmremGenerator.compileEquirectangularShader();

				//

				if ( statsEnabled ) {

					stats = new Stats();
					container.appendChild( stats.dom );

				}

				window.addEventListener( 'resize', onWindowResize, false );

			}

			//

			function onWindowResize() {

				renderer.setSize( window.innerWidth, window.innerHeight );

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

			}

			//

			function animate() {

				requestAnimationFrame( animate );

				controls.update();
				renderer.render( scene, camera );

				if ( statsEnabled ) stats.update();

			}

		</script>
 
</body>
</html>