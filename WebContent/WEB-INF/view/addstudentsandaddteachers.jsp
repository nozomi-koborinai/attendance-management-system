<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.LoginUser"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.ClassData"%>
<%@ page import="dto.CourseData"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/CSS/addstudentsandaddteachers.css"
	rel="stylesheet" type="text/css">
<title>add students and add teachers</title>
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
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<ClassData> classList = (ArrayList<ClassData>) request.getAttribute("classData");
	ArrayList<CourseData> courseList = (ArrayList<CourseData>) request.getAttribute("courseData");
%>
<body>
	<center>
		<div class="tab_wrap">
			<input id="tab1" type="radio" name="tab_btn" checked> <input
				id="tab2" type="radio" name="tab_btn">

			<div class="tab_area">
				<label class="tab1_label" for="tab1">生徒</label> <label
					class="tab2_label" for="tab2">教員</label>
			</div>
			<div class="panel_area">
				<div id="panel1" class="tab_panel">
					<form
						action="/Attendance_management_system/AddStudentsAndAddTeachers"
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
								for (CourseData course : courseList) {
							%>
							<option value=<%=course.getCourse_id()%>><%=course.getCourse_name()%></option>
							<%
								}
							%>
						</select> <input type="submit" value="確定">
					</form>
				</div>
				<div id="panel2" class="tab_panel">
					<p>教員追加</p>
	<form action="/Attendance_management_system/AddTeacher" method="get">
		 氏：<input type="text" name="shi">名：<input type="text" name="mei"><br>
		ID:<input type="text" name="id"><br>
		パスワード<input type="text" name="pass"><br>
		<input type="submit" value="確定">
				</div>
			</div>
		</div>


</body>
</html>