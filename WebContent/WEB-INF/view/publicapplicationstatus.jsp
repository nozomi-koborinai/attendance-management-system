<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.PublicStatus"%>
<%@ page import="java.util.ArrayList"%>
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
	<%=sName%>
	さん
</div>
<body>
	<center>
		<table border="1" class="table">
			<thead>
				<tr>
					<th class="th1">申請日</th>
					<th class="th2">理由</th>
					<th class="th3">場所</th>
					<th class="th4">期間</th>
					<th class="th5">削除</th>
					<th class="th6">許可</th>
				</tr>
			</thead>

			<tbody>
			<%
				for (PublicStatus ps : publicList) {
			%>

			<tr>
				<td class="td1"><%=ps.getPublicDate()%></td>
				<td class="td2"><%=ps.getReason()%></td>
				<td class="td3"><%=ps.getPlace()%></td>
				<td class="td4"><%=ps.getPeriod()%></td>
				<%
					if (ps.getAuth() == 1) {
				%>
				<form>
					<td class="td5"><input type="submit" value="×" disabled=disabled /></td>
				</form>
				<td class="td6">✔</td>
				<%
					} else {
				%>
				<td><form action="/Attendance_management_system/DeletePublic"
						method="get">
						<input type="hidden" name="barcodeData" value=<%=barcodeData%>>
						<button type="submit" name="delete" value=<%=ps.getPublicId()%>>🗑️</button>
					</form></td>
				<td></td>
				<%
					}
				%>
			</tr>

			<%
				}
			%>
			</tbody>
		</table>
</body>
<footer>
	<div id="bottom">
		<form action="/Attendance_management_system/Menu" method="get"
			name='form-back'>
			<input type="submit" value="メニューへ">
		</form>
	</div>
</footer>
</html>