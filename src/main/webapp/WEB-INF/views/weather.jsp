<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보 확인</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="css/weather.css" type="text/css">
<script type="text/javascript">
function weatherSearch2(){
	location.href="weatherSearch.do";
}

function weatherSearch(){
		$.ajax({
			url : "weatherSearch.do",
			method : "post",
			dataType : "json",
			data : $("#weather").serialize(),
			success : function(jsonStr){
				var data = jsonStr.response.body.items.item;
				console.log(data);
				data.forEach(function(val){
					});
			},
			error : function(e){
				alert("error");
				console.log(e);
			}
		});
	}
</script>
</head>
<%-- <%@ include file="common/header.jsp" %> --%>
<body>
	<div>날씨 정보 확인</div>
	<form id="weather" name="weather">
		<input type="button" value="날씨 확인" onclick="weatherSearch();">
	</form>	
	
	<div class="resultVal">	
		<ul class="nowWeather">
			<li>
				<span class="toDay">2020. 04. 28. Mon</span>	
			</li>
			<li>
				<p>12:00 AM</p>
			</li>
			<li>
				<span>17°C</span>
				<span>12°C / 18°C</span>	
				<span>구름</span>
				<span>북동풍</span>
				<span>20m/s</span>
			</li>
		</ul>
		<ul class="weatherList" style="display: flex;">
			<li>
				<div>03시</div>
				<div>맑음</div>
				<div>13</div>
				<div>북동풍 / 20m/s</div>
				<div>0%</div>
				<div>0</div>
				<div>30%</div>
			</li>
			<li> 
				<div>03시</div>
				<div>맑음</div>
				<div>13</div>
				<div>북동풍 / 20m/s</div>
				<div>0%</div>
				<div>0</div>
				<div>30%</div>
			</li>
			<li> 
				<div>03시</div>
				<div>맑음</div>
				<div>13</div>
				<div>북동풍 / 20m/s</div>
				<div>0%</div>
				<div>0</div>
				<div>30%</div>
			</li>
		</ul>
	</div>
	
</body>
<%@ include file="common/footer.jsp" %>
</html>
