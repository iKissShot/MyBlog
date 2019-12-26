<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="/static/jsp/web/css/index.css">

<link rel="stylesheet" href="/static/jsp/web/css/userCenter.css">

<table style="margin-top: 50px; margin-bottom: 50px;">
	<tr>
		<td>用户总数</td>
		<td>${userCount }</td>
		<td>文章总数</td>
		<td>${articleCount }</td>
		<td>评论总数</td>
		<td>${commentCount }</td>
		<td>分类总数</td>
		<td>${sortCount }</td>
		<td>标签总数</td>
		<td>${labelCount }</td>
	</tr>
</table>



<footer>
	<hr />
	<p>Copyright © 2019-2020 KissShot.top 保留所有版权</p>
	<hr />
</footer>