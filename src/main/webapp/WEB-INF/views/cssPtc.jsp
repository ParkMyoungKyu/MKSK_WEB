<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CSS 연습 01</title>
<link rel="stylesheet" href="css/cssPractice/cssPtc01.css" type="text/css">
<script type="text/javascript">
	function  toggleBlur(el){
		el.classList.toggle('blur');
	}
</script>
</head>
<body>
	<div class="motion">
		<a href="#" class="s-link">See the details</a>
	</div>
	<div class="textBoxAll">
		<div onclick="toggleBlur(this)" class="s-box">
			<div class="title">생성자란...</div>
			<div class="contents">.................</div>
		</div>
		<div onclick="toggleBlur(this)" class="s-box">
			<div class="title">상속...</div>
			<div class="contents">.................</div>
		</div>
		<div onclick="toggleBlur(this)" class="s-box">
			<div class="title">this 와 super</div>
			<div class="contents">.................</div>
		</div>
		<div onclick="toggleBlur(this)" class="s-box">
			<div class="title">상속...</div>
			<div class="contents">.................</div>
		</div>
		<div onclick="toggleBlur(this)" class="s-box">
			<div class="title">생성자란...</div>
			<div class="contents">.................</div>
		</div>
		<div onclick="toggleBlur(this)" class="s-box">
			<div class="title">상속...</div>
			<div class="contents">.................</div>
		</div>
		<div onclick="toggleBlur(this)" class="s-box">
			<div class="title">상속...</div>
			<div class="contents">.................</div>
		</div>
		<div onclick="toggleBlur(this)" class="s-box">
			<div class="title">상속...</div>
			<div class="contents">.................</div>
		</div>
	</div>
</body>
</html>