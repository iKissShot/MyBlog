<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>

<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>

<script type="text/javascript" src="https://webapi.amap.com/maps?v=2.0Beta&key=57910ead2b7ec93a339590abf0dca5d4"></script>

<meta name="viewport" content="initial-scale=1.0, user-scalable=no">

<meta charset="utf-8">
<title>小地图</title>

<style type="text/css">
* {
	maring: 0;
	padding: 0;
	letter-spacing: 3px;
	text-decoration: none;
}

html, body {
	width: 100%;
	margin: 0px;
	background: #5C4084;
}

header {
	height: 90px;
	margin: 0;
	width: 100%;
	background: rgba(255, 255, 255, 0.8);
	text-align: center;
}

.main {
	width: 50%;
	min-width: 700px;
	margin: 100px auto;
	text-align: center;
	background: rgba(255, 255, 255, 0.9);
	border-radius: 30px;
	padding: 20px;
}

a {
	display: inline-block;
	font-size: 1.5em;
	transition: 0.3s;
	padding: 20px;
}

a:hover {
	cursor: pointer;
}

h1 a {
	color: #f99;
}

h2 a {
	color: #99f;
}

#container {
	width: 100%;
	height: 550px;
}

.fullScreen {
	
}

#change {
	cursor: pointer;
	margin-left: 50px;
	color: #f99;
	transition: 0.3s;
}

#change:hover {
	color: #99f;
}
</style>

</head>
<body>
	<header>
		<h1>
			<a href="/">返回博客</a>
		</h1>
	</header>
	<div class="main">
		<h1>
			小地图
			<span id="change">大屏</span>
		</h1>

		<div id="container"></div>
	</div>

	<script type="text/javascript">
		window.onload = function() {
			var map = new AMap.Map('container', {
				center : [ 115.994875, 29.705219 ],
				zoom : 14,
				viewMode : '3D',
				layers : [ new AMap.TileLayer.Satellite(),
						new AMap.TileLayer.RoadNet() ],
			});
			var icon = new AMap.Icon(
					{
						size : new AMap.Size(100, 100),
						image : '//webapi.amap.com/theme/v1.3/images/newpc/way_btn2.png',
						imageOffset : new AMap.Pixel(0, -60)
					});
			var marker = new AMap.Marker({
				position : new AMap.LngLat(115.994875, 29.705219),
				title : '九江',
				offset : new AMap.Pixel(-10, -10),
				icon : icon,
			});
			map.add(marker);

			var infoWindow = new AMap.InfoWindow({ //创建信息窗体
				isCustom : true, //使用自定义窗体
				content : '<div>信息窗体</div>', //信息窗体的内容可以是任意html片段
				offset : new AMap.Pixel(16, -45)
			});
			var onMarkerClick = function(e) {
				infoWindow.open(map, e.target.getPosition());//打开信息窗体
				//e.target就是被点击的Marker
			}
			var marker = new AMap.Marker({
				position : [ 116.481181, 39.989792 ]
			})
			map.add(marker);
			marker.on('click', onMarkerClick);//绑定click事件

			var path = [ [ 115.994875, 29.705219 ], [ 115.999875, 29.709219 ],
					[ 115.991875, 29.707219 ] ];
			map.add(new AMap.Polyline({
				path : path,
				fillColor : '#f99',
				strokeColor : '#3366FF',
				strokeWeight : 8,
				strokeStyle : 'solid',
				lineJoin : 'round'
			}));
			var path = [ [ 115.991875, 29.708219 ], [ 115.991875, 29.700519 ],
					[ 115.999875, 29.709219 ] ];
			map.add(new AMap.Polygon({
				path : path,
				fillColor : '#eee',
				strokeColor : '#f00',
				strokeWeight : 3,
				strokeStyle : 'dashed',
				borderWeight : 2,
				lineJoin : 'round'
			}));
			map.add(new AMap.CircleMarker({
				center : [ 115.991875, 29.708219 ],
				radius : 50,
				fillColor : 'red',
				strokeWeight : 2,
				strokeColor : "#fff"
			}));
		};
	</script>


	<script type="text/javascript">
		$('#change').click(function() {
			if ($(this).html() == '大屏') {
				$(this).html('迷你');
				$('header').hide('slow');
				$('.main').css({
					'width' : '80%',
					'height' : '850px',
					'margin' : '50px auto'
				});
				$('#container').css('height', '750px');
			} else {
				$('header').show('slow');
				$(this).html('大屏');
				$('.main').css({
					'width' : '50%',
					'height' : '700px',
					'margin' : '100px auto'
				});
				$('#container').css('height', '600px');
			}
		});
	</script>


</body>
</html>