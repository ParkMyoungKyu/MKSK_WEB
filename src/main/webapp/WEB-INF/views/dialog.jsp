<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dialog Test</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#dialog").dialog({
			autoOpen : false,
			model : true,
			closeOnEscap : false,
			width : "500",
			height : "400",
			beforeClosss : function(event,ui){
				return true;
			}
		});

		$("#progressbar").progressbar({value:false});
		$("#progressbar").progressbar("option","value",false);

		$("#btn").click(function(){
			$("#dialog").dialog("open");
		})
	});

		
</script>
</head>
<%@ include file="common/header.jsp" %>
<body>

	<button id="btn">프로그래스 바 생성</button>
	<div id="dialog" title="dialog Test....">
		<p>테스트 중입니다....</p>
		<div id="progressbar"></div>
	</div>
</body>
<%@ include file="common/footer.jsp" %>
</html>