<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<link href="${pageContext.request.contextPath}/CSS/login.css"
	rel="stylesheet" type="text/css">
<title>login</title>
</head>
<body>
	<div id="login">
		<form name='form-login'>
			<span class="fontawesome-user"></span> <input type="text" id="user"
				placeholder="Username"> <span class="fontawesome-lock"></span>
			<input type="password" id="pass" placeholder="Password"> <input
				type="submit" value="Login">
		</form>
	</div>
</body>
</html>