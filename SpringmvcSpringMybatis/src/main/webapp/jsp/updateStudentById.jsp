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

<form action="<%=request.getContextPath()%>/updateStudentById.action" method="post">
	<table>
		<tr>
			<td>姓名</td>
			<td>年龄</td>
			<td>姓名</td>
		</tr>
		
			<tr>
				<td>
					<input type="hidden" name="id" value="${student.id}" >
					<input type="text" name="name" value="${student.name}">
				</td>
				<td><input type="text" name="age" value="${student.age}"></td>
				<td><input type="text" name="sex" value="${student.sex}"></td>
			</tr>
			
		<tr>
			<td colspan="3">
				<input type="submit" value="更新">
				<input type="reset" value="重置">
			</td>
		</tr>
	</table>
</form>
</body>
</html>