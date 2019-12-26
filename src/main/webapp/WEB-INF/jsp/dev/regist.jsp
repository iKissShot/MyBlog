<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>登录--KissShot的康熙窝</title>
<link rel="stylesheet" type="text/css"
	href="/static/jsp/web/css/login.css">
<style>
.body {
	width: 100% !important;
	height: 100% !important;
	background: gold url(/static/jsp/web/img/registBG_.png) no-repeat 70%
		50% fixed !important;
	background-size: cover !important;
}
</style>
</head>
<body
	style="background: gold url(/static/jsp/web/img/registBG_.png) no-repeat 70% 50% fixed; background-size: cover;">


	<div class="body" style="width: 100%; height: 100%;">

		<form action='/dev/userRegistConfirm' method="POST"
			style="height: 100%;">
			<div class="border-radius"></div>
			<input type="text" autofocus="autofocus" name="name"
				placeholder="请输入用户名"> <input type="password" name="pwd"
				placeholder="请输入密码"> <input type="text" name="email"
				placeholder="请输入邮箱"> <input type="submit" name="submit"
				value="注冊" class="btn"> <a href="userLogin"
				style="color: #f00; display: flex; justify-content: center; margin: 15px;">已有账号？点我登录</a>
		</form>

		<br> <br> <br>

		<c:import url="/dev/footer"></c:import>

		<br>

	</div>

	<audio src="/static/jsp/web/audio/Reborned_Best_Girl.mp3" loop="loop"
		autoplay="autoplay"></audio>

	<script type="text/javascript">
		document.getElementsByTagName('input')[3].onclick = function() {
			let name = document.getElementsByTagName('input')[0];
			let pwd = document.getElementsByTagName('input')[1];
			let email = document.getElementsByTagName('input')[2];
			if (name.value == '') {
				alert('请输入用户名');
				return false;
			}
			if (pwd.value == '') {
				alert('请输入密码');
				return false;
			}
			if (email.value == '') {
				alert('请输入邮箱');
				return false;
			}
		}
		let music = document.getElementsByTagName('audio')[0];
		document.getElementsByTagName('body')[0].onclick = function() {
			if (music.pause)
				music.play();
		}
		document.onkeydown = function() {
			if (music.pause)
				music.play();
		}
	</script>
</body>
</html>