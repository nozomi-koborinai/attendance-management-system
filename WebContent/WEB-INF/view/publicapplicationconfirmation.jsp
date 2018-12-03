<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/CSS/publicapplicationconfirmation.css"
	rel="stylesheet" type="text/css">
<title>public application confirmation</title>
</head>
<header> こちらの情報で申請しますか？ </header>
<body>

</body>
<footer>
	<div id="bottom1">
		<form action="/Attendance_management_system/PublicApplication" method="get"
			name='form-back'>
			<input type="submit" value="戻る">
		</form>
	</div>
	<div id="bottom2">
		<form action="/Attendance_management_system/PublicApplicationResult" method="get"
			name='forward'>
			<input type="submit" value="申請">
		</form>
	</div>
</footer>
</html>