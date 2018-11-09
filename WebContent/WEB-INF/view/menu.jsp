<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
</head>
<body>
	<a>登校の場合はバーコードをかざしてください。</a>
	<form action="/Attendance_management/Barcode_reading" method="get">
	<button type="submit" name="action" value=1>早退</button><br>
	<button type="submit" name="action" value=2>公欠申請</button><br>
    <button type="submit" name="action" value=3>公欠申請状況</button><br>
    <a>テスト</a>
	</form>
</body>
</html>