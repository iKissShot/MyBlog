<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="icon" href="./favicon.ico">
<link rel="stylesheet" href="/test/static/jsp/web/css/index.css">

<header>
	<div class="header-banner"></div>
	<h1 class="header-h1" onclick="location.href='/test/dev/index';">你好，欢迎来到KissShot的小窝</h1>
	<nav>
		<ul>
			<li><a>首页</a></li>
			<li><a>分类</a></li>
			<li><a>时间线</a></li>
			<li><a>我的工具</a></li>
			<li><a>API</a></li>
			<li><a>关于我</a></li>
			<li><c:choose>
					<c:when test="${uid != null }">
						<a href="userCenter">${name }</a>
					</c:when>
					<c:otherwise>
						<a href="userLogin">点我登录</a>
					</c:otherwise>
				</c:choose></li>
			<li class="search"><input type="text" class="search-box" /> <img
				class="search-btn" /></li>
		</ul>
	</nav>
</header>