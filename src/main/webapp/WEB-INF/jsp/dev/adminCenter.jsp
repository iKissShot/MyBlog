<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>KissShot的康熙小窝</title>

<link rel="stylesheet" href="/static/jsp/web/css/index.css">
<link rel="stylesheet" href="/static/jsp/web/css/userCenter.css">


<style>
input, button {
	width: 80px;
	margin: 0 auto;
	text-align: center;
	display: flex;
	justify-content: center;
}

td {
	max-width: 120px;
	min-width: 80px;
	text-align: center;
}
</style>

</head>
</head>
<body>


	<c:import url="/dev/header"></c:import>






	<div style="margin: 50px auto; text-align: center;">
		<a href="/dev/userCenter"
			style="background: #99f; color: #fff; padding: 30px 50px; margin: 10p;">返回普通用户界面</a>
	</div>


	<table>

		<tr>
			<td>用户总数</td>
			<td>${userCount }</td>
			<td><button>管理用户</button></td>
			<td>文章总数</td>
			<td>${articleCount }</td>
			<td><button>管理文章</button></td>
			<td>评论总数</td>
			<td>${commentCount }</td>
			<td><button>管理评论</button></td>
			<td>分类总数</td>
			<td>${sortCount }</td>
			<td><button>管理分类</button></td>
			<td>标签总数</td>
			<td>${labelCount }</td>
			<td><button>管理标签</button></td>
		</tr>

	</table>





	<!-- 确认操作-->
	<script type="text/javascript">
		function checkOperate() {
			if (confirm('确认此操作?')) {
				return true;
			} else {
				return false;
			}
		}
	</script>

	<!-- 删除get -->
	<script>
		function ajaxDelete(ele, url) {
			if (checkOperate()) {
				$.get('/dev/adminCenter/' + url).success(function() {
					$(ele).parent().parent().remove();
				}).error(function() {
					alert('刪除失败');
				});
			}
		}
	</script>

	<!-- ajax -->
	<script>
		function ajax(ele, addUrl, delUrl, opeType) {
			alert(addUrl + ":" + del + ":" + delUrl);
			//addUrl: updateLabel
			//delUrl：deleteLabel/1
			//opType: add
			let tds = $(ele).parent().parent().children("td");
			let arr = new Array();
			let map = new Map();

			let data = {};

			if (opeType == 'add')
				var newEle = '<tr>';
			for (let i = 0; i < tds.length - 2; i++) {
				let e = tds.eq(i).find("input");
				let key = e.attr("name");
				let val = e.val();
				data[key] = val;

				if (opeType == 'add')
					newEle += '<td><input type="text" disabled="disabled" name="' + key + '" value="' + val + '"></td>';
			}

			//具体
			//<td><a onclick="tryUpdate(this, 'updateLabel')">修改</a></td>
			//<td><a onclick="ajaxDelete(this, 'deleteLabel1${label.lid }')">刪除</a></td>

			//最终的
			if (opeType == 'add') {
				newEle += '<td><a onclick="tryUpdate(this, ' + '\'' + updUrl
						+ '\'' + ')">修改</a></td>';
				newEle += '<td><a onclick="ajaxDelete(this, ' + '\'' + delUrl
						+ '\'' + ')">刪除</a></td>';
				newEle += '</tr>';
			}
			let jsonData = JSON.stringify(data, null, "  ");

			if (opeType == 'add')
				url = '/dev/adminCenter/' + updUrl;
			else
				url = '/dev/adminCenter/' + delUrl;

			//alert(newEle);
			alert(url);
			alert(jsonData);

			$.ajax({
				type : 'PUT',
				url : url,
				data : jsonData,
				dataType : 'json',
				contentType : "application/json;charset=utf-8",
				success : function() {
					if (opeType == 'add') {
						$(ele).parent().parent().next().after(newEle);
					} else {
						alert('修改成功');
					}
				},
				error : function() {
					if (opeType == 'add')
						alert('添加失败');
					else
						alert('修改失败');
				}
			});
		}
	</script>

	<!-- 添加post -->
	<script type="text/javascript">
		function ajaxAdd(ele, type, id) {
			if (checkOperate()) {
				ajaxAdd_(ele, type, id);
			}
		}

		function ajaxAdd_(ele, type, id) {
			//type: Label;
			//idType: lid
			let tds = $(ele).parent().parent().parent().children("td");
			let arr = new Array();
			let map = new Map();

			let data = {};
			for (let i = 1; i < tds.length - 1; i++) {
				let e = tds.eq(i).find("input");
				let key = e.attr("name");
				let val = e.val();
				data[key] = val;
			}
			let jsonData = JSON.stringify(data, null, "  ");
			$
					.ajax({
						type : 'POST',
						url : '/dev/adminCenter/add' + type,
						data : jsonData,
						contentType : "application/json;charset=utf-8",
						success : function(resultData) {
							//alert('resultData.lid: ' + resultData.lid);
							//alert('resultData["lid"]: ' + resultData["lid"]);
							let newEle = '<tr>';
							newEle += '<td><input type="text" disabled="disabled" name="' + id + '" value="' + resultData[id]+ '"></td>';
							for (let i = 1; i < tds.length - 1; i++) {
								let key = tds.eq(i).find("input").attr("name");
								newEle += '<td><input type="text" disabled="disabled" name="' + key + '" value="' + resultData[key]+ '"></td>';
							}
							newEle += '<td><a onclick="ajaxUpdate(this, '
									+ '\'update' + type + '\''
									+ ')">修改</a></td>';
							newEle += '<td><a onclick="ajaxDelete(this, '
									+ '\'delete' + type + '/' + resultData[id]
									+ '\'' + ')">刪除</a></td>';
							newEle += '</tr>';
							$(ele).parent().parent().parent().next().after(
									newEle);
							//alert(newEle);
						},
						error : function() {
							alert('增加失败');
						}
					});
		}
	</script>

	<!-- 修改post -->
	<script type="text/javascript">
		function ajaxUpdate(ele, url) {
			if ($(ele).html() == "修改") {
				sta2edit(ele);
			} else {
				if (checkOperate()) {
					ajaxUpdate_(ele, url);
					//ajax(ele, updUrl, delUrl, opeType);
					sta2normal(ele);
				}
			}
		}

		function sta2edit(ele, url) {
			let tds = $(ele).parent().parent().children("td");
			for (let i = 0; i < tds.length - 2; i++) {
				tds.eq(i).find("input").removeAttr("disabled");
			}
			$(ele).html("确定");
		}

		function sta2normal(ele, url) {
			let tds = $(ele).parent().parent().children("td");
			for (let i = 0; i < tds.length - 2; i++) {
				tds.eq(i).find("input").attr("disabled", "disabled");
			}
			$(ele).html("修改");
		}

		function ajaxUpdate_(ele, url) {
			let tds = $(ele).parent().parent().children("td");
			let arr = new Array();
			let map = new Map();

			let data = {};
			for (let i = 0; i < tds.length - 2; i++) {
				let e = tds.eq(i).find("input");
				let key = e.attr("name");
				let val = e.val();
				//arr.push(key);
				//map.set(key, val);
				data[key] = val;
			}
			let jsonData = JSON.stringify(data, null, "  ");
			$.ajax({
				type : 'POST',
				url : '/dev/adminCenter/' + url,
				data : jsonData,
				contentType : "application/json;charset=utf-8",
				error : function() {
					alert('修改失败');
				}
			});
		}
	</script>



	<!-- 用户管理 -->
	<table>
		<tr>
			<td colspan="11">
				<div style="margin: 50px auto; text-align: center;">
					<a
						style="background: #f99; color: #fff; padding: 10px 300px; margin: 10p;">用戶管理</a>
				</div>
			</td>
		</tr>
		<tr>
			<td><img alt="" src="/static/jsp/web/img/search.png"></td>
			<td><input type="text" name="role"></td>
			<td><input type="text" name="name"></td>
			<td><input type="text" name="pwd"></td>
			<td><input type="text" name="email"></td>
			<td><input type="text" name="age"></td>
			<td><input type="text" name="gender"></td>
			<td><input type="text" name="motto"></td>
			<td><input type="text" name="date"></td>
			<td colspan="2" align="center">
				<button style="border: 0px; background: #99f; padding: 5px 10px;">
					<a style="color: #fff" onclick="ajaxAdd(this, 'User', 'uid')">增加</a>
				</button>
			</td>
		</tr>
		<tr>
			<td>uid</td>
			<td>role</td>
			<td>name</td>
			<td>pwd</td>
			<td>email</td>
			<td>age</td>
			<td>gender</td>
			<td>motto</td>
			<td>date</td>
			<td>修改</td>
			<td>刪除</td>
		</tr>
		<c:forEach items="${userPage.list }" var="user" varStatus="st">
			<tr>
				<td><input type="text" disabled="disabled" name="uid"
					value="${user.uid }"></td>
				<td><input type="text" disabled="disabled" name="role"
					value="${user.role }"></td>
				<td><input type="text" disabled="disabled" name="name"
					value="${user.name }"></td>
				<td><input type="text" disabled="disabled" name="pwd"
					value="${user.pwd }"></td>
				<td><input type="text" disabled="disabled" name="email"
					value="${user.email }"></td>
				<td><input type="text" disabled="disabled" name="age"
					value="${user.age }"></td>
				<td><input type="text" disabled="disabled" name="gender"
					value="${user.gender }"></td>
				<td><input type="text" disabled="disabled" name="motto"
					value="${user.motto }"></td>
				<td><input type="text" disabled="disabled" name="date"
					value="${user.date }"></td>
				<td><a onclick="ajaxUpdate(this, 'updateUser')">修改</a></td>
				<td><a onclick="ajaxDelete(this, 'deleteUser/${user.uid }')">刪除</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="11">

				<div style="text-align: center; margin: 20px;">
					<a href="?start=1">[首 页]</a>
					<c:if test="${userPage.pageNum > 1 }">
						<a href="?start=${userPage.pageNum - 1}">[上一页]</a>
					</c:if>
					<c:if test="${userPage.pageNum < labelPage.pages }">
						<a href="?start=${userPage.pageNum + 1}">[下一页]</a>
					</c:if>
					<a href="?start=${userPage.pages}">[末 页]</a>
				</div>

			</td>
		</tr>
	</table>



	<!-- 文章管理 -->
	<table>
		<tr>
			<td colspan="12">
				<div style="margin: 50px auto; text-align: center;">
					<a
						style="background: #f99; color: #fff; padding: 10px 300px; margin: 10p;">文章管理</a>
				</div>
			</td>
		</tr>
		<tr>
			<td><img alt="" src="/static/jsp/web/img/search.png"></td>
			<td><input type="text" name="uid"></td>
			<td><input type="text" name="sid"></td>
			<td><input type="text" name="lid"></td>
			<td><input type="text" name="title"></td>
			<td><input type="text" name="content"></td>
			<td><input type="text" name="viewCount"></td>
			<td><input type="text" name="likeCount"></td>
			<td><input type="text" name="commentCount"></td>
			<td><input type="text" name="date"></td>
			<td colspan="2" align="center">
				<button style="border: 0px; background: #99f; padding: 5px 10px;">
					<a style="color: #fff" onclick="ajaxAdd(this, 'Article', 'aid')">增加</a>
				</button>
			</td>
		</tr>
		<tr>
			<td>aid</td>
			<td>uid</td>
			<td>sid</td>
			<td>lid</td>
			<td>title</td>
			<td>content</td>
			<td>viewCount</td>
			<td>likeCount</td>
			<td>commentCount</td>
			<td>date</td>
			<td>修改</td>
			<td>刪除</td>
		</tr>
		<c:forEach items="${articlePage.list }" var="article" varStatus="st">
			<tr>
				<td><input type="text" disabled="disabled" name="aid"
					value="${article.aid }"></td>
				<td><input type="text" disabled="disabled" name="uid"
					value="${article.uid }"></td>
				<td><input type="text" disabled="disabled" name="sid"
					value="${article.sid }"></td>
				<td><input type="text" disabled="disabled" name="lid"
					value="${article.lid }"></td>
				<td><input type="text" disabled="disabled" name="title"
					value="${article.title }"></td>
				<td><input type="text" disabled="disabled" name="content"
					value="${article.content }"></td>
				<td><input type="text" disabled="disabled" name="viewCount"
					value="${article.viewCount }"></td>
				<td><input type="text" disabled="disabled" name="likeCount"
					value="${article.likeCount }"></td>
				<td><input type="text" disabled="disabled" name="commentCount"
					value="${article.commentCount }"></td>
				<td><input type="text" disabled="disabled" name="date"
					value="${article.date }"></td>
				<td><a onclick="ajaxUpdate(this, 'updateArticle')">修改</a></td>
				<td><a
					onclick="ajaxDelete(this, 'deleteArticle/${article.aid }')">刪除</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="11">

				<div style="text-align: center; margin: 20px;">
					<a href="?start=1">[首 页]</a>
					<c:if test="${articlePage.pageNum > 1 }">
						<a href="?start=${articlePage.pageNum - 1}">[上一页]</a>
					</c:if>
					<c:if test="${articlePage.pageNum < articlePage.pages }">
						<a href="?start=${articlePage.pageNum + 1}">[下一页]</a>
					</c:if>
					<a href="?start=${articlePage.pages}">[末 页]</a>
				</div>

			</td>
		</tr>
	</table>



	<!-- 评论管理 -->
	<table>
		<tr>
			<td colspan="11">
				<div style="margin: 50px auto; text-align: center;">
					<a
						style="background: #f99; color: #fff; padding: 10px 50px; margin: 10p;">评论管理</a>
				</div>
			</td>
		</tr>
		<tr>
			<td><img alt="" src="/static/jsp/web/img/search.png"></td>
			<td><input type="text" name="uid"></td>
			<td><input type="text" name="aid"></td>
			<td><input type="text" name="pcid"></td>
			<td><input type="text" name="content"></td>
			<td><input type="text" name="likeCount"></td>
			<td><input type="text" name="date"></td>
			<td colspan="2" align="center">
				<button style="border: 0px; background: #99f; padding: 5px 10px;">
					<a style="color: #fff" onclick="ajaxAdd(this, 'Comment', 'cid')">增加</a>
				</button>
			</td>
		</tr>
		<tr>
			<td>cid</td>
			<td>uid</td>
			<td>aid</td>
			<td>pcid</td>
			<td>content</td>
			<td>likeCount</td>
			<td>date</td>
			<td>修改</td>
			<td>刪除</td>
		</tr>
		<c:forEach items="${commentPage.list }" var="comment" varStatus="st">
			<tr>
				<td><input type="text" disabled="disabled" name="cid"
					value="${comment.cid }"></td>
				<td><input type="text" disabled="disabled" name="uid"
					value="${comment.uid }"></td>
				<td><input type="text" disabled="disabled" name="aid"
					value="${comment.aid }"></td>
				<td><input type="text" disabled="disabled" name="pcid"
					value="${comment.pcid }"></td>
				<td><input type="text" disabled="disabled" name="content"
					value="${comment.content }"></td>
				<td><input type="text" disabled="disabled" name="likeCount"
					value="${comment.likeCount }"></td>
				<td><input type="text" disabled="disabled" name="date"
					value="${comment.date }"></td>
				<td><a onclick="ajaxUpdate(this, 'updateComment')">修改</a></td>
				<td><a
					onclick="ajaxDelete(this, 'deleteComment/${comment.cid }')">刪除</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="11">

				<div style="text-align: center; margin: 20px;">
					<a href="?start=1">[首 页]</a>
					<c:if test="${commentPage.pageNum > 1 }">
						<a href="?start=${commentPage.pageNum - 1}">[上一页]</a>
					</c:if>
					<c:if test="${commentPage.pageNum < commentPage.pages }">
						<a href="?start=${commentPage.pageNum + 1}">[下一页]</a>
					</c:if>
					<a href="?start=${commentPage.pages}">[末 页]</a>
				</div>

			</td>
		</tr>
	</table>



	<!-- 分类管理 -->
	<table>
		<tr>
			<td colspan="11">
				<div style="margin: 50px auto; text-align: center;">
					<a
						style="background: #f99; color: #fff; padding: 10px 50px; margin: 10p;">分类管理</a>
				</div>
			</td>
		</tr>
		<tr>
			<td><img alt="" src="/static/jsp/web/img/search.png"></td>
			<td><input type="text" name="psid"></td>
			<td><input type="text" name="name"></td>
			<td><input type="text" name="alias"></td>
			<td><input type="text" name="description"></td>
			<td colspan="2" align="center">
				<button style="border: 0px; background: #99f; padding: 5px 10px;">
					<a style="color: #fff" onclick="ajaxAdd(this, 'Sort', 'sid')">增加</a>
				</button>
			</td>
		</tr>
		<tr>
			<td>sid</td>
			<td>psid</td>
			<td>name</td>
			<td>alias</td>
			<td>description</td>
			<td>修改</td>
			<td>刪除</td>
		</tr>
		<c:forEach items="${sortPage.list }" var="sort" varStatus="st">
			<tr>
				<td><input type="text" disabled="disabled" name="sid"
					value="${sort.sid }"></td>
				<td><input type="text" disabled="disabled" name="psid"
					value="${sort.psid }"></td>
				<td><input type="text" disabled="disabled" name="name"
					value="${sort.name }"></td>
				<td><input type="text" disabled="disabled" name="alias"
					value="${sort.alias }"></td>
				<td><input type="text" disabled="disabled" name="description"
					value="${sort.description }"></td>
				<td><a onclick="ajaxUpdate(this, 'updateSort')">修改</a></td>
				<td><a onclick="ajaxDelete(this, 'deleteSort/${sort.sid }')">刪除</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="11">

				<div style="text-align: center; margin: 20px;">
					<a href="?start=1">[首 页]</a>
					<c:if test="${sortPage.pageNum > 1 }">
						<a href="?start=${sortPage.pageNum - 1}">[上一页]</a>
					</c:if>
					<c:if test="${sortPage.pageNum < sortPage.pages }">
						<a href="?start=${sortPage.pageNum + 1}">[下一页]</a>
					</c:if>
					<a href="?start=${sortPage.pages}">[末 页]</a>
				</div>

			</td>
		</tr>
	</table>



	<!-- 标签管理 -->
	<table>
		<tr>
			<td colspan="11">
				<div style="margin: 50px auto; text-align: center;">
					<a
						style="background: #f99; color: #fff; padding: 10px 50px; margin: 10p;">标签管理</a>
				</div>
			</td>
		</tr>
		<tr>
			<td><img alt="" src="/static/jsp/web/img/search.png"></td>
			<td><input type="text" name="name"></td>
			<td><input type="text" name="alias"></td>
			<td><input type="text" name="description"></td>
			<td colspan="2" align="center">
				<button style="border: 0px; background: #99f; padding: 5px 10px;">
					<a style="color: #fff" onclick="ajaxAdd(this, 'Label', 'lid')">增加</a>
				</button>
			</td>
		</tr>
		<tr>
			<td>lid</td>
			<td>name</td>
			<td>alias</td>
			<td>description</td>
			<td>修改</td>
			<td>刪除</td>
		</tr>
		<c:forEach items="${labelPage.list }" var="label" varStatus="st">
			<tr>
				<td><input type="text" disabled="disabled" name="lid"
					value="${label.lid }"></td>
				<td><input type="text" disabled="disabled" name="name"
					value="${label.name }" /></td>
				<td><input type="text" disabled="disabled" name="alias"
					value="${label.alias }" /></td>
				<td><input type="text" disabled="disabled" name="description"
					value="${label.description }" /></td>
				<td><a onclick="ajaxUpdate(this, 'updateLabel')">修改</a></td>
				<td><a onclick="ajaxDelete(this, 'deleteLabel/${label.lid }')">刪除</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="11">

				<div style="text-align: center; margin: 20px;">
					<a href="?start=1">[首 页]</a>
					<c:if test="${labelPage.pageNum > 1 }">
						<a href="?start=${userPage.pageNum - 1}">[上一页]</a>
					</c:if>
					<c:if test="${labelPage.pageNum < labelPage.pages }">
						<a href="?start=${userPage.pageNum + 1}">[下一页]</a>
					</c:if>
					<a href="?start=${labelPage.pages}">[末 页]</a>
				</div>

			</td>
		</tr>
	</table>








	<c:import url="/dev/footer"></c:import>

</body>




<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>






</html>