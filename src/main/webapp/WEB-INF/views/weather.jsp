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

function resultVal(data){
	var result = document.querySelector(".result");
	var tr = document.createElement("tr");
	var td = document.createElement("td");
	var td2 = document.createElement("td");
	
	if(data.fcstDate === "20200418"){
		td.innerText = JSON.stringify(data.fcstDate);
		td2.innerText = JSON.stringify(data.category);
	}
	
	tr.appendChild(td);
	tr.appendChild(td2);
	
	result.appendChild(tr);
	
}

function resultVal2(data){
	const toDay = document.querySelector(".toDay");
	
	const div = document.querySelector(".resultVal");
	const ul = document.createElement("ul");
	const li = document.createElement("li");
	const valueDiv = document.createElement("div");
	
	let today = new Date();

	let year = today.getFullYear();		// 현재 년도
	let month = today.getMonth()+1;		// 현재 월
	let date = today.getDate();			// 현재 일
	let day = today.getDay();			// 현재 요일
	let hours = today.getHours(); 		// 현재 시간
	let minutes = today.getMinutes();  	// 현재 분
	
	if(date<10)	date = 0+""+date;
	if(month<10) month = 0+""+month;
	if(day === 0)  day = "SUN";
	if(day === 1)  day = "MON";
	if(day === 2)  day = "TUS";
	if(day === 3)  day = "WED";
	if(day === 4)  day = "THR";
	if(day === 5)  day = "FRI";
	if(day === 6)  day = "SAT";
	
	const toDays = year+". "+month+". "+date+". "+day;

	toDay.innerText = toDays;
	const category = data.category;
	if(category === "T3H"){
		valueDiv.innerText = data.fcstValue;
	}
	/* 	for(var i=0; i<data.fcstDate.length; i++){
			if(category === "POP"){
				valueDiv.innerText = "강수확률 -> "+data.fcstValue;
			} else if(category === "PTY"){
				valueDiv.innerText = "강수형태 -> " + data.fcstValue;
			} else if(category === "REH"){
				valueDiv.innerText = "습도 -> " +  data.fcstValue;
			} else if(category === "SKY"){
				valueDiv.innerText = "날씨 -> " + data.fcstValue;
			} else if(category === "T3H"){
				valueDiv.innerText = "기온 -> " +data.fcstValue;
			} else if(category === "TMN"){
				valueDiv.innerText ="아침 최저기온 -> " +  data.fcstValue; 
			} else if(category === "VEC"){
				valueDiv.innerText = "풍향 -> " + data.fcstValue;
			} else if(category === "WSD"){
				valueDiv.innerText = "풍속 -> " + data.fcstValue;
			} 
		}*/
	li.appendChild(valueDiv);
	ul.appendChild(li);
	div.appendChild(ul);
}

function weatherSearch(){
		$.ajax({
			url : "weatherSearch.do",
			method : "post",
			dataType : "json",
			data : $("#weather").serialize(),
			success : function(jsonStr){
				var data = jsonStr.response.body.items.item;
				
				data.forEach(function(val){
			//		resultVal(val);
					resultVal2(val);
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
