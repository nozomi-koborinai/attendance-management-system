<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/CSS/publicapplicationresult.css"
	rel="stylesheet" type="text/css">
<title>public application result</title>
</head>
<body>
<center>
	<div class="a">
		<p>【申請しました】</p>
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
		<form action="/Attendance_management_system/PublicApplication" method="get"
			name='back'>
			<input type="submit" value="申請ページへ">
		</form>
	</div>
</footer>
</html>