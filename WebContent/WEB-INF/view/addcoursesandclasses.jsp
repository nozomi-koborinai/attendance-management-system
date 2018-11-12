<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Login"%>
<%@ page import="dto.ClassData"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<%
			request.setCharacterEncoding("UTF-8");
			ArrayList<ClassData> classList = (ArrayList<ClassData>)request.getAttribute("classData");
			Login user = (Login) session.getAttribute("user");
		%>

	<a><%=user.getUser_name() %>さん、ログイン中</a>
	<br>
	<form>
		<button type="button"
			onClick="location.href='/Attendance_management_system/LogOut'">ログアウト</button>
	</form>

	<p>クラス追加</p>
	<form action="/Attendance_management_system/AddCoursesAndClasses"
		method="post">
		追加クラス名：<input type="text" name="className"> <input
			type="submit" value="送信">
	</form>
	<br>
	<br>
	<br>


	<p>コース追加</p>
	<form action="/Attendance_management_system/AddCourses" method="get">
		クラス名：<select name="classId">
		<%for(ClassData cd : classList){ %>
		<option value=<%=cd.getClass_id() %>><%=cd.getClass_name() %></option>
		<%} %>
		</select><br>
		追加コース名<input type="text" name="courseName"> <input
			type="submit" value="送信">

	</form>
</body>
</html>