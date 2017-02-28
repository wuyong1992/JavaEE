<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/select.action" method="post">
	id:<input type="text" name="id" >		
	姓名：<input type="text" name="name" >	
	年龄：<input type="text" name="age" >		
	性别：<input type="text" name="sex" >	
	<br>
	<input type="submit" value="模糊查询">	
	<input type="reset" value="重置">
</form>
<table>
	<tr>
		<td>id</td>
		<td>姓名</td>
		<td>年龄</td>
		<td>性别</td>
		<td colspan="2">操作</td>
	</tr>
	<c:forEach items="${students}" var="student">
      <tr>
      	<td>${student.id}</td>
		<td>${student.name}</td>
		<td>${student.age}</td>
		<td>${student.sex}</td>
		<td>
			<a href="selectStudentById.action?id=${student.id}">修改</a>
			<a href="deleteStudent.action?id=${student.id}">删除</a>
		</td>
		<td><input type="checkbox" name="checkID" value="${student.id}" ></td>
	</tr>
   </c:forEach>
</table>
</body>
</html>