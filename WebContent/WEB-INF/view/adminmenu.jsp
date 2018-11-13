<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.LoginUser"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/CSS/adminmenu.css"
	rel="stylesheet" type="text/css">
<title>admin menu</title>
</head>
<%
	LoginUser user = (LoginUser) session.getAttribute("user");
%>
<header>
	<div id="container">
		<div id="header">
			<ul id="nav">
				<li class="active"><a
					href="/Attendance_management_system/AddStudentsAndAddTeachers"
					title="生徒・教員の追加">生徒・教員の追加</a></li>
				<li><a
					href="/Attendance_management_system/AddCoursesAndClasses"
					title="クラス・コースの追加">クラス・コースの追加</a></li>
			</ul>
		</div>
	</div>
	<div class="login">
		<a><%=user.getUser_name()%>さん</a>
		<form>
			<button type="button"
				onClick="location.href='/Attendance_management_system/LogOut'">ログアウト</button>
		</form>
	</div>
</header>
<body>

</body>
</html>