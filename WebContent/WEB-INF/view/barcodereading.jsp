<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/CSS/barcodereading.css"
	rel="stylesheet" type="text/css">
<title>barcode reading</title>
</head>
<header>バーコードをかざして下さい</header>
<body onLoad="focusText()">
	<center>
		<script>
			function focusText() {
				document.getElementById('focus').focus();
			}
		</script>
		<form action="/Attendance_management_system/BarcodeReading" method="post">
				<input type="text" name="barcodeData" id="focus">
			</form>
		<div id="bottom">
			<form action="/Attendance_management_system/Menu" method="get">
				<button type="submit" name="action" value="menu">メニューへ</button>
			</form>
		</div>
</body>
</html>