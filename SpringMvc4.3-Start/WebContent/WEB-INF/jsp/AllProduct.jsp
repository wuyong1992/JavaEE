<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script src="jquery-3.1.1.min.js" type="text/javascript"></script> -->
<script type="text/javascript">
	/* 需要判断是否选中checkbox和当前表格中是否还有值 ，用来设这删除按钮的可用不可用属性*/
	
	function fun(){
	    obj = document.getElementsByName("checkID");	//获取checkbox中的值
	    check_val = [];
	    for(k in obj){
	        if(obj[k].checked)	{						//如果有checkbox被点击则可以将其value值放入check_val数组中
	        	check_val.push(obj[k].value);
	        }						
	    }
	    if (check_val.length > 0) {	//条件
	    	return true;	//满足则生效
		} else {
			return false;	//否则点击无效
		}
	    
	}
	
</script>
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
				<td><input type="submit" id="del" value="删除" onclick="return fun()" /></td>
				<td>修改</td>
			</tr>
			<c:forEach items="${products}" var="product">
				<tr>
					<td>${product.value.id}</td>
					<td>${product.value.name}</td>
					<td>${product.value.description}</td>
					<td>${product.value.price}</td>
					<td>${product.value.count}</td>
					<td><input type="checkbox" name="checkID" value="${product.value.id}" onclick="hasCheck()"></td>
					<td><a href="product_update.action?id=${product.value.id}">修改</a></td>
			</c:forEach>
		</table>
	</form>
</body>
</html>