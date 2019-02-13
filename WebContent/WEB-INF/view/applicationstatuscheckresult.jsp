<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/CSS/applicationstatuscheckresult.css"
	rel="stylesheet" type="text/css">
<title>application status check result</title>
</head>
<body>
<center>
	<div class="a">
		<p>【出席情報を更新しました】</p>
	</div>
</body>
<footer>
<div id="bottom">
		<form action="/Attendance_management_system/AttendingStatusCheck2" method="get"
			name='back'>
			<input type="submit" value="出席状況一覧へ">
		</form>
	</div>
</footer>
</html>