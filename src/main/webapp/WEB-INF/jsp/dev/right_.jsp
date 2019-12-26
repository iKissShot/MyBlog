<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="/static/jsp/web/css/index.css">

<header>
	<div class="header-banner"></div>
	<h1 class="header-h1" onclick="location.href='/dev/index';">你好，欢迎来到KissShot的小窝</h1>
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
	
	
		<div class="contain-right">

			<div class="contain-right-ins item">
				<img alt="face" width="100%" height="100%"
					src="/static/jsp/web/img/face.jpg">

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
				<img alt="article" width="200px" height="150px"
					src="/static/jsp/web/img/article.jpg">

				<div class="contain-right-ins-text">
					<h2>最热文章</h2>
					<c:forEach items="${articles}" var="art" varStatus="st">
						<p>${art.content}</p>
					</c:forEach>
				</div>
			</div>

			<div class="contain-right-ins item">
				<img alt="comment" width="200px" height="150px"
					src="/static/jsp/web/img/comment.jpg">

				<div class="contain-right-ins-text">
					<h2>最新评论</h2>
					<c:forEach items="${comments}" var="com" varStatus="st">
						<p>
							${com.content}<br /> <span>${com.likeCount}</span><br /> <span>${com.easyDate}</span>
						</p>
					</c:forEach>
				</div>
			</div>

		</div>

	</div>
</header>