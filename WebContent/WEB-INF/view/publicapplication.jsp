<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/CSS/publicapplication.css"
	rel="stylesheet" type="text/css">
<title>public application</title>
</head>
<header> 公欠申請ページ </header>
<body>
	<center>
		<div id="pa">
			<form
				action="/Attendance_management_system/PublicApplicationConfirmation"
				method="get">
				理由：<input type="text" placeholder="例：盛岡情報ビジネス専門学校の内定式にいくため。"
					id="why" name="why"><br>場所：<input type="text"
					placeholder="例：岩手県盛岡市中央通３丁目２−１７" name="place"><br> 期間：<select
					name="year">
					<%
						for (int i = 2018; i < 2025; i++) {
					%>
					<option value="<%=i%>"><%=i%></option>
					<%
						}
					%>
				</select>
			</form>
		</div>
</body>
<footer>
	<div id="bottom1">
		<form action="/Attendance_management_system/Menu" method="get"
			name='form-back'>
			<input type="submit" value="メニューへ">
		</form>
	</div>
	<div id="bottom2">
		<form name='commit'>
			<input type="submit" value="確定">
		</form>
	</div>
</footer>
</html>