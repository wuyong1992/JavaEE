<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="JavaScript" type="text/javascript">    
    function clearNoNum(obj){    
      obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符     
      obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的     
      obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");    
      obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入两个小数     
      if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额    
       obj.value= parseFloat(obj.value);    
      }    
    }    
</script> 
</head>
<body>
<%
	String name = (String)session.getAttribute("name");
	String description = (String)session.getAttribute("description");
	Double price = (Double)session.getAttribute("price");
	Integer count = (Integer)session.getAttribute("count");
%>
	<form action="product_update_view.action" method="post">
		<fieldset>
			<legend>Update a product! Tips:在你想修改的地方输入新值就ok了</legend>
			
			<label for="name">Product Name:</label> 
			<input type="text" id="name" name="name" value="" placeholder="<%=name %>" tabindex="1" /> 
			
			<label for="description">Description:</label>
			<input type="text" id="description" name="description" value="" placeholder="<%=description %>" tabindex="2" />
			
			<label for="price">Price:</label> 
			<input type="text" id="price" name="price" value="" placeholder="<%=price %>" tabindex="3" onkeyup="clearNoNum(this)" />
			
			<label for="count">Count:</label>
			<input type="text" id="count" name="count" value="" placeholder="<%=count %>"  tabindex="4" onkeyup="clearNoNum(this)" />
			
			
			<div id="buttons">
				<label for="dummy"> </label> 
				<input id="reset" type="reset" tabindex="4" /> 
				<input id="submit" type="submit" tabindex="5" value="Update Product" />
			</div>
		</fieldset>
	</form>
</body>
</html>