<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>KissShot的康熙小窝</title>

<link rel="stylesheet" href="/static/jsp/web/css/index.css">
<link rel="stylesheet" href="/static/jsp/web/css/userCenter.css">


</head>
</head>
<body>

	<c:import url="/dev/header"></c:import>







	<c:if test="${user.role> 100 }">
		<div style="margin: 50px auto; text-align: center;">
			<a href="/dev/adminCenter"
				style="background: #99f; color: #fff; padding: 30px; 10 px; margin: 10p;">进入管理员界面</a>
		</div>
	</c:if>


	<br />


	<div style="margin: 20px auto; text-align: center;">
		<a href="/dev/userOut"
			onclick="if(confirm('确定退出登录'))return true;else return false;"
			style="padding: 10px 20px; background: #f99; color: #fff; margin: 10p;">退出登录</a>
	</div>






	<div>
		<table border="1px" frame="box" cellpadding="20px" cellspacing="5px">
			<caption>
				用户信息<br /> <a href="userEdit">修改</a>
			</caption>
			<tr>
				<td>*<span>UID</span>*
				</td>
				<td>${user.uid }</td>
			</tr>
			<tr>
				<td>*<span>ROLE</span>*
				</td>
				<td>${user.role }</td>
			</tr>
			<tr>
				<td>*<span>昵称</span>*
				</td>
				<td>${user.name }</td>
			</tr>
			<tr>
				<td>*<span>密码</span>*
				</td>
				<td>${user.pwd }</td>
			</tr>
			<tr>
				<td>*<span>邮箱</span>*
				</td>
				<td>${user.email }</td>
			</tr>
			<tr>
				<td>*<span>年龄</span>*
				</td>
				<td>${user.age }</td>
			</tr>
			<tr>
				<td>*<span>性别</span>*
				</td>
				<td>${user.gender }</td>
			</tr>
			<tr>
				<td>*<span>宣言</span>*
				</td>
				<td>${user.motto }</td>
			</tr>
		</table>
	</div>








	<div class="contain">

		<div class="contain-left"
			style="width: 100%; min-width: 600px; max-width: 1200px">






			<div class="contain-left-arts item">
				<div class="contain-left-arts-tip">
					<span>${user.name }的文章汇总</span> <span><a>发文总数: ${articlesCount }</a></span>
				</div>
				<div class="contain-left-arts-info">

					<c:forEach items="${page.list}" var="article" varStatus="st">
						<div class="item">
							<img alt="" src="/static/jsp/web/img/album3.jpg">
							<div class="art-info">
								<h3>${article.title}(全文共${fn:length(article.content)}字)</h3>
								<p>${
											fn:length(article.content) <= 150 ? article.content : 
											fn:length(article.content) <= 300 ? article.content.substring(0, 150).concat(' ...') : 
											article.content.substring(0, 200).concat(' ...') 
										}
								</p>
								<div class="reflect">
									<span class="view-times"><img class="icon icon1" /><span>查看次数${article.viewCount}</span></span>
									<span class="like-times"><img class="icon icon2" /><span>喜欢次数${article.likeCount}</span></span>
									<span class="look-more"><img class="icon icon3" /><a
										href="/dev/article?aid=${article.aid}">查看详情${article.commentCount}</a></span>
								</div>
							</div>
						</div>
					</c:forEach>

					<div style="text-align: center; margin: 20px;">
						<a href="?start=1">[首 页]</a>
						<c:if test="${page.pageNum > 1 }">
							<a href="?start=${page.pageNum - 1}">[上一页]</a>
						</c:if>
						<c:if test="${page.pageNum < page.pages }">
							<a href="?start=${page.pageNum + 1}">[下一页]</a>
						</c:if>
						<a href="?start=${page.pages}">[末 页]</a>
					</div>
				</div>
			</div>








		</div>

	</div>











	<c:import url="/dev/footer"></c:import>


</body>




<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>






</html>