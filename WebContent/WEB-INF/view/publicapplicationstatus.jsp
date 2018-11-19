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
				<th class="th">申請日</th>
				<th class="th">理由</th>
				<th class="th">場所</th>
				<th class="th">期間</th>
				<th class="th">削除</th>
		</table>
</body>
<footer>
	<div id="bottom">
		<form name='form-back'>
			<input type="submit" value="メニューへ">
		</form>
	</div>
</footer>
</html>