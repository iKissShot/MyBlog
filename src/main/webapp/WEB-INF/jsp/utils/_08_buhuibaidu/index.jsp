<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="/static/jsp/web/css/gridder.min.css">
<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>

<title>不会百度？</title>

<style>
* {
	margin: 0;
	padding: 0;
	letter-spacing: 3px;
	font-weight: lighter;
	overflow: hidden;
}

html, body {
	width: 100%;
	height: 100%;
	text-align: center;
}

body {
	background: url('/static/jsp/utils/_08_buhuibaidu/bg.png');
	background-size: contain;
	background-repeat: no-repeat;
	background-position: 0% center;
	background-attachment: fixed;
}

.container {
	width: 800px;
	height: 80%;
	position: relative;
}

#logo {
	margin: 10px auto;
	width: 500px;
	height: 200px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: contain;
	background-image: url('/static/jsp/utils/_08_buhuibaidu/logo1.png');
	background-repeat: no-repeat;
}

#search {
	border-radius: 10px;
	width: 600px;
	height: 60px;
	margin: 50px auto;
	background: #0076FE;
	margin: 50px auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

#search-box {
	width: 500px;
	height: 60px;
	margin: 0px;
	border-radius: 10px;
	outline: 0px;
	border: 0px;
	font-size: 1.3em;
	padding: 0px 20px;
	box-shadow: 0 0 0 5px #0076FE inset;
}

#search-btn {
	height: 60px;
	padding: 10px;
	margin: 0px;
	background: #0076FE;
	border: 0px;
	font-weight: bolder;
	border-radius: 10px;
	color: #fff;
	border-radius: 10px;
	font-size: 1.3em;
	cursor: pointer;
}

#tip {
	margin: 50px;
}

footer {
	width: 100%;
	height: 20%;
	display: flex;
	align-items: center;
	justify-content: center;
}

a {
	cursor: pointer;
	font-size: 2em;
	color: #99f;
	transition: 0.3s;
}

a:hover {
	color: #f99;
}

#cursor {
	transition: 1s;
	width: 50px;
	height: 100px;
	background-image: url('/static/jsp/utils/_08_buhuibaidu/mouse.png');
	background-repeat: no-repeat;
	background-size: contain;
	position: absolute;
	top: 150px;
	left: 750px;
	background-position: center;
}
</style>

</head>
<body>


	<div class="container">
		<div id="logo"></div>
		<div id="cursor"></div>

		<div id="search">
			<input id="search-box" type="search" placeholder="输入关键字，回车搜索" />
			<input id="search-btn" type="submit" value="百度一下" />
		</div>

		<div id="tip">
			<a>看我百度给你看</a>
		</div>

	</div>

	<footer>
		<div id="stop">
			<a>停停停，我是自己人</a>
		</div>
	</footer>


	<script type="text/javascript">
		var starter = setTimeout(begin, 1000);
		var timer;
		var moveTimer;
		var linkTimer;
		$('#stop').click(function() {
			clearTimeout(starter);
			clearInterval(timer);
			clearInterval(moveTimer);
			clearInterval(linkTimer);
			$('#search-box').val('');
			$('#tip a').html('请输入关键词');

			$('#search-box').change(function() {
				if ($('#search-box').val() == '') {
					$('#tip a').html('请输入关键词');
				} else {
					$('#tip a').html('请百度一下');
				}
			});
		});
		$('#search-btn').click(
				function() {
					var url = 'http://127.0.0.1:8080/Utils/Buhuibaidu?s='
							+ $('#search-box').val();
					if (prompt('已生成关键词链接：\n快发给小伙伴玩玩吧~是否先测试一下呢~', url)) {
						window.location.href = url;
					} else {
						$('#search-box').val('');
						$('#tip a').html("看我百度给你看");
						starter = setTimeout(begin, 1000);
					}
				});
		function begin() {
			var text = 'KissShot的康熙小窝';
			var params = window.location.search.substring(1).split('&');
			for (i = 0; i < params.length; i++) {
				if (params[i].split('=')[0] == 's') {
					text = params[i].split('=')[1];
				}
			}
			fillText(text);
		}
		function fillText(text) {
			var i = 0;
			timer = setInterval(function() {
				fillLetter(text[i++]);
				if (text[i] == undefined) {
					clearInterval(timer);
					move(text);
				}
			}, 200);
		}

		function fillLetter(letter) {
			$('#search-box').val($('#search-box').val() + letter);
		}

		function move(text) {
			moveTimer = setTimeout(function() {
				$('#cursor').animate({
					'left' : '650px',
					'top' : '300px',
				}, 300);
				linkTimer = setTimeout(function() {
					search(text);
				}, 1500);
			}, 300);
		}
		function search(text) {
			document.location.href = 'https://www.baidu.com/s?wd=' + text;
		}
	</script>

</body>
</html>