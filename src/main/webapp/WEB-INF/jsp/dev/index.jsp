<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>KissShot的康熙小窝</title>


</head>
<body>


	<c:import url="/dev/header"></c:import>








	<div class="contain">
		<div class="contain-left">



			<div class="contain-left-arts item">
				<div class="contain-left-arts-tip">
					<span>学习笔记</span> <span></span><span></span><span></span><span></span><span></span><span></span>
					<span><a>更多</a></span>
				</div>
				<div class="contain-left-arts-info">


					<div class="item">
						<img alt="" src="/static/jsp/web/img/album1.jpg">
						<div class="art-info">
							<h3>测试文章</h3>
							<p>这是测试文章, 用于测试单篇文章的样式!</p>

							<div class="reflect">
								<span class="view-times"><img class="icon icon1" /><span>查看次数${article.viewCount}</span></span>
								<span class="like-times"><img class="icon icon2" /><span>喜欢次数${article.likeCount}</span></span>
								<span class="look-more"><img class="icon icon3" /><a>查看详情</a></span>
							</div>
						</div>
					</div>



				</div>
			</div>







			<c:forEach items="${sorts}" var="sort" varStatus="st0">



				<div class="contain-left-arts item">
					<div class="contain-left-arts-tip">
						<span>${sort.name} <c:forEach items="${articleCounts}"
								var="count" varStatus="st1">
								<c:if test="${st1.index == sort.sid - 1}">
									(共${count}篇文章)
								</c:if>
							</c:forEach>

						</span> <span></span><span></span><span></span><span></span><span></span><span></span>
						<span><a href="sort?sid=${sort.sid }">更多</a></span>
					</div>
					<div class="contain-left-arts-info">
						<c:forEach items="${articles}" var="article" varStatus="st">


							<!-- <h1>${st.index}+${sort.sid* 3}+${sort.sid * 3 + 3}</h1> -->

							<c:if
								test="${st.index >= (sort.sid - 1) * 3 && st.index < (sort.sid - 1) * 3 + 3}">


								<div class="item">
									<img alt="" src="/static/jsp/web/img/album3.jpg">
									<div class="art-info">
										<h3>
											<a>${article.title}(全文共${fn:length(article.content)}</a>字)
										</h3>
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


							</c:if>


						</c:forEach>



					</div>
				</div>
			</c:forEach>







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