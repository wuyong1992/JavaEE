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
studnetList!
<form action="<%=request.getContextPath()%>/delectStudentsByIds.action" method="post">
<table border="1">
	<tr>
		<td>姓名</td>
		<td>年龄</td>
		<td>姓名</td>
		<td>操作</td>
		<td>
			<input type="submit" value="批量删除">
		</td>
	</tr>
  <c:forEach items="${students}" var="student">
      <tr>
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
</form>

</body>
</html>