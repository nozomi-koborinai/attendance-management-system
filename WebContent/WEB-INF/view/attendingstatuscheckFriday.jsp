<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.LoginUser"%>
<%@ page import="dto.Time"%>
<%@ page import="dto.ClassData"%>
<%@ page import="dto.CourseData"%>
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
<%
ArrayList<AttendanceInfo> attendanceList = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList");
ArrayList<AttendanceInfo> attendanceList2 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList2");
ArrayList<AttendanceInfo> attendanceList3 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList3");
ArrayList<AttendanceInfo> attendanceList4 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList4");
ArrayList<AttendanceInfo> attendanceList5 = (ArrayList<AttendanceInfo>) request.getAttribute("attendanceList5");
ArrayList<ClassData> classList = (ArrayList<ClassData>) request.getAttribute("classList");
ArrayList<CourseData> courseList = (ArrayList<CourseData>) request.getAttribute("courseList");
ArrayList<AttendanceInfo> userAttendanceList1 = (ArrayList<AttendanceInfo>) request.getAttribute("userAttendanceList1");
ArrayList<AttendanceInfo> userAttendanceList2 = (ArrayList<AttendanceInfo>) request.getAttribute("userAttendanceList2");
ArrayList<AttendanceInfo> userAttendanceList3 = (ArrayList<AttendanceInfo>) request.getAttribute("userAttendanceList3");
ArrayList<AttendanceInfo> userAttendanceList4 = (ArrayList<AttendanceInfo>) request.getAttribute("userAttendanceList4");
ArrayList<AttendanceInfo> userAttendanceList5 = (ArrayList<AttendanceInfo>) request.getAttribute("userAttendanceList5");
if(userAttendanceList1 != null){
	attendanceList = userAttendanceList1;
}
if(userAttendanceList2 != null){
	attendanceList2 = userAttendanceList2;
}
if(userAttendanceList3 != null){
	attendanceList3 = userAttendanceList3;
}
if(userAttendanceList4 != null){
	attendanceList4 = userAttendanceList4;
}
if(userAttendanceList5 != null){
	attendanceList5 = userAttendanceList5;
}

LoginUser user = (LoginUser) session.getAttribute("user");
Date date = (Date) request.getAttribute("date");

//Timeクラスインスタンス化
Time jikan = new Time();

//Calenderクラスのインタスタンス生成
Calendar cl = Calendar.getInstance();
//日付フォーマットの定義
SimpleDateFormat sdf = new SimpleDateFormat("MM'月'dd'日'");
SimpleDateFormat sdf2 = new SimpleDateFormat("kk:mm");

String nowTime = sdf2.format(date);
//ユーザの出席情報を表示したかのフラグ
int flag = 0;

cl.setTime(date);
String searchName = (String) request.getAttribute("searchName");
%>

<header>
<div class ="header">
生徒の出席状況
</div>
<div class="login">
<a><%=user.getUser_name()%>さん</a>
		<form>
			<button type="button"
				onClick="location.href='/Attendance_management_system/LogOut'">ログアウト</button>
		</form>
		</div>
