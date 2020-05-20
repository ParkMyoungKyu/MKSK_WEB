<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="styleSheet" href="css/login.css" type="text/css">
</head>
<body>
	<div class="loginMain">
		<div class="loginImg"><img alt="aaa" src="bbbbbbbb"> </div>
		<div class="loginInput">
			<form action="main.do">
			<!-- <form action="loginCheck.do"> -->
				<div>Title</div>
				<div>ID : <input type="text" placeholder="id"> </div>
				<div>PW : <input type="password" placeholder="password"></div>
				<div><input type="submit" value="login"></div>
			</form>
			<span><button type="button">ID 찾기</button></span>
			<span><button type="button">PW 찾기</button></span>
			<span><button type="button">회원가입</button></span>
		</div>
	</div>
</body>
</html>