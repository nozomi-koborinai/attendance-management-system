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
String sName = (String) request.getAttribute("studentName");
int barcodeData = (Integer) request.getAttribute("bDate");
ArrayList<PublicStatus> publicList = (ArrayList<PublicStatus>) request.getAttribute("applicatinstatus");
%>
<header> 公欠申請状況 </header>
<div id="name">
<%=sName %>　さん
</div>
<body>
	<center>
		<table border="1" class="table">
			<tr>
				<th class="th1">申請日</th>
				<th class="th2">理由</th>
				<th class="th3">場所</th>
				<th class="th4">期間</th>
				<th class="th5">削除</th>
				<th class="th6">許可</th>
			</tr>
				<%
					for (PublicStatus ps : publicList) {
				%>

				<tr>
					<td><%=ps.getPublicDate()%></td>
					<td><%=ps.getReason()%></td>
					<td><%=ps.getPlace()%></td>
					<td><%=ps.getPeriod()%></td>
					<td><form action="/Attendance_management_system/DeletePublic" method="get"><input type="hidden" name="barcodeData" value=<%=barcodeData %>><button type="submit" name="delete" value=<%=ps.getPublicId()%>>🗑️</button></form></td>
					<%if(ps.getAuth() == 1){ %>
					<td>✔</td>
					<%} else { %>
					<td>　</td>
					<%} %>
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