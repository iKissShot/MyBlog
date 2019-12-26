<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="/static/jsp/web/css/gridder.min.css">
<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>

<script type="text/javascript" src="/static/jsp/utils/_07_coder/JsBarcode.all.min.js"></script>
<script type="text/javascript" src="/static/jsp/utils/_07_coder/qrcode.min.js"></script>

<title>活码生成器</title>

<style>
* {
	margin: 0;
	padding: 0;
	font-weight: lighter;
}

html, body {
	width: 100%;
	height: 100%;
}

body {
	background: #5C4084;
}

header {
	background: rgba(255, 255, 255, 0.9);
	text-align: center;
}

h1 {
	display: inline-block;
	padding: 30px 30px;
}

a {
	padding: 10px;
	color: #99f;
	cursor: pointer;
	transition: 0.3s;
	font-weight: lighter;
}

a:hover {
	color: #f99;
}

#container {
	margin: 100px auto;
	padding: 50px;
	text-align: center;
	background: #fff;
	width: 400px;
	border-radius: 10px;
	text-align: center;
}

#text {
	width: 100px;
	margin: 10px;
}

#qrcode {
	width: 300px;
	height: 300px;
	background: #eee;
	margin: 10px auto;
}

#text {
	padding: 5px;
	text-align: center;
	width: 300px;
	color: #999;
}
</style>

</head>
<body>


	<header>
		<div>
			<h1>
				<a href="/">返回博客</a>
			</h1>
		</div>
	</header>


	<div id="container">

		<input id="text" type="text" value="http://KissShot.top" />
		<div id="qrcode"></div>
		<div>
			<svg id="barcode"></svg>
		</div>

	</div>


	<script type="text/javascript">
		var qrcode = new QRCode(document.getElementById("qrcode"), {
			width : 300,
			height : 300,
			render : 'table',
			colorDark : '#f00',
			colorLight : '#fff',
			correctLevel : QRCode.CorrectLevel.L,
			src : 'http://www.baidu.com/img/baidu_jgylogo3.gif'
		});
		function makeCode(text) {
			text = encodeURI(text);
			qrcode.makeCode(text);
			JsBarcode('#barcode', text, {
				lineColor : '#99f',
				width : 1,
				height : 40,
				textPosition : 'bottom',
				displayValue : true,
				options : ({
					font : '楷体',
					fontSize : 28,
					textMargin : 10,
				})
			});
		}
		function changeWidth() {
			$('#container').css('width', $('#barcode').attr('width'));
		}
		makeCode($('#text').val());
		$('#text').change(function() {
			var text = $('#text').val();
			if (text != '') {
				makeCode(text);
				changeWidth();
			} else {
				qrcode.clear();
			}
		});
	</script>

</body>
</html>