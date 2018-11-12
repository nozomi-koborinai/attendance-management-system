<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Login"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.ClassData"%>
<%@ page import="dto.CourseData"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		ArrayList<ClassData> classList = (ArrayList<ClassData>) request.getAttribute("classData");
		ArrayList<CourseData> courseList = (ArrayList<CourseData>) request.getAttribute("courseData");
		Login user = (Login) session.getAttribute("user");
	%>

	<a><%=user.getUser_name()%>さん、ログイン中</a>
	<br>
	<form>
		<button type="button"
			onClick="location.href='/Attendance_management_system/LogOut'">ログアウト</button>
	</form>

	<p>生徒追加</p>
	<form action="/Attendance_management_system/AddStudentsAndAddTeachers"
		method="post">
		学籍番号：<input type="text" name="studentsNo"><br> 氏：<input
			type="text" name="shi">名：<input type="text" name="mei"><br>
		性別: 男<input type="radio" name="gender" value="男"> 女<input
			type="radio" name="gender" value="女"><br>
		<!--選択肢①-->
		<select name="selectName1">
			<%
				for (ClassData cd : classList) {
			%>
			<option value=<%=cd.getClass_id()%>><%=cd.getClass_name()%></option>
			<%
				}
			%>
		</select><br>

		<!--選択肢②（選択肢①の項目によって変化）-->
		<select name="selectName2">
		<%
			for(CourseData course : courseList) {
		%>
		<option value=<%=course.getCourse_id() %>><%=course.getCourse_name() %></option>
		<%} %>
		</select> <input type="submit" value="確定">
	</form>
	<br>
	<br>
	<br>


	<p>教員追加</p>
	<form action="/Attendance_management_system/AddCourses" method="get">
		 氏：<input type="text" name="shi">名：<input type="text" name="mei"><br>
		ID:<input type="text" name="id">
		パスワード<input type="text" name="pass">
		<input type="submit" value="">
	</form>
</body>
</html>