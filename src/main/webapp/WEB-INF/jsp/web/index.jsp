<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>KissShot——康熙博客</title>
<style>
* {
	margin: 0;
	padding: 0;
	word-spacing: 0.1em;
	letter-spacing: 0.1em;
	color: #666;
	outline: 0px;
}

a {
	text-decoration: none;
	transition: 0.2s;
}

a:hover {
	color: #f99;
	font-weight: 700;
}

html body {
	width: 100%;
	height: 100%;
	maring: 0;
	padding: 0;
	background: #F2F2F2;
	overflow-x: hidden;
}

header {
	width: 100%;
	height: 400px;
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
	background-position: 100%;
	background-repeat: no-repeat;
	marign: 0;
	filter: blur(5px);
	padding: 0;
	transition: 0.8s;
	z-index: -1;
	background-position: center;
}

header:hover .header-banner {
	filter: blur(30px);
}

.header-h1 {
	cursor: pointer;
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
	background: rgba(255, 0, 0, 0.5);
	padding: 20px;
	display: flex;
	justify-content: center;
}

header nav ul {
	width: 100%;
	max-width: 1100px;
	min-width: 800px;
	list-style-type: none;
	display: flex;
	justify-content: space-between;
}

header nav ul li {
	margin-top: 10px;
}

header nav ul a {
	cursor: pointer;
	min-width: 80px;
	background: rgba(150, 150, 255, 0.5);
	padding: 10px;
	color: #fff;
	padding-left: 20px;
	padding-right: 20px;
	margin: 10px;
}

header .search {
	display: flex;
}

header .search-box {
	width: 50px;
	height: 30px;
	margin-top: -6px;
	border: 0;
	border-radius: 10px;
	padding-left: 10px;
	padding-right: 40px;
	transition: 1s;
	padding-left: 10px;
}

header .search-box:hover {
	width: 120px;
	border: 0px;
}

header .search-btn {
	cursor: pointer;
	width: 30px;
	height: 30px;
	border: 0px;
	border-radius: 5px;
	position: relative;
	right: 30px;
	top: -6px;
	background: url('/test/static/jsp/web/img/search.png');
	background-repeat: no-repeat;
}

header .search:hover header .search-btn {
	
}

.contain {
	width: 100%;
	max-width: 1100px;
	min-width: 800px;
	background: #F2F2F2;;
	border: 2px #fff solid;
	border-radius: 10px;
	display: flex;
	margin: 10px auto;
	padding: 10px;
	justify-content: space-between;
	border: 2px #fff solid;
}

.contain-right {
	width: 25%;
	height: 100%;
	background: #99f;
	align-items: center;
	justify-content: center;
	margin: 20px;
}

.contain-right-ins {
	background: #F8F8FA;
	margin: 10px;
	padding: 10px;
	align-items: center;
	justify-content: center;
	align-self: flex-start;
}

.contain-right-ins img {
	border-radius: 1000px;
	transition: 1s;
}

.contain-right-ins:hover img {
	transform: rotate(360deg);
	transition: 1s;
}

.contain-right-ins-text {
	margin: 8px;
}

.item {
	background: #F8F8FA;
	border: #fff 1.5px solid;
}

.contain-left {
	width: 75%;
	height: 100%; //
	background: #f66;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin: 20px;
	padding: 10px;
}

.contain-left-arts {
	width: 100%;
	display: flex;
	flex-direction: column;
	padding: 10px;
	margin: 20px;
}

.contain-left-arts-tip {
	width: 100%;
	display: flex;
	justify-content: space-between;
}

.contain-left-arts-info {
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	padding-top: 10px;
}

.contain-left-arts-info .item {
	display: flex;
	justify-content: center;
	align-items: flex-end;
	flex-direction: row;
	padding: 10px;
}

.contain-left-arts-info .item img {
	width: 100px;
	height: 100px;
}

.contain-left-arts-info .item .art-info {
	padding: 10px;
	padding-bottom: 0px;
}

.contain-left-arts-info .item .art-info p {
	margin: 5px;
	width: 100%;
	line-height: 1.2em;
	font-size: 0.75em;
}

.contain-left-arts-info .item .art-info .reflect {
	display: flex;
	justify-content: space-between;
}

.contain-left-arts-info  .reflect .icon {
	width: 20px;
	height: 20px;
	border: 0;
	outline: 0;
	background-repeat: no-repeat;
	background-size: contain;
}

.icon1 {
	background: url('/test/static/jsp/web/img/icon1.png');
}

.icon2 {
	background: url('/test/static/jsp/web/img/icon2.png');
}

.icon3 {
	background: url('/test/static/jsp/web/img/icon3.png');
}

