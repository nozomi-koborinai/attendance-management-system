<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/CSS/publicapplicationstatus.css"
	rel="stylesheet" type="text/css">
<title>public application status</title>
</head>
<header> 公欠申請状況 </header>
<body>
	<center>
		<table border="1" class="table">
			<tr>
				<th class="th1">申請日</th>
				<th class="th2">理由</th>
				<th class="th3">場所</th>
				<th class="th4">期間</th>
				<th class="th5">削除</th>
		</table>
</body>
<footer>
	<div id="bottom">
		<form action="/Attendance_management_system/Menu"
			method="get" name='form-back'>
			<input type="submit" value="メニューへ">
		</form>
	</div>
</footer>
</html>