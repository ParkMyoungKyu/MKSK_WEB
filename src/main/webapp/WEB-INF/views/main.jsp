<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="js/todo.js" defer="defer"></script>
<script src="js/clock.js" defer="defer"></script>
<script src="js/gretting.js" defer="defer"></script>
<script src="js/bg.js" defer="defer"></script>
<!-- <script src="js/searchBox.js" defer="defer"></script> -->
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript">

	$(document).ready(function(){
		$("#dialog").click(function(){
			location.href = "menuMove.do?command=01";
		});
		$("#juso").click(function(){
			location.href = "menuMove.do?command=02";
		});
		$("#jsonTest").click(function(){
			location.href = "menuMove.do?command=03"
		});
		$("#fileUpload").click(function(){
			location.href = "menuMove.do?command=04"
		});
		$("#weather").click(function(){
			location.href = "menuMove.do?command=05"
		});
		
	});	
</script>
<script type="text/javascript">
 $(document).ready(function() {
	$('.search').click(function() {
			$('.search').attr('placeholder','오늘은 무엇을 해볼까?');
			$('.search').addClass('active');
			$('.line-1').css({
					'transform': 'rotate(45deg)',
					'top': '0px',
					'left': '0px'
			});
			$('.line-2').css({
					'height':'40px',
					'opacity':'1'
			});
	});
	$('.line-1, .line-2').click(function() {
			$('.search').attr('placeholder','?');
			$('.search').removeClass('active').val('');
			$('.line-1').css({
					'transform': 'rotate(-45deg)',
					'top': '-20px',
					'left': '45px'
			});
			$('.line-2').css({
					'height':'0px',
					'opacity':'0'
			});

	});
});
</script>
</head>
	<%@ include file="common/header.jsp" %>
	<body>
		<div class="js-clock">
			<h1 class="rel-time">00:00</h1>
		</div>
		<form class="js-form form">
			<input type="text" class="form-Input" placeholder="What is your name?">
		</form>
		<h4 class="js-greetings greetings"></h4>
		<form class="js-toDoForm">
			<input type="text"  class="toDoForm-Input">
			<div class="line-1"></div>
			<div class="line-2"></div>
		</form>
		<ul class="js-toDoList"></ul>	
			
		
		
		<form action="javascript:text()">
			<input type="text" class="search" placeholder="오늘은 무엇을 해볼까?"/>
		</form>
		<div class="line-1"></div>
		<div class="line-2"></div>
		
		
		<div class="main">
			<button id="dialog">dialog</button>
			<button id="juso">도로명 주소 API</button>
			<button id="jsonTest">jsonTest</button>
			<!-- <button id="fileUpload">FileUpload</button> -->
			<button id="weather">날씨 예보 API</button>
		</div>
	</body>
	<%@ include file="common/footer.jsp" %>
</html>