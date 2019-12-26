<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>文章——KissShot的康熙小窝</title>

<link rel="stylesheet" href="/static/jsp/web/css/index.css">
<link rel="stylesheet" href="/static/jsp/web/css/userCenter.css">

<link rel="stylesheet" type="text/css"
	href="/static/jsp/web/css/timeline.css">

<style type="text/css">
.content {
	width: 80%;
}
</style>

</head>
</head>
<body>

	<c:import url="/dev/header"></c:import>




	<div class="contain">


		<div class="content">

			<article>
				<h3>2012</h3>
				<c:forEach items="${articles }" var="article" varStatus="st">

					<section>
						<span
							class="point-time point-${article.sid == 1 ? 'red' : article.sid == 2 ? 'green' : 'blue' }"></span>
						<time datetime="${article.easyDate }">
							<span>${article.easyDate.substring(5, 9)}</span> <span>${article.easyDate.substring(0, 4)}</span>
						</time>
						<aside>
							<p class="things">${article.title }(全文共${fn:length(article.content)}字)</p>
							<p class="brief">
								<span
									class="text-${article.sid == 1 ? 'red' : article.sid == 2 ? 'green' : 'blue' }">
									${
										fn:length(article.content) <= 150 ? article.content : 
										fn:length(article.content) <= 300 ? article.content.substring(0, 150).concat(' ...') : 
										article.content.substring(0, 200).concat(' ...') 
									}
								</span>
							</p>
						</aside>
					</section>
				</c:forEach>
			</article>

		</div>




	</div>









	<c:import url="/dev/footer"></c:import>


</body>




<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>






</html>