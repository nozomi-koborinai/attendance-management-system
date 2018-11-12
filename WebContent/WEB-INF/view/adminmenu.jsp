<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Login"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin menu</title>
</head>
<%
Login user = (Login)session.getAttribute("user");
%>
<a><%=user.getUser_name() %>さん、ログイン中</a><br>
						<form>　　　　　　 　　<button type="button" onClick="location.href='/Attendance_management_system/LogOut'">ログアウト</button></form>
<body>
	<button type="submit" onClick="location.href='/Attendance_management_system/AddStudentsAndAddTeachers'">生徒・教員の追加</button>
	<br>
	<button type="submit" onClick="location.href='/Attendance_management_system/AddCoursesAndClasses'">クラス・コースの追加</button>
	<br>
</body>
</html>