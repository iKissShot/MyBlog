<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>KissShot——康熙博客</title>
<style>
* {
	maring: 0;
	padding: 0;
	word-spacing: 1em;
	letter-spacing: 0.1em;
}

html body {
	width: 100%;
	height: 100%;
	maring: 0;
	padding: 0;
	overflow-x: hidden;
}

header {
	width: 100%;
	height: 300px;
	position: relative;
	display: flex;
}

.header-banner {
	position: absolute;
	padding: 0;
	marign: 0;
	width: 100%;
	height: 300px;
	background-image: url('/test/static/jsp/web/img/banner.png');
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	marign: 0;
	filter: blur(1px);
	padding: 0;
	transition: 0.5s;
	z-index: -1;
}

header:hover .header-banner {
	filter: blur(10px);
}

.header-h1 {
	margin: 0 auto;
	margin-top: 110px;
	height: 10px;
	padding: 30px;
	line-height: 10px;
	color: #ff6666;
	border: 3px #999 solid;
	border-radius: 10px;
	background: rgba(255, 255, 255, 0.9);
}

header nav {
	position: absolute;
	bottom: 0px;
	width: 100%;
	display: flex;
	justify-content: center;
}

ul {
	display: flex;
	justify-content: center;
	position: absolute;
	float: left;
}

haeder nav li a {
	margin: 10px;
	background: #6f6;
	padding: 10px;
	background: #6f6;
}
</style>
</head>
<body>
	<header>
		<div class="header-banner"></div>
		<h1 class="header-h1">你好，欢迎来到KissShot的博客</h1>
		<nav>
			<ul>
				<li><a>导航一</a></li>
				<li><a>导航一</a></li>
				<li><a>导航一</a></li>
				<li><a>导航一</a></li>
				<li><a>导航一</a></li>
				<li><a>导航一</a></li>
			</ul>
		</nav>
	</header>
</body>
</html>