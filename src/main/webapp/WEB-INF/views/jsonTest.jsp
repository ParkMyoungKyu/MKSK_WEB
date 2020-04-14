<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonTest</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#result").hide();

		$("#jsonInput").click(function(){
			var jsonDataVal = $("#jsonData").val();
			var jsonData = JSON.parse(jsonDataVal);
			$("#jsonResult").empty();
			$("#jsonResult").append(document.createTextNode(JSON.stringify(jsonData, null, 4)));

			$("#result").show();
		});
	});
</script>
</head>
<%@ include file="common/header.jsp" %>
<body>
	<div>JSON 입력</div>
		<textarea id="jsonData" rows="10" cols="40" placeholder="내용을 입력하세요"></textarea>
		<input type="button" id="jsonInput" value="jsonInput">
	
	<div id="result">
		<div>JSON 정렬 출력값</div>
			<textarea id="jsonResult" rows="10" cols="40"></textarea>
	</div>
</body>
<%@ include file="common/footer.jsp" %>
</html>