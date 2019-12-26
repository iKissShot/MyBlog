<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用AJAX以JSON方式提交数据</title>
<script type="text/javascript"
	src="/test/static/jsp/web/js/jquery.min.js"></script>
</head>
<body>
	<form style="display: flex; justify-content: center; margin: 30px">
		<table cellspacing="10px" border="1" frame="box">
			<tr>
				<td>name</td>
				<td><input name="name" value="${user.name}"></td>
			</tr>
			<tr>
				<td>pwd</td>
				<td><input name="pwd" value="${user.pwd}"></td>
			</tr>
			<tr>
				<td>email</td>
				<td><input name="email" value="${user.email}"></td>
			</tr>
			<tr style="text-align: center">
				<td colspan="2"><input type="button" value="提交" id="put">
				</td>
			</tr>
		</table>
	</form>
	<input type="button" value="获取一个" id="getOne">
	<input type="button" value="获取多个" id="getMany">
	<div id="messageDiv"></div>

	<script>
		$("#getOne").click(function() {
			let div = document.getElementById("messageDiv");
			$.get('web/UserJSON/1', function(result) {
				let str = JSON.stringify(result);
				alert(str);
				$("#messageDiv").html(str);
			})
		});
		$("#getMany").click(function() {
			let div = document.getElementById("messageDiv");
			$.get('web/UserJSON', function(result) {
				let str = JSON.stringify(result);
				alert(str);
				$("#messageDiv").html(str);
			})
		});
		$("#put").click(function() {
			var name = document.getElementsByName('name')[0].value;
			var pwd = document.getElementsByName('pwd')[0].value;
			var email = document.getElementsByName('email')[0].value;
			var user = {
				"name" : name,
				"pwd" : pwd,
				"email" : email
			};
			var jsonData = JSON.stringify(user);
			var page = "web/UserJSON";

			$.ajax({
				type : "PUT",
				url : page,
				data : jsonData,
				dataType : 'json',
				contentType : 'application/json;charset=utf-8',
				success : function(result) {
					alert(result)
				}
			});
			alert(user + jsonData);
		})
	</script>
</body>
</html>