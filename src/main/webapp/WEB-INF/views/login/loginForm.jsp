<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MKSK_WEB | 로그인</title>
<link rel="styleSheet" href="css/login.css" type="text/css">
</head>
<body>
	<div class="loginMain">
		<div class="loginImg"><img alt="MKSK WEB SITE" src="images/MKSa.jpg"> </div>
		<div class="loginInput">
			<form action="main.do">
			<!-- <form action="loginCheck.do"> -->
				<div>Title</div>
				<div>ID : <input type="text" placeholder="id"> </div>
				<div>PW : <input type="password" placeholder="password"></div>
				<div><input type="submit" value="login"></div>
			</form>
			<span><button type="button" onclick="location.href = 'idSearch.do'">ID 찾기</button></span>
			<span><button type="button" onclick="location.href = 'pwSearch.do'">PW 찾기</button></span>
			<span><button type="button" onclick="location.href = 'signUp.do'">회원가입</button></span>
		</div>
	</div>
</body>
</html>