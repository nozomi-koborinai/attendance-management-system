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

<%
	int sNumber = (Integer) request.getAttribute("sNumber");
	String sinseiDate = (String) request.getAttribute("applicationDate");
	String reason = (String) request.getAttribute("reason");
	String place = (String) request.getAttribute("place");
	String date1 = (String) request.getAttribute("date1");
	String date2 = (String) request.getAttribute("date2");
%>
<header> 【こちらの情報で申請しますか？】 </header>
<body>

	<div id ="a1">【理由】<%=reason%></div>
	<br>
	<div id ="a2">【場所】<%=place%></div>
	<br>
	<div id ="a3">【期間】<%=date1%>　　～　　<%=date2%></div>
	<br>

</body>

<footer>
	<div id="bottom1">
		<input value="戻る" onclick="history.back();" type="button"
			name="form-back">
	</div>
	<div id="bottom2">
		<form action="/Attendance_management_system/PublicApplicationResult"
			method="get" name='forward'>
			<input type="hidden" name="sNumber" value=<%=sNumber%>> <input
				type="hidden" name="applicationDate" value=<%=sinseiDate%>>
			<input type="hidden" name="reason" value=<%=reason%>> <input
				type="hidden" name="place" value=<%=place%>> <input
				type="hidden" name="date1" value=<%=date1%>> <input
				type="hidden" name="date2" value=<%=date2%>> <input
				type="submit" value="申請">
		</form>
	</div>
</footer>
</html>