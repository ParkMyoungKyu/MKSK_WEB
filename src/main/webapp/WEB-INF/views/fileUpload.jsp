<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload</title>
<script src="js/slide.js" defer="defer"></script>
<link rel="stylesheet" href="css/slider.css" type="text/css">
</head>
<body>
	<div class="slider-wrapper">
		<ul id="slider">
			<li>
				<p>FIRST ITEM</p>
			</li>
			<li>
				<p>SECOND ITEM</p>
			</li>
			<li>
				<p>THIRD ITEM</p>
			</li>	
		</ul>
		<div onclick="slide_next()" class="controll controll-right">
			<img src="images/a.jpg" alt="">
		</div>
		<div onclick="previous_slide()" class="controll controll-left">
			<img src="images/a.jpg" alt="">
		</div>		
	</div>
	
	
	
</body>
</html>
