<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
td {
	padding: 10px;
	color: red;
	font-size: 1.2em;
	font-weight: 800;
}
</style>

<table align='center' border='1' cellspacing='0'>
	<tr>
		<td>uid</td>
		<td>role</td>
		<td>name</td>
		<td>pwd</td>
		<td>email</td>
		<td>age</td>
		<td>gender</td>
		<td>motto</td>
		<td>修改</td>
		<td>删除</td>
	</tr>
	<c:forEach items="${page.list}" var="u" varStatus="st">
		<tr>
			<td>${u.uid}</td>
			<td>${u.role}</td>
			<td>${u.name}</td>
			<td>${u.pwd}</td>
			<td>${u.email}</td>
			<td>${u.age}</td>
			<td>${u.gender}</td>
			<td>${u.motto}</td>
			<td><a href="editUser?uid=${u.uid}">修改</a></td>
			<td><a href="deleteUser?uid=${u.uid}">刪除</a></td>
		</tr>
	</c:forEach>
</table>

<br />

<div style="text-align: center;">
	<a href="?start=1">[首 页]</a>
	<c:if test="${page.pageNum > 1 }">
		<a href="?start=${page.pageNum - 1}">[上一页]</a>
	</c:if>
	<c:if test="${page.pageNum < page.pages }">
		<a href="?start=${page.pageNum + 1}">[下一页]</a>
	</c:if>
	<a href="?start=${page.pages}">[末 页]</a>
</div>

<form action="addUser" method="post"
	style="display: flex; justify-content: center; margin: 30px">
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
			<td colspan="2">
				<button type="submit">提交</button>
			</td>
		</tr>
	</table>
</form>