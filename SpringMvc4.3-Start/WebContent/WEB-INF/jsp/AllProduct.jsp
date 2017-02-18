<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="product_del.action" method="post">
		<table border="1">
			<thead>全部商品信息</thead>
			<tr>
				<td>Product ID</td>
				<td>Product Name</td>
				<td>Description</td>
				<td>Price(￥)</td>
				<td>Count</td>
				<td><input type="submit" value="删除" /></td>
				<td>修改</td>
			</tr>
			<c:forEach items="${products}" var="product">
				<tr>
					<td>${product.value.id}</td>
					<td>${product.value.name}</td>
					<td>${product.value.description}</td>
					<td>${product.value.price}</td>
					<td>${product.value.count}</td>
					<td><input type="checkbox" name="checkID" value="${product.value.id}"></td>
					<td><a href="product_update.action?id=${product.value.id}">修改</a></td>
			</c:forEach>
		</table>
	</form>
</body>
</html>