<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/CSS/publicapplication.css"
	rel="stylesheet" type="text/css">
<title>public application</title>
</head>
<%
int barcodeDate = (Integer) request.getAttribute("bDate");
String sName = (String) request.getAttribute("studentName");
%>
<header> 公欠申請ページ </header>
<a><%=sName %></a>
<body>
	<center>
		<div id="a">
			<form action="/Attendance_management_system/PublicApplicationConfirmation" method="get">
				【理由】<input type="text" placeholder="例：盛岡情報ビジネス専門学校の内定式にいくため。"
					id="why" name="why"><br>【場所】<input type="text"
					placeholder="例：岩手県盛岡市中央通３丁目２−１７" name="place"><br>

				<div id="pulldown">
					<%--行く年月日 --%>
					【期間】 <select name="year" id="year">
						<%
							for (int i = 2018; i < 2025; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>年 <select name="month" id="month">
						<%
							for (int i = 1; i < 13; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>月 <select name="day" id="day">
						<%
							for (int i = 1; i < 32; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>日 <select name="hour" id="hour">
						<%
							for (int i = 0; i < 25; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>時 <select name="minute" id="minute">
						<%
							for (int i = 0; i < 60; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>分 から
				</div>

				<div id="pulldown2">
					<%--戻ってくる年月日 --%>
					<select name="year2" id="year2">
						<%
							for (int i = 2018; i < 2025; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>年 <select name="month2" id="month">
						<%
							for (int i = 1; i < 13; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>月 <select name="day2" id="day">
						<%
							for (int i = 1; i < 32; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>日 <select name="hour2" id="hour">
						<%
							for (int i = 0; i < 25; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>時 <select name="minute2" id="minute">
						<%
							for (int i = 0; i < 60; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>分 まで
				</div>
				<input type="hidden" name="barcodeDate" value=<%=barcodeDate%>>
				<input type="submit" value="確定">
			</form>
		</div>
</body>
<footer>
	<div id="bottom1">
		<form action="/Attendance_management_system/Menu" method="get"
			name='form-back'>
			<input type="submit" value="メニューへ">
		</form>
	</div>
</footer>
</html>