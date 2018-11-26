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
//ユーザの出席情報を表示したかのフラグ
int flag = 0;

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
			<%-- ココから下はログイン時刻によってどの曜日を取得するか決定 --%>
			<%if(day == 1){ %>
				<%for(int i = 0; i < attendanceList.size(); i++){ %>

			<tr>
			<tr align="center">

				<%if(i < attendanceList.size()){ %>
				<td><%=attendanceList.get(i).getName()%></td>

				<%if(attendanceList.get(i).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>
				<% }%>
				<% }else { %>

				<% if(attendanceList.get(i).getTime() == 1){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 1; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 2){ %>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++;%>
				<%flag = 2; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 3; %>

				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<% if(flag == 0 || flag == 1 || flag == 10){ {%>
				<% if(attendanceList.get(i).getTime() == 2){ %>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 2; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 3; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 3) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 3; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 4) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 4; %>


				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 5) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 5; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 6){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>


				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>

				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>

				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>

				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>

				<td>0</td>
				<td>0</td>
				<td>％</td>
				<td>あり</td>



			</tr>
			<tr>
				<% }%>



				<%} else if(day == 2){ %>
				<%for(int i = 0, k = 0; i < attendanceList.size(); i++, k++){ %>

			<tr>
			<tr align="center">

				<%if(i < attendanceList.size()){ %>
				<td><%=attendanceList.get(i).getName()%></td>

				<%if(attendanceList.get(i).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>
				<% }%>
				<% }else { %>

				<% if(attendanceList.get(i).getTime() == 1){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 1; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 2){ %>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++;%>
				<%flag = 2; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 3; %>

				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<% if(flag == 0 || flag == 1 || flag == 10){ {%>
				<% if(attendanceList.get(i).getTime() == 2){ %>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 2; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 3; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 3) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 3; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 4) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 4; %>


				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 5) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 5; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 6){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>



				<%if(k < attendanceList2.size()){ %>
				<%if(attendanceList2.get(k).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>

				<% }%>
				<% }else { %>

				<% if(attendanceList2.get(k).getTime() == 1){%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 1; %>

				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 2){ %>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 2; %>
				<%} %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 3; %>

				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 4; %>

				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<%if(flag == 0 || flag == 1 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 2){ %>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 2; %>


				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 3; %>
				<%} %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 4; %>

				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 3) {%>
				<%flag = 3; %>

				<td><%=attendanceList2.get(k).getInfo() %></td>

				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 4) {%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 4; %>

				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 5) {%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 5; %>


				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 6){%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>

				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>

				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>

				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>

				<td>0</td>
				<td>0</td>
				<td>％</td>
				<td>あり</td>



			</tr>
			<tr>
				<% }%>

				<%} else if(day == 3){ %>
				<%for(int i = 0, k = 0, l = 0; i < attendanceList.size(); i++, k++, l++){ %>

			<tr>
			<tr align="center">

				<%if(i < attendanceList.size()){ %>
				<td><%=attendanceList.get(i).getName()%></td>

				<%if(attendanceList.get(i).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>
				<% }%>
				<% }else { %>

				<% if(attendanceList.get(i).getTime() == 1){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 1; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 2){ %>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++;%>
				<%flag = 2; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 3; %>

				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<% if(flag == 0 || flag == 1 || flag == 10){ {%>
				<% if(attendanceList.get(i).getTime() == 2){ %>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 2; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 3; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 3) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 3; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 4) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 4; %>


				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 5) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 5; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 6){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>



				<%if(k < attendanceList2.size()){ %>
				<%if(attendanceList2.get(k).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>

				<% }%>
				<% }else { %>

				<% if(attendanceList2.get(k).getTime() == 1){%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 1; %>

				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 2){ %>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 2; %>
				<%} %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 3; %>

				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 4; %>

				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<%if(flag == 0 || flag == 1 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 2){ %>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 2; %>


				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 3; %>
				<%} %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 4; %>

				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 3) {%>
				<%flag = 3; %>

				<td><%=attendanceList2.get(k).getInfo() %></td>

				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 4) {%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 4; %>

				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 5) {%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 5; %>


				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 6){%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>


				<%if(l < attendanceList3.size()){ %>
				<%if(attendanceList3.get(l).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>

				<% }%>
				<% }else { %>

				<% if(attendanceList3.get(l).getTime() == 1){%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 1; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 2){ %>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 2; %>
				<%} %>

				<% if(attendanceList3.get(l + 1).getTime() == 3) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 3; %>

				<% if(attendanceList3.get(l + 1).getTime() == 4) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 4; %>

				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 5; %>

				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<%flag = 10; %>

				<td>欠</td>
				<%} %>

				<%if(flag == 0 || flag == 1 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 2){ %>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 2; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 3) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 3; %>
				<%} %>

				<% if(attendanceList3.get(l + 1).getTime() == 4) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 4; %>

				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 5; %>

				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 3) {%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 3; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 4) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 5; %>

				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 4) {%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 4; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 5) {%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 5; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 6){%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>

				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>

				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>

				<td>0</td>
				<td>0</td>
				<td>％</td>
				<td>あり</td>



			</tr>
			<tr>
				<% }%>

				<%} else if(day == 4){ %>
				<%for(int i = 0, k = 0, l = 0, m = 0; i < attendanceList.size(); i++, k++, l++, m++){ %>

			<tr>
			<tr align="center">

				<%if(i < attendanceList.size()){ %>
				<td><%=attendanceList.get(i).getName()%></td>

				<%if(attendanceList.get(i).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>
				<% }%>
				<% }else { %>

				<% if(attendanceList.get(i).getTime() == 1){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 1; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 2){ %>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++;%>
				<%flag = 2; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 3; %>

				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<% if(flag == 0 || flag == 1 || flag == 10){ {%>
				<% if(attendanceList.get(i).getTime() == 2){ %>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 2; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 3; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 3) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 3; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 4) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 4; %>


				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 5) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 5; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 6){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>



				<%if(k < attendanceList2.size()){ %>
				<%if(attendanceList2.get(k).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>

				<% }%>
				<% }else { %>

				<% if(attendanceList2.get(k).getTime() == 1){%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 1; %>

				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 2){ %>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 2; %>
				<%} %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 3; %>

				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 4; %>

				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<%if(flag == 0 || flag == 1 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 2){ %>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 2; %>


				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 3; %>
				<%} %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 4; %>

				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 3) {%>
				<%flag = 3; %>

				<td><%=attendanceList2.get(k).getInfo() %></td>

				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 4) {%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 4; %>

				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 5) {%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 5; %>


				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 6){%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>


				<%if(l < attendanceList3.size()){ %>
				<%if(attendanceList3.get(l).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>

				<% }%>
				<% }else { %>

				<% if(attendanceList3.get(l).getTime() == 1){%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 1; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 2){ %>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 2; %>
				<%} %>

				<% if(attendanceList3.get(l + 1).getTime() == 3) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 3; %>

				<% if(attendanceList3.get(l + 1).getTime() == 4) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 4; %>

				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 5; %>

				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<%flag = 10; %>

				<td>欠</td>
				<%} %>

				<%if(flag == 0 || flag == 1 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 2){ %>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 2; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 3) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 3; %>
				<%} %>

				<% if(attendanceList3.get(l + 1).getTime() == 4) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 4; %>

				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 5; %>

				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 3) {%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 3; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 4) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 5; %>

				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 4) {%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 4; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 5) {%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 5; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 6){%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>






				<%if(m < attendanceList4.size()){ %>
				<%if(attendanceList4.get(m).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>

				<% }%>
				<% }else { %>

				<% if(attendanceList4.get(m).getTime() == 1){%>
				<td><%=attendanceList4.get(m).getInfo() %></td>
				<%flag = 1; %>

				<% if(m < attendanceList4.size() -1){ %>
				<% if(attendanceList4.get(m + 1).getTime() == 2){ %>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 2; %>
				<%} %>

				<% if(attendanceList4.get(m + 1).getTime() == 3) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 3; %>

				<% if(attendanceList4.get(m + 1).getTime() == 4) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 4; %>

				<% if(attendanceList4.get(m + 1).getTime() == 5) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 5; %>

				<% if(attendanceList4.get(m + 1).getTime() == 6) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<%flag = 10; %>

				<td>欠</td>
				<%} %>

				<%if(flag == 0 || flag == 1 || flag == 10){ %>
				<% if(attendanceList4.get(m).getTime() == 2){ %>
				<td><%=attendanceList4.get(m).getInfo() %></td>
				<%flag = 2; %>

				<% if(m < attendanceList4.size() -1){ %>
				<% if(attendanceList4.get(m + 1).getTime() == 3) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 3; %>
				<%} %>

				<% if(attendanceList4.get(m + 1).getTime() == 4) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 4; %>

				<% if(attendanceList4.get(m + 1).getTime() == 5) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 5; %>

				<% if(attendanceList4.get(m + 1).getTime() == 6) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList4.get(m).getTime() == 3) {%>
				<td><%=attendanceList4.get(m).getInfo() %></td>
				<%flag = 3; %>

				<% if(m < attendanceList4.size() -1){ %>
				<% if(attendanceList4.get(m + 1).getTime() == 4) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList4.get(m + 1).getTime() == 5) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 5; %>

				<% if(attendanceList4.get(m + 1).getTime() == 6) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList4.get(m).getTime() == 4) {%>
				<td><%=attendanceList4.get(m).getInfo() %></td>
				<%flag = 4; %>

				<% if(m < attendanceList4.size() -1){ %>
				<% if(attendanceList4.get(m + 1).getTime() == 5) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList4.get(m + 1).getTime() == 6) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList4.get(m).getTime() == 5) {%>
				<td><%=attendanceList4.get(m).getInfo() %></td>
				<%flag = 5; %>

				<% if(l < attendanceList4.size() -1){ %>
				<% if(attendanceList4.get(m + 1).getTime() == 6) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList4.get(m).getTime() == 6){%>
				<td><%=attendanceList4.get(m).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>


				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>0</td>
				<td>0</td>
				<td>％</td>
				<td>あり</td>



			</tr>
			<tr>
				<% }%>

				<%} else if(day == 5){ %>
				<%for(int i = 0, k = 0, l = 0, m = 0, n = 0; i < attendanceList.size(); i++, k++, l++, m++, n++){ %>

			<tr>
			<tr align="center">

				<%if(i < attendanceList.size()){ %>
				<td><%=attendanceList.get(i).getName()%></td>

				<%if(attendanceList.get(i).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>
				<% }%>
				<% }else { %>

				<% if(attendanceList.get(i).getTime() == 1){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 1; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 2){ %>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++;%>
				<%flag = 2; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 3; %>

				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<% if(flag == 0 || flag == 1 || flag == 10){ {%>
				<% if(attendanceList.get(i).getTime() == 2){ %>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 2; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 3) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 3; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 3) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 3; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 4) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 4) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 4; %>


				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 5) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 5) {%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 5; %>

				<% if(i < attendanceList.size() -1){ %>
				<% if(attendanceList.get(i + 1).getTime() == 6) {%>
				<td><%=attendanceList.get(i + 1).getInfo() %></td>
				<%i++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList.get(i).getTime() == 6){%>
				<td><%=attendanceList.get(i).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>



				<%if(k < attendanceList2.size()){ %>
				<%if(attendanceList2.get(k).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>

				<% }%>
				<% }else { %>

				<% if(attendanceList2.get(k).getTime() == 1){%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 1; %>

				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 2){ %>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 2; %>
				<%} %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 3; %>

				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 4; %>

				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>

				<%if(flag == 0 || flag == 1 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 2){ %>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 2; %>


				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 3) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 3; %>
				<%} %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 4; %>

				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 3) {%>
				<%flag = 3; %>

				<td><%=attendanceList2.get(k).getInfo() %></td>

				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 4) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 4) {%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 4; %>

				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 5) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 5) {%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 5; %>


				<% if(k < attendanceList2.size() -1){ %>
				<% if(attendanceList2.get(k + 1).getTime() == 6) {%>
				<td><%=attendanceList2.get(k + 1).getInfo() %></td>
				<%k++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList2.get(k).getTime() == 6){%>
				<td><%=attendanceList2.get(k).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>


				<%if(l < attendanceList3.size()){ %>
				<%if(attendanceList3.get(l).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>

				<% }%>
				<% }else { %>

				<% if(attendanceList3.get(l).getTime() == 1){%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 1; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 2){ %>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 2; %>
				<%} %>

				<% if(attendanceList3.get(l + 1).getTime() == 3) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 3; %>

				<% if(attendanceList3.get(l + 1).getTime() == 4) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 4; %>

				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 5; %>

				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<%flag = 10; %>

				<td>欠</td>
				<%} %>

				<%if(flag == 0 || flag == 1 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 2){ %>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 2; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 3) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 3; %>
				<%} %>

				<% if(attendanceList3.get(l + 1).getTime() == 4) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 4; %>

				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 5; %>

				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 3) {%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 3; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 4) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 5; %>

				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 4) {%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 4; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 5) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 5) {%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 5; %>

				<% if(l < attendanceList3.size() -1){ %>
				<% if(attendanceList3.get(l + 1).getTime() == 6) {%>
				<td><%=attendanceList3.get(l + 1).getInfo() %></td>
				<%l++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList3.get(l).getTime() == 6){%>
				<td><%=attendanceList3.get(l).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>






				<%if(m < attendanceList4.size()){ %>
				<%if(attendanceList4.get(m).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>

				<% }%>
				<% }else { %>

				<% if(attendanceList4.get(m).getTime() == 1){%>
				<td><%=attendanceList4.get(m).getInfo() %></td>
				<%flag = 1; %>

				<% if(m < attendanceList4.size() -1){ %>
				<% if(attendanceList4.get(m + 1).getTime() == 2){ %>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 2; %>
				<%} %>

				<% if(attendanceList4.get(m + 1).getTime() == 3) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 3; %>

				<% if(attendanceList4.get(m + 1).getTime() == 4) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 4; %>

				<% if(attendanceList4.get(m + 1).getTime() == 5) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 5; %>

				<% if(attendanceList4.get(m + 1).getTime() == 6) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<%flag = 10; %>

				<td>欠</td>
				<%} %>

				<%if(flag == 0 || flag == 1 || flag == 10){ %>
				<% if(attendanceList4.get(m).getTime() == 2){ %>
				<td><%=attendanceList4.get(m).getInfo() %></td>
				<%flag = 2; %>

				<% if(m < attendanceList4.size() -1){ %>
				<% if(attendanceList4.get(m + 1).getTime() == 3) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 3; %>
				<%} %>

				<% if(attendanceList4.get(m + 1).getTime() == 4) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 4; %>

				<% if(attendanceList4.get(m + 1).getTime() == 5) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 5; %>

				<% if(attendanceList4.get(m + 1).getTime() == 6) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList4.get(m).getTime() == 3) {%>
				<td><%=attendanceList4.get(m).getInfo() %></td>
				<%flag = 3; %>

				<% if(m < attendanceList4.size() -1){ %>
				<% if(attendanceList4.get(m + 1).getTime() == 4) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList4.get(m + 1).getTime() == 5) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 5; %>

				<% if(attendanceList4.get(m + 1).getTime() == 6) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList4.get(m).getTime() == 4) {%>
				<td><%=attendanceList4.get(m).getInfo() %></td>
				<%flag = 4; %>

				<% if(m < attendanceList4.size() -1){ %>
				<% if(attendanceList4.get(m + 1).getTime() == 5) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList4.get(m + 1).getTime() == 6) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList4.get(m).getTime() == 5) {%>
				<td><%=attendanceList4.get(m).getInfo() %></td>
				<%flag = 5; %>

				<% if(m < attendanceList4.size() -1){ %>
				<% if(attendanceList4.get(m + 1).getTime() == 6) {%>
				<td><%=attendanceList4.get(m + 1).getInfo() %></td>
				<%m++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList4.get(m).getTime() == 6){%>
				<td><%=attendanceList4.get(m).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>


				<%if(n < attendanceList5.size()){ %>
				<%if(attendanceList5.get(n).getDate() == null){%>
				<%for(int j = 1; j <= 6; j++){ %>
				<td>欠</td>
				<%flag = 10; %>

				<% }%>
				<% }else { %>

				<% if(attendanceList5.get(n).getTime() == 1){%>
				<td><%=attendanceList5.get(n).getInfo() %></td>
				<%flag = 1; %>

				<% if(n < attendanceList5.size() -1){ %>
				<% if(attendanceList5.get(n + 1).getTime() == 2){ %>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 2; %>
				<%} %>

				<% if(attendanceList5.get(n + 1).getTime() == 3) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 3; %>

				<% if(attendanceList5.get(n + 1).getTime() == 4) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 4; %>

				<% if(attendanceList5.get(n + 1).getTime() == 5) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 5; %>

				<% if(attendanceList5.get(n + 1).getTime() == 6) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<%flag = 10; %>

				<td>欠</td>
				<%} %>

				<%if(flag == 0 || flag == 1 || flag == 10){ %>
				<% if(attendanceList5.get(n).getTime() == 2){ %>
				<td><%=attendanceList5.get(n).getInfo() %></td>
				<%flag = 2; %>

				<% if(n < attendanceList5.size() -1){ %>
				<% if(attendanceList5.get(n + 1).getTime() == 3) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 3; %>
				<%} %>

				<% if(attendanceList5.get(n + 1).getTime() == 4) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 4; %>

				<% if(attendanceList5.get(n + 1).getTime() == 5) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 5; %>

				<% if(attendanceList5.get(n + 1).getTime() == 6) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList5.get(n).getTime() == 3) {%>
				<td><%=attendanceList5.get(n).getInfo() %></td>
				<%flag = 3; %>

				<% if(n < attendanceList5.size() -1){ %>
				<% if(attendanceList5.get(n + 1).getTime() == 4) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 4; %>
				<%} %>

				<% if(attendanceList5.get(n + 1).getTime() == 5) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 5; %>

				<% if(attendanceList5.get(n + 1).getTime() == 6) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList5.get(n).getTime() == 4) {%>
				<td><%=attendanceList5.get(n).getInfo() %></td>
				<%flag = 4; %>

				<% if(n < attendanceList5.size() -1){ %>
				<% if(attendanceList5.get(n + 1).getTime() == 5) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 5; %>
				<%} %>

				<% if(attendanceList5.get(n + 1).getTime() == 6) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 6; %>

				<%} %>
				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList5.get(n).getTime() == 5) {%>
				<td><%=attendanceList5.get(n).getInfo() %></td>
				<%flag = 5; %>

				<% if(n < attendanceList5.size() -1){ %>
				<% if(attendanceList5.get(n + 1).getTime() == 6) {%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 6; %>
				<%} %>

				<%} %>
				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList5.get(n).getTime() == 6){%>
				<td><%=attendanceList5.get(n).getInfo() %></td>
				<%flag = 6; %>

				<%} else {%>
				<td>欠</td>
				<%flag = 10; %>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>

				<td>0</td>
				<td>0</td>
				<td>％</td>
				<td>あり</td>



			</tr>
			<tr>
				<% }%>
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