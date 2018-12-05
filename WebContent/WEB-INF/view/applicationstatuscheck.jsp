<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.PublicStatus"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/CSS/applicationstatuscheck.css"
	rel="stylesheet" type="text/css">
<title>application status check</title>
</head>
<%
	ArrayList<PublicStatus> publicList = (ArrayList<PublicStatus>) request.getAttribute("publicList");
	int studentNo = (Integer) request.getAttribute("studentNo");
%>
<header> 公欠申請状況 </header>
<body>
	<center>
		<div id="bottom-p">
			<form action="/Attendance_management_system/ApplicationStatusCheck"
				method="post" name='form-permisson'>
				<table border="1" class="table">
					<tr>
						<th class="th1">申請日</th>
						<th class="th2">理由</th>
						<th class="th3">場所</th>
						<th class="th4">日時</th>
						<th class="th5">チェック</th>
					</tr>

					<%
						for (PublicStatus ps : publicList) {
							int count = 1;
					%>
					<tr>
						<td><%=ps.getPublicDate()%></td>
						<td><%=ps.getReason()%></td>
						<td><%=ps.getPlace()%></td>
						<td><%=ps.getPeriod()%></td>
						<td align="center">
							<p>
								<input type="checkbox" value=<%=ps.getPublicId()%> name="public">
							</p>
						</td>
					</tr>
					<%
						}
					%>

				</table>
				<input type="hidden" name="sNo" value=<%=studentNo%>> <input
					type="submit" value="許可">
			</form>
		</div>
</body>
<footer>
	<div id="bottom-back">
		<form action="/Attendance_management_system/AttendingStatusCheck"
				method="post"  name='form-back'>
			<input type="submit" value="戻る">
		</form>
	</div>
</footer>
</html>