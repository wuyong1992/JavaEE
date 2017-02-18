<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="product_update_view.action" method="post">
		<fieldset>
			<legend>Add a product</legend>
			<label for="name">Product Name:</label> 
			<input type="text" id="name" name="name" value="" tabindex="1" /> 
			
			<label for="description">Description:</label>
			<input type="text" id="description" name="description" value="" tabindex="2" />
			
			<label for="price">Price:</label> 
			<input type="text" id="price" name="price" value="" tabindex="3" />
			
			<label for="count">Count:</label>
			<input type="text" id="count" name="count" value="" tabindex="4" />
			
			<div id="buttons">
				<label for="dummy"> </label> 
				<input id="reset" type="reset" tabindex="4" /> 
				<input id="submit" type="submit" tabindex="5" value="Add Product" />
			</div>
		</fieldset>
	</form>
</body>
</html>