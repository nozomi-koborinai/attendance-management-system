<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.PublicStatus" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/CSS/publicapplicationstatus.css"
	rel="stylesheet" type="text/css">
<title>public application status</title>
</head>
<%
String studentName = (String) request.getAttribute("studentName");
ArrayList<PublicStatus> publicList = (ArrayList<PublicStatus>) request.getAttribute("applicatinstatus");
%>
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
			</tr>
				<%
					for (PublicStatus ps : publicList) {
				%>

				<tr>
					<th><%=ps.getPublicDate()%></th>
					<th><%=ps.getReason()%></th>
					<th><%=ps.getPlace()%></th>
					<th><%=ps.getPeriod()%></th>
					<th><form action="/Attendance_management_system/DeletePublic" method="get"><button type="submit" name="delete" value=<%=ps.getPublicId()%>>🗑️</button></form></th>

				</tr>

				<%
					}
				%>
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