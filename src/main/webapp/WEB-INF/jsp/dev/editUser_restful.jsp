<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<div style="margin: 0px auto; width: 500px">

	<form action="${user.uid }" method="POST">
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
				<input name="uid" type="hidden" value="${user.uid}">
				<input name="_method" type="hidden" value="PUT">
				<td colspan="2">
					<button type="submit">提交</button>
				</td>
			</tr>
		</table>
	</form>
</div>