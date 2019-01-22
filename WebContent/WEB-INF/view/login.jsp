<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<link href="${pageContext.request.contextPath}/CSS/login.css"
	rel="stylesheet" type="text/css">
<title>login</title>
</head>
<body>
<header> 教員・管理者ログイン </header>
	<div id="login">
		<form name='form-login' action="/Attendance_management_system/AttendingStatusCheck" method="post">
			<span class="fontawesome-user"></span>
			<input type="text" id="user" name="userName" placeholder="Username">
			<span class="fontawesome-lock"></span>
			<input type="password" id="pass" name="pw" placeholder="Password">
			<input type="submit" value="Login">
		</form>
	</div>
</body>
</html>