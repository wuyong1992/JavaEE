<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
	<form action="product_saveAll.action" method="post">
	<fieldset>
		<legend>Add a product</legend>
		<label for="name">Product Name:</label>
		<input type="text"  id="name" name="name" value="" tabindex="1" />
		
		<label for="description">Description:</label>
		<input type="text"  id="description" name="description" value="" tabindex="2" />
		
		<label for="price">Price:</label>
		<input type="text"  id="price" name="price" value="" tabindex="3" />
		
		<label for="count">Count:</label>
		<input type="text"  id="count" name="count" value="" tabindex="4" />
		
		<div id="buttons">
		<label for="dummy" > </label>
		<input id="reset" type="reset"  tabindex="4"/>
		<input id="submit" type="submit" tabindex="5" value="Add Product" />
		</div>
	</fieldset>
	</form>
	</div>

	<!-- <form action="product_saveAll.action" method="post">
		<table>
			<thead>请填入新的商品信息
			</thead>
			<tr>
				<td>Product ID</td>
				<td>Product Name</td>
				<td>Description</td>
				<td>Price(￥)</td>
				<td>Count</td>

			</tr>
			<tr>
				<td><input type="text" name="id" value="" /></td>
				<td><input type="text" name="name" value="" /></td>
				<td><input type="text" name="description" value="" /></td>
				<td><input type="text" name="price" value="" /></td>
				<td><input type="text" name="count" value="" /></td>
			</tr>
			<tr>
				<td colspan="5">
				<input type="submit" value="提交" /> 
				<input type="reset" value="重置" />
			</td>
			</tr>
		</table>
	</form> -->
</body>
</html>