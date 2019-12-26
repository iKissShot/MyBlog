<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>文章——KissShot的康熙小窝</title>

<!-- 打开页面自动调用了ajax，因此js的导入要放在最前面 -->
<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>

<link rel="stylesheet" href="/static/jsp/web/css/index.css">
<link rel="stylesheet" href="/static/jsp/web/css/userEdit.css">

<!-- 富文本编辑器summarynot -->
<!-- 
<link href="/static/jsp/web/summernote/bootstrap.3.3.4.css"
	rel="stylesheet">
<script src="/static/jsp/web/summernote/jquery.min.js"></script>
<script src="/static/jsp/web/summernote/bootstrap.3.3.4.js"></script>
<link href="/static/jsp/web/summernote/summernote.css" rel="stylesheet">
<script src="/static/jsp/web/summernote/summernote.js"></script>
-->

<!-- edit -->
<!-- 
<link rel="stylesheet"
	href="/static/jsp/web/assets/design/css/trumbowyg.css">
<script src="/static/jsp/web/assets/jquery.min.js"></script>
<script src="/static/jsp/web/assets/trumbowyg.js"></script>
<script src="/static/jsp/web/assets/plugins/base64/trumbowyg.base64.js"></script>
-->

</head>
</head>
<body>

	<c:import url="/dev/header"></c:import>






	<!-- edit
	<div id="odiv" style="display: none; position: absolute; z-index: 100;">
		<img src="assets/pic/sx.png" title="缩小" border="0" alt="缩小"
			onclick="sub(-1);" /> <img src="assets/pic/fd.png" title="放大"
			border="0" alt="放大" onclick="sub(1)" /> <img src="assets/pic/cz.png"
			title="重置" border="0" alt="重置" onclick="sub(0)" /> <img
			src="assets/pic/sc.png" title="删除" border="0" alt="删除"
			onclick="del();odiv.style.display='none';" />
	</div>
	<div onmousedown="show_element(event)" style="clear: both"
		id="customized-buttonpane" class="editor"></div>
 -->


	<!-- 
	<div id="summernote">
		<p>
			Hello Summernote ,<b>Hello jQuery插件库</b>
		</p>
	</div>
	<script>
		$(document).ready(function() {
			$('#summernote').summernote();
		});
	</script>
 -->






	<div class="contain">


		<div class="contain-left">




			<div class="contain-left-arts item">

				<div class="contain-left-arts-tip">
					<span><h3>${article.title }(全文共${fn:length(article.content)}字)</h3></span>
					<div>
						<a onclick=articleLike()>
							<button onclick='checkLogin()'>喜欢</button>
						</a>
					</div>

				</div>

				<%
					String href = request.getRequestURL() + "";
				%>
				<script>
				function checkLogin(){
					if(${uid == null}){
						alert('请先登录');
						document.location.href='userLoginBack?href=<%=request.getRequestURL().substring(request.getRequestURL().lastIndexOf("/dev"))%>' + '?aid=' + ${article.aid};
						return false;
					} else{
						return true;
					}
				}
				</script>

				<div class="contain-left-arts-info">

					<div class="item">
						<img alt="" src="/static/jsp/web/img/album1.jpg">
						<div class="art-info">
							<div class="reflect">
								<span class="view-times"><img class="icon icon1" /><a>查看次数${article.viewCount}</a></span>
								<span class="like-times"><img class="icon icon2" /><a>喜欢次数${article.likeCount}</a></span>
								<span class="look-more"><img class="icon icon3" /><a>评论次数${article.commentCount}</a></span>
							</div>
							<p>
								${article.content}
								<!-- ${
									fn:length(article.content) <= 150 ? article.content : 
									fn:length(article.content) <= 300 ? article.content.substring(0, 150).concat(' ...') : 
									article.content.substring(0, 200).concat(' ...')
								}
							 -->
							</p>
						</div>
					</div>

					<script type="text/javascript">
						//增加like数量
						function articleLike() {
							$.get('article/likeup/' + ${article.aid}, function(likeCount){
								$('#articleLikeCount').html(likeCount);
							}).success(function(){
							}).error(function(){
								alert( '喜欢失败');
							}).complete(function(){
							});
						}
						//增加阅读数量
						html = $('#articleViewCount').load('article/viewup/' + ${article.aid});
					</script>

				</div>
			</div>







			<div>

				<c:if test="${articleCommentsCount == 0 }">
					<h1>暂无评论啊你</h1>
				</c:if>

				<table style="width: 100%">

					<form action="addComment" method="POST">
						<tr>
							<td><img alt="" src="/static/jsp/web/img/search.png"></td>
							<td><input type="text" name="content" value="支持博主,加油啊" /></td>
							<td colspan="2" align="center"><input type="hidden"
								name="aid" value="${article.aid }" />
								<button
									onclick="
									if(${uid == null}){
										alert('请先登录');
										<%String backUrl = request.getRequestURL().toString();
										backUrl = backUrl.substring(backUrl.lastIndexOf("/dev"));%>
										document.location.href='userLoginBack?href=<%=backUrl%>' + '?aid=' + ${article.aid};
										return  false;
									} else{
										return true;
								}
								"
									style="border: 0px; background: #99f; padding: 5px 10px;">
									<a style="color: #fff">发送</a>
								</button></td>
						</tr>
					</form>


					<c:forEach items="${articleComments}" var="c" varStatus="st">
						<tr>
							<td>
								<div>
									<p>${c.uid}</p>
								</div>
							</td>
							<td>
								<div>
									<p>${c.content}</p>
								</div>
							</td>
							<td style="text-align: center;">
								<div>
									<p id="likeCount${c.cid }">${c.likeCount}</p>
								</div>
								<div>
									<a onclick=commentLike(${c.cid})>
										<button onclick='checkLogin()'>赞同</button>
									</a>
								</div>
							</td>
							<td>
								<div>
									<p>${c.easyDate}</p>
								</div>
							</td>
						</tr>
					</c:forEach>

					<script type="text/javascript">

					
						function commentLike(cid) {
							$.get('comment/likeup/' + cid, function(likeCount){
								$('#likeCount' +  cid).html(likeCount);
							}).success(function(){
								//alert( '已赞同');
							}).error(function(){
								alert( '赞同失败');
							}).complete(function(){
								//alert('请求结束')
							});
						}
					</script>
				</table>


			</div>






			<c:if test="${uid != null && uid == article.uid}">
				<a
					onclick="
					if($('#updateArticle').css('display') == 'none'){
						$('#updateArticle').css('display', 'block');
					} else{
						$('#updateArticle').css('display', 'none');
					}">修改文章</a>
			</c:if>


			<div id="updateArticle" style="display: none; transition: 0.5s;">
				<form action="/dev/updateArticle" method="POST"
					style="background: #fff;">
					<table border="1px" frame="box" cellpadding="20px"
						cellspacing="5px">
						<caption>
							文章信息<br />
						</caption>
						<tr>
							<td>*<span>AID</span>*
							</td>
							<td><input tabindex="-1" readonly="readonly" type="text"
								name="aid" value="${article.aid }"></td>
						</tr>
						<tr>
							<td>*<span>UID</span>*
							</td>
							<td><input tabindex="-1" readonly="readonly" type="text"
								name="uid" value="${article.uid}"></td>
						</tr>
						<tr>
							<td>*<span>分类</span>*
							</td>
							<td><input tabindex="-1" type="text" value="${article.sid}"
								name="sid"> <br />
								<div>
									<h3>${article.sid}</h3>
								</div></td>
						</tr>
						<tr>
							<td>*<span>标签</span>*
							</td>
							<td><input placeholder="请输入密码" tabindex="2" type="text"
								value="${article.lid}" name="lid">
								<div>
									<h3>${article.lid}</h3>
								</div></td>
						</tr>
						<tr>
							<td>*<span>标题</span>*
							</td>
							<td><input tabindex="3" type="text" placeholder="请输入邮箱"
								value="${article.title}" name="title"></td>
						</tr>
						<tr>
							<td>*<span>浏览次数</span>*
							</td>
							<td><input tabindex="4" type="text" placeholder="请输入年龄"
								value="${article.viewCount}" name="viewCount"></td>
						</tr>
						<tr>
							<td>*<span>喜欢次数</span>*
							</td>
							<td><input tabindex="5" type="text" placeholder="请输入性别"
								value="${article.likeCount}" name="likeCount"></td>
						</tr>
						<tr>
							<td>*<span>评论次数</span>*
							</td>
							<td><input tabindex="6" type="text" placeholder="请输入宣言"
								value="${article.commentCount}" name="commentCount"></td>
						</tr>

						<tr>
							<td>*<span>发文时间</span>*
							</td>
							<td><input tabindex="6" type="text" placeholder="请输入宣言"
								value="${article.easyDate }" name="date"></td>
						</tr>
						<tr>
						<tr>
							<td colspan="2"><textarea name="content" cols="128"
									rows="30"
									style="background: #fff; maring: 20px auto; text-align: center; max-width: 1100px; min-width: 800px; width: 100%;">
					${article.content}</textarea></td>
						</tr>
						<tr>
							<td colspan="2"><button
									onclick="alert(document.getElementsByClassName('nicEdit-main')[0].html); return false;">清空内容</button>
								<button
									onclick="let tem =document.getElementsByName('date')[0].value; 
								let str = tem.split(' ')[0].split('-');document.getElementsByName('date')[0].value=new Date(str[0], str[1], str[2]);return true;">确认修改</button></td>
						</tr>
					</table>
				</form>
			</div>


			<script type="text/javascript" src="/static/jsp/web/js/nicEdit.js"></script>
			<script type="text/javascript">
				bkLib.onDomLoaded(function() {
					nicEditors.allTextAreas()
				});
			</script>












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





<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>






</html>