</header>
<script>
		function functionName() {
			var select1 = document.forms.formName.selectName1; //変数select1を宣言
			var select2 = document.forms.formName.selectName2; //変数select2を宣言

			select2.options.length = 0;

			if (select1.options[select1.selectedIndex].value == "s.s_class_id") {
				<%
				int b = 0;
				for(ClassData cd : classList){
				%>

				select2.options[<%=b%>] = new Option("<%=cd.getClass_name()%>");

				<%
				b++;
				}
				%>
			}

			else if (select1.options[select1.selectedIndex].value == "s.s_course_id") {

				<%
				int a = 0;
				for(CourseData coursed : courseList){
				%>

				select2.options[<%=a%>] = new Option("<%=coursed.getCourse_name()%>");

				<%
				a++;
				}
				%>

			}

		}
	</script>

	<center>

	<a>絞り込み検索も可能です。</a>
				<form name="formName" action="/Attendance_management_system/RefineSearch" method="get">
				<!--選択肢①-->
				<select name="selectName1" onChange="functionName()">
					<option value="s.s_class_id">学科全体で絞込</option>
					<option value="s.s_course_id">コースのみで絞込</option>
				</select>

				<!--選択肢②（選択肢①の項目によって変化）-->
				<select name="selectName2"></select>
			<input type="submit" value="検索！" style="WIDTH: 100px; HEIGHT: 30px;">
		</form><br>

		<%if(searchName != null){%>
		<a><%=searchName %></a>
		<%} %>

		<table border="1" class="table">

			<tr>
				<th class="th1"></th>
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
				<td>欠席数日数(累計)</td>
				<td>遅刻数(累計)</td>
				<td>出席率</td>
				<td>公欠申請</td>
			</tr>

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
				<td>欠</td>
				<%flag = 10; %>

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
				<td>欠</td>
				<%flag = 10; %>

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
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime1()))) < 0){%>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<%flag = 10; %>


				<%} else if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime6()))) >= 0){%>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<%flag = 10; %>


				<%} else if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime5()))) >= 0){%>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>　</td>
				<%flag = 10; %>

				<%} else if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime4()))) >= 0){%>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>　</td>
				<td>　</td>
				<%flag = 10; %>

				<%} else if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime3()))) >= 0){%>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<%flag = 10; %>

				<%} else if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime2()))) >= 0){%>
				<td>欠</td>
				<td>欠</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<%flag = 10; %>

				<%}else if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime1()))) >= 0){%>
				<td>欠</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<td>　</td>
				<%flag = 10; %>

				<%} %>
				<% }else { %>

				<% if(attendanceList5.get(n).getTime() == 1){%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime1()))) >= 0){%>
				<td><%=attendanceList5.get(n).getInfo() %></td>
				<%flag = 1; %>
				<%} else { %>
				<td>　</td>
				<%}%>

				<% if(n < attendanceList5.size() -1){ %>
				<% if(attendanceList5.get(n + 1).getTime() == 2){ %>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime2()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 2; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 2; %>
				<%}%>
				<%} %>

				<% if(attendanceList5.get(n + 1).getTime() == 3) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime3()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 3; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 3; %>
				<%}%>

				<% if(attendanceList5.get(n + 1).getTime() == 4) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime4()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 4; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 4; %>
				<%}%>

				<% if(attendanceList5.get(n + 1).getTime() == 5) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime5()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 5; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 5; %>
				<%}%>

				<% if(attendanceList5.get(n + 1).getTime() == 6) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime6()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 6; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 6; %>
				<%}%>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime1()))) >= 0){%>
				<td>欠</td>
				<%flag = 10; %>
				<%} else { %>
				<td>　</td>
				<%flag = 10; %>
				<%}%>
				<%} %>

				<%if(flag == 0 || flag == 1 || flag == 10){ %>
				<% if(attendanceList5.get(n).getTime() == 2){ %>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime2()))) >= 0){%>
				<td><%=attendanceList5.get(n).getInfo() %></td>
				<%flag = 2; %>
				<%} else { %>
				<td>　</td>
				<%flag = 2; %>
				<%}%>

				<% if(n < attendanceList5.size() -1){ %>
				<% if(attendanceList5.get(n + 1).getTime() == 3) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime3()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 3; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 3; %>
				<%}%>
				<%} %>

				<% if(attendanceList5.get(n + 1).getTime() == 4) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime4()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 4; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 4; %>
				<%}%>

				<% if(attendanceList5.get(n + 1).getTime() == 5) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime5()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 5; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 5; %>
				<%}%>

				<% if(attendanceList5.get(n + 1).getTime() == 6) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime6()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 6; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 6; %>
				<%}%>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime2()))) >= 0){%>
				<td>欠</td>
				<%flag = 10; %>
				<%} else { %>
				<td>　</td>
				<%flag = 10; %>
				<%}%>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 2 || flag == 10){ %>
				<% if(attendanceList5.get(n).getTime() == 3) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime3()))) >= 0){%>
				<td><%=attendanceList5.get(n).getInfo() %></td>
				<%flag = 3; %>
				<%} else { %>
				<td>　</td>
				<%flag = 3; %>
				<%}%>

				<% if(n < attendanceList5.size() -1){ %>
				<% if(attendanceList5.get(n + 1).getTime() == 4) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime4()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 4; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 4; %>
				<%}%>
				<%} %>

				<% if(attendanceList5.get(n + 1).getTime() == 5) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime5()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 5; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 5; %>
				<%}%>

				<% if(attendanceList5.get(n + 1).getTime() == 6) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime6()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 6; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 6; %>
				<%}%>

				<%} %>
				<%} %>
				<%} %>
				<%} else {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime3()))) >= 0){%>
				<td>欠</td>
				<%flag = 10; %>
				<%} else { %>
				<td>　</td>
				<%flag = 10; %>
				<%}%>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 3 || flag == 10){ %>
				<% if(attendanceList5.get(n).getTime() == 4) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime4()))) >= 0){%>
				<td><%=attendanceList5.get(n).getInfo() %></td>
				<%flag = 4; %>
				<%} else { %>
				<td>　</td>
				<%flag = 4; %>
				<%}%>

				<% if(n < attendanceList5.size() -1){ %>
				<% if(attendanceList5.get(n + 1).getTime() == 5) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime5()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 5; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 5; %>
				<%}%>
				<%} %>

				<% if(attendanceList5.get(n + 1).getTime() == 6) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime6()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 6; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 6; %>
				<%}%>

				<%} %>
				<%} %>
				<%} else {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime4()))) >= 0){%>
				<td>欠</td>
				<%flag = 10; %>
				<%} else { %>
				<td>　</td>
				<%flag = 10; %>
				<%}%>

				<%} %>
				<%} %>


				<%if(flag == 0 || flag == 4 || flag == 10){ %>
				<% if(attendanceList5.get(n).getTime() == 5) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime5()))) >= 0){%>
				<td><%=attendanceList5.get(n).getInfo() %></td>
				<%flag = 5; %>
				<%} else { %>
				<td>　</td>
				<%flag = 5; %>
				<%}%>

				<% if(n < attendanceList5.size() -1){ %>
				<% if(attendanceList5.get(n + 1).getTime() == 6) {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime6()))) >= 0){%>
				<td><%=attendanceList5.get(n + 1).getInfo() %></td>
				<%n++; %>
				<%flag = 6; %>
				<%} else { %>
				<td>　</td>
				<%n++; %>
				<%flag = 6; %>
				<%}%>
				<%} %>

				<%} %>
				<%} else {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime5()))) >= 0){%>
				<td>欠</td>
				<%flag = 10; %>
				<%} else { %>
				<%flag = 10; %>
				<td>　</td>
				<%}%>

				<%} %>
				<%} %>

				<%if(flag == 0 || flag == 5 || flag == 10){ %>
				<% if(attendanceList5.get(n).getTime() == 6){%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime6()))) >= 0){%>
				<td><%=attendanceList5.get(n).getInfo() %></td>
				<%flag = 6; %>
				<%} else { %>
				<td>　</td>
				<%flag = 6; %>
				<%}%>

				<%} else {%>
				<%if(nowTime.compareTo(sdf2.format(sdf2.parse(jikan.getEndTime6()))) >= 0){%>
				<td>欠</td>
				<%flag = 10; %>
				<%} else { %>
				<td>　</td>
				<%flag = 10; %>
				<%}%>

				<%} %>
				<%} %>
				<%} %>
				<%} %>
				<%flag = 0; %>

				<td><%=attendanceList.get(i).getAbsence() %></td>
				<td><%=attendanceList.get(i).getLate() %></td>
				<td><%=attendanceList.get(i).getAttendanceRate() %>％</td>

				<%if(attendanceList.get(i).getPublicFlag() == 1){ %>
				<td><form action="/Attendance_management_system/ApplicationStatusCheck" method="get"><button type="submit" name="check" value=<%=attendanceList.get(i).getSNumber()%>>公欠確認</button></form></td>
				<%} else { %>
				<td>　　</td>
				<%} %>



			</tr>
			<tr>
				<% }%>

</body>
</html>