footer {
	width: 100%;
	height: 100px;
	background: #414D55;
	font-size: 0.8em;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-around;
}

footer p {
	color: #fff;
}

footer hr {
	border: 0;
	width: 100%;
	height: 10px;
	background: #3A76BF;
}
</style>
</head>
<body>
	<header>
		<div class="header-banner"></div>
		<h1 class="header-h1" onclick="location.href='/test/index.html';">你好，欢迎来到KissShot的小窝</h1>
		<nav>
			<ul>
				<li><a>首页</a></li>
				<li><a>分类</a></li>
				<li><a>时间线</a></li>
				<li><a>我的工具</a></li>
				<li><a>API</a></li>
				<li><a>关于我</a></li>
				<li class="search"><input type="text" class="search-box" /> <img
					class="search-btn" /></li>
			</ul>
		</nav>
	</header>








	<div class="contain">
		<div class="contain-left">



			<div class="contain-left-arts item">
				<div class="contain-left-arts-tip">
					<span>学习笔记</span> <span><a>更多</a></span>
				</div>
				<div class="contain-left-arts-info">
					<div class="item">
						<img alt="" src="/test/static/jsp/web/img/album1.jpg">
						<div class="art-info">
							<h3>学习笔记标题一</h3>
							<p>学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：</p>
							<div class="reflect">
								<span href="#" class="view-times"><img class="icon icon1" />查看次数</span>
								<span href="#" class="like-times"><img class="icon icon2" />喜欢次数</span>
								<a href="#" class="look-more"><img class="icon icon3" />查看详情</a>
							</div>
						</div>
					</div>


					<div class="item">
						<img alt="" src="/test/static/jsp/web/img/album2.jpg">
						<div class="art-info">
							<h3>学习笔记标题二</h3>
							<p>学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：</p>
							<div class="reflect">
								<span href="#" class="view-times"><img class="icon icon1" />查看次数</span>
								<span href="#" class="like-times"><img class="icon icon2" />喜欢次数</span>
								<a href="#" class="look-more"><img class="icon icon3" />查看详情</a>
							</div>
						</div>
					</div>


					<div class="item">
						<img alt="" src="/test/static/jsp/web/img/album3.jpg">
						<div class="art-info">
							<h3>学习笔记标题三</h3>
							<p>学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：学习笔记一的内容：</p>
							<div class="reflect">
								<span href="#" class="view-times"><img class="icon icon1" />查看次数</span>
								<span href="#" class="like-times"><img class="icon icon2" />喜欢次数</span>
								<a href="#" class="look-more"><img class="icon icon3" />查看详情</a>
							</div>
						</div>
					</div>

				</div>
			</div>














		</div>

		<div class="contain-right">

			<div class="contain-right-ins item">
				<img alt="face" width="100%" height="100%"
					src="/test/static/jsp/web/img/face.jpg">

				<div class="contain-right-ins-text">
					<h2>KissShot</h2>
					<p>自我评价：</p>
					<p>勤劳刻苦，踏实肯干，为人谦虚谨慎，处世友善谦和。</p>
					<p>人生格言：</p>
					<p>我将永不屈服于这失控的世界，自由地追逐繁星。</p>
					<p>邮箱：3043856477@qq.com</p>
				</div>
			</div>

			<div class="contain-right-ins item">
				<img alt="face" width="100%" height="100%"
					src="/test/static/jsp/web/img/face.jpg">

				<div class="contain-right-ins-text">
					<h2>KissShot</h2>
					<p>自我评价：</p>
					<p>勤劳刻苦，踏实肯干，为人谦虚谨慎，处世友善谦和。</p>
					<p>人生格言：</p>
					<p>我将永不屈服于这失控的世界，自由地追逐繁星。</p>
					<p>邮箱：3043856477@qq.com</p>
				</div>
			</div>

			<div class="contain-right-ins item">
				<img alt="face" width="100%" height="100%"
					src="/test/static/jsp/web/img/face.jpg">

				<div class="contain-right-ins-text">
					<h2>KissShot</h2>
					<p>自我评价：</p>
					<p>勤劳刻苦，踏实肯干，为人谦虚谨慎，处世友善谦和。</p>
					<p>人生格言：</p>
					<p>我将永不屈服于这失控的世界，自由地追逐繁星。</p>
					<p>邮箱：3043856477@qq.com</p>
				</div>
			</div>

		</div>

	</div>

















	<footer>
		<hr />
		<p>Copyright © 2019-2020 KissShot.top 保留所有版权</p>
		<hr />
	</footer>
</body>

<script type="text/javascript">
	let header = document.getElementsByTagName('header')[0];
</script>

</html>