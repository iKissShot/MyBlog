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
		<td>name</td>
		<td>name</td>
		<td>pwd</td>
		<td>email</td>
		<td>age</td>
		<td>gender</td>
		<td>motto</td>
	</tr>
	<c:forEach items="${us}" var="u" varStatus="st">
		<tr>
			<td>${u.uid}</td>
			<td>${u.role}</td>
			<td>${u.name}</td>
			<td>${u.pwd}</td>
			<td>${u.email}</td>
			<td>${u.age}</td>
			<td>${u.gender}</td>
			<td>${u.motto}</td>
		</tr>
	</c:forEach>
</table>