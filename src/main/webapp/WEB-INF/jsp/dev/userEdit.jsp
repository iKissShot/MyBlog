<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>KissShot的康熙小窝</title>

<link rel="stylesheet" href="/static/jsp/web/css/index.css">
<link rel="stylesheet" href="/static/jsp/web/css/userEdit.css">

</head>
</head>
<body>



	<c:import url="/dev/header"></c:import>






	<div>
		<form action="userUpdate">
			<table border="1px" frame="box" cellpadding="20px" cellspacing="5px">
				<caption>
					用户信息<br />
				</caption>
				<tr>
					<td>*<span>UID</span>*
					</td>
					<td><input tabindex="-1" readonly="readonly" type="text"
						name="uid" value="${user.uid }"></td>
				</tr>
				<tr>
					<td>*<span>ROLE</span>*
					</td>
					<td><input tabindex="-1" readonly="readonly" type="text"
						name="role" value="${user.role }"></td>
				</tr>
				<tr>
					<td>*<span>昵称</span>*
					</td>
					<td><input tabindex="-1" readonly="readonly" type="text"
						value="${user.name }" name="name"></td>
				</tr>
				<tr>
					<td>*<span>密码</span>*
					</td>
					<td><input autofocus="autofocus" placeholder="请输入密码"
						tabindex="2" type="text" value="${user.pwd }" name="pwd"></td>
				</tr>
				<tr>
					<td>*<span>邮箱</span>*
					</td>
					<td><input tabindex="3" type="text" placeholder="请输入邮箱"
						value="${user.email }" name="email"></td>
				</tr>
				<tr>
					<td>*<span>年龄</span>*
					</td>
					<td><input tabindex="4" type="text" placeholder="请输入年龄"
						value="${user.age }" name="age"></td>
				</tr>
				<tr>
					<td>*<span>性别</span>*
					</td>
					<td><input tabindex="5" type="text" placeholder="请输入性别"
						value="${user.gender }" name="gender"></td>
				</tr>
				<tr>
					<td>*<span>宣言</span>*
					</td>
					<td><input tabindex="6" type="text" placeholder="请输入宣言"
						value="${user.motto }" name="motto"></td>
				</tr>
				<tr>
					<td colspan="2"><button>清空信息</button>
						<button>确认修改</button></td>
				</tr>
			</table>
		</form>
	</div>


	<script>
		input = document.getElementsByTagName('input');
		for (let i = 0; i < input.length; i++) {
			if (input[i].readOnly) {
				input[i].onclick = function() {
					alert('不可修改'
							+ (this.name == 'uid' ? 'UID'
									: this.name == 'role' ? 'ROLE' : '昵称'));
				}
			}
		}

		document.getElementsByTagName('button')[0].onclick = function() {
			input = document.getElementsByTagName('input');
			for (let i = 0; i < input.length; i++) {
				if (!input[i].readOnly) {
					input[i].value = '';
				}
			}
			return false;
		}

		document.getElementsByTagName('button')[1].onclick = function() {
			if (window.confirm("确认修改？", "确定", "我再检查检查")) {
				input = document.getElementsByTagName('input');
				for (let i = 3; i < input.length; i++) {
					if (input[i].value == '') {
						alert('信息不完整');
						return false;
					}
				}
			} else {
				alert('好哒');
				return false;
			}
		}
	</script>

	<script type="text/javascript">
		input = document.getElementsByTagName('input');
		for (let i = 0; i < input.length; i++) {
			if (!input[i].readOnly) {
				onkeydown = function(event) {
					tryNext(event);
				}
			}
		}

		function tryNext(event) {
			var keyCode = event.keyCode;//获得引发事件的键值
			var elem = event.target;//获得引阀事件的元素
			var form = document.getElementsByTagName("form")[0];//获得表单

			if (keyCode == 13) {//13是回车键的键值
				for (i = 3; i < form.length; i++) {//循环，直到遍历结束
					if (form.elements[i] == elem) {//也可以使用f.elements[i].isSameNode(cc)==true;来进行判断
						break;
					}
				}
				if ((i + 1) == form.length) {//如果是最后一个结点，就转换焦点到第一个表单元素
					form.elements[0].focus();
					return;//跳出函数
				}
				form.elements[i + 1].focus();//否则就转换焦点到下一个表单元素
			}
		}
	</script>








	<c:import url="/dev/footer"></c:import>


</body>




<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>






</html>