<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Login"%>
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
Login user = (Login) session.getAttribute("user");
%>

<header> 生徒の出席状況 </header>


	<center>
		<table border="1" class="table">

			<tr>
				<th class="th1"></th>
				<th colspan="6" class="th">11月5日</th>
				<th colspan="6" class="th">11月6日</th>
				<th colspan="6" class="th">11月7日</th>
				<th colspan="6" class="th">11月8日</th>
				<th colspan="6" class="th">11月9日</th>
			</tr>
			<tr>
			<tr align="center">
				<td>名前</td>
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
			<%--ココから下の列は拡張for文で情報を格納して表示  --%>
			<%-- ココから下は見栄え用 --%>
			<tr>
			<tr align="center">
				<td>大須賀雅希</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>0</td>
				<td>0</td>
				<td>100%</td>
				<td>公欠申請なし</td>
			</tr>
			<tr>
			<tr align="center">
				<td>小堀内志</td>
				<td>〇</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>16</td>
				<td>0</td>
				<td>66.66%</td>
				<td>公欠申請あり</td>
			</tr>
			<tr>
			<tr align="center">
				<td>小成楓斗</td>
				<td>遅</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>遅</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>遅</td>
				<td>欠</td>
				<td>〇</td>
				<td>〇</td>
				<td>遅</td>
				<td>〇</td>
				<td>遅</td>
				<td>〇</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>欠</td>
				<td>遅</td>
				<td>〇</td>
				<td>〇</td>
				<td>〇</td>
				<td>遅</td>
				<td>〇</td>
				<td>遅</td>
				<td>14</td>
				<td>8</td>
				<td>??.??%</td>
				<td>公欠申請あり</td>
			</tr>
			<tr>
			<tr align="center">
				<td>杉山くん</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>遅</td>
				<td>0</td>
				<td>30</td>
				<td>??.??%</td>
				<td>公欠申請なし</td>
			</tr>
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