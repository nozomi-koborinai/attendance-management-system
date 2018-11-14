<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Student"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/CSS/attendingschool.css"
	rel="stylesheet" type="text/css">
<title>attending school</title>
</head>
<%
request.setCharacterEncoding("UTF-8");
Student student = (Student) session.getAttribute("studentData");
%>
<body>
	<center>

		<header>
			<%=student.getS_number() %>><br>
			<%=student.getS_name() %>
		</header>

		<div class="a">
			<p>【登校を確認しました】</p>
		</div>

		<div class="b">
			<p>※この画面は5秒後にメニューに戻ります</p>
		</div>
</body>
</html>
