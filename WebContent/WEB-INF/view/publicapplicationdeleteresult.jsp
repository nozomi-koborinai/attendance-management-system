<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/CSS/publicapplicationresult.css"
	rel="stylesheet" type="text/css">
<%
String sName = (String) request.getAttribute("studentName");
%>
<title>public appliction delete result</title>
<div id="name">
<%=sName %>　さん
</div>
</head>
<%
int barcodeData = (Integer) request.getAttribute("barcodeData");
%>
<body>
<center>
	<div class="a">
		<p>【削除しました】</p>
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
		<form action="/Attendance_management_system/PublicApplicationStatus" method="get"
			name='back'>
			<input type="hidden" name="barcodeData" value=<%=barcodeData%>>
			<input type="submit" value="申請状況へ">
		</form>
	</div>
</footer>
</html>