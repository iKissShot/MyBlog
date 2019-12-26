<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>KissShot的康熙小窝</title>

<link rel="stylesheet" href="/test/static/jsp/web/css/index.css">

</head>
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>








	<div class="contain">
		<div class="contain-left">



			<div class="contain-left-arts item">
				<div class="contain-left-arts-tip">
					<span>学习笔记</span> <span><a href="sort?sid=0">更多</a></span>
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



				</div>
			</div>





			<div class="contain-left-arts item">
				<div class="contain-left-arts-tip">
					<span>学习笔记</span> <span><a href="sort?sid=2">更多</a></span>
				</div>
				<div class="contain-left-arts-info">


					<c:forEach items="${page.list}" var="article" varStatus="st">
						<div class="item">
							<img alt="" src="/test/static/jsp/web/img/album3.jpg">
							<div class="art-info">
								<h3>${article.title}</h3>
								<p>${article.content}${article.content}${article.content}${article.content}${article.content}${article.content}</p>
								<div class="reflect">
									<span href="#" class="view-times"><img
										class="icon icon1" />查看次数${article.viewCount}</span> <span href="#"
										class="like-times"><img class="icon icon2" />喜欢次数${article.likeCount}</span>
									<a href="/test/dev/article?aid=${article.aid}"
										class="look-more"><img class="icon icon3" />查看详情${article.commentCount}</a>
								</div>
							</div>
						</div>
					</c:forEach>



				</div>
			</div>






			<div class="contain-left-arts item">
				<div class="contain-left-arts-tip">
					<span>学习笔记</span> <span><a href="sort?sid=3">更多</a></span>
				</div>
				<div class="contain-left-arts-info">

					<c:forEach items="${page.list}" var="article" varStatus="st">
						<div class="item">
							<img alt="" src="/test/static/jsp/web/img/album3.jpg">
							<div class="art-info">
								<h3>${article.title}</h3>
								<p>${article.content}${article.content}${article.content}${article.content}${article.content}${article.content}</p>
								<div class="reflect">
									<span href="#" class="view-times"><img
										class="icon icon1" />查看次数${article.viewCount}</span> <span href="#"
										class="like-times"><img class="icon icon2" />喜欢次数${article.likeCount}</span>
									<a href="/test/dev/article?aid=${article.aid}"
										class="look-more"><img class="icon icon3" />查看详情${article.commentCount}</a>
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
				<img alt="article" width="200px" height="150px"
					src="/test/static/jsp/web/img/article.jpg">

				<div class="contain-right-ins-text">
					<h2>最热文章</h2>
					<c:forEach items="${hotArticles}" var="art" varStatus="st">
						<p>${art.content}</p>
					</c:forEach>
				</div>
			</div>

			<div class="contain-right-ins item">
				<img alt="comment" width="200px" height="150px"
					src="/test/static/jsp/web/img/comment.jpg">

				<div class="contain-right-ins-text">
					<h2>最新评论</h2>
					<c:forEach items="${newComments}" var="com" varStatus="st">
						<p>
							${com.content}<br /> <span>${com.likeCount}</span><br /> <span>${com.easyDate}</span>
						</p>
					</c:forEach>
				</div>
			</div>

		</div>

	</div>












	<jsp:include page="_footer.jsp"></jsp:include>


</body>




<script type="text/javascript"
	src="/test/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/test/static/jsp/web/js/mouse.js"></script>






</html>