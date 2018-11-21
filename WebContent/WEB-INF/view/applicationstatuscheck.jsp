<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/CSS/applicationstatuscheck.css"
	rel="stylesheet" type="text/css">
<title>application status check</title>
</head>
<header> 公欠申請状況 </header>
<body>
	<center>
		<table border="1" class="table">
			<tr>
				<th class="th1">申請日</th>
				<th class="th2">理由</th>
				<th class="th3">場所</th>
				<th class="th4">日時</th>
				<th class="th5">チェック</th>
			</tr>
			<tr>
				<td>2018/11/06</td>
				<td>株式会社インフォコムの内定式があるため</td>
				<td>株式会社インフォコム東日本 原宿事業所</td>
				<td>2019/01/03～2019/01/03</td>
				<td align="center"><p>
						<input type="checkbox" name="riyu" value="1">
					</p></td>
			</tr>
			<tr>
				<td>2018/11/08</td>
				<td>株式会社インフォコムの内定式があるため</td>
				<td>株式会社インフォコム東日本 原宿事業所</td>
				<td>2019/01/20～2019/01/20</td>
				<td align="center"><p>
						<input type="checkbox" name="riyu" value="1">
					</p></td>
			</tr>
			<%-- ココから下の例 --%>
			<%-- for(kouketu k : kouketuList){ --%>
		</table>
</body>
<footer>
	<div id="bottom-back">
		<form name='form-back'>
			<input type="submit" value="戻る">
		</form>
	</div>
	<div id="bottom-p">
		<form name='form-permisson'>
			<input type="submit" value="許可">
		</form>
	</div>
</footer>
</html>