<%@page import="top.kissshot.myblog.pojo.Category"%>
<%@page import="top.kissshot.myblog.pojo.Site"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>

<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>

<script type="text/javascript"
	src="/static/jsp/utils/_02_nav/js/status.js"></script>
<script type="text/javascript"
	src="/static/jsp/utils/_02_nav/js/opCategory.js"></script>
<script type="text/javascript"
	src="/static/jsp/utils/_02_nav/js/opSite.js"></script>

<link rel="stylesheet" href="/static/jsp/utils/_02_nav/css/link.css">
<link rel="stylesheet" href="/static/jsp/utils/_02_nav/css/index.css">

</head>
<body>
	<div class="body-bg"></div>
	<div class="container flex-center flex-column">
		<header>
			<div class="datetime">
				<span class="font-small"></span>
				<span class="font-big"></span>
			</div>
			<div class="search">
				<input type="text" id="search-box" class="search-box" />
				<input type="button" id="search-baidu" class="search-btn font-white"
					value="搜百度" />
				<input type="button" id="search-google"
					class="search-btn font-white" value="问谷歌" />
			</div>
			<div class="motto">
				<p class="font-small">古之立大事者，不惟有超世之才，亦必有坚忍不拔之志。</p>
			</div>
		</header>
		<div class="main">
			<table class="big-table">
				<thead>
					<tr>
						<td colspan="3">
							<div class="tip flex-row-between flex-v-center">
								<span class="item">
									<span class="item">
										<c:choose>
											<c:when test="${user.uid != null}">
											${user.name }
											<span class="item" id="tip">在做什么呢？</span>
											</c:when>
											<c:otherwise>
												<a onclick="login(this)">[大佬，点我登录] </a>
											</c:otherwise>
										</c:choose>
									</span>
									<span>
										<span class="item" id="theme"
											onclick="$(this).attr('theme', '1_0');getTheme(this);"
											theme="${type }">推荐样式</span>
										<span class="item" onclick="changeBG(this)" id='bgChange'>绅士模式</span>
										<span class="item" onclick="changeScreen(this)"
											id='widthChange'>宽屏模式</span>
										<span class="item">
											<a id="manual" onclick="changeCategoryEdit(this)">修改全部分类</a>
										</span>
									</span>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<hr class="dashed" />
						</td>
					</tr>
				</thead>
				<tbody>

					<!-- 

					<tr class="bg-pink" id="list-op">
						<td colspan="3">
							<table class="op-table">
								<tr>
									<td>
										<span onclick="categoryUp(this)">
											<a>分类上移</a>
										</span>
									</td>
									<td>
										<span onclick="categoryTop(this)">
											<a>分类置顶</a>
										</span>
									</td>
									<td>
										<span onclick="categoryAdd(this)">
											<a>增加分类</a>
										</span>
									</td>
									<td>
										<span>
											<a>请三思而后行</a>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span onclick="categoryDown(this)">
											<a>分类下移</a>
										</span>
									</td>
									<td>
										<span onclick="categoryBottom(this)">
											<a>分类置底</a>
										</span>
									</td>
									<td>
										<span onclick="categoryDelete(this)">
											<a>删除分类</a>
										</span>
									</td>
									<td>
										<span onclick="deleteMulSite(this)">
											<a>批量删除链接</a>
										</span>
									</td>
								</tr>
							</table>
						</td>
					</tr>

					<tr id="list-body">
						<td>
							<span class="item-category">
								<span id="categoryName" style="color: red">温馨提示</span>
								<button class="btn" id="renameBtn"
									onclick="renameCategory(this)">重命名</button>
							</span>
						</td>
						<td>
							<div class="list">

								<c:forEach begin="1" end="1">
									<span class="item">
										<input type="checkbox" class="item-select" />
										<img class="item-icon icon-url">
										<a href="http://KissShot.top">
											<span class="item-title">鼠标移到这段文字右侧来新增分类，并在新分类中添加站点~但修改本分类无效，试一试你就懂了~</span>
										</a>

										<span class="item-op">
											<a onclick="delItem(this)">
												<img class="item-icon icon-del">
												删除
											</a>
											<a onclick="reNameItem(this)">
												<img class="item-icon icon-rename">
												重命名
											</a>
											<a onclick="reUrlItem(this)">
												<img class="item-icon icon-reurl">
												重定向
											</a>
											<a onclick="reIconItem(this)">
												<img class="item-icon icon-reicon">
												改图标
											</a>
											<a onclick="mvUpItem(this)">
												<img class="item-icon icon-up">
												上移
											</a>
											<a onclick="mvDownItem(this)">
												<img class="item-icon icon-down">
												下移
											</a>
											<a onclick="mvTopItem(this)">
												<img class="item-icon icon-top">
												置顶
											</a>
											<a onclick="mvBottomItem(this)">
												<img class="item-icon icon-bottom">
												置底
											</a>
											<a onclick="addItem(this)">
												<img class="item-icon icon-add">
												新增
											</a>
										</span>

									</span>
								</c:forEach>

							</div>
						</td>
						<td class="editBtn-contain" onmouseenter="changeItemEdit(this)"
							onmouseleave="changeItemEdit(this)">
							<button class="btn" id="editBtn" onclick="commitItemEdit(this)">修改</button>
						</td>
					</tr>

					<tr>
						<td colspan="3">
							<hr class="dashed" />
						</td>
					</tr>
					
					-->

					<%
						List<Category> categories = (List<Category>) request.getAttribute("categories");
						for (Category c : categories) {
							String str = "<tr class=\"bg-pink\" id=\"list-op\"> " + "<td colspan=\"3\">"
									+ "<table class=\"op-table\">" + "<tr>"
									+ "<td><span onclick=\"categoryUp(this)\">分类上移</span></td>"
									+ "<td><span onclick=\"categoryTop(this)\">分类置顶</span></td>"
									+ "<td><span onclick=\"categoryAdd(this)\">增加分类</span></td>" + "<td><span>请三思二后行</span></td>"
									+ "</tr>" + "<tr>" + "<td><span onclick=\"categoryDown(this)\">分类下移</span></td>"
									+ "<td><span onclick=\"categoryBottom(this)\">分类置底</span></td>"
									+ "<td><span onclick=\"categoryDelete(this)\">删除分类</span></td>"
									+ "<td><span onclick=\"deleteMulSite(this)\">批量删除链接</span></td>" + "</tr>" + "</table>"
									+ "</td>" + "</tr>"
									+ "<tr id=\"list-body\" onmouseenter=\"changeItemEdit(editBtn, renameBtn, this)\""
									+ "onmouseleave=\"changeItemEdit(editBtn, renameBtn, this)\">"
									+ "<td><span class=\"item-category\"><span order=\"" + c.getOrder() + "\" cid=\"" + c.getCid()
									+ "\" " + "id=\"categoryName\">" + c.getName() + "</span>"
									+ "<button class=\"btn\" id=\"renameBtn\""
									+ "onclick=\"renameCategory(this)\">重命名</button> </span></td>" + "<td>"
									+ "<div class=\"list\">";

							out.print(str);
							for (Site s : (List<Site>) request.getAttribute("cid" + c.getCid())) {
								str = "<span class=\"item\"> <input type=\"checkbox\""
										+ "class=\"item-select\" /> <img class=\"item-icon icon-url\"><a order=\"" + s.getOrder()
										+ "\" sid=\"" + s.getSid() + "\" " + "href=\"" + s.getUrl()
										+ "\"> <span class=\"item-title\">" + s.getName() + "</span></a>"
										+ "<span class=\"item-op\"> <a onclick=\"delItem(this)\">"
										+ "<img class=\"item-icon icon-del\">删除" + "</a> <a onclick=\"reNameItem(this)\"> <img "
										+ "class=\"item-icon icon-rename\">重命名" + "</a> <a onclick=\"reUrlItem(this)\"> <img "
										+ "class=\"item-icon icon-reurl\">重定向" + "</a> <a onclick=\"reIconItem(this)\"> <img "
										+ "class=\"item-icon icon-reicon\">改图标" + "</a> <a onclick=\"mvUpItem(this)\"><img "
										+ "class=\"item-icon icon-up\">上移</a> <a " + "onclick=\"mvDownItem(this)\"><img "
										+ "class=\"item-icon icon-down\">下移</a>" + "<a onclick=\"mvTopItem(this)\"><img "
										+ "class=\"item-icon icon-top\">置顶</a><a " + "onclick=\"mvBottomItem(this)\"><img "
										+ "class=\"item-icon icon-bottom\">置底</a><a " + "onclick=\"addItem(this)\"><img "
										+ "class=\"item-icon icon-add\">新增</a>" + "</span>" + "</span>";
								out.print(str);
							}
							str = "</div>" + "</td>" + "<td class=\"editBtn-contain\" onmouseenter=\"changeItemEdit(this)\""
									+ "onmouseleave=\"changeItemEdit(this)\"><button class=\"btn\" id=\"editBtn\""
									+ "onclick=\"commitItemEdit(this)\">修改</button></td>" + "</tr>" + "<tr>"
									+ "<td colspan=\"3\"><hr class=\"dashed\" /></td>" + "</tr>";
							out.print(str);
						}
					%>
				</tbody>
				<tfoot>
					<tr class="bg-pink" id="list-op">
						<td colspan="3">
							<table class="op-table">
								<tr>
									<td>
										<span onclick="categoryUp(this)">
											<a>分类上移</a>
										</span>
									</td>
									<td>
										<span onclick="categoryTop(this)">
											<a>分类置顶</a>
										</span>
									</td>
									<td>
										<span onclick="categoryAdd(this)">
											<a>增加分类</a>
										</span>
									</td>
									<td>
										<span>
											<a>请三思而后行</a>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span onclick="categoryDown(this)">
											<a>分类下移</a>
										</span>
									</td>
									<td>
										<span onclick="categoryBottom(this)">
											<a>分类置底</a>
										</span>
									</td>
									<td>
										<span onclick="categoryDelete(this)">
											<a>删除分类</a>
										</span>
									</td>
									<td>
										<span onclick="deleteMulSite(this)">
											<a>批量删除链接</a>
										</span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr id="list-body">
						<td>
							<span class="item-category">
								<span order="_order_" cid="_cid_" id="categoryName">
									Collection
									<sup style="color: red">new</sup>
								</span>
								<button class="btn" id="renameBtn"
									onclick="renameCategory(this)">重命名</button>
							</span>
						</td>
						<td>
							<div class="list">
								<span class="item">
									<input type="checkbox" class="item-select" />
									<img class="item-icon icon-url">
									<a order="1" sid="_sid_" href="http://KissShot.top"
										target="blank">
										<span class="item-title">
											KissShot's Blog
											<sup style="color: red">hot</sup>
										</span>
									</a>
									<span class="item-op">
										<a onclick="delItem(this)">
											<img class="item-icon icon-del">
											删除
										</a>
										<a onclick="reNameItem(this)">
											<img class="item-icon icon-rename">
											重命名
										</a>
										<a onclick="reUrlItem(this)">
											<img class="item-icon icon-reurl">
											重定向
										</a>
										<a onclick="reIconItem(this)">
											<img class="item-icon icon-reicon">
											改图标
										</a>
										<a onclick="mvUpItem(this)">
											<img class="item-icon icon-up">
											上移
										</a>
										<a onclick="mvDownItem(this)">
											<img class="item-icon icon-down">
											下移
										</a>
										<a onclick="mvTopItem(this)">
											<img class="item-icon icon-top">
											置顶
										</a>
										<a onclick="mvBottomItem(this)">
											<img class="item-icon icon-bottom">
											置底
										</a>
										<a onclick="addItem(this)">
											<img class="item-icon icon-add">
											新增
										</a>
									</span>
								</span>
							</div>
						</td>
						<td class="editBtn-contain" onmouseenter="changeItemEdit(this)"
							onmouseleave="changeItemEdit(this)">
							<button class="btn" id="editBtn" onclick="commitItemEdit(this)">修改</button>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<hr class="dashed" />
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<footer>
			<p class="item">
				<a>感谢小可爱的支持 ~Q~</a>
			</p>
		</footer>
	</div>

	<script type="text/javascript"
		src="/static/jsp/utils/_02_nav/js/base.js"></script>

</body>