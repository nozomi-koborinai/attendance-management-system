<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Login"%>
<%@ page import="dto.ClassData"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/CSS/addcoursesandclasses.css"
	rel="stylesheet" type="text/css">
<title>add course and classes</title>
</head>
</head>
<%
	Login user = (Login) session.getAttribute("user");
%>
<header>
	<div id="container">
		<div id="header">
			<ul id="nav">
				<li class="active"><a
					href="/Attendance_management_system/AddStudentsAndTeachers"
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
%>
<body>
	<center>
		<div class="tab_wrap">
			<input id="tab1" type="radio" name="tab_btn" checked> <input
				id="tab2" type="radio" name="tab_btn">

			<div class="tab_area">
				<label class="tab1_label" for="tab1">クラス</label> <label
					class="tab2_label" for="tab2">コース</label>
			</div>
			<div class="panel_area">
				<div id="panel1" class="tab_panel">
					<form action="/Attendance_management_system/AddCoursesAndClasses"
						method="post">
						追加クラス名：<input type="text" name="className"> <input
							type="submit" value="送信">
					</form>
				</div>
				<div id="panel2" class="tab_panel">
					<form action="/Attendance_management_system/AddCourses"
						method="get">
						クラス名：<select name="classId">
							<%
								for (ClassData cd : classList) {
							%>
							<option value=<%=cd.getClass_id()%>><%=cd.getClass_name()%></option>
							<%
								}
							%>
						</select><br> 追加コース名<input type="text" name="courseName"> <input
							type="submit" value="送信">

					</form>
				</div>
			</div>
		</div>
</body>
</html>