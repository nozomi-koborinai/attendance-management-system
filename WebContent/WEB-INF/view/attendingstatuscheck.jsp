<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.LoginUser"%>
<%@ page import="dto.AttendanceInfo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/CSS/attendingstatuscheck.css"
	rel="stylesheet" type="text/css">
<title>attending status check</title>
</head>
<body onLoad="functionName()">
	<script>
		function functionName() {
			var select1 = document.forms.formName.selectName1; //変数select1を宣言
			var select2 = document.forms.formName.selectName2; //変数select2を宣言

			select2.options.length = 0;

			if (select1.options[select1.selectedIndex].value == 0) {
				select2.options[0] = new Option("システムエンジニアコース");
				select2.options[1] = new Option("大学編入");
			}

			else if (select1.options[select1.selectedIndex].value == 1) {
				select2.options[0] = new Option("WEBアプリケーション");
				select2.options[1] = new Option("ネットワークエンジニア");
			}

			else if (select1.options[select1.selectedIndex].value == 2) {
				select2.options[0] = new Option("会計ビジネス");
				select2.options[1] = new Option("会計エキスパート");
				select2.options[2] = new Option("公共ビジネス");
			}

		}
	</script>

	<%
LoginUser user = (LoginUser) session.getAttribute("user");
Date date = (Date) request.getAttribute("date");
Integer day = (Integer) request.getAttribute("day");
ArrayList<AttendanceInfo> attendanceList = null;
ArrayList<AttendanceInfo> attendanceList2 = null;
ArrayList<AttendanceInfo> attendanceList3 = null;
ArrayList<AttendanceInfo> attendanceList4 = null;
ArrayList<AttendanceInfo> attendanceList5 = null;

if(day == 1){
	attendanceList = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList");
} else if(day == 2){
	attendanceList = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList");
	attendanceList2 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList2");
} else if(day == 3){
	attendanceList = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList");
	attendanceList2 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList2");
	attendanceList3 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList3");
} else if(day == 4){
	attendanceList = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList");
	attendanceList2 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList2");
	attendanceList3 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList3");
	attendanceList4 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList4");
} else if(day == 5){
	attendanceList = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList");
	attendanceList2 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList2");
	attendanceList3 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList3");
	attendanceList4 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList4");
	attendanceList5 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList5");
}

//Calenderクラスのインタスタンス生成
Calendar cl = Calendar.getInstance();
//日付フォーマットの定義
SimpleDateFormat sdf = new SimpleDateFormat("MM'月'dd'日'");

