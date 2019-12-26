<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>关于我——KissShot的康熙小窝</title>

<link rel="stylesheet" href="/static/jsp/web/css/index.css">
<link rel="stylesheet" href="/static/jsp/web/css/userCenter.css">

<style type="text/css">
.contain-right-ins {
	text-align: center;
}
</style>
</head>
<body>

	<c:import url="/dev/header"></c:import>



	<div class="contain-right-ins item">
		<img alt="face" width="300px" height="300px"
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





	<table>
		<caption>发文数据</caption>
		<tr>
			<td>用户总数</td>
			<td>${userCount }</td>
		</tr>
		<tr>
			<td>文章总数</td>
			<td>${articleCount }</td>
		</tr>
		<tr>
			<td>评论总数</td>
			<td>${commentCount }</td>
		</tr>
		<tr>
			<td>分类总数</td>
			<td>${sortCount }</td>
		</tr>
		<tr>
			<td>标签总数</td>
			<td>${labelCount }</td>
		</tr>
	</table>





	<c:import url="/dev/footer"></c:import>
	
	
	


</body>
</html>