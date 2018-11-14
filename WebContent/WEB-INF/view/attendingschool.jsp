<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Student"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/CSS/attendingschool.css"
	rel="stylesheet" type="text/css">
<title>attending school</title>
</head>

<body>
	<%
		request.setCharacterEncoding("UTF-8");
		Student sdt = (Student) request.getAttribute("studentData");
	%>
	<center>

		<header>
			<a><%=sdt.getS_number()%></a><br><a><%=sdt.getS_name()%></a>
		</header>

		<div class="a">
			<p>【登校を確認しました】</p>
		</div>

		<div class="b">
			<p>※この画面は5秒後にメニューに戻ります</p>
		</div>
</body>
</html>
