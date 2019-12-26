<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>文章——KissShot的康熙小窝</title>

<link rel="stylesheet" href="/static/jsp/web/css/index.css">

</head>
</head>
<body>



	<c:import url="/dev/header"></c:import>







	<div class="contain">
		<div class="contain-left">


			<div class="contain-left-arts item">

				<div class="contain-left-arts-tip">
					<span>${sort.name }</span>
					<hr />
					<span>${sort.alias }</span>
					<hr />
					<span><a>文章总数:${articlesCount }</a></span>
				</div>
				<hr />
				<div class="contain-left-arts-tip">
					<span>描述：${sort.description }</span>
				</div>

				<div class="contain-left-arts-info">

					<c:forEach items="${page.list}" var="article" varStatus="st">
						<div class="item">
							<img alt="" src="/static/jsp/web/img/album1.jpg">
							<div class="art-info">
								<h3>${article.title }(全文共${fn:length(article.content)}字)</h3>
								<p>${
										fn:length(article.content) <= 150 ? article.content : 
										fn:length(article.content) <= 300 ? article.content.substring(0, 150).concat(' ...') : 
										article.content.substring(0, 200).concat(' ...')
									}</p>
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
						<a href="?sid=${sort.sid}&start=1">[首 页]</a>
						<c:if test="${page.pageNum > 1 }">
							<a href="?sid=${sort.sid}&start=${page.pageNum - 1}">[上一页]</a>
						</c:if>
						<c:if test="${page.pageNum < page.pages }">
							<a href="?sid=${sort.sid}&start=${page.pageNum + 1}">[下一页]</a>
						</c:if>
						<a href="?sid=${sort.sid}&start=${page.pages}">[末 页]</a>
					</div>

				</div>
			</div>



			<div>

				<c:if test="${articlesCount == 0 }">
					<h1>暂无内容啊你</h1>
				</c:if>

			</div>












		</div>

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



			<c:import url="/dev/right"></c:import>



		</div>

	</div>









	<c:import url="/dev/footer"></c:import>


</body>




<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>






</html>