cl.setTime(date);
%>

	<header> 生徒の出席状況 </header>


	<center>
		<table border="1" class="table">

			<tr>
				<th class="th1"></th>
				<%if(day == 1){ %>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%} %>


				<%if(day == 2){ %>
				<%cl.add(Calendar.DAY_OF_MONTH,-1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%} %>


				<% if(day == 3){%>
				<%cl.add(Calendar.DAY_OF_MONTH,-2);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%} %>


				<% if(day == 4){%>
				<%cl.add(Calendar.DAY_OF_MONTH,-3);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%} %>


				<% if(day == 5){%>
				<%cl.add(Calendar.DAY_OF_MONTH,-4);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%cl.add(Calendar.DAY_OF_MONTH,1);
				  date = cl.getTime();
				%>
				<th colspan="6" class="th"><%=sdf.format(date) %></th>
				<%} %>
			</tr>
			<tr>
			<tr align="center">
				<td>氏名</td>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>欠席数</td>
				<td>遅刻数</td>
				<td>出席率</td>
				<td>公欠申請</td>
			</tr>
			<%-- ココから下は見栄え用 --%>
			<%if(day == 1){%>
			<%for(int i = 0; i < attendanceList.size(); i++){ %>
			<tr>
			<tr align="center">
				<td><%=attendanceList.get(i).getName()%></td>

				<%if(attendanceList.get(i).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<% }%>
				<% }else { %>

				<% if(attendanceList.get(i).getTime() == 1){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 2){ %>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 2){ %>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 3) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 4) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 5) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 6){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>0</td>
				<td>0</td>
				<td>100%</td>
				<td>公欠申請なし</td>
			</tr>
			<tr>
				<%} %>
				<%} %>



				<%} else if(day == 2){%>
				<%for(int i = 0; i < attendanceList.size(); i++){ %>

			<tr>
			<tr align="center">
				<td><%=attendanceList.get(i).getName()%></td>

				<%if(attendanceList.get(i).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<% }%>
				<% }else { %>

				<% if(attendanceList.get(i).getTime() == 1){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 2){ %>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 2){ %>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 3) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 4) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 5) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 6){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%} else {%>
				<td>欠</td>
				<%} %>


				<%if(attendanceList2.get(i).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<% }%>
				<% }else { %>

				<% if(attendanceList2.get(i).getTime() == 1){%>
				<td><%=attendanceList2.get(i).getInfo() %></td>
				<% if(attendanceList2.get(i + 1).getTime() == 2){ %>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(i).getTime() == 2){ %>
				<td><%=attendanceList2.get(i).getInfo() %></td>
				<% if(attendanceList2.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(i).getTime() == 3) {%>
				<td><%=attendanceList2.get(i).getInfo() %></td>
				<% if(attendanceList2.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(i).getTime() == 4) {%>
				<td><%=attendanceList2.get(i).getInfo() %></td>
				<% if(attendanceList2.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(i).getTime() == 5) {%>
				<td><%=attendanceList2.get(i).getInfo() %></td>
				<% if(attendanceList2.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(i).getTime() == 6){%>
				<td><%=attendanceList2.get(i).getInfo() %></td>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>0</td>
				<td>0</td>
				<td>100%</td>
				<td>公欠申請なし</td>
			</tr>
			<tr>
				<%} %>
				<%} %>
				<%} %>

				<%} else if(day == 3){ %>
				<%for(int i = 0; i < attendanceList.size(); i++){ %>

			<tr>
			<tr align="center">
				<td><%=attendanceList.get(i).getName()%></td>

				<%if(attendanceList.get(i).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<% }%>
				<% }else { %>

				<% if(attendanceList.get(i).getTime() == 1){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 2){ %>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 2){ %>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 3) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 4) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 5) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 6){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%} else {%>
				<td>欠</td>
				<%} %>


				<%if(attendanceList2.get(i).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<% }%>
				<% }else { %>

				<% if(attendanceList2.get(i).getTime() == 1){%>
				<td><%=attendanceList2.get(i).getInfo() %></td>
				<% if(attendanceList2.get(i + 1).getTime() == 2){ %>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(i).getTime() == 2){ %>
				<td><%=attendanceList2.get(i).getInfo() %></td>
				<% if(attendanceList2.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(i).getTime() == 3) {%>
				<td><%=attendanceList2.get(i).getInfo() %></td>
				<% if(attendanceList2.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(i).getTime() == 4) {%>
				<td><%=attendanceList2.get(i).getInfo() %></td>
				<% if(attendanceList2.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList2.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(i).getTime() == 5) {%>
				<td><%=attendanceList2.get(i).getInfo() %></td>
				<% if(attendanceList2.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(i).getTime() == 6){%>
				<td><%=attendanceList2.get(i).getInfo() %></td>
				<%} else {%>
				<td>欠</td>
				<%} %>





				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>/</td>
				<td>0</td>
				<td>0</td>
				<td>100%</td>
				<td>公欠申請なし</td>
			</tr>
			<tr>
				<%} %>
				<%} %>
				<%} %>

				<%} else if(day == 4){ %>
				<%for(int i = 0, k = 0, l = 0, m = 0; i < 20; ){ %>

			<tr>
			<tr align="center">

				<%if(i < attendanceList.size()){ %>
				<td><%=attendanceList.get(i).getName()%></td>

				<%if(attendanceList.get(i).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<% }%>
				<% }else { %>

				<% if(attendanceList.get(i).getTime() == 1){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 2){ %>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else { %>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 2){ %>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 3) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 4) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 5) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList.get(i).getTime() == 6){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<%} %>
				<%} %>


				<%if(k < attendanceList2.size()){ %>
				<%if(attendanceList2.get(k).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<% }%>
				<% }else { %>

				<% if(attendanceList2.get(k).getTime() == 1){%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<% if(attendanceList2.get(k + 1).getTime() == 2){ %>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<% if(attendanceList2.get(k + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(k).getTime() == 2){ %>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<% if(attendanceList2.get(k + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(k).getTime() == 3) {%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(k).getTime() == 4) {%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(k).getTime() == 5) {%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList2.get(k).getTime() == 6){%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%} else {%>
				<td>欠</td>
				<%} %>
				<%} %>
				<%} %>


				<%if(l < attendanceList3.size()){ %>
				<%if(attendanceList3.get(l).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<% }%>
				<% }else { %>

				<% if(attendanceList3.get(l).getTime() == 1){%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<% if(attendanceList3.get(l + 1).getTime() == 2){ %>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<% if(attendanceList3.get(l + 1).getTime() == 3) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<% if(attendanceList3.get(l + 1).getTime() == 4) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList3.get(l).getTime() == 2){ %>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<% if(attendanceList3.get(l + 1).getTime() == 3) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<% if(attendanceList3.get(l + 1).getTime() == 4) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList3.get(l).getTime() == 3) {%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<% if(attendanceList3.get(l + 1).getTime() == 4) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList3.get(l).getTime() == 4) {%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%k++; %>
				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList3.get(l).getTime() == 5) {%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%} %>

				<% if(attendanceList3.get(l).getTime() == 6){%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%} else {%>
				<td>欠</td>
				<%} %>
				<%} %>
				<%} %>










			</tr>
			<tr>
				<% i++;
				   k++;
				   l++;
				   m++; }
				%>

				<%} else if(day == 5){ %>

				<%} %>

		</table>
		<br> <br> <br>
		<form name="formName" action="/aaa/aaa" method="post">
			<select name="years">
				<option value=1>1</option>
				<option value=2>2</option>
				<option value=3>3</option>
				<option value=4>4</option>
			</select>

			<!-- この選択肢によってこの後の選択肢を変更する -->
			<select name="selectName1" onChange="functionName()">
				<option value=0>情報システム科</option>
				<option value=1>WEBネットワーク</option>
				<option value=2>会計ビジネス</option>
			</select> <select name="selectName2"></select>

		</form>
</body>
<footer>
	<div id="bottom">
		<form name='form-back'>
			<input type="submit" value="戻る">
		</form>
	</div>
</footer>
</html>