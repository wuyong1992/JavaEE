<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div>
	<form action="product_saveAll.action" method="post">
	<fieldset>
		<legend>Add a product</legend>
		<%-- <label for="id">Product Name:</label>
		<input type="hidden"  id="id" name="id" value="${id}" tabindex="1" /> --%>
		
		<label for="name">Product Name:</label>
		<input type="text"  id="name" name="name" value="" tabindex="1"  />
		
		<label for="description">Description:</label>
		<input type="text"  id="description" name="description" value="" tabindex="2" />
		
		<label for="price">Price:</label>
		<input type="text"  id="price" name="price" value="" tabindex="3"  onkeyup="clearNoNum(this)"/>
		
		<label for="count">Count:</label>
		<input type="text"  id="count" name="count" value="" tabindex="4"  onkeyup="clearNoNum(this)"/>
		
		<div id="buttons">
		<label for="dummy" > </label>
		<input id="reset" type="reset"  tabindex="4"/>
		<input id="submit" type="submit" tabindex="5" value="Add Product" />
		</div>
	</fieldset>
	</form>
	</div>
</body>
</html>