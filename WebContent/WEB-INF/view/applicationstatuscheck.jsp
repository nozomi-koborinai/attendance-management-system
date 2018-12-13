<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.PublicStatus"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
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
	ArrayList<Long> publicCntList = new ArrayList<Long>();
	int studentNo = (Integer) request.getAttribute("studentNo");

	for (PublicStatus ps : publicList){
		if(ps.getAuth() == 0){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		String startDate = null;
		String endDate = null;
		Date dateTo = null;
		Date dateFrom = null;

		String period = ps.getPeriod();

		startDate = period.substring(0, 11);
		endDate = period.substring(16, 27);

		//日付変換
		try {
			dateFrom = sdf.parse(startDate);
			dateTo = sdf.parse(endDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		//日付をlong値に変換
		long dateTimeTo = dateTo.getTime();
		long dateTimeFrom = dateFrom.getTime();

		// 公欠の日数を算出
		long dayDiff = ( dateTimeTo - dateTimeFrom  ) / (1000 * 60 * 60 * 24 ) + 1;

		publicCntList.add(dayDiff);
		}

	}
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
						int cnt = 0;
						for (PublicStatus ps : publicList) {
							int count = 1;

					%>
					<%if(ps.getAuth() == 0){ %>
					<tr>
						<td><%=ps.getPublicDate()%></td>
						<td><%=ps.getReason()%></td>
						<td><%=ps.getPlace()%></td>
						<td><%=ps.getPeriod()%></td>
						<td align="center">
							<p>
								<input type="checkbox" value="<%=ps.getPublicId()%> <%=publicCntList.get(cnt) %> " name="public">
							</p>
						</td>
					</tr>
					<%
						cnt++;
						}
					%>
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