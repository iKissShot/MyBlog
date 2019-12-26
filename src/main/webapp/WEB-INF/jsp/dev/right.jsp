<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
	<div class="contain-right-ins item">
		<div class="contain-right-ins-text">
			<h2>最热文章</h2>
			<c:forEach items="${hotArticles}" var="article" varStatus="st">
				<p>${
								article.title 
							}</p>
			</c:forEach>
		</div>
	</div>

	<div class="contain-right-ins item">

		<div class="contain-right-ins-text">
			<h2>最新评论</h2>
			<c:forEach items="${newComments}" var="comment" varStatus="st">
				<p>
					${
								fn:length(comment.content) >= 80 ? comment.content.substring(0, 40).concat(' ...') : 
								fn:length(comment.content) >= 50 ? comment.content.substring(0, 30).concat(' ...') : 
								fn:length(comment.content) >= 20 ? comment.content.substring(0, 15).concat(' ...') : 
								comment.content
							}
					<br /> <span>${comment.likeCount}</span><br /> <span>${comment.easyDate}</span>
				</p>
			</c:forEach>
		</div>
	</div>
</div>