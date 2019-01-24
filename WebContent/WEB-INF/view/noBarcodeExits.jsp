<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Student"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/CSS/noBarcodeExits.css"
	rel="stylesheet" type="text/css">
<title>NO BARCODE EXITS</title>
</head>
<body onLoad="timeOut()">
	<%
		request.setCharacterEncoding("UTF-8");
		Student sdt = (Student) request.getAttribute("studentData");
	%>
	<script>
		function timeOut() {
			setTimeout(function() {
				window.location.href = '/Attendance_management_system/Menu';
			}, 10 * 1000);
		}
	</script>
	<center>

		<div class="a">
			<p>【読み込んだバーコードの学籍番号は現在登録されていません】</p>
		</div>

		<div class="b">
			<p>※この画面は3秒後にメニューに戻ります</p>
		</div>
</body>
